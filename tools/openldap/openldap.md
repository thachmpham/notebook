# Command
ldapsearch -x -H ldap:/// -b dc=example,dc=com

slapd -d 7

slapd -d 7 -f slapd.conf

slaptest -v -f slapd.conf


cd test
./run tc_name
