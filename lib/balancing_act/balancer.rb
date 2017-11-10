module BalancingAct
  class Balancer
    # Takes in all the arguments being passed through the terminal command as
    # type array of strings.  This will iterate through each of these options and
    # manipulate the string so it can create Server objects.  Then it will
    # place each Server into an array 'n' times based on the size passed in,
    # so the collection array will have the correctly proportioned values.
    # ex:
    # ["X:3", "Y:1"] #=> ["X", "X", "X", "Y"]
    def self.process(values)
      collection = []

      values.each do |v|
        name, size_string = v.split(":")
        size_int = size_string.to_i
        server = BalancingAct::Server.new(name, size_int)
        size_int.times { collection << server }
      end

      server = select_server(collection)
      puts server.name
      server
    end

    private

    # Picks a random server from an array of Server objects being passed in.
    # Returns a server object
    def self.select_server(servers)
      servers.sample
    end
  end
end
