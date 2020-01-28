#
# This Base class implements behaviour that is
# shared among ALL types of Views.
#
# Base classes will never be instanciated in our app.
# no BaseView.new
#
# They are simply wrappers/containers to encapsulate
# shared/common code so that we can be DRY:
# Don't Repeat Yourself

class BaseView
  def display_elements(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1} - " + element.to_s
    end
  end

  def ask_for(attribute)
    # The actual question will be implemented in the
    # CHILD Views (see other view classes for implementation)
    # The return value runs AFTER the child code has been
    # executed.
    #
    @input = gets.chomp

    # Some hocus pocus to ensure that the User is actually
    # typing value (not blanks) and that if the attribute
    # is a price, it must be a number and be converted to String
    @input if valid?(attribute)
  end

  private

  def valid?(attribute)
    validate_presence(attribute) && validate_number(attribute)
  end

  def validate_presence(attribute)
    while @input.empty?
      puts "'#{attribute}' must be present."
      print "> "
      @input = gets.chomp
    end

    @input
  end

  def validate_number(attribute)
    return @input unless attribute == :price

    until @input =~ /^\d+$/
      puts "'#{attribute}' must be a number."
      print "> "
      @input = gets.chomp
    end

    @input = @input.to_i
  end
end
