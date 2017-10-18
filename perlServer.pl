#!/usr/bin/perl
#perlServer.pl

use IO::Socket::INET;

$| = 1;

my ($socket,$client_socket);
my ($peeraddress,$peerport);

$socket = new IO::Socket::INET (
	LocalHost => '127.0.0.1',
	LocalPort => '5000',
	Proto => 'tcp',
	Listen => 5,
	Reuse => 1
) or die "ERROR in socket creation: $!\n";

print "SERVER waiting for client connection on port 5000...";

while (1)
{
	$client_socket = $socket->accept();
	$peer_address = $client_socket->peerhost();
	$peer_port = $client_socket->peerport();

	print "accepted new client connection from : $peeraddress, $peerport\n";

	$data = "DATA from server";
	print $client_socket "$data\n";

	$data = <$client_socket>;
	print "received from client : $data\n";
}

$socket->close();
