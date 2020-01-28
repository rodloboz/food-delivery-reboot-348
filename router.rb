# TODO: implement the router of your app.

class Router
  def initialize(controllers = {})
    # Store ALL controllers in instance variables
    # so that I can use them throughout the Router
    @meals_controller = controllers[:meals_controller]
    @customers_controller = controllers[:customers_controller]
    @running = true
  end

  # This starts the actual program:
  def run
    puts "Welcome to the Le Wagon Bistro!"
    puts "           --           "

    # After an action is done, I want to
    # display the MENU again (looping)
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  # Dispatch the User REQUEST to the
  # SPECIFIC controller action/method
  # that implements what the User wants to do
  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then stop
    else
      puts "Please press 1, 2, 3, 4 or 9"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - Stop and exit the program"
  end
end
