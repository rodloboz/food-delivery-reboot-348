class Meal
  attr_accessor :id # read and write :id
  attr_reader :name, :price

  # This CLASS METHOD (note the self.csv_headers)
  # is REFERENCED/CALLED in BaseRepository.
  #
  # It needs to be defined in here because the Meal
  # and Customer differ in their headers.
  #
  # It makes sense that the class would know
  # what CSV headers are needed to persist
  # instances of itself.
  #
  def self.csv_headers
    # Shorthand for Array of symbols:
    # %i[id name price] => [:id, :name, :price]
    # Shortand for Array of strings:
    # %w => ["id", "name", "price"]
    %i[id name price]
  end

  # Meal.new({})
  def initialize(attributes = {})
    # Set initial instance
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_array
    [@id, @name, @price]
  end

  # In Ruby, most objects RESPOND to a .to_s call.
  # However, if you do not override the implementation
  # of this method, converting an instance of Meal
  # to String would look like this:
  #
  # #<Meal:0x00007ff4be01dc08>
  #
  # We want to teach our model to display its data as
  # a string so that we can use it in the View
  # (see BaseView for method call)
  def to_s
    "Name: #{name} | Price: $#{price}"
  end
end
