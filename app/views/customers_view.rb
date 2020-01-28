require_relative 'base_view'

class CustomersView < BaseView
  def ask_for(attribute)
    puts "What's the #{attribute} of the customer?"
    print "> "

    # we print the question and then we want to run
    # super (the code defined in the parent class BaseView)
    # which return the user input and converts it into the
    # proper format
    #
    super
  end
end
