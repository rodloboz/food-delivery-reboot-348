

class EmployeeRepository < BaseRepository
  def find_by_username(username)
    # Find is an iterator that return an element
    # as soon as the block condition is true
    #
    # the block will receive each Employee instance
    employees.find { |employee| employee.username == username }
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
