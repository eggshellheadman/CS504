my $n=$ARGV[0];
shift;

my $c=0;

while (<>)
{
  chomp;
  if ($_=="") {
    $_="0.0";
  }
  print $_."\n";
  $c++;
}
for (my $i=$c;$i<$n;$i++) {
  print "0.0\n";
}
