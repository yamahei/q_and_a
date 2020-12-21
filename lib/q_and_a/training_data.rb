require 'securerandom'

module QAndA
class TrainingData

  ROOT_DIR_NAME = 'root'
  ANSWER_FILE_NAME = 'answer.txt'
  QUESTIONS_FILE_NAME = 'questions.txt'

  attr_accessor :id, :path, :answer, :questions, :resources

  def initialize path=nil, answer=nil, questions=[], resources=[]
    @id = SecureRandom.uuid.downcase
    @path = path
    @answer = answer
    @questions = questions
    @resources = resources
  end

  def self.from_hash_list list#=>[data, data, ...]
    list.map{|item|
      path = item[:path] || nil
      answer = item[:answer] || nil
      questions = item[:questions] || []
      resources = item[:resources] || []
      self.new(path, answer, questions, resources)
    }
  end

  # def self.from_dir path_to_root#=>[data, data, ...]
  #   raise QAndA::Error.new "'#{path_to_root}' isnt root directory." if File.basename(path_to_root) != ROOT_DIR_NAME
  #   datas = []

  # end

end# class
end# module
