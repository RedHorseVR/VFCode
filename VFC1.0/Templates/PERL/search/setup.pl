
















$root_web_path = "/home/sites/www.flowlynx.com/web";
$root_web_path = ".";
$html_url = "search.htm";


$server_url = "http://206.166.222.162";



$search_script = "search.pl";





$banned_files = "";




sub PrintHeaderHTML  
  {  
  local($user) = @_;  
print <<__HEADERHTML__;
<html><head><title>$search_results_title</title></head>  
<body>  
<h2><center>$user Search Engine Output</center></h2>  
<center>  
<hr><p>  
</center>  
<center><h3>Your keyword(s) <font color=#ff0000><i>$keywords</i></font>
appear on these pages:</h3></center><ul>  
__HEADERHTML__
}  




sub PrintBodyHTML  
  {  
  local($filename, $title) = @_;  
print <<__bodyHTML__;
<li>  
<b>  
<a href="$filename">
$title</a>  
</b>  
($filename)<br>
__bodyHTML__
}  


sub PrintFooterHTML  
  {  
  local($number_of_hits) = @_;  
print <<__FOOTERHTML__  ;
<br><center><b><font size=2>Your search on <i>'$keywords'</i> found <font color=  #ff0000>
$number_of_hits </font>page(s) containing the selected keyword(s)</b>  
</font><br><font size=2><i><b>Refine your  
keyword search by pressing 'Ctrl+F'  
to locate your keyword when viewing pages.</b>  
</i></font><br>  
<a href=$html_url><b>START A NEW SEARCH</b></a>  
<p>  
<hr>  
</center> </body> </html>  
__FOOTERHTML__
}  


sub PrintNoHitsBodyHTML  
  {  
print <<__NOHITS__;
<p>  
<center>  
<h2>No pages were found containing your keyword(s).</h2>  
</center>  
<p>  
__NOHITS__
}   


sub PrintNoKeywordMessage  {
  local ($user) = @_ ;
  print  ("<h2><center>$user Search Engine Error</center></h2>");
  print ("<b>You MUST enter one or more keywords to use this search engine. </b> ");
  print ("  <a href=$html_url>Return to the search input form. </a>");
}  
#  FlowCode File: setup.ins.
#  Export  File: setup.pl.
#  Export  Date: 02:18:15 PM - 06:Dec:2000.

