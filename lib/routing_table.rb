# Routing table
class RoutingTable
  include Pio

  MAX_NETMASK_LENGTH = 32

  def initialize(route)
    @db = Array.new(MAX_NETMASK_LENGTH + 1) { Hash.new }
    route.each { |each| add(each) }
  end

  def add(options)
    netmask_length = options.fetch(:netmask_length)
    prefix = IPv4Address.new(options.fetch(:destination)).mask(netmask_length)
    @db[netmask_length][prefix.to_i] = IPv4Address.new(options.fetch(:next_hop))
  end
  
  def delete(options)
    netmask_length = options.fetch(:netmask_length)
    prefix = IPv4Address.new(options.fetch(:destination)).mask(netmask_length)
    @db[netmask_length].delete(prefix.to_i)
  end

  def lookup(destination_ip_address)
    MAX_NETMASK_LENGTH.downto(0).each do |each|
      prefix = destination_ip_address.mask(each)
      entry = @db[each][prefix.to_i]
      return entry if entry
    end
    nil
  end
  
  def dump()
    str = "Destination\t|\tNext hop\n"
    str += "----------------------------------------\n"
    MAX_NETMASK_LENGTH.downto(0).each do |netmask_length|
      for prefix_i, next_hop in @db[netmask_length].each_pair do
        str += IPv4Address.new(prefix_i).to_s
        str += "/"
        str += netmask_length.to_s
        str += "\t"
        str += "|"
        str += "\t"
        str += next_hop.to_s
        str += "\n"
      end
    end
    return str
  end
end
