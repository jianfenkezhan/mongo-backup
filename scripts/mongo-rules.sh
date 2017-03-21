# just a example, we can to defined ip for ESC to access contact
ip=127.0.0.1
iptables -I INPUT -p tcp --dport 27017 -j DROP
# local
iptables -I INPUT -s ip -p tcp --dport 27017 -j ACCEPT
#s1
iptables -I INPUT -s ip -p tcp --dport 27017 -j ACCEPT
#s2
iptables -I INPUT -s ip -p tcp --dport 27017 -j ACCEPT
# cms
iptables -I INPUT -s ip -p tcp --dport 27017 -j ACCEPT
# test.cms ip
# iptables -I INPUT -s ip -p tcp --dport 27017 -j ACCEPT