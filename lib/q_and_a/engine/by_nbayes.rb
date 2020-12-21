require 'nbayes'

module QAndA
module Engine
class ByNbayes
  include Interface
  
  def initialize path_to_model=nil#=> QandAIF instance if path
    @engine = NBayes::Base.new
    load(path_to_model) if path_to_model
  end

  def load(path_to_model)#=> QandAIF instance
    @engine = NBayes::Base.new.load(path_to_model)
    self
  end

  def save(path_to_model)#=> void
    @engine.dump(path_to_model)
  end

  def train(data)#=> void
    id, a, questions = data.id, data.answer, data.questions
    typicals = "どうすればいいですか？ どこですか？ 教えてください。 できますか？ ありますか？ もらえますか？"

    questions.each{|q|
      begin
        parsed = parse(q) + parse(typicals)
        @engine.train(parsed, id)
      rescue => e
        p ["** ERROR in train **", id, parsed]
        p e.inspect
      end
    }
    begin
      parsed = parse(a)
      @engine.train(parsed, id)
    rescue => e
      p ["** ERROR in train **", id, parsed]
      p e.inspect
    end
  end

  def classify(text, length=3)#=> [{score: #, tag: String}, ...]
    tokens = parse(text)
    classed = @engine.classify(tokens)
    candies = classed.
      map {|k, v| {id: k, prob: v}}.
      sort {|a, b| a[:prob] <=> b[:prob] }.
      reverse
    candies[0...length]
  end

end# class
end# module Engine
end# module QAndA
