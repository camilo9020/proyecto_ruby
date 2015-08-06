class Parser
  attr_reader :deck_hash
  def initialize(text_file)
    @text_file = text_file
  end

  def parse
   @deck_array = File.foreach(@text_file).map {|line| line.strip }.delete_if { |line| line == ""}
   @deck_hash = Hash[*@deck_array]
  end
end



class Game # controller

  def initialize(text_file)
    @text_file = text_file
    @parser = Parser.new(@text_file)
    @parser.parse
    @deck_hash = @parser.deck_hash
    @attemps_array = []
  end

  def run
    View.welcome
    View.instructions
    Flashcard.loop_hash(@deck_hash)
  end

end

class Flashcard #model

  def self.get_user_answer
    @user_answer = gets.chomp
    return @user_answer
  end

  def self_questions_hash
    @dificult_questions = []
  end

  def self.loop_hash(deck_hash)
    deck_hash.each do |definition , correct_answer|
      @user_answer = nil
      @attemps = 1
      puts deck_hash.key(correct_answer)
      until correct_answer == @user_answer
        print "GUESS:"
        get_user_answer
        View.wrong_answer if correct_answer != @user_answer
        @attemps += 1
      end
      View.correct_answer
    end
  end

end



class  View #view
  
  def self.welcome
    puts "welcome to Ruby Flash Cards."
  end

  def self.instructions
    puts "To play, just enter the correct term for each definition. Ready? go!"\
  end

  def self.wrong_answer
    puts "wrong answer, try again"
  end

  def self.correct_answer
    puts "correct answer"
  end

  def number_of_attemps
    puts "you try #{Flashcard.attemps}"
  end
end
#------------------- Driver code ---------------------------

# parser = Parser.new("flashcard_samples.txt")
# parser.parse
# p parser.deck_hash

game = Game.new("flashcard_samples.txt")
game.run