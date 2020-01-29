require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  # This will create a Session and should return a User (Employee)
  def create
    username = @view.ask_for_username
    password = @view.ask_for_password

    # employee will either be an Employee instance or nil
    employee = @employee_repository.find_by_username(username)

    # if there is an employee and the passwords match
    if employee && employee.password == password
      employee
    else # no match (wrong username OR wrong password)
      @view.display_wrong_credentials
      create
    end
  end
end
