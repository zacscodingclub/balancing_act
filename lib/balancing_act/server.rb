module BalancingAct
  class Server
    attr_accessor :name, :size

    def initialize(name, size)
      if valid_params?(name, size)
      	@name = name
        @size = size
      end
    end

    private

    # Validates the params by type.  Could add in additional validations in
    # this method depending on requirements.  Raises exception with invalid
    # types with early return or returns true if params are valid
    def valid_params?(name, size)
      return raise TypeError.new("A 'name' should be a string") if name.class != String
      return raise TypeError.new("A 'size' should be an integer") if size.class != Integer

      true
    end
  end
end
