module MediaWiktory
  class Setpagelanguage < Action
    symbol :setpagelanguage
    post!
    param :title, Params::String
    param :pageid, Params::Integer
    param :lang, Params::Enum[:default, :ab, :ace, :ady, :"ady-cyrl", :aeb, :"aeb-arab", :"aeb-latn", :af, :ak, :aln, :am, :an, :ang, :anp, :ar, :arc, :arn, :arq, :ary, :arz, :as, :ase, :ast, :av, :avk, :awa, :ay, :az, :azb, :ba, :ban, :bar, :bbc, :"bbc-latn", :bcc, :bcl, :be, :"be-tarask", :bg, :bgn, :bh, :bho, :bi, :bjn, :bm, :bn, :bo, :bpy, :bqi, :br, :brh, :bs, :bto, :bug, :bxr, :ca, :"cbk-zam", :cdo, :ce, :ceb, :ch, :chr, :chy, :ckb, :co, :cps, :cr, :crh, :"crh-cyrl", :"crh-latn", :cs, :csb, :cu, :cv, :cy, :da, :de, :"de-at", :"de-ch", :"de-formal", :diq, :dsb, :dtp, :dty, :dv, :dz, :ee, :egl, :el, :eml, :en, :"en-ca", :"en-gb", :eo, :es, :et, :eu, :ext, :fa, :ff, :fi, :fit, :fj, :fo, :fr, :frc, :frp, :frr, :fur, :fy, :ga, :gag, :gan, :"gan-hans", :"gan-hant", :gd, :gl, :glk, :gn, :gom, :"gom-deva", :"gom-latn", :gor, :got, :grc, :gsw, :gu, :gv, :ha, :hak, :haw, :he, :hi, :hif, :"hif-latn", :hil, :hr, :hrx, :hsb, :ht, :hu, :hy, :ia, :id, :ie, :ig, :ii, :ik, :"ike-cans", :"ike-latn", :ilo, :inh, :io, :is, :it, :iu, :ja, :jam, :jbo, :jut, :jv, :ka, :kaa, :kab, :kbd, :"kbd-cyrl", :kg, :khw, :ki, :kiu, :kk, :"kk-arab", :"kk-cn", :"kk-cyrl", :"kk-kz", :"kk-latn", :"kk-tr", :kl, :km, :kn, :ko, :"ko-kp", :koi, :krc, :kri, :krj, :krl, :ks, :"ks-arab", :"ks-deva", :ksh, :ku, :"ku-arab", :"ku-latn", :kv, :kw, :ky, :la, :lad, :lb, :lbe, :lez, :lfn, :lg, :li, :lij, :liv, :lki, :lmo, :ln, :lo, :loz, :lrc, :lt, :ltg, :lus, :luz, :lv, :lzh, :lzz, :mai, :"map-bms", :mdf, :mg, :mhr, :mi, :min, :mk, :ml, :mn, :mo, :mr, :mrj, :ms, :mt, :mwl, :my, :myv, :mzn, :na, :nah, :nan, :nap, :nb, :nds, :"nds-nl", :ne, :new, :niu, :nl, :"nl-informal", :nn, :nov, :nrm, :nso, :nv, :ny, :oc, :olo, :om, :or, :os, :pa, :pag, :pam, :pap, :pcd, :pdc, :pdt, :pfl, :pi, :pih, :pl, :pms, :pnb, :pnt, :prg, :ps, :pt, :"pt-br", :qu, :qug, :rgn, :rif, :rm, :rmy, :ro, :"roa-tara", :ru, :rue, :rup, :ruq, :"ruq-cyrl", :"ruq-latn", :rw, :sa, :sah, :sat, :sc, :scn, :sco, :sd, :sdc, :sdh, :se, :sei, :ses, :sg, :sgs, :sh, :shi, :shn, :si, :sk, :sl, :sli, :sm, :sma, :sn, :so, :sq, :sr, :"sr-ec", :"sr-el", :srn, :ss, :st, :stq, :su, :sv, :sw, :szl, :ta, :tcy, :te, :tet, :tg, :"tg-cyrl", :"tg-latn", :th, :ti, :tk, :tl, :tly, :tn, :to, :tokipona, :tpi, :tr, :tru, :ts, :tt, :"tt-cyrl", :"tt-latn", :tw, :ty, :tyv, :tzm, :udm, :ug, :"ug-arab", :"ug-latn", :uk, :ur, :uz, :ve, :vec, :vep, :vi, :vls, :vmf, :vo, :vot, :vro, :wa, :war, :wo, :wuu, :xal, :xh, :xmf, :yi, :yo, :yue, :za, :zea, :zh, :"zh-cn", :"zh-hans", :"zh-hant", :"zh-hk", :"zh-mo", :"zh-my", :"zh-sg", :"zh-tw", :zu]
    param :reason, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :token, Params::String
  end
end