class Order
  attr_accessor :id # defines a getter and a setter
  attr_reader :meal, :employee, :customer

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
  end

  def self.csv_headers
    # Shorthand for Array of symbols:
    # %i[id name price] => [:id, :name, :price]
    # Shortand for Array of strings:
    # %w => ["id", "name", "price"]
    %i[id delivered meal_id employee_id customer_id]
  end

  def to_array
    # @meal => is a Meal instance
    [@id, @delivered, @meal.id, @employee.id, @customer.id]
  end

  # Teach each Order instance to display itself as a String
  def to_s
    "Customer: #{@customer.name} - #{@customer.address} | "\
    "Meal: #{@meal.name} - Price: $#{@meal.price} | "\
    "Employee: #{@employee.username}"
  end

  # We are defined a getter with a different syntax (?)
  # because this returns a boolean - Ruby convention
  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
