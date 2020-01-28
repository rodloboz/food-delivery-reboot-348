require_relative 'base_repository'

class CustomerRepository < BaseRepository
  private

  # This private method is REFERENCED/CALLED in
  # BaseRepository.
  #
  # It needs to be defined here because MealRepository
  # and CustomerRepository differ in the type of elements
  # they are trying to create (Meal and Customer)
  #
  def build_element(row)
    # Unlike the meal, there are no customer specific
    # convertions to be done on Row
    Customer.new(row) # returns a Customer instance
  end
end
