require_relative 'base_controller'
require_relative '../views/meals_view'

class MealsController < BaseController
  def initialize(meal_repository)
    super(meal_repository)
    @view = MealsView.new
  end

  def add
    # ask user for name
    name = @view.ask_for(:name)
    # ask user for the price
    price = @view.ask_for(:price)
    # create a meal instance
    meal = Meal.new(name: name, price: price)
    # save the meal instance
    @repository.add(meal)
  end
end
