require 'natto'

module QAndA
module Interface

  # def initialize path_to_model=nil#=> QandAIF instance if path

  def load(path_to_model)#=> QandAIF instance
    raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
  end
  def save(path_to_model)#=> void
      raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
  end

  def bulk_train(datas, path_to_model=nil)#=> void
    datas.each{|data| train(data) }
    save(path_to_model) if path_to_model
  end
  def train(data)#=> void
      raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
  end
  def classify(text, length=3)#=> [id, id, id]
      raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
  end

  def parse(text)#=> %w(parsed strings)
    # ATTENTION: 辞書はUTF-8じゃないと化ける
    natto = Natto::MeCab.new
    natto.enum_parse(text).select{|n|
      !n.is_eos?
    }.map{|n|
      # n = surface: 表層形, feature: 品詞,品詞細分類1,品詞細分類2,品詞細分類3,活用型,活用形,原形,読み,発音
      # 美しい: 形容詞,自立,*,*,形容詞・イ段,基本形,美しい,ウツクシイ,ウツクシイ
      hinsi_name, hinsi_group1, hinsi_group2, hinsi_group3, katuyo_type, katuyo_state, plain, reading, pronounce = n.feature.split(",")
      {
        surface:      n.surface,
        hinsi_name:   hinsi_name, 
        hinsi_group1: hinsi_group1, 
        hinsi_group2: hinsi_group2, 
        hinsi_group3: hinsi_group3, 
        katuyo_type:  katuyo_type, 
        katuyo_state: katuyo_state, 
        plain:        plain, 
        reading:      reading, 
        pronounce:    pronounce,
      }
    }.select{|e|
      %w(名詞 動詞 形容詞 形容動詞).include?(e[:hinsi_name]) #|| e[:hinsi_group1] == "自立" 
    }.map{|e|
      e[:plain].gsub(/^\*$/, e[:surface])
    }
  end


end# class
end# module
