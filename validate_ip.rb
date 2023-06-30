def get_addr_network(address, net_size)
    #Convert ip address to 32 bit binary
    ip_bin = ip_to_binary(address)
    #Extract Network ID from 32 binary
    network = ip_bin.chars[0..32-(32-net_size)]
    network
end


def ip_to_binary(ip)
    octet_list_int = ip.split(".")
    octet_list_bin = octet_list_int.map{|dec|  "%08b" % dec}
    binary = octet_list_bin.join("")
    binary
end


def ip_in_prefix(ip_address, prefix)
    #CIDR based separation of address and network size
    prefix_address, net_size = prefix.split("/")
    #Convert string to int
    net_size = net_size.to_i
    #Get the network ID of both prefix and ip based net size
    prefix_network = get_addr_network(prefix_address, net_size)
    ip_network = get_addr_network(ip_address, net_size)
    return ip_network == prefix_network
end


prefix = "192.0.2.0/24"
 ip_address = "192.0.2.1"

ip_in_prefix(ip_address, prefix)
