# frozen_string_literal: true

module MediaWiktory
  class Generator
    class Module < Hashie::Mash
      disable_warnings

      class << self
        def from_html_nodes(title, nodes)
          type, name, prefix = title.scan(/^([a-z]+)=([^(]+)(?:\s+\((.+)\))?$/).flatten

          new(
            type: type._n.to_sym || :main,
            name: name || '',
            prefix: prefix,
            description: extract_description(nodes),
            flags: extract_flags(nodes),
            params: extract_params(nodes, prefix)
          )
        end

        private

        def extract_description(nodes)
          nodes.detect { |n| n.name == 'p' }._n.text.to_s.tr("\n", ' ').strip
        end

        def extract_flags(nodes)
          flags = nodes.detect { |n| n['class']._n.include?('apihelp-flags') } or return []
          flags.search('ul li > span').to_a
               .map { |el| {id: el.attr('class'), text: el.text} }
               .map { |h| h.merge(role: h[:id].sub(/^apihelp-(flag-)?/, '')) }
        end

        def extract_params(nodes, prefix)
          params = nodes.detect { |n| n['class']._n.include?('apihelp-parameters') } or return []
          params.at('dl').each_term.to_a
                .map { |dts, dds| Param.from_html_nodes(dts.first.text, dds, prefix: prefix) }
        end
      end

      attr_reader :api

      def initialize(*)
        super
        # 'action' should not be rendered as "available default params" for api initializer
        params.reject! { |p| p.name == 'action' } if main?
      end

      def prefix=(pre)
        super
        params.each { |p| p.prefix = pre }
      end

      def inspect
        "#<#{self.class.name} #{name}>"
      end

      def action?
        type == :action
      end

      def main?
        type == :main
      end

      include Renderable

      def main_template
        'action_class.rb'
      end

      def api=(api)
        @api = api
        params.each { |p| p.api = api }
      end

      def description
        super.split("\n").join("\n#\n# ")
      end

      def params
        # TODO: some actions have "rest of parameters, see there".
        # Currently, we ignore it
        (super || []).reject { |p| p.name == '*' || main? && p.name == 'action' }
      end

      def http_method
        post? ? 'Post' : 'Get'
      end

      def post?
        flags.any? { |f| f.id == 'apihelp-flag-mustbeposted' }
      end

      def method_name
        name.sub(/^g-/, '').split('-').join('_')
      end

      def class_name
        name.split('-').map(&:capitalize).join
      end
    end
  end
end
