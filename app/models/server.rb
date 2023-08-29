class Server
    attr_accessor :model, :ram, :hdd, :location, :price
  
    def initialize(attributes = {})
        @model = attributes['model']
        @ram = attributes['ram']
        @hdd = attributes['hdd']
        @location = attributes['location']
        @price = attributes['price']
    end
  
    def valid?
        # Implement your validation logic here
        # For example: Check if required attributes are present
        !@model.nil? && !@ram.nil? && !@hdd.nil? && !@location.nil? && !@price.nil?
    end
  
    def save
        # Implement any additional logic you need
        # Since you're not saving to the database, this can be an empty method
    end
  end
  