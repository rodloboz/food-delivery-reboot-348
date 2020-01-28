# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

# Require dependencies (Ruby libraries/modules)
require 'byebug'
require 'csv'

# Require all models
require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/models/employee'

# Require all repositories
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'

# Require all controllers
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'

# Require the router
require_relative 'router'

# The router needs to receive ALL of the controllers...

# In order to create a MealsController, I need to...
# have a string with the Meals CSV filepath...
meals_csv_filepath = File.join(__dir__, 'data/meals.csv')
# so that I can use it to create a MealRepository...
meal_repository = MealRepository.new(meals_csv_filepath)
# that can be used to create the MealsController:
meals_controller = MealsController.new(meal_repository)

# In order to create a CustomersController, I need to...
# have a string with the Customers CSV filepath...
customers_csv_filepath = File.join(__dir__, 'data/customers.csv')
# so that I can use it to create a CustomerRepository...
customer_repository = CustomerRepository.new(customers_csv_filepath)
# that can be used to create the CustomersController:
customers_controller = CustomersController.new(customer_repository)

employees_csv_filepath = File.join(__dir__, 'data/employees.csv')
employee_repository = EmployeeRepository.new(employees_csv_filepath)
sessions_controller = SessionsController.new(employee_repository)

# Organize all controllers in a hash to be used in the Router:
controllers = {
  meals_controller: meals_controller,
  customers_controller: customers_controller,
  sessions_controller: sessions_controller
}

router = Router.new(controllers)

# Start the program:
router.run






