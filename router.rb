# TODO: implement the router of your app.

class Router
  def initialize(controllers = {})
    # Store ALL controllers in instance variables
    # so that I can use them throughout the Router
    @meals_controller = controllers[:meals_controller]
    @customers_controller = controllers[:customers_controller]
    @sessions_controller = controllers[:sessions_controller]
    @running = true
    @user = nil
  end

  # This starts the actual program:
  #
  # rubocop:disable Metrics/MethodLength
  def run
    puts "Welcome to the Le Wagon Bistro!"
    puts "           --           "

    # After an action is done, I want to
    # display the MENU again (looping)
    while @running
      # check if there is a user
      # if there's no user, sign in user (SessionsController)
      @user = @sessions_controller.create
      # if there is a user, display tasks
      while @user # is an Employee instance
        @user.manager? ? display_manager_tasks : display_delivery_guy_tasks
        action = gets.chomp.to_i
        print `clear`
        @user.manager? ? route_manager_action(action) : route_delivery_guy_action(action)
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def destroy_session
    @user = nil
  end

  # Dispatch the User REQUEST to the
  # SPECIFIC controller action/method
  # that implements what the User wants to do
  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then destroy_session
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4 or 9"
    end
  end

  def route_delivery_guy_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then destroy_session
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4 or 9"
    end
  end

  def stop
    destroy_session
    @running = false
  end

  def display_delivery_guy_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List my orders"
    puts "2 - Mark an order as delivered"
    puts "9 - Log out"
    puts "0 - Stop and exit the program"
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "5 - List undelivered orders"
    puts "6 - Add an order"
    puts "9 - Log out"
    puts "0 - Stop and exit the program"
  end
end
