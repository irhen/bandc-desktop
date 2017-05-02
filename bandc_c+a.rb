def choosing_game
    puts "Select classic or advanced game mode. For classic press 'c', for advanced press 'a'."
    input = gets.chomp.downcase
  yield input
end

def classic_check(variable)
  if variable.size != 4
    puts "Please, try again. Your guess must contain exactly 4 digits!"
  end
        
  if variable.uniq.length != 4
    puts "Please, try again. Your guess must contain 4 unique digits!"
  end
    
  if variable.include?(0)
    puts "Please, try again. You cannot use zero in your guess!"
  end
end

def advanced_check(variable)
  if variable.size != 6
    puts "Please, try again. Your guess must contain exactly 6 digits!"
  end
        
  if variable.uniq.length != 6
    puts "Please, try again. Your guess must contain 6 unique digits!"
  end
end

game_type = ""
choice = Proc.new { |input| game_type = input }

choosing_game(&choice)

while game_type do
  if game_type == "c"  
    secret_number = Array(1..9).sample(4)
    classic_game = [0, 1, 2, 3]
    user_guess = ""
    
    puts "Input your guess using keyboard."
    
    while user_guess != secret_number do
      user_guess = gets.chomp.split("").map { |el| el.to_i }
      
      classic_check(user_guess)
            
      bulls_n_cows = secret_number&user_guess
      bulls = classic_game.map{ |index| user_guess[index] == secret_number[index] }.select{ |value| value }
      cows = bulls_n_cows.length - bulls.length
        
      puts "#{user_guess.join("")} has #{bulls.length} bulls and #{cows} cows."
    end
    
    puts "You're gorgeous!"
    choosing_game(&choice)
  
  elsif game_type == "a"  
    secret_number_a = Array(0..9).sample(6)
    advanced_game = [0, 1, 2, 3, 4, 5]
    user_guess_a = ""
    
    puts "Input your guess using keyboard."
    
    while user_guess_a != secret_number_a do
      user_guess_a = gets.chomp.split("").map { |el| el.to_i }
      
      advanced_check(user_guess_a)
            
      bulls_n_cows_a = secret_number_a&user_guess_a
      bulls_a = advanced_game.map{ |index| user_guess_a[index] == secret_number_a[index] }.select{ |value| value }
      cows_a = bulls_n_cows_a.length - bulls_a.length
       
      puts "#{user_guess_a.join("")} has #{bulls_a.length} bulls and #{cows_a} cows."
    end
    
    puts "You're super gorgeous!!"
    choosing_game(&choice)
    
  else 
    puts "Didn’t quite catch that. What was it, again?"
    choosing_game(&choice)
  end
end
