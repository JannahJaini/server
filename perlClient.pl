#!/usr/bin/perl
#perlClient.pl

use IO::Socket::INET;

$| = 1;

my ($socket,$client_socket);

$socket = new IO::Socket::INET (
	PeerHost => '192.168.136.133',
	PeerPort => '5000',
	Proto => 'tcp',
) or die "ERROR in Socket Creation : $!\n";

print "TCP Connection Success.\n";

#read socket data from server

$data = <$socket>;

print "Receiver from Server : $data\n";

$data = "DATA from CLIENT";
print $socket "$data\n";

sleep (10);
$socket->close();


