require 'io/console'

class SessionsView
  def ask_for_username
    puts "Username?"
    print "> "

    gets.chomp
  end

  def ask_for_password
    puts "Password?"
    print "> "

    STDIN.noecho(&:gets).chomp
  end

  def display_wrong_credentials
    puts "Wrong credentials!"
    puts "Try again..."
  end
end
