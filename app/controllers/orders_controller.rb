require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display_elements(orders)
  end

  def add
    meal_id = @view.ask_for(:meal).to_i
    customer_id = @view.ask_for(:customer).to_i
    employee_id = @view.ask_for(:employee).to_i

    attributes = {
      meal: @meal_repository.find(meal_id),
      customer: @customer_repository.find(customer_id),
      employee: @employee_repository.find(employee_id)
    }

    @order_repository.add(Order.new(attributes))
  end

  def list_my_orders(employee)
    # Fetch the orders of the employee
    orders = @order_repository.all.select do |order|
      # Order instances have Employee instances
      # so if the employee (which is the user in the Router)
      # matches the Order's employee, we want to
      # add that order to the results
      employee == order.employee
    end
    # OrdersView inherits from BaseView which knows how
    # to display lists of things: elements
    @view.display_elements(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    order_id = @view.ask_for(:order).to_i
    order = @order_repository.find(order_id)
    order.deliver!
    @order_repository.save
  end
end
