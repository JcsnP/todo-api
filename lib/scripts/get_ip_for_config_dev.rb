require 'socket'
p Socket.getifaddrs.map(&:addr).select(&:ipv4?).map(&:ip_address).detect { |x| x !~ /\A127/ }