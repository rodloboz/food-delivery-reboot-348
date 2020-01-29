class Employee
  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attributes = {})
    # Setting the initial state in instance variables:
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  # Public interface:
  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end
