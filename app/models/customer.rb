class Customer
  attr_accessor :id # read and write :id
  attr_reader :name, :address

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
    %i[id name address]
  end

  # Customer.new({})
  def initialize(attributes = {})
    # Set initial instance
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_array
    [@id, @name, @address]
  end

  # In Ruby, most objects RESPOND to a .to_s call.
  # However, if you do not override the implementation
  # of this method, converting an instance of Customer
  # to String would look like this:
  #
  # #<Customer:0x00007ff4be01dc08>
  #
  # We want to teach our model to display its data as
  # a string so that we can use it in the View
  # (see BaseView for method call)
  def to_s
    "Name: #{name} | Address: #{address}"
  end
end
