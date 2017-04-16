module MediaWiktory
  module ApiParser
    class Param < Hashie::Mash
      class << self
        def from_html_nodes(name, dds, prefix = nil)
          new(
            full_name: name,
            name: name.sub(/^#{prefix}/, ''),
            prefix: prefix,
            description: extract_description(dds),
            type: extract_type(dds),
            vals: extract_values(dds) #,
            #default: extract_default(dds)

            # TODO: limit: extract_limit(dds),

            # TODO: mandatoriness:
            # * optional
            # * mandatory
            # * this OR that is mandatory
            # * this AND that can't intersect
            # * and so on
          )
        end

        def extract_description(els)
          els.detect{|e| e.attr('class') == 'description'}.search('p')
            .map { |p| p.text.strip }.reject(&:empty?)
            .join("\n")
        end

        def extract_type(els)
          # TODO: "Expiry time. May be relative (e.g. 5 months or 2 weeks) or absolute (e.g. 2014-09-18T12:34:56Z). If set to infinite, indefinite, or never, the block will never expire."
          els.select{|e| e.attr('class') == 'info'}.each do |el|
            case el.text
            when /^Type: ([^\(]+)\s*($|\()/
              return $1.strip
            when /^Values \(separate with \|/,
                 /^Separate values with \|/
              return 'list'
            when /^One of the following values:/
              return 'enum'
            end
          end
          'string'
        end

        def extract_default(els)
          els.each{|el| return $1 if el =~ /^Default:\s*(.+)$/}
          nil
        end

        def extract_values(els)
          # 1. try dl from definition
          els.detect{|e| e.attr('class') == 'description'}.tap{|d|
            if d.at('dl')
              return d.at('dl').each_term.map{|dts, dds|
                {name: dts.first.text, description: dds.first.text}
              }
            end
          }

          # 2. ...or take from info
          els.select{|e| e.attr('class') == 'info'}.each do |el|
            if el.text =~ /^(?:One of the following values||Values \(separate with \|.*?\)):\s*(.+)$/
              if el.search('a').count > 1
                return el.search('a').reject { |a| a.text == 'alternative' }.
                  map{|a|
                    {name: a.text, module: a.attr('href').sub(/^.*[\#+]/, '')}
                  }
              else
                return $1.sub(/^Can be empty, or/, '').split(',')
                  .map{|s| s.gsub(/^[[:space:]]|[[:space:]]$/, '')}
                  #.map{|n| {name: n}}
              end
            end
          end

          nil
        end
      end
    end
  end
end