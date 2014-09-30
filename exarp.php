<?php
/*this file is a part of exarp v1.2 (freeware)

                         #                    
                        ###                   
                       ## ##                  
                      ### ###                 
                     ###   ###                
               ######################         
              ########################        
               ###  ###    ####  ####         
                ## ###      ### ####          
                 #####      #######           
         ###     ######     ######   ###      
        ######  ########   #######  #######   
       ######   ######### #########  #######  
      #####    ####  ######### #####    ####  
      #####   #####   #######   #####   ####  
       ###########     #####     ###########  
        #########       ##        #########   
         #####                      #####
            ---exarp v1.2 - by unnex---

          ---visit: http://blacknet.me---
            
           ---visit: http://unnex.de---

download compiled program and source: https://new-crew.net/showthread.php?tid=416
*/

//---usage-config---
$pw="anypw";//link-password
$key="Test-123";//aes-password
$eaddx="info.exarp";//information-panel address
$filegety="no";//method: no=curl, yes=file_get_contents, fsock=fsockopen

//intranet config (optional):
$intrafolder="exarp-intranet";//local intranetfolder
$intrahost="websitehost";//intranet host
$intralink="http://websiteaddr/exarp-intranet";//intranet link
//------------------

if (!isset($_GET["p"])) { echo "<html></html>"; exit; }
if ($_GET["p"]==$pw) { } else { echo "<html></html>"; exit; }
if (isset($_POST["h"])) { if (isset($_GET["c"])) { while (strlen($key)<32) { $key.="0"; }
//---aes---
if (!function_exists('hex2bin')) { function hex2bin($d) { return pack("H*" , $d); } }
function pkcs5_pad ($text, $blocksize=16) {
$pad = $blocksize - (strlen($text) % $blocksize);
return $text . str_repeat(chr($pad), $pad); }

function pkcs5_unpad($text) { $pad = ord(substr($text, -1));
if ($pad > strlen($text)) { return false; }
if (strspn($text, chr($pad), strlen($text) - $pad) != $pad) { return false; }
return substr($text, 0, -$pad); }

$header=$_POST["h"];
$enc = $header;
$iv = '1234567890123456';
//---------

$decrypttext = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, base64_decode($enc), MCRYPT_MODE_CBC, $iv);
$header=pkcs5_unpad($decrypttext); } else { $header=base64_decode($_POST["h"]); } } else { exit; }

$linex=explode("\r\n", $header); $linexa=explode("\n\n", $header); $linexl=strlen($linex[0]); $linexla=strlen($linexa[0]);
if ($linexl>$linexla) { $linexb="\n"; } else { $linexb="\r\n"; }

if (isset($_GET["h"])) { $page=$header; $pagehe=explode($linexb . $linexb, $page); $pagehet=explode($linexb, $pagehe[0]); $ihen=""; $ihe=0; while (isset($pagehet[$ihe])) { if (preg_match("/Accept-Encoding:/i", $pagehet[$ihe], $match)) { $pagehet[$ihe]="Accept-Encoding: deflate"; }
$ihen.=$pagehet[$ihe] . $linexb; $ihe++; } $pagehei=1; while (isset($pagehe[$pagehei])) { $page=$linexb . $pagehe[$pagehei]; $pagehei++; } $page=$ihen . $page; $header=$page; $page=""; unset($pagehe); unset($pagehet); }

$prega="#01111000#";
$faddr=explode(" ", $header);
$addr=$faddr[1];

$addrri=preg_replace("/http:\/\//i" ,"", $addr);
$addrri=preg_replace("/\//" ,"", $addrri);

//---intranet---
$addrrijx=explode("/", $addr);
if (file_exists("./" . $intrafolder . "/" . $addrrijx[2] . "/exarp-dummy.txt")) {
$fp=fopen("./" . $intrafolder . "/" . $addrrijx[2] . "/exarp-dummy.txt",'r');
$sizsilcheck=fread ($fp, filesize("./" . $intrafolder . "/" . $addrrijx[2] . "/exarp-dummy.txt"));
fclose($fp); if ($sizsilcheck!=="intranet") { exit; }

$addrrijxir=""; $addrrijxi=0; while(isset($addrrijx[$addrrijxi])) { $addrrijxir.=$addrrijx[$addrrijxi] . "/"; $addrrijxi++; } if ($addrrijxi>0) { $addrrijxir=substr($addrrijxir, 0, strlen($addrrijxir)-1); }
$addrrijxir=preg_replace("/http:\/\//i" ,"", $addrrijxir);

$addrrij=$intralink . "/" . $addrri;
$slilen=strlen($faddr[0])+8+strlen($addrrijx[2]); $slilen=0-(strlen($header)-$slilen); $header=$faddr[0] . " " . $intralink . "/" . $addrrijx[2] . substr($header, $slilen);

$headersliq=explode($linexb, $header); $headersliqi=0;
$header=""; while (isset($headersliq[$headersliqi])) {
if (strlen($headersliq[$headersliqi])>6) { $headersliqx=substr($headersliq[$headersliqi], 0, 6); if (strtolower($headersliqx)=="host: ") { $headersliq[$headersliqi]="Host: " . $intrahost; } }
$header.=$headersliq[$headersliqi] . $linexb; $headersliqi++; } if ($headersliqi>0) { $header=substr($header, 0, strlen($header)-strlen($linexb)); }

if (isset($faddr)) { unset($faddr); } if (isset($addr)) { unset($addr); } if (isset($addrri)) { unset($addrri); }
$faddr=explode(" ", $header);
$addr=$faddr[1];
$addrri=preg_replace("/http:\/\//i" ,"", strtolower($addr));
$addrri=preg_replace("/\//" ,"", $addrri); }
//--------------

if (strtolower($addrri)==strtolower($eaddx)) {
$agents=""; if (isset($_POST["b"])) { $agents=base64_decode($_POST["b"]); }
$agents=preg_replace("/</" ,"&lt;", $agents); $agents=preg_replace("/>/" ,"&gt;", $agents);
$agents=preg_replace("/\"/" ,"&quot;", $agents); $agents=preg_replace("/'/" ,"&apos;", $agents);
$inuse="???";
if ($filegety=="yes") { $inuse="file_get_contents"; }
if ($filegety=="no") { $inuse="curl"; }
if ($filegety=="fsock") { $inuse="fsockopen"; }

$info="<td>&nbsp;<i>Server Time:</i> ". preg_replace("/</" ,"&lt;", date('h:i:s')) . " <i>Server Date:</i> ". preg_replace("/</" ,"&lt;", date('d.m.Y')) . "<br>&nbsp;Intranet: " . preg_replace("/</" ,"&lt;", $intrafolder) . "</td>";
$infox="<table width=\"98%\" cellpadding=\"0\" cellspacing=\"0\" border=\"3\"><tr><td><h2>&nbsp;Server</h2>" . $info . "</td></td></tr></table>"; $info=$infox;

$infoa.="<td>&nbsp;<i>Method in use:</i> " . $inuse . "<br>";
$cutz="plain > base64 (low)";
if (isset($_GET["c"])) { $cutz="plain > <u>aes-256</u> > base64 (high)"; }
$infoa.="&nbsp;<i>Encryption:</i> ". $cutz . "<br>";
$infoa.="&nbsp;<i>User-Agent:</i> ". $agents . "</td>";
$infox=$info . "<br><table width=\"98%\" cellpadding=\"0\" cellspacing=\"0\" border=\"3\"><tr><td><h2>&nbsp;You</h2>" . $infoa . "</td></td></tr></table>"; $info=$infox;

$w="<html><head><title>Exarp v1.2</title></head>";
$w.="<body><p align=\"center\">";
$w.=$info;
$w.="</p>";
$w.="</body></html>";
$page="HTTP/1.1 200 OK\nContent-Type: text/html; charset=UTF-8\nContent-Length: " . strlen($w) . "\n\n" . $w;

if (isset($_GET["c"])) { $enctext=mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, pkcs5_pad($page), MCRYPT_MODE_CBC, $iv); $page=base64_encode($enctext); echo $prega . $page . $prega; } else { echo $prega . base64_encode($page) . $prega; }
exit; }

//---config---
$errormsg="<html><h1 align=\"center\">error on building tunnel to " . htmlspecialchars($addr);
//------------

$agent="";
if (isset($_POST["b"])) { $agent=base64_decode($_POST["b"]); }

$post="no";
if (strtolower($faddr[0])=="post") { $post="yes"; $reheader=explode($linexb . $linexb, $header); $postdata=$reheader[1]; }

//--------------------------------
if ($filegety=="fsock") { if (isset($_GET["h"])) { $errormsg="error: https not implemented in exarp's fsockopen tunnel. but you can use curl and file_get_contents!<br><br><i>used: fsockopen</i></h1></html>"; $page="HTTP/1.1 503 Service Unavailable\nContent-Type: text/html; charset=UTF-8\nContent-Length: " . strlen($errormsg) . "\n\n" . $errormsg; if (isset($_GET["c"])) { $enctext=mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, pkcs5_pad($page), MCRYPT_MODE_CBC, $iv); $page=base64_encode($enctext); echo $prega . $page . $prega; } else { echo $prega . base64_encode($page) . $prega; } }
$headerta=explode($linexb, $header); $headertb=""; $headerti=1;
while (isset($headerta[$headerti])) { if ($headerti>1) { $headertb=$headertb . $linexb; } $headertb=$headertb . $headerta[$headerti]; $headerti++; }

$faddkt=explode("/", $faddr[1]); $faddkti=0; $faddkta="";
while (isset($faddkt[$faddkti])) { if ($faddkti>2) { $faddkta.="/" . $faddkt[$faddkti]; } $faddkti++; }

$faddsqr=explode($linexb, $faddr[2]); $faddktprn="80";
$faddktx=explode(":", $faddkt[2]); if (isset($faddktx[1])) { if (strlen($faddktx[1])>0) { $faddkt[2]=preg_replace("/:" . $faddktx[1] . "/" ,"", $faddkt[2]); $faddktprn=$faddktx[1]; } }
$headertb=$faddr[0] . " " . $faddkta . " " . $faddsqr[0] . $linexb . $headertb;
$headertb=preg_replace("/" . ": Keep-Alive" . $linexb . "/i" ,": Close" . $linexb, $headertb);

$fp=fsockopen($faddkt[2], $faddktprn, $errno, $errstr, 30); $jehn="";
if (!$fp) { /*error*/ } else { fwrite($fp, $headertb);
while (!feof($fp)) { $jehn.=fgets($fp, 128); } fclose($fp); }

$page=$jehn; if (strlen($boundary)>0) { $page=preg_replace("/HTTP\/1.1 100 Continue\r\n/" ,"", $page); $page=preg_replace("/HTTP\/1.1 100 Continue\n/" ,"", $page); }
$errormsg=$errormsg . "<br><br><i>used: fsockopen</i></h1></html>";
if (strlen($page)<1) { $page="HTTP/1.1 503 Service Unavailable\nContent-Type: text/html; charset=UTF-8\nContent-Length: " . strlen($errormsg) . "\n\n" . $errormsg; }

if (isset($_GET["c"])) { $enctext=mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, pkcs5_pad($page), MCRYPT_MODE_CBC, $iv); $page=base64_encode($enctext); echo $prega . $page . $prega; } else { echo $prega . base64_encode($page) . $prega; }
exit; }
//--------------------------------

//--------------------------------
if ($filegety=="yes") { $headerta=explode($linexb, $header);
$headertb=""; $headerti=1;
while (isset($headerta[$headerti])) { if ($headerti>1) { $headertb=$headertb . $linexb; } $headertb=$headertb . $headerta[$headerti]; $headerti++; }
$headertb=preg_replace("/" . ": Keep-Alive" . $linexb . "/i" ,": Close" . $linexb, $headertb);

$opts = array(
  'http'=>array(
    'method'=>$faddr[0],
    'header'=>$headertb
  )
);

$context = stream_context_create($opts);

if (isset($_GET["h"])) { $addrqap=substr($faddr[1], 0, 7); if (strtolower($addrqap)=="http://") { $faddr[1]=substr($addr, 7, strlen($faddr[1])); $faddr[1]="https://" . $faddr[1]; } }
$page = file_get_contents($faddr[1], FALSE, $context);
$filegeti=0; $newhead="";
while (isset($http_response_header[$filegeti])) { $newhead=$newhead . $http_response_header[$filegeti] . $linexb;
if ($filegeti>1) { if (strlen($http_response_header[$filegeti])>4) { if (strtolower($http_response_header[$filegeti][0] . $http_response_header[$filegeti][1]  . $http_response_header[$filegeti][2]  . $http_response_header[$filegeti][3] . $http_response_header[$filegeti][4])=="http/") { $filegeti=9999999999; } } }
$filegeti++; }

if (strlen($page)>0) { $page=$newhead . $linexb . $page; } else { $page=$newhead; }
$errormsg=$errormsg . "<br><br><i>used: file_get_contents</i></h1></html>";
if (strlen($page)<1) { $page="HTTP/1.1 503 Service Unavailable\nContent-Type: text/html; charset=UTF-8\nContent-Length: " . strlen($errormsg) . "\n\n" . $errormsg; }

if (isset($_GET["h"])) { $pagehe=explode($linexb . $linexb, $page); $pagehet=explode($linexb, $pagehe[0]); $ihen=""; $ihe=0; while (isset($pagehet[$ihe])) { if (preg_match("/Set-Cookie:/i", $pagehet[$ihe], $match)) { $pagehet[$ihe]=preg_replace("/ Secure;/i" ," HttpOnly;", $pagehet[$ihe] . ";"); $pagehet[$ihe]=preg_replace("/;Secure;/i" ,";HttpOnly;", $pagehet[$ihe] . ";"); $pagehet[$ihe]=preg_replace("/; Secure /i" ,"; HttpOnly ", $pagehet[$ihe] . ";"); }
$ihen.=$pagehet[$ihe] . $linexb; $ihe++; } $pagehei=1; $page=""; while (isset($pagehe[$pagehei])) { $page.=$linexb . $pagehe[$pagehei]; $pagehei++; } $page=$ihen . $page; $page=preg_replace("/https:/i" ,"http:", $page); $page=preg_replace("/\"https\"/i" ,"\"http\"", $page); $page=preg_replace("/'https'/i" ,"'http'", $page); }

if (isset($_GET["c"])) { $enctext=mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, pkcs5_pad($page), MCRYPT_MODE_CBC, $iv); $page=base64_encode($enctext); echo $prega . $page . $prega; } else { echo $prega . base64_encode($page) . $prega; }
exit; }
//--------------------------------

$cookie="";
if (preg_match("/Cookie: /", $header, $match)) { $xatesend=explode("Cookie: ", $header);
$cookiex=explode($linexb, $xatesend[1]); $cookie=$cookiex[0]; }
$referer="";
if (preg_match("/Referer: /", $header, $match)) { $xatesendr=explode("Referer: ", $header);
$refererx=explode($linexb, $xatesendr[1]); $referer=$refererx[0]; }
$boundary="";
if (preg_match("/boundary=-/", $header, $match)) { $xatesendr=explode("boundary=-", $header);
$boundaryx=explode($linexb, $xatesendr[1]); $boundary=$boundaryx[0]; }

if (isset($_GET["h"])) { $addrqap=substr($addr, 0, 7); if (strtolower($addrqap)=="http://") { $addr=substr($addr, 7, strlen($addr)); $addr="https://" . $addr; } }

$ch = curl_init($addr);
curl_setopt($ch, CURLOPT_URL, $addr);

if (isset($_GET["h"])) { curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); }
if (strlen($agent)>0) { curl_setopt($ch, CURLOPT_USERAGENT, $agent); }
if (strlen($cookie)>0) { curl_setopt ($ch, CURLOPT_COOKIE, $cookie); }
if (strlen($referer)>0) { curl_setopt ($ch, CURLOPT_REFERER, $referer); }

if (strlen($boundary)>0) { $boundary="-" . $boundary;
$xfix=1; $strf="";
$strfx=explode($linexb . $linexb, $header); while (isset($strfx[$xfix])) { if (strlen($strf)>0) { $strf.=$linexb . $linexb . $strfx[$xfix]; } else { $strf.=$strfx[$xfix]; } $xfix++; }
$strf=preg_replace("/\\\\r\\\\n/" ,"", $strf); $str=preg_replace("/\\\\n/" ,"", $strf);

curl_setopt_array($ch, array(
CURLOPT_HEADER => true,
CURLOPT_RETURNTRANSFER => true,
CURLOPT_POST => true,
CURLOPT_HTTPHEADER => array('Content-Type: multipart/form-data; boundary=' . $boundary,
'Content-Length: ' . strlen($str)), CURLOPT_READFUNCTION => 'myfunc'));

function myfunc($ch, $fp, $len) { static $pos=0;
global $str;
$data = substr($str, $pos, $len);
$pos += strlen($data);
return $data; } }

if (strlen($boundary)<1) { curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); curl_setopt($ch, CURLOPT_HEADER, 1);
if ($post=="yes") { curl_setopt ($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata); } }

$page=curl_exec($ch); if (strlen($boundary)>0) { $page=preg_replace("/HTTP\/1.1 100 Continue\r\n/" ,"", $page); $page=preg_replace("/HTTP\/1.1 100 Continue\n/" ,"", $page); }
curl_close($ch);

$errormsg=$errormsg . "<br><br><i>used: curl_exec</i></h1></html>";
if (strlen($page)<1) { $page="HTTP/1.1 503 Service Unavailable\nContent-Type: text/html; charset=UTF-8\nContent-Length: " . strlen($errormsg) . "\n\n" . $errormsg; }

if (isset($_GET["h"])) { $pagehe=explode($linexb . $linexb, $page); $pagehet=explode($linexb, $pagehe[0]); $ihen=""; $ihe=0; while (isset($pagehet[$ihe])) { if (preg_match("/Set-Cookie:/i", $pagehet[$ihe], $match)) { $pagehet[$ihe]=preg_replace("/ Secure;/i" ," HttpOnly;", $pagehet[$ihe] . ";"); $pagehet[$ihe]=preg_replace("/;Secure;/i" ,";HttpOnly;", $pagehet[$ihe] . ";"); $pagehet[$ihe]=preg_replace("/; Secure /i" ,"; HttpOnly ", $pagehet[$ihe] . ";"); }
$ihen.=$pagehet[$ihe] . $linexb; $ihe++; } $pagehei=1; $page=""; while (isset($pagehe[$pagehei])) { $page.=$linexb . $pagehe[$pagehei]; $pagehei++; } $page=$ihen . $page; $page=preg_replace("/https:/i" ,"http:", $page); $page=preg_replace("/\"https\"/i" ,"\"http\"", $page); $page=preg_replace("/'https'/i" ,"'http'", $page); }

if (isset($_GET["c"])) { $enctext=mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, pkcs5_pad($page), MCRYPT_MODE_CBC, $iv); $page=base64_encode($enctext); echo $prega . $page . $prega; } else { echo $prega . base64_encode($page) . $prega; }
?>
