module QAndA
class Factory

  def self.get_instance name, path_to_model=nil
    case name
    when :nbayes
      QAndA::Engine::ByNbayes.new(path_to_model)
    else
      raise QAndA::Error.new("unknown engine: #{name}.")
    end
  end

end# class
end# module
