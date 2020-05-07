#!/usr/bin/perl -w
#[eJPT][spider]A script for crawling websites as Web Grep
#This script is named by YYJ, who is my friend and a smart lady.
#It is used for CTF and written by demonalex.
use Cwd;
$|=1;
$original_dir = getcwd;


for (0..7) { $folder .= chr( int(rand(25) + 65) ); }
#print "$folder\n";
system("mkdir -p /tmp/$folder");
chdir "/tmp/$folder";


print("Target URL (e.g. http://192.168.0.1:8080/ or http://www.163.com/): ");
$target_url=<STDIN>;
chop($target_url);
if(defined($target_url)){
 ;
}else{
 die("Target URL is not defined!\n");
}
print("Maximum Recursion Depth (Default: 5): ");
$mrd=<STDIN>;
chop($mrd);
if($mrd ne ""){
 ;
}else{
 $mrd=5;
}
print("Keyword (Default: password): ");
$keyword=<STDIN>;
chop($keyword);
if($keyword ne ""){
 ;
}else{
 $keyword="password";
}

=head
print("\$target_url : $target_url\n");
print("\$mrd: $mrd\n");
print("\$keyword: $keyword\n");
=cut
system("wget -q -r -l $mrd $target_url");
print("----------------------------------------\n");
system("grep -nR -i $keyword");


chdir $original_dir;
system("rm -Rf /tmp/$folder");
exit(0);
