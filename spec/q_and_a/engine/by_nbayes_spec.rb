# frozen_string_literal: true

RSpec.describe QAndA do

  before do
    @datas = QAndA::TrainingData.from_hash_list([
      # { answer: "", questions: [] },
      {
        answer: "ご利用になれます。入口で係員が半券をもぎりますのでお見せください。購入（1冊2,200円）・引換も可能です。係員のいる窓口で承ります。※2020年6月23日（火）から当面のあいだ、おひとり1枚の整理券の予約が必要です。詳しくはこちらのページをご覧ください。", 
        questions: [
          " 「ぐるっとパス」は利用できますか？",
          "回数券はありますか？",
          "「ぐるっとパス」の使い方を教えてください", 
        ],
      }, {
        answer: "会員証のご提示で、入場券が2割引で購入できます。「東京パークフレンド」（東京都公園協会発行）の会員証や、外国人旅行者で「ウェルカムカード」をお持ちの方も同様です。※2020年6月23日（火）から当面のあいだ、おひとり1枚の整理券の予約が必要です。詳しくはこちらのページをご覧ください。", 
        questions: [
          " 「東京動物園友の会」の会員対象の入園料割引はありますか？",
          "入園料が割引できると聞きましたが、どうすればよいですか",
          "割引制度はありますか？" 
        ],
      }, {
        answer: "手帳をお持ちのご本人と、お付添いの方1名が無料でご入園できます。入口で手帳をご提示ください。※2020年6月23日（火）から当面のあいだ、おひとり1枚の整理券の予約が必要です。詳しくはこちらのページをご覧ください。", 
        questions: [
          "身体障害者手帳、療育手帳、愛の手帳、精神障害者保健福祉手帳がある場合、入園料の取扱いは？",
          "障害者割引はありますか？",
          "子供に障害がありますが、入園できますか？",
          "障害者も入園できますか？"
        ],
      }, {
        answer: "団体の種類により、お手続きが異なります。くわしくは団体利用についてをご参照ください。※新型コロナウイルス感染症（COVID-19）の感染拡大防止のため、2020年6月23日（火）から当面のあいだ団体の受入れを休止します。詳しくはこちらのページをご覧ください。", 
        questions: [
          "団体で入園したいのですが、必要な手続きはありますか？",
          "学校の遠足で利用できますか？",
          "団体割引はありますか？",
          "団体客は受け入れ可能ですか？",
          "大人数で行こうと思いますが、注意点はありますか？",
        ],
      }, {
        answer: "下見の当日、表門・弁天門・池之端門の係員にお申し出ください。開園日の最終入園時間までにご来園をお願いいたします。※予約制ではありませんので、電話やFAXなどで事前のご連絡は必要ありません。※新型コロナウイルス感染症（COVID-19）の感染拡大防止のため、2020年6月23日（火）から当面のあいだ団体および下見の受入れを休止します。詳しくはこちらのページをご覧ください。", 
        questions: [
          "下見（実地踏査）はどのように手続きをすればよいですか？",
          "下見の場合の割引はありますか？",
        ],
      }, {
        answer: "放送したい時間に総合案内所・表門・弁天門・池之端門の係員にお申し出ください。", 
        questions: [
          "団体向けに集合のための放送をお願いできますか？",
          "園内放送を使うことはできますか？",
          "案内のために園内放送できますか？",
        ],
      }, {
        answer: "表門・弁天門・池之端門の係員のいる窓口で購入できます。一般2,400円、65歳以上1,200円です（自動券売機では販売しておりません）。", 
        questions: [
          "年間パスポートはどこで購入できますか？",
          "年間パスポートはありますか？",
          "フリーパスの売り場を教えてください",
        ],
      }, {
        answer: "特別な事情がある場合は、出口の係員にご相談ください。※2020年6月23日（火）から当面のあいだ、整理券による入場制限をおこないますので再入園はできません。", 
        questions: [
          "荷物を取りに車に戻りたいのですが、どうしたらよいですか？",
          "入園した後、園外に出られますか？",
          "車に忘れ物を取りに行きたいのですが",
        ],
      }, {
        answer: "犬や猫、その他のペットを連れての入園はできません。身体障害者補助犬（盲導犬、聴導犬、介助犬）は入園できます。", 
        questions: [
          "ペットと一緒に入園できますか？",
          "犬を連れて入園できますか？",
          "盲導犬を連れて入園できますか？",
          "介助犬を連れて入園できますか？",
        ],
      }, {
        answer: "喫煙所はありません。園内は禁煙です。", 
        questions: [
          "タバコを吸う所はありますか？",
          "喫煙所はどこにありますか？",
          "電子タバコは園内で吸えますか？",
          "灰皿はどこにありますか？",
        ],
      }, {
        answer: "アレルゲンの一覧表を用意しています。係員にお声がけください。", 
        questions: [
          "アレルギーがあるのでメニューに使っている食材を知りたいのですが？",
          "園内の食事にアレルギーの表示はありますか？",
          "アレルゲンフリーのメニューはありますか？",
          "うどんを茹でる鍋で蕎麦も茹でますか？",
        ],
      }, {
        answer: "東園さるやまキッチン（1階約60席、2階約120席）、および西園休憩所（約130席）をご利用いただけます。また、西園の不忍池テラス（約300席）には屋根があります。なお、野外卓や休憩所の座席の予約はできません。席取りはご遠慮いただいておりますので、ゆずり合ってのご利用をお願いいたします（園内マップ）。", 
        questions: [
          "持ってきたお弁当を食べられますか？また、雨天時にお弁当を食べられる屋根付きの場所はありますか？",
          "休憩場所はどこにありますか？",
          "園内でお弁当を食べてもよいですか？",
        ],
      }, {
        answer: "売店付近などに、ペットボトルの自動販売機があります。", 
        questions: [
          "飲み物の自動販売機はありますか？",
          "自販機はどこにありますか？",
          "園内で飲み物は買えますか？",
        ],
      }, {
        answer: "東園1ヵ所（リトルトランク）、西園1ヵ所（プチカメレオン）で販売しています。・リトルトランク：総合案内所裏・プチカメレオン：不忍池テラス脇※売店利用のみの場合も入園券の購入が必要です。※2020年6月23日（火）から当面のあいだ、入園には入園料のほかに整理券の予約が必要です。", 
        questions: [
          "おみやげはどこで売っていますか？",
          "動物のぬいぐるみは購入できますか？",
          "土産物屋はどこにありますか？",
        ],
      }, {
        answer: "東園：表門、西園：弁天門・池之端門の3ヵ所です。", 
        questions: [
          "出口はどこですか？",
          "どこから出れますか？",
        ],
      }, {
        answer: "携帯端末（ユビキタス端末）の貸出しは、2016年3月31日をもって終了しました。現在はお客さまのスマートフォンなどでご利用いただける「上野動物園散策アプリ」により、動物の詳細情報や動画等をお楽しみいただけます。くわしくはこちらをご参照ください。", 
        questions: [
          "園内案内用の携帯端末（ユビキタス端末）はどこで借りられますか？",
          "案内用の機械を借りたいのですが",
          "案内機はありますか？",
        ],
      }, {
        answer: "お客さまによるえさやりはおこなっていませんが、アシカなどへの飼育係によるえさやりは見学できます。※動物の体調や天候などにより中止になる場合があります。", 
        questions: [
          "動物にえさをやることはできますか？",
          "餌やりできますか？",
          "ペンギンの餌やりはできますか？",
          "ゾウに餌をあげられますか？",
        ],
      }, {
        answer: "上野動物園には専用の駐車場はありません。近隣の有料駐車場をご利用ください。くわしくは交通アクセスをご参照ください。", 
        questions: [
          "駐車場はありますか？",
          "車はどこに停めればよいですか？",
          "駐車場の場所を教えてください",
        ],
      }, {
        answer: "東園の総合案内所と西園の弁天門に救護室があります。看護師が対応いたしますが、不在の場合もあります。医師はおりませんので、看護師による応急処置のみおこなうことができます。また、看護師が不在の場合、消毒液や絆創膏などを準備していますので、お客さまご自身で手当てしていただくか、近隣の病院をご紹介します。緊急の場合は救急車を要請します。急病の場合はお近くの係員にお声がけください。", 
        questions: [
          "ケガをしたのですが治療してもらえますか？",
          "近くに病院はありますか？（提携病院など）",
          "怪我をした場合、どこで手当てを受けられますか？",
          "体調不良になった場合、病院を案内してもらえますか？",
        ],
      }, {
        answer: "総合案内所・表門・弁天門・池之端門で承りますのでお申し付けください。", 
        questions: [
          "迷子札は配布していますか？",
          "子供が迷子になりました。捜索はどこでお願いすればいいですか？",
          "子供とはぐれた場合はどうすればよいですか？",
          "迷子になりました。園内放送で探してもらえますか？",
          "連れとはぐれたのですが、呼出放送をしてもらえますか？"
        ],
      }, {
        answer: "お近くの係員にお申し出ください。届いているかを確認します。届いていない場合、「遺失物届」にご記入いただきますと、発見時のみ連絡を差し上げることもできます。", 
        questions: [
          "落し物をしたときはどうすればよいですか？",
          "財布を紛失しました。",
          "携帯電話を落としてしまいました",
          "届けものの問い合わせはどこでできますか？",
        ],
      },
      {
        answer: "総合案内所・表門・弁天門・池之端門で承ります。", 
        questions: [
          "落し物を拾いました。どこに届ければよいですか？",
          "財布が落ちていました。",
          "携帯電話を拾いました",
          "拾い物の届け出はどこでできますか？",
        ],
      }, {
        answer: "総合案内所2階の動物相談員におたずねください。",
        questions: [          "自宅で飼っている動物について質問できますか？",
          "動物について、質問できますか？",
          "動物博士はいますか？",
          "子供の質問に答えられますか？",
        ],
      }, {
        answer: "ゆっくりご覧になると、2～3時間かかります。※ジャイアントパンダを観覧される場合、日によっては観覧の待ち時間がありますので、上記以上にかかることがあります。",
        questions: [
          "園内を一周するのにどのぐらいかかりますか？",
          "丸一日かかりますか？",
          "ゆっくり見ると、どれくらいの時間がかかりますか？",
          "一日で見終わりますか？",
        ],
      },
    ])
  end
  it "get instance -> bulk train -> classify" do
    e = QAndA::Factory.get_instance :nbayes
    e.bulk_train(@datas)
    [
      "園内で喫煙はできますか",
      "煙草を吸いたいのですが",
      "タバコを吸いたいのですが",
      "すいている時間帯を教えてください",
      "小さな子供でも楽しめますか？",
      "動物のショーはありますか？",
      "車で行けますか？",
      "大人数だと割引されますか？",
      "雨の日でも楽しめますか？",
    ].each { |test|
      candies = e.classify(test)
      result = @datas.find { |data| data.id == candies[0][:id] }
      puts test, result, ""
    }
  end

end
