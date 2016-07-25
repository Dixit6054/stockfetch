#!/usr/bin/perl

use Finance::Quote;

my $q = Finance::Quote->new();
open (FIN, $ARGV[0]) || die ("Could not open $ARGV[0]");
print "Ticker, Name, Price, Cap, 52 Week low - high, eps, pe, Yield \n";



while ($line = <FIN>) {
  ($field1,$field2) = split ',', $line;

my %hash = (
    $field1 => $field2 );

  chomp(%hash);

  foreach my $i (keys %hash) {
  my %data = $q->fetch( $hash{$i}, $i);

  print $hash{$i} . " " . $i . ": " . $data{$i, 'name'} . ","  . $data{$i, 'price'} . "," .  $data{$i, 'cap'} .",". $data{$i, 'year_range'} .",". $data{$i, 'eps'} .",". $data{$i, 'pe'} . ",". $data{$i, 'yield'} . "\n";
  }

}
close (FIN);
