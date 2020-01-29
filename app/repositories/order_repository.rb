class OrderRepository < BaseRepository
  def initialize(csv_filepath, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository

    # Works as any other method call
    # super calls the parent method
    super(csv_filepath)
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? }
  end

  private

  def build_element(row)
    # row contains ids for meal, employee and customer
    # We needs to fetch the actual instances of these
    # classes.

    # row[:delivered] = "true"

    attributes = {
      id: row[:id],
      meal: @meal_repository.find(row[:meal_id].to_i),
      employee: @employee_repository.find(row[:employee_id].to_i),
      customer: @customer_repository.find(row[:customer_id].to_i),
      delivered: row[:delivered] == "true"
    }
    Order.new(attributes)
  end
end
