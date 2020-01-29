class EmployeeRepository < BaseRepository
  undef_method :add

  def find_by_username(username)
    # Find is an iterator that return an element
    # as soon as the block condition is true
    #
    # the block will receive each Employee instance
    employees.find { |employee| employee.username == username }
  end

  def all_delivery_guys
    # go through the list of employees
    # filter out the managers
    # find => returns 1 elements
    # select => return a new []
    employees.select { |employee| employee.delivery_guy? }
  end

  private

  # Because we inherint from Base, the instance
  # variable is named @elements
  # Creates a private interface to reference
  # the Array by employees
  #
  def employees
    @elements
  end

  def build_element(row)
    Employee.new(row)
  end
end
