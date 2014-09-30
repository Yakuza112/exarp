;this file is a part of exarp v1.2 (freeware)
;
;                         #                    
;                        ###                   
;                       ## ##                  
;                      ### ###                 
;                     ###   ###                
;               ######################         
;              ########################        
;               ###  ###    ####  ####         
;                ## ###      ### ####          
;                 #####      #######           
;         ###     ######     ######   ###      
;        ######  ########   #######  #######   
;       ######   ######### #########  #######  
;      #####    ####  ######### #####    ####  
;      #####   #####   #######   #####   ####  
;       ###########     #####     ###########  
;        #########       ##        #########   
;         #####                      #####
;            ---exarp v1.2 - by unnex---
;
;          ---visit: http://blacknet.me---
;            
;           ---visit: http://unnex.de---

;download compiled program and source: https://new-crew.net/showthread.php?tid=416

#include <ScrollBarConstants.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <WinHTTP.au3>
#Include <String.au3>
#include <Crypt.au3>

Opt('TrayMenuMode', 3)
Opt('TrayAutoPause', 0)
Opt('TrayIconHide', 0)
TraySetClick(16)

global $headersa="a", $guiheaders, $infheaders, $infheaderstext="", $infclear, $infclearsta, $infclearstax="a", $infnewtext="", $infnheaderbutton, $yinfheader="", $infncheaderbutton, $tampera, $tamperyaa, $filteria="", $inffilterbutton, $inffilterinput

$v="v1.2"
$link="http://0.0.0.0/exarp.php"
$browsera=_Base64Encode("EXARP " & $v & " (HTTP://UNNEX.DE)")
$ip="127.0.0.1"
$port=80
$stabili=5
$critay="a"
$critzx="Test-123"
$key=$critzx
$nchza="a"
$IV='1234567890123456'
Const $KP_IV = 1
Const $KP_MODE = 4
Const $CRYPT_MODE_ECB = 2
$trayhidei="a"

$configx=""
$infatext=""
$infatexti="a"
$lfilel="-97827211A3"
$logfiles="False"
$breakewh="b"
$stoivua="a"
$prega="#01111000#"
if fileexists("conf.txt") Then
$config=FileRead("conf.txt")
$configx=stringsplit($config, @CRLF, 1)

if ubound($configx)>7 Then
$critzx=$configx[7]
$key=$critzx
EndIf
if ubound($configx)>5 Then
$link=$configx[1]
$browsera=_Base64Encode($configx[2])
$ip=$configx[3]
$port=$configx[4]
$stabili=$configx[5]
if ubound($configx)>6 Then
$logfiles=$configx[6]
EndIf
EndIf
EndIf
$browsera=StringReplace($browsera, @crlf, "")
$browsera=StringReplace($browsera, @cr, "")

$gui=GUICreate("exarp " & $v, 700, 220)
$groupa=GUICtrlCreateGroup("Link (PHP-File)", 6, 7, 687, 60)
$inputa=GUICtrlCreateInput($link, 15, 30, 670, 23)
$groupb=GUICtrlCreateGroup("Browser (User-Agent)", 6, 77, 687, 60)
GUICtrlSetColor(-1, 0x8B008B)
$par="|CorePlayer/1.0 (Palm OS 5.4.9; ARM Intel PXA27x; en) CorePlayer/1.3.2_6909|EXARP " & $v & " (HTTP://UNNEX.DE)|facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)|Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)|Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0 [en]|Mozilla/4.0 (compatible; MSIE 6.0b; Windows 98; YComp 5.0.0.0)|Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; )|Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; MS-RTC LM 8; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30729)|Mozilla/5.0 (Android; Linux armv7l; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 Fennec/10.0.1|Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)|Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)|Mozilla/5.0 (compatible; Konqueror/4.1; OpenBSD) KHTML/4.1.4 (like Gecko)|Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0) |Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)|Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)|Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)|Mozilla/5.0 (GNU; rv:1.9.1.7) Gecko/20100107 IceCat/3.6 (like Firefox/3.6)|Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25|Mozilla/5.0 (Linux; U; Android 4.2; en-us; Nexus 10 Build/JVP15I) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30|Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.5b) Gecko/20030917 Camino/0.7+|Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+|Mozilla/5.0 (Playstation Vita 1.61) AppleWebKit/531.22.8 (KHTML, like Gecko) Silk/3.2|Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31|Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0|Mozilla/5.0 (X11; U; FreeBSD amd64; en-US; rv:1.8.0.8) Gecko/20061116 Firefox/1.5.0.8|Mozilla/5.0 (X11; U; Linux i686; en-gb) AppleWebKit/525.1+ (KHTML, like Gecko, Safari/525.1+) epiphany-webkit|NCSA_Mosaic/2.0 (Windows 3.1)|Opera/9.80 (Windows Mobile; WCE; Opera Mobi/WMD-50430; U; en-GB) Presto/2.4.13 Version/10.00|XBMC/3.3-DEV-r31572 (Xbox; http://www.xbmc.org)|"
$inputb=GUICtrlCreateCombo("", 15, 100, 670, 23)
if StringInStr($par, "|" & _HexToString(_Base64Decode($browsera)) & "|")>0 Then
GUICtrlSetData($inputb, $par, _HexToString(_Base64Decode($browsera)))
Else
GUICtrlSetData($inputb, $par & _HexToString(_Base64Decode($browsera)), _HexToString(_Base64Decode($browsera)))
EndIf

$button=GUICtrlCreateButton("start", 10, 170, 350, 20)
$configbutton=GUICtrlCreateButton("local config", 360, 170, 125, 20)
$profilesbutton=GUICtrlCreateButton("profiles", 485, 170, 125, 20)
$credits=GUICtrlCreateButton("credits", 610, 170, 80, 20)
$stabila=GUICtrlCreateButton("purgation socket to stabilize cavity", 10, 195, 680, 20)
$trayhide=TrayCreateItem("hide/show window")
$trayexit=TrayCreateItem("exit")
TraySetIcon(@ScriptDir & '\exarp.exe');compiled.ico or exarp.exe
GUIctrlSetState($stabila, $GUI_DISABLE)

$traffic=0
$trafficlabel=GUICtrlCreateLabel("Traffic: ~" & StringReplace(traffic($traffic), ".", ","), 15, 145, 250, 20)

$itr=0
WinSetTrans($gui, "", $itr)
GUISetState(@SW_SHOW, $gui)
while $itr<=255
sleep(50)
WinSetTrans($gui, "", $itr)
$itr=$itr+25.5
WEnd

while 1
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select
   
Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()
   
Case $msg=$credits
credits()

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf

Case $msg=$profilesbutton
GUISetState(@SW_DISABLE, $gui)
GUISetState(@SW_DISABLE, $guiheaders)
$guiprofiles=GUICreate("Profiles", 554, 613)
$profilestexta=fileread("conf.txt")
$profilestextb=fileread("conf2.txt")
$profilestextc=fileread("conf3.txt")
$profilestextd=fileread("conf4.txt")
$profilesagroupa=GUICtrlCreateGroup("Profile: 1 (The profile currently in use)", 6, 7, 540, 148)
$profilesalabela=GUICtrlCreateLabel("Link (PHP-File):", 15, 25, 80, 20)
$profilesalabelb=GUICtrlCreateLabel("User-Agent:", 15, 38, 80, 20)
$profilesalabelc=GUICtrlCreateLabel("IP:", 15, 51, 80, 20)
$profilesalabeld=GUICtrlCreateLabel("Port:", 15, 64, 80, 20)
$profilesalabele=GUICtrlCreateLabel("Stabilizer:", 15, 76, 80, 20)
$profilesalabelf=GUICtrlCreateLabel("Logfile:", 15, 89, 80, 20)
$profilesalabelg=GUICtrlCreateLabel("AES-Password:", 15, 103, 80, 20)
$profilesbuttona=GUICtrlCreateButton("Reset", 13, 122, 80, 20)
$profilesa=GUICtrlCreateEdit($profilestexta, 95, 23, 440, 120)
GUICtrlSetState(-1, $GUI_DISABLE)
$profilesagroupb=GUICtrlCreateGroup("Profile: 2", 6, 157, 540, 148)
$profilesalabelh=GUICtrlCreateLabel("Link (PHP-File):", 15, 175, 80, 20)
$profilesalabeli=GUICtrlCreateLabel("User-Agent:", 15, 188, 80, 20)
$profilesalabelj=GUICtrlCreateLabel("IP:", 15, 201, 80, 20)
$profilesalabelk=GUICtrlCreateLabel("Port:", 15, 214, 80, 20)
$profilesalabell=GUICtrlCreateLabel("Stabilizer:", 15, 226, 80, 20)
$profilesalabelm=GUICtrlCreateLabel("Logfile:", 15, 239, 80, 20)
$profilesalabeln=GUICtrlCreateLabel("AES-Password:", 15, 253, 80, 20)
$profilesbuttonb=GUICtrlCreateButton("Apply", 13, 272, 80, 20)
$profilesb=GUICtrlCreateEdit($profilestextb, 95, 173, 440, 120)
$profilesagroupc=GUICtrlCreateGroup("Profile: 3", 6, 307, 540, 148)
$profilesalabelo=GUICtrlCreateLabel("Link (PHP-File):", 15, 325, 80, 20)
$profilesalabelp=GUICtrlCreateLabel("User-Agent:", 15, 338, 80, 20)
$profilesalabelq=GUICtrlCreateLabel("IP:", 15, 351, 80, 20)
$profilesalabelr=GUICtrlCreateLabel("Port:", 15, 364, 80, 20)
$profilesalabels=GUICtrlCreateLabel("Stabilizer:", 15, 376, 80, 20)
$profilesalabelt=GUICtrlCreateLabel("Logfile:", 15, 389, 80, 20)
$profilesalabelu=GUICtrlCreateLabel("AES-Password:", 15, 403, 80, 20)
$profilesbuttonc=GUICtrlCreateButton("Apply", 13, 422, 80, 20)
$profilesc=GUICtrlCreateEdit($profilestextc, 95, 323, 440, 120)
$profilesagroupd=GUICtrlCreateGroup("Profile: 4", 6, 457, 540, 148)
$profilesalabelv=GUICtrlCreateLabel("Link (PHP-File):", 15, 475, 80, 20)
$profilesalabelw=GUICtrlCreateLabel("User-Agent:", 15, 488, 80, 20)
$profilesalabelx=GUICtrlCreateLabel("IP:", 15, 501, 80, 20)
$profilesalabely=GUICtrlCreateLabel("Port:", 15, 514, 80, 20)
$profilesalabelz=GUICtrlCreateLabel("Stabilizer:", 15, 526, 80, 20)
$profilesalabelaa=GUICtrlCreateLabel("Logfile:", 15, 539, 80, 20)
$profilesalabelbb=GUICtrlCreateLabel("AES-Password:", 15, 553, 80, 20)
$profilesbuttond=GUICtrlCreateButton("Apply", 13, 572, 80, 20)
$profilesd=GUICtrlCreateEdit($profilestextd, 95, 473, 440, 120)
GUISetState(@SW_SHOW, $guiprofiles)

while 1
$msg=GUIGetMsg($guiprofiles)
Select

Case $msg=$profilesbuttona
if ubound($configx)>7 Then
$configx[7]=stringreplace($configx[7], @CRLF, "")
$critzx=$configx[7]
$key=$critzx
EndIf
if ubound($configx)>5 Then
$configx[1]=stringreplace($configx[1], @CRLF, "")
$configx[2]=stringreplace($configx[2], @CRLF, "")
$configx[3]=stringreplace($configx[3], @CRLF, "")
$configx[4]=stringreplace($configx[4], @CRLF, "")
$configx[5]=stringreplace($configx[5], @CRLF, "")
$link=$configx[1]
$browsera=$configx[2]
$ip=$configx[3]
$port=$configx[4]
$stabili=$configx[5]
if ubound($configx)>6 Then
$configx[6]=stringreplace($configx[6], @CRLF, "")
$logfiles=$configx[6]
EndIf
EndIf

GUICtrlSetData($profilesa, "http://0.0.0.0/exarp.php" & @CRLF & "EXARP v1.2 (HTTP://UNNEX.DE)" & @CRLF & "127.0.0.1" & @CRLF & "80" & @CRLF & "5" & @CRLF & "False" & @CRLF & "Test-123")
if FileExists("conf.txt") Then FileDelete("conf.txt")
filewrite("conf.txt", guictrlread($profilesa))
$configx=stringsplit(guictrlread($profilesa), @CRLF, 1)
if ubound($configx)>7 Then
$configx[7]=stringreplace($configx[7], @CRLF, "")
$critzx=$configx[7]
$key=$critzx
EndIf
if ubound($configx)>5 Then
$configx[1]=stringreplace($configx[1], @CRLF, "")
$configx[2]=stringreplace($configx[2], @CRLF, "")
$configx[3]=stringreplace($configx[3], @CRLF, "")
$configx[4]=stringreplace($configx[4], @CRLF, "")
$configx[5]=stringreplace($configx[5], @CRLF, "")
$link=$configx[1]
GUICtrlSetData($inputa, $link)
$browsera=$configx[2]
$par="|CorePlayer/1.0 (Palm OS 5.4.9; ARM Intel PXA27x; en) CorePlayer/1.3.2_6909|EXARP " & $v & " (HTTP://UNNEX.DE)|facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)|Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)|Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0 [en]|Mozilla/4.0 (compatible; MSIE 6.0b; Windows 98; YComp 5.0.0.0)|Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; )|Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; MS-RTC LM 8; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30729)|Mozilla/5.0 (Android; Linux armv7l; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 Fennec/10.0.1|Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)|Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)|Mozilla/5.0 (compatible; Konqueror/4.1; OpenBSD) KHTML/4.1.4 (like Gecko)|Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0) |Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)|Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)|Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)|Mozilla/5.0 (GNU; rv:1.9.1.7) Gecko/20100107 IceCat/3.6 (like Firefox/3.6)|Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25|Mozilla/5.0 (Linux; U; Android 4.2; en-us; Nexus 10 Build/JVP15I) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30|Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.5b) Gecko/20030917 Camino/0.7+|Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+|Mozilla/5.0 (Playstation Vita 1.61) AppleWebKit/531.22.8 (KHTML, like Gecko) Silk/3.2|Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31|Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0|Mozilla/5.0 (X11; U; FreeBSD amd64; en-US; rv:1.8.0.8) Gecko/20061116 Firefox/1.5.0.8|Mozilla/5.0 (X11; U; Linux i686; en-gb) AppleWebKit/525.1+ (KHTML, like Gecko, Safari/525.1+) epiphany-webkit|NCSA_Mosaic/2.0 (Windows 3.1)|Opera/9.80 (Windows Mobile; WCE; Opera Mobi/WMD-50430; U; en-GB) Presto/2.4.13 Version/10.00|XBMC/3.3-DEV-r31572 (Xbox; http://www.xbmc.org)|"
if StringInStr($par, "|" & $browsera & "|")>0 Then
GUICtrlSetData($inputb, $par, $browsera)
Else
GUICtrlSetData($inputb, $par & $browsera, $browsera)
EndIf
$ip=$configx[3]
$port=$configx[4]
$stabili=$configx[5]
if ubound($configx)>6 Then
$configx[6]=stringreplace($configx[6], @CRLF, "")
$logfiles=$configx[6]
EndIf
EndIf
exitloop

Case $msg=$profilesbuttonb
if FileExists("conf2.txt") Then FileDelete("conf2.txt")
filewrite("conf2.txt", guictrlread($profilesb))
$configx=stringsplit(guictrlread($profilesb), @CRLF, 1)
if ubound($configx)>7 Then
$configx[7]=stringreplace($configx[7], @CRLF, "")
$critzx=$configx[7]
$key=$critzx
EndIf
if ubound($configx)>5 Then
$configx[1]=stringreplace($configx[1], @CRLF, "")
$configx[2]=stringreplace($configx[2], @CRLF, "")
$configx[3]=stringreplace($configx[3], @CRLF, "")
$configx[4]=stringreplace($configx[4], @CRLF, "")
$configx[5]=stringreplace($configx[5], @CRLF, "")
$link=$configx[1]
GUICtrlSetData($inputa, $link)
$browsera=$configx[2]
$par="|CorePlayer/1.0 (Palm OS 5.4.9; ARM Intel PXA27x; en) CorePlayer/1.3.2_6909|EXARP " & $v & " (HTTP://UNNEX.DE)|facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)|Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)|Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0 [en]|Mozilla/4.0 (compatible; MSIE 6.0b; Windows 98; YComp 5.0.0.0)|Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; )|Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; MS-RTC LM 8; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30729)|Mozilla/5.0 (Android; Linux armv7l; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 Fennec/10.0.1|Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)|Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)|Mozilla/5.0 (compatible; Konqueror/4.1; OpenBSD) KHTML/4.1.4 (like Gecko)|Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0) |Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)|Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)|Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)|Mozilla/5.0 (GNU; rv:1.9.1.7) Gecko/20100107 IceCat/3.6 (like Firefox/3.6)|Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25|Mozilla/5.0 (Linux; U; Android 4.2; en-us; Nexus 10 Build/JVP15I) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30|Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.5b) Gecko/20030917 Camino/0.7+|Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+|Mozilla/5.0 (Playstation Vita 1.61) AppleWebKit/531.22.8 (KHTML, like Gecko) Silk/3.2|Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31|Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0|Mozilla/5.0 (X11; U; FreeBSD amd64; en-US; rv:1.8.0.8) Gecko/20061116 Firefox/1.5.0.8|Mozilla/5.0 (X11; U; Linux i686; en-gb) AppleWebKit/525.1+ (KHTML, like Gecko, Safari/525.1+) epiphany-webkit|NCSA_Mosaic/2.0 (Windows 3.1)|Opera/9.80 (Windows Mobile; WCE; Opera Mobi/WMD-50430; U; en-GB) Presto/2.4.13 Version/10.00|XBMC/3.3-DEV-r31572 (Xbox; http://www.xbmc.org)|"
if StringInStr($par, "|" & $browsera & "|")>0 Then
GUICtrlSetData($inputb, $par, $browsera)
Else
GUICtrlSetData($inputb, $par & $browsera, $browsera)
EndIf
$ip=$configx[3]
$port=$configx[4]
$stabili=$configx[5]
if ubound($configx)>6 Then
$configx[6]=stringreplace($configx[6], @CRLF, "")
$logfiles=$configx[6]
EndIf
EndIf
exitloop

Case $msg=$profilesbuttonc
if FileExists("conf3.txt") Then FileDelete("conf3.txt")
filewrite("conf3.txt", guictrlread($profilesc))
$configx=stringsplit(guictrlread($profilesc), @CRLF, 1)
if ubound($configx)>7 Then
$configx[7]=stringreplace($configx[7], @CRLF, "")
$critzx=$configx[7]
$key=$critzx
EndIf
if ubound($configx)>5 Then
$configx[1]=stringreplace($configx[1], @CRLF, "")
$configx[2]=stringreplace($configx[2], @CRLF, "")
$configx[3]=stringreplace($configx[3], @CRLF, "")
$configx[4]=stringreplace($configx[4], @CRLF, "")
$configx[5]=stringreplace($configx[5], @CRLF, "")
$link=$configx[1]
GUICtrlSetData($inputa, $link)
$browsera=$configx[2]
$par="|CorePlayer/1.0 (Palm OS 5.4.9; ARM Intel PXA27x; en) CorePlayer/1.3.2_6909|EXARP " & $v & " (HTTP://UNNEX.DE)|facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)|Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)|Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0 [en]|Mozilla/4.0 (compatible; MSIE 6.0b; Windows 98; YComp 5.0.0.0)|Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; )|Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; MS-RTC LM 8; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30729)|Mozilla/5.0 (Android; Linux armv7l; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 Fennec/10.0.1|Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)|Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)|Mozilla/5.0 (compatible; Konqueror/4.1; OpenBSD) KHTML/4.1.4 (like Gecko)|Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0) |Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)|Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)|Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)|Mozilla/5.0 (GNU; rv:1.9.1.7) Gecko/20100107 IceCat/3.6 (like Firefox/3.6)|Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25|Mozilla/5.0 (Linux; U; Android 4.2; en-us; Nexus 10 Build/JVP15I) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30|Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.5b) Gecko/20030917 Camino/0.7+|Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+|Mozilla/5.0 (Playstation Vita 1.61) AppleWebKit/531.22.8 (KHTML, like Gecko) Silk/3.2|Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31|Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0|Mozilla/5.0 (X11; U; FreeBSD amd64; en-US; rv:1.8.0.8) Gecko/20061116 Firefox/1.5.0.8|Mozilla/5.0 (X11; U; Linux i686; en-gb) AppleWebKit/525.1+ (KHTML, like Gecko, Safari/525.1+) epiphany-webkit|NCSA_Mosaic/2.0 (Windows 3.1)|Opera/9.80 (Windows Mobile; WCE; Opera Mobi/WMD-50430; U; en-GB) Presto/2.4.13 Version/10.00|XBMC/3.3-DEV-r31572 (Xbox; http://www.xbmc.org)|"
if StringInStr($par, "|" & $browsera & "|")>0 Then
GUICtrlSetData($inputb, $par, $browsera)
Else
GUICtrlSetData($inputb, $par & $browsera, $browsera)
EndIf
$ip=$configx[3]
$port=$configx[4]
$stabili=$configx[5]
if ubound($configx)>6 Then
$configx[6]=stringreplace($configx[6], @CRLF, "")
$logfiles=$configx[6]
EndIf
EndIf
exitloop

Case $msg=$profilesbuttond
if FileExists("conf4.txt") Then FileDelete("conf4.txt")
filewrite("conf4.txt", guictrlread($profilesd))
$configx=stringsplit(guictrlread($profilesd), @CRLF, 1)
if ubound($configx)>7 Then
$configx[7]=stringreplace($configx[7], @CRLF, "")
$critzx=$configx[7]
$key=$critzx
EndIf
if ubound($configx)>5 Then
$configx[1]=stringreplace($configx[1], @CRLF, "")
$configx[2]=stringreplace($configx[2], @CRLF, "")
$configx[3]=stringreplace($configx[3], @CRLF, "")
$configx[4]=stringreplace($configx[4], @CRLF, "")
$configx[5]=stringreplace($configx[5], @CRLF, "")
$link=$configx[1]
GUICtrlSetData($inputa, $link)
$browsera=$configx[2]
$par="|CorePlayer/1.0 (Palm OS 5.4.9; ARM Intel PXA27x; en) CorePlayer/1.3.2_6909|EXARP " & $v & " (HTTP://UNNEX.DE)|facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)|Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)|Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0 [en]|Mozilla/4.0 (compatible; MSIE 6.0b; Windows 98; YComp 5.0.0.0)|Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; )|Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; MS-RTC LM 8; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30729)|Mozilla/5.0 (Android; Linux armv7l; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 Fennec/10.0.1|Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)|Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)|Mozilla/5.0 (compatible; Konqueror/4.1; OpenBSD) KHTML/4.1.4 (like Gecko)|Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0) |Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)|Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)|Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)|Mozilla/5.0 (GNU; rv:1.9.1.7) Gecko/20100107 IceCat/3.6 (like Firefox/3.6)|Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25|Mozilla/5.0 (Linux; U; Android 4.2; en-us; Nexus 10 Build/JVP15I) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30|Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.5b) Gecko/20030917 Camino/0.7+|Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+|Mozilla/5.0 (Playstation Vita 1.61) AppleWebKit/531.22.8 (KHTML, like Gecko) Silk/3.2|Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31|Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0|Mozilla/5.0 (X11; U; FreeBSD amd64; en-US; rv:1.8.0.8) Gecko/20061116 Firefox/1.5.0.8|Mozilla/5.0 (X11; U; Linux i686; en-gb) AppleWebKit/525.1+ (KHTML, like Gecko, Safari/525.1+) epiphany-webkit|NCSA_Mosaic/2.0 (Windows 3.1)|Opera/9.80 (Windows Mobile; WCE; Opera Mobi/WMD-50430; U; en-GB) Presto/2.4.13 Version/10.00|XBMC/3.3-DEV-r31572 (Xbox; http://www.xbmc.org)|"
if StringInStr($par, "|" & $browsera & "|")>0 Then
GUICtrlSetData($inputb, $par, $browsera)
Else
GUICtrlSetData($inputb, $par & $browsera, $browsera)
EndIf
$ip=$configx[3]
$port=$configx[4]
$stabili=$configx[5]
if ubound($configx)>6 Then
$configx[6]=stringreplace($configx[6], @CRLF, "")
$logfiles=$configx[6]
EndIf
EndIf
exitloop

Case $msg=$GUI_EVENT_CLOSE
ExitLoop
EndSelect
WEnd
GUIDelete($guiprofiles)
GUISetState(@SW_ENABLE, $guiheaders)
GUISetState(@SW_ENABLE, $gui)
GUISetState(@SW_RESTORE, $gui)

Case $msg=$configbutton
GUISetState(@SW_DISABLE, $gui)
GUISetState(@SW_DISABLE, $guiheaders)
$guiportport=GUICreate(" ", 154, 261)
$labelportportip=GUICtrlCreateLabel("---ip---", 58, 7, 187, 20)
$inputportportip=GUICtrlCreateInput($ip, 28, 23, 93, 20)
$labelportport=GUICtrlCreateLabel("---port---", 54, 50, 187, 20)
$inputportport=GUICtrlCreateInput($port, 28, 67, 93, 20)
$labelstoreme=GUICtrlCreateLabel("---stabilizer---", 45, 91, 187, 20)
$storeme=GUICtrlCreateInput($stabili, 28, 108, 93, 20)
$labelcritzze=GUICtrlCreateLabel("___optional___", 37, 171, 187, 20)
$labelcritz=GUICtrlCreateLabel("---aes password---", 33, 191, 187, 20)
$critz=GUICtrlCreateInput($critzx, 28, 210, 93, 20)
$buttonportport=GUICtrlCreateButton("ok", 28, 235, 93, 20)
$labelportport=GUICtrlCreateLabel("---logfile---", 52, 130, 187, 20)
$radioa = GUICtrlCreateRadio("yes", 38, 145, 40, 20)
$radiob = GUICtrlCreateRadio("no", 78, 145, 30, 20)
if StringLower($logfiles)=="true" Then
GUICtrlSetState($radioa, $GUI_CHECKED)
Else
GUICtrlSetState($radiob, $GUI_CHECKED)
EndIf

GUISetState(@SW_SHOW, $guiportport)

while 1
$msg=GUIGetMsg($guiportport)
$msgtray=TrayGetMsg()

Select
   
Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()

Case $msg=$buttonportport
$ip=GUICtrlRead($inputportportip)
$port=GUICtrlRead($inputportport)
$stabili=GUICtrlRead($storeme)
$logfiles=$radioa And BitAND(GUICtrlRead($radioa), $GUI_CHECKED) = $GUI_CHECKED
$critzx=guictrlread($critz)
$key=$critzx
GUIDelete($guiportport)
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
GUIDelete($guiportport)
ExitLoop
EndSelect
WEnd

GUISetState(@SW_ENABLE, $guiheaders)
GUISetState(@SW_ENABLE, $gui)
GUISetState(@SW_RESTORE, $gui)

Case $msg=$button
if stringlen($key)>32 Then
msgbox(4096, "error", "max length of aes-password is 32 chars!")
exit
EndIf

$key=$critzx
if $nchza=="b" Then
_Crypt_DestroyKey($key)
_Crypt_Shutdown()
$nchza="a"
EndIf

if $nchza=="a" Then
_Crypt_Startup()
$keyra=$key
while stringlen($keyra)<32
$keyra&="0"
WEnd
$key = _CryptImportKey($CALG_AES_256, $keyra, 32)
_CryptSetKeyParam($key, $KP_IV, $IV, 0, "str")
$nchza="b"
EndIf

if $lfilel<>"-97827211A3" Then
fileclose($lfilel)
endif
$lfilel="-97827211A3"
$inputbqwq=StringReplace(GUICtrlRead($inputb), "|", "")
if stringlen($inputbqwq)<1 then
msgbox(4096, "info", "user-agent need more than 0 chars!")
$inputbqwq="EXARP " & $v & " (HTTP://UNNEX.DE)"
GUICtrlSetData($inputb, $par, "EXARP " & $v & " (HTTP://UNNEX.DE)")
EndIf
$browsera=_Base64Encode($inputbqwq)
$browsera=StringReplace($browsera, @crlf, "")
$browsera=StringReplace($browsera, @cr, "")
if StringInStr($link, "&c", 1)>0 Then
GUICtrlSetData($button, "stop (secure)")
Else
GUICtrlSetData($button, "stop")
EndIf
if StringInStr($link, "&h", 1)>0 and StringInStr(guictrlread($button), "https", 1)<1 Then GUICtrlSetData($button, guictrlread($button) & " (https)")

GUICtrlSetData($configbutton, "headers")

GUIctrlSetState($stabila, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_DISABLE)
GUIctrlSetState($profilesbutton, $GUI_DISABLE)
GUIctrlSetState($inputa, $GUI_DISABLE)
GUIctrlSetState($inputb, $GUI_DISABLE)
$breakewh="a"

if StringLower($logfiles)=="true" Then
$lfilel=FileOpen("log.txt", 1)
EndIf

if stringlen(GUICtrlRead($inputa))>0 Then
$link=GUICtrlRead($inputa)
$critay="a"
if StringInStr($link, "&c", 1)>0 Then
GUICtrlSetData($button, "stop (secure)")
$critay="b"
Else
GUICtrlSetData($button, "stop")
EndIf
if StringInStr($link, "&h", 1)>0 and StringInStr(guictrlread($button), "https", 1)<1 Then GUICtrlSetData($button, guictrlread($button) & " (https)")

if fileexists("conf.txt") Then
FileDelete("conf.txt")
EndIf
FileWrite("conf.txt", $link & @CRLF & _HexToString(_Base64Decode($browsera)) & @CRLF & $ip & @CRLF & $port & @CRLF & $stabili & @CRLF & $logfiles & @CRLF & $critzx)
EndIf

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect

if $stoivua=="b" Then
$browsera=_Base64Encode(GUICtrlRead($inputb))
$browsera=StringReplace($browsera, @crlf, "")
$browsera=StringReplace($browsera, @cr, "")
if StringInStr($link, "&c", 1)>0 Then
GUICtrlSetData($button, "stop (secure)")
else
GUICtrlSetData($button, "stop")
EndIf
if StringInStr($link, "&h", 1)>0 and StringInStr(guictrlread($button), "https", 1)<1 Then GUICtrlSetData($button, guictrlread($button) & " (https)")

;GUIctrlSetState($configbutton, $GUI_DISABLE)
GUICtrlSetData($configbutton, "headers")

GUIctrlSetState($stabila, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_DISABLE)
GUIctrlSetState($profilesbutton, $GUI_DISABLE)
GUIctrlSetState($inputa, $GUI_DISABLE)
GUIctrlSetState($inputb, $GUI_DISABLE)
$breakewh="a"

if stringlen(GUICtrlRead($inputa))>0 Then
$link=GUICtrlRead($inputa)
if fileexists("conf.txt") Then
FileDelete("conf.txt")
EndIf
FileWrite("conf.txt", $link & @CRLF & _HexToString(_Base64Decode($browsera)) & @CRLF & $ip & @CRLF & $port & @CRLF & $stabili & @CRLF & $logfiles & @CRLF & $critzx)
EndIf
$stoivua="a"
GUICtrlSetData($stabila, "purgation socket to stabilize cavity")
GUIctrlSetState($stabila, $GUI_ENABLE)
EndIf
;--------------------------------------------------------------------------------------------------------------x

if $breakewh=="a" then
$browser=$browsera
$errormsg=""

TCPShutdown()
TCPStartUp()

$mainsocket=TCPListen($ip, $port,  1000)
If $MainSocket=-1 Then
$errormsg="cant connect as " &  $ip & " with port " & $port & "."
if $errormsg<>"cant understand header data. please use 5 or more chars in your header data." Then
msgbox(4096, "error", $errormsg, 99999999999999)
endif
exiti()
EndIf
$socket=-1

while $breakewh=="a"

;---
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select

Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()



Case $msg=$infclearsta
if $headersa=="b" Then
if $infclearstax=="a" Then
guictrlsetdata($infclearsta, "start")
$infclearstax="b"
Else
guictrlsetdata($infclearsta, "stop")
$infclearstax="a"
EndIf
EndIf

Case $msg=$inffilterbutton
$filteria=guictrlread($inffilterinput)
filter()

Case $msg=$tamperyaa
if $tampera=="a" then
GUICtrlSetData($tamperyaa, "stop tamper")
$tampera="b"
else
GUICtrlSetData($tamperyaa, "start tamper")
$tampera="a"
endif

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf

Case $msg=$infnheaderbutton
if $headersa=="b" Then
$yinfheader=" (saved!)"
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$infatext=GUICtrlRead($infnewtext)
$infatexti="b"
endif

Case $msg=$infclear
if $headersa=="b" Then
GUICtrlSetData($infheaders, "")
$infheaderstext=""
EndIf

Case $msg=$configbutton
headers()

Case $msg=$button
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
TCPShutdown()
GUICtrlSetData($button, "start")
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect
;---

$wiluen=@sec
$wilueni=0
While $socket<=0 and $breakewh=="a"

if $wiluen>@sec or $wiluen<@sec Then
$wiluen=@sec
$wilueni=$wilueni+1
if $wiluen>2 and $socket<0 Then
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
TCPShutdown()
TCPStartup()
$mainsocket=TCPListen($ip, $port,  1000)
$wilueni=0
EndIf
EndIf
	
$socket=TCPAccept($mainsocket)
;---
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select

Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()

Case $msg=$infclearsta
if $headersa=="b" Then
if $infclearstax=="a" Then
guictrlsetdata($infclearsta, "start")
$infclearstax="b"
Else
guictrlsetdata($infclearsta, "stop")
$infclearstax="a"
EndIf
EndIf

Case $msg=$inffilterbutton
$filteria=guictrlread($inffilterinput)
filter()

Case $msg=$tamperyaa
if $tampera=="a" then
GUICtrlSetData($tamperyaa, "stop tamper")
$tampera="b"
else
GUICtrlSetData($tamperyaa, "start tamper")
$tampera="a"
endif

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf	

Case $msg=$infnheaderbutton
if $headersa=="b" Then
$yinfheader=" (saved!)"
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$infatext=GUICtrlRead($infnewtext)
$infatexti="b"
endif

Case $msg=$infclear
if $headersa=="b" Then
GUICtrlSetData($infheaders, "")
$infheaderstext=""
EndIf

Case $msg=$configbutton
headers()

Case $msg=$button
TCPShutdown()
GUICtrlSetData($button, "start")
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect
;---
WEnd


if $socket>0 Then
$errormsg=""
$header=""
$recv=""
$rexif=@sec
$rexifi=0
;--------------

;while StringInStr($recv, @CRLF & @CRLF, 1)<1 and StringInStr($recv, @CR & @CR, 1)<1 and $breakewh=="a"
$lia="b"
while $breakewh=="a" and $lia=="b"
;---
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select

Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()

Case $msg=$infclearsta
if $headersa=="b" Then
if $infclearstax=="a" Then
guictrlsetdata($infclearsta, "start")
$infclearstax="b"
Else
guictrlsetdata($infclearsta, "stop")
$infclearstax="a"
EndIf
EndIf

Case $msg=$inffilterbutton
$filteria=guictrlread($inffilterinput)
filter()

Case $msg=$tamperyaa
if $tampera=="a" then
GUICtrlSetData($tamperyaa, "stop tamper")
$tampera="b"
else
GUICtrlSetData($tamperyaa, "start tamper")
$tampera="a"
endif

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf

Case $msg=$infnheaderbutton
if $headersa=="b" Then
$yinfheader=" (saved!)"
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$infatext=GUICtrlRead($infnewtext)
$infatexti="b"
endif
	
Case $msg=$infclear
if $headersa=="b" Then
GUICtrlSetData($infheaders, "")
$infheaderstext=""
EndIf

Case $msg=$configbutton
headers()

Case $msg=$stabila
GUICtrlSetData($stabila, "socket was stabilized. it can go on!")
GUIctrlSetState($stabila, $GUI_DISABLE)
;---
TCPCloseSocket($socket)
$socket=TCPAccept($mainsocket)
while $socket<0 and $breakewh=="a"
$socket=TCPAccept($mainsocket)
;---
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select

Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()

Case $msg=$infclearsta
if $headersa=="b" Then
if $infclearstax=="a" Then
guictrlsetdata($infclearsta, "start")
$infclearstax="b"
Else
guictrlsetdata($infclearsta, "stop")
$infclearstax="a"
EndIf
EndIf

Case $msg=$inffilterbutton
$filteria=guictrlread($inffilterinput)
filter()

Case $msg=$tamperyaa
if $tampera=="a" then
GUICtrlSetData($tamperyaa, "stop tamper")
$tampera="b"
else
GUICtrlSetData($tamperyaa, "start tamper")
$tampera="a"
endif

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf

Case $msg=$infnheaderbutton
if $headersa=="b" Then
$yinfheader=" (saved!)"
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$infatext=GUICtrlRead($infnewtext)
$infatexti="b"
endif

Case $msg=$infclear
if $headersa=="b" Then
GUICtrlSetData($infheaders, "")
$infheaderstext=""
EndIf	

Case $msg=$configbutton
headers()

Case $msg=$button
TCPShutdown()
GUICtrlSetData($button, "start")
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect
;---
WEnd
GUIctrlSetState($stabila, $GUI_ENABLE)
GUICtrlSetData($stabila, "purgation socket to stabilize cavity")
;---

Case $msg=$button
TCPShutdown()
GUICtrlSetData($button, "start")
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect
;---

$recvxy=$recv
$recv &= TCPRecv($socket, 2048)
If @error Then $lia="a"
if StringInStr($recv, @CRLF & @CRLF, 1)>0 or StringInStr($recv, @CR & @CR, 1)>0 then
if $recvxy==$recv Then
$lia="a"
endif
EndIf
	
if StringLen($recv)>0 Then
$rexif=@sec
EndIf

if StringLen($recv)<1 and $rexif<@sec or $rexif>@sec and $socket>=0 Then
if $rexifi>$stabili Then
GUIctrlSetState($stabila, $GUI_DISABLE)

GUICtrlSetData($stabila, "socket was stabilized. it can go on!")

TCPShutdown()
TCPStartup()
GUICtrlSetData($button, "start")
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
$stoivua="b"
ExitLoop

TCPShutdown()
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
$mainsocket=TCPListen($ip, $port,  1000)
If $MainSocket=-1 Then
$errormsg="cant connect as " &  $ip & " with port " & $port & "."
if $errormsg<>"cant understand header data. please use 5 or more chars in your header data." Then
msgbox(4096, "error", $errormsg, 99999999999999)
endif
exiti()
EndIf

$socket=TCPAccept($mainsocket)
while $socket<0 and $breakewh=="a"
$socket=TCPAccept($mainsocket)
;---
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select

Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()

Case $msg=$infclearsta
if $headersa=="b" Then
if $infclearstax=="a" Then
guictrlsetdata($infclearsta, "start")
$infclearstax="b"
Else
guictrlsetdata($infclearsta, "stop")
$infclearstax="a"
EndIf
EndIf

Case $msg=$inffilterbutton
$filteria=guictrlread($inffilterinput)
filter()

Case $msg=$tamperyaa
if $tampera=="a" then
GUICtrlSetData($tamperyaa, "stop tamper")
$tampera="b"
else
GUICtrlSetData($tamperyaa, "start tamper")
$tampera="a"
endif

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf

Case $msg=$infnheaderbutton
if $headersa=="b" Then
$yinfheader=" (saved!)"
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$infatext=GUICtrlRead($infnewtext)
$infatexti="b"
endif

Case $msg=$infclear
if $headersa=="b" Then
GUICtrlSetData($infheaders, "")
$infheaderstext=""
EndIf

Case $msg=$configbutton
headers()

Case $msg=$button
TCPShutdown()
GUICtrlSetData($button, "start")
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect
;---
WEnd
GUIctrlSetState($stabila, $GUI_DISABLE)
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
TCPShutdown()
GUICtrlSetData($stabila, "purgation socket to stabilize cavity")

TCPStartup()
sleep(100)
$mainsocket=TCPListen($ip, $port,  1000)
If $MainSocket=-1 Then
$errormsg="cant connect as " &  $ip & " with port " & $port & "."
if $errormsg<>"cant understand header data. please use 5 or more chars in your header data." Then
msgbox(4096, "error", $errormsg, 99999999999999)
endif
exiti()
EndIf

$rexif=@sec
$rexifi=0
endif
$rexif=@sec
$rexifi=$rexifi+1
EndIf
WEnd

if $infatexti=="b" Then
$yinfheader=""
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$recv=$infatext
$infatext=""
$infatexti="a"
EndIf

if stringlen($recv)<5 then
$errormsg="cant understand header data. please use 5 or more chars in your header data."
EndIf
if Stringlen($errormsg)<1 Then
	
$recvx=StringSplit(StringLower($recv), "", 1)

if $recvx[1] & $recvx[2] & $recvx[3] & $recvx[4]=="post" and Stringlen($errormsg)<1 Then

;---
$recvpost=StringLower($recv)
$recvpostx=stringsplit($recvpost, "content-length: ", 1)

if not $recvpostx[2] Then
$errormsg="unidentified header data. unknown on search strlower(Content-Length)."
EndIf
if stringlen($errormsg)<1 Then
if StringInStr($recv, @CRLF & @CRLF, 1) Then
$recvpostxx=stringsplit($recvpostx[2], @CRLF, 1)
Else
$recvpostxx=stringsplit($recvpostx[2], @CR, 1)
EndIf
if int($recvpostxx[1])==$recvpostxx[1] Then
Else
$errormsg="unidentified header data. Content-Length must be a integer."
EndIf
EndIf

if stringlen($errormsg)<1 Then
if StringInStr($recv, @CRLF & @CRLF, 1) Then
$recvpc=stringsplit($recv, @CRLF & @CRLF, 1)
Else
$recvpc=stringsplit($recv, @CR & @CR, 1)
EndIf

if StringInStr($recvpc[1], "boundary=-----------------", 1)>0 and ubound($recvpc)>2 Then
$iaii=3
while $iaii<ubound($recvpc)
$recvpc[2]&=$recvpc[$iaii]
$iaii=$iaii+1
WEnd
EndIf

$recvpostxx[1]=$recvpostxx[1]-50
$oldiu=0
while number(stringlen($recvpc[2]))<number($recvpostxx[1])
;---
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select

Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()

Case $msg=$infclearsta
if $headersa=="b" Then
if $infclearstax=="a" Then
guictrlsetdata($infclearsta, "start")
$infclearstax="b"
Else
guictrlsetdata($infclearsta, "stop")
$infclearstax="a"
EndIf
EndIf

Case $msg=$inffilterbutton
$filteria=guictrlread($inffilterinput)
filter()

Case $msg=$tamperyaa
if $tampera=="a" then
GUICtrlSetData($tamperyaa, "stop tamper")
$tampera="b"
else
GUICtrlSetData($tamperyaa, "start tamper")
$tampera="a"
endif

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf

Case $msg=$infnheaderbutton
if $headersa=="b" Then
$yinfheader=" (saved!)"
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$infatext=GUICtrlRead($infnewtext)
$infatexti="b"
endif

Case $msg=$infclear
if $headersa=="b" Then
GUICtrlSetData($infheaders, "")
$infheaderstext=""
EndIf

Case $msg=$configbutton
headers()

Case $msg=$button
TCPShutdown()
GUICtrlSetData($button, "start")
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect
;---

$recv &= TCPRecv($socket, 2048)
if StringInStr($recv, @CRLF & @CRLF, 1) Then
$recvpc=stringsplit($recv, @CRLF & @CRLF, 1)
Else
$recvpc=stringsplit($recv, @CR & @CR, 1)
EndIf

if StringInStr($recvpc[1], "boundary=-----------------", 1)>0 and ubound($recvpc)>2 Then
$iaii=3
while $iaii<ubound($recvpc)
$recvpc[2]&=$recvpc[$iaii]
$iaii=$iaii+1
WEnd
EndIf

if $oldiu<number(stringlen($recvpc[2])) Then
$oldiu=number(stringlen($recvpc[2]))
Else
ExitLoop
EndIf
WEnd

;---tamper---
if $headersa=="b" and $tampera=="b" Then
$tampergui=GUICreate("tamper-header (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ")", 705, 330, -1, -1, $WS_BORDER)
$tamperdit=GUICtrlCreateEdit($recv, 10, 10, 680, 250)
$tamperok=GUICtrlCreateButton("send", 10, 270, 340, 25)
$tamperya=GUICtrlCreateButton("stop tamper", 350, 270, 340, 25)
GUISetState(@SW_SHOW, $tampergui)
GUISetState(@SW_DISABLE, $gui)
GUISetState(@SW_DISABLE, $guiheaders)
GUISetState(@SW_RESTORE, $tampergui)

while 1
$tampermsg=GUIGetMsg($tampergui)
Select

Case $tampermsg=$tamperok
$recv=GUICtrlRead($tamperdit)
GUIDelete($tampergui)
GUISetState(@SW_ENABLE, $gui)
GUISetState(@SW_ENABLE, $guiheaders)
ExitLoop

Case $tampermsg=$tamperya
GUIDelete($tampergui)
GUICtrlSetData($tamperyaa, "start tamper")
GUISetState(@SW_ENABLE, $gui)
GUISetState(@SW_ENABLE, $guiheaders)
$tampera="a"
ExitLoop

Case $tampermsg=$GUI_EVENT_CLOSE
GUIDelete($guiportport)
ExitLoop

EndSelect
WEnd
EndIf
;------------

if $headersa=="b" and $infclearstax=="a" Then
$infheaderstext=$infheaderstext & "#---------------------------outgoing---------------------------# (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ") user-agent: " & _HexToString(_Base64Decode($browsera)) & @CRLF & $recv & @crlf
$infheaderstext=stringreplace($infheaderstext, Chr(00), "")
if stringlen($filteria)>0 then
filter()
else
WinSetTitle($guiheaders, "", "http-headers (loading...)")
GUICtrlSetData($infheaders, $infheaderstext)
if stringlen($filteria)>0 then
WinSetTitle($guiheaders, "", "http-headers #filter: " & $filteria)
Else
WinSetTitle($guiheaders, "", "http-headers")
EndIf
endif
_GUICtrlEdit_Scroll($infheaders, $SB_SCROLLCARET)
EndIf
if StringLower($logfiles)=="true" Then
filewrite($lfilel, "#---------------------------outgoing---------------------------# (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ") user-agent: " & _HexToString(_Base64Decode($browsera)) & @CRLF & $recv & @crlf)
EndIf
$header=$recv
EndIf
;---
Else

;---tamper---
if $headersa=="b" and $tampera=="b" Then
$tampergui=GUICreate("tamper-header (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ")", 705, 330, -1, -1, $WS_BORDER)
$tamperdit=GUICtrlCreateEdit($recv, 10, 10, 680, 250)
$tamperok=GUICtrlCreateButton("send", 10, 270, 340, 25)
$tamperya=GUICtrlCreateButton("stop tamper", 350, 270, 340, 25)
GUISetState(@SW_SHOW, $tampergui)
GUISetState(@SW_DISABLE, $gui)
GUISetState(@SW_DISABLE, $guiheaders)
GUISetState(@SW_RESTORE, $tampergui)

while 1
$tampermsg=GUIGetMsg($tampergui)
Select

Case $tampermsg=$tamperok
$recv=GUICtrlRead($tamperdit)
GUIDelete($tampergui)
GUISetState(@SW_ENABLE, $gui)
GUISetState(@SW_ENABLE, $guiheaders)
ExitLoop

Case $tampermsg=$tamperya
GUIDelete($tampergui)
GUICtrlSetData($tamperyaa, "start tamper")
GUISetState(@SW_ENABLE, $gui)
GUISetState(@SW_ENABLE, $guiheaders)
$tampera="a"
ExitLoop

Case $tampermsg=$GUI_EVENT_CLOSE
GUIDelete($guiportport)
ExitLoop

EndSelect
WEnd
EndIf
;------------

if $headersa=="b" and $infclearstax=="a" Then
$infheaderstext&="#---------------------------outgoing---------------------------# (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ") user-agent: " & _HexToString(_Base64Decode($browsera)) & @CRLF & $recv & @crlf
$infheaderstext=stringreplace($infheaderstext, Chr(00), "")
if stringlen($filteria)>0 then
filter()
else
WinSetTitle($guiheaders, "", "http-headers (loading...)")
GUICtrlSetData($infheaders, $infheaderstext)
if stringlen($filteria)>0 then
WinSetTitle($guiheaders, "", "http-headers #filter: " & $filteria)
Else
WinSetTitle($guiheaders, "", "http-headers")
EndIf
endif
_GUICtrlEdit_Scroll($infheaders, $SB_SCROLLCARET)
EndIf
if StringLower($logfiles)=="true" Then
filewrite($lfilel, "#---------------------------outgoing---------------------------# (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ") user-agent: " & _HexToString(_Base64Decode($browsera)) & @CRLF & $recv & @crlf)
EndIf
$header=$recv

endif
EndIf

if stringlen($errormsg)<1 Then
if $critay=="b" Then
$crypt=_Crypt_EncryptData($header, $key, $CALG_USERKEY)
$header=$crypt
;$header=Hex($crypt)
EndIf

$header=_Base64Encode($header)
$header=StringReplace($header, @crlf, "")
$header=StringReplace($header, @cr, "")

$post="h=" & $header

if stringlen($browser)>0 Then
$post=$post & "&b=" & $browser
EndIf
$post=StringReplace($post, "+", "%2B")

;---path-host---
$hostname=""
$get=""

if StringInStr($link, "/" , 1)<1 Then
$hostname=$link
EndIf

if stringlen($hostname)<1 and StringInStr(stringlower($link), "http://" , 1)<1 Then
$i=1
$linkxa=StringSplit($link, "", 1)
while $i<ubound($linkxa)
if $linkxa[$i]=="/" then exitloop
$hostname=$hostname & $linkxa[$i]
$i=$i+1
WEnd
while $i<ubound($linkxa)
$get=$get & $linkxa[$i]
$i=$i+1
WEnd
EndIf

if stringlen($hostname)<1 and stringlen($link)>7 Then
$linkl=StringLower($link)
$linklx=StringSplit($link, "", 1)
if $linklx[1] & $linklx[2] & $linklx[3] & $linklx[4] & $linklx[5] & $linklx[6] & $linklx[7]=="http://" Then
$i=8
$linkxa=StringSplit($link, "", 1)
while $i<ubound($linklx)
if $linkxa[$i]=="/" then exitloop
$hostname=$hostname & $linkxa[$i]
$i=$i+1
WEnd
while $i<ubound($linkxa)
$get=$get & $linkxa[$i]
$i=$i+1
WEnd
EndIf
EndIf

if stringlen($get)<1 Then
$get="/"
EndIf

GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetState($configbutton, $GUI_DISABLE)
GUICtrlSetData($stabila, "connecting server...")

$hostnameip=TCPNameToIP($hostname)
;---------------

;---send---
$traffic=$traffic+314+stringlen($hostname)+stringlen($hostname)+stringlen($post)
GUICtrlSetData($trafficlabel, "Traffic: ~" & StringReplace(traffic($traffic), ".", ","))

$hw_open = _WinHttpOpen("reviece")
$hw_connect = _WinHttpConnect($hw_open, $hostname)
$h_openRequest = _WinHttpOpenRequest($hw_connect,"POST", $get,"HTTP/1.1", "http://" & $hostname)
$x=_WinHttpSendRequest($h_openRequest, "Content-Type: application/x-www-form-urlencoded" & @CRLF, $post)
_WinHttpReceiveResponse($h_openRequest)

GUIctrlSetState($stabila, $GUI_ENABLE)
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUICtrlSetData($stabila, "purgation socket to stabilize cavity")

Local $data=""
Do
;----------------------------------------------
$msg=GUIGetMsg($gui)
$msgtray=TrayGetMsg()
Select

Case $msgtray=$trayhide
if $trayhidei=="a" Then
GUISetState(@SW_HIDE, $gui)
$trayhidei="b"
Else
GUISetState(@SW_SHOW, $gui)
$trayhidei="a"
EndIf

Case $msgtray=$trayexit
exiti()

Case $msg=$infclearsta
if $headersa=="b" Then
if $infclearstax=="a" Then
guictrlsetdata($infclearsta, "start")
$infclearstax="b"
Else
guictrlsetdata($infclearsta, "stop")
$infclearstax="a"
EndIf
EndIf

Case $msg=$inffilterbutton
$filteria=guictrlread($inffilterinput)
filter()

Case $msg=$tamperyaa
if $tampera=="a" then
GUICtrlSetData($tamperyaa, "stop tamper")
$tampera="b"
else
GUICtrlSetData($tamperyaa, "start tamper")
$tampera="a"
endif

Case $msg=$infncheaderbutton
if $headersa=="b" Then
GUIDelete($guiheaders)
$headersa="a"
EndIf

Case $msg=$infnheaderbutton
if $headersa=="b" Then
$yinfheader=" (saved!)"
GUICtrlSetData($infnheaderbutton, "set new header" & $yinfheader)
$infatext=GUICtrlRead($infnewtext)
$infatexti="b"
endif

Case $msg=$infclear
if $headersa=="b" Then
GUICtrlSetData($infheaders, "")
$infheaderstext=""
EndIf	

Case $msg=$configbutton
headers()

Case $msg=$stabila
ExitLoop

Case $msg=$button
TCPShutdown()
GUICtrlSetData($button, "start")
TCPCloseSocket($socket)
TCPCloseSocket($mainsocket)
GUIctrlSetState($stabila, $GUI_DISABLE)
GUIctrlSetdata($configbutton, "local config")
GUIctrlSetState($configbutton, $GUI_ENABLE)
GUIctrlSetState($credits, $GUI_ENABLE)
GUIctrlSetState($profilesbutton, $GUI_ENABLE)
GUIctrlSetState($inputa, $GUI_ENABLE)
GUIctrlSetState($inputb, $GUI_ENABLE)
$breakewh="b"
ExitLoop

Case $msg=$GUI_EVENT_CLOSE
exiti()
EndSelect
;----------------------------------------------

$trafficxqe=$traffic+stringlen($data)
GUICtrlSetData($trafficlabel, "Traffic: ~" & StringReplace(traffic($trafficxqe), ".", ","))

$data&=_WinHttpReadData($h_openRequest)
Until @error or StringInStr($data, @CRLF & "0" & @CRLF & @CRLF)>0 or StringInStr($data, @CR & "0" & @CR & @CR)>0
$traffic=$traffic+stringlen($data)
GUICtrlSetData($trafficlabel, "Traffic: ~" & StringReplace(traffic($traffic), ".", ","))

_WinHttpCloseHandle($h_openRequest)
_WinHttpCloseHandle($hw_connect)
_WinHttpCloseHandle($hw_open)

if $critay=="b" Then
$datacri=stringsplit($data, "#01111000#", 1)
if ubound($datacri)>2 Then
$datacri=_Crypt_DecryptData(Binary('0x' & hex(_Base64Decode($datacri[2]))), $key, $CALG_USERKEY)
$data="#01111000#" & BinaryToString($datacri) & "#01111000#"
Else
$data="SFRUUC8xLjEgMjAwIE9LCkNvbnRlbnQtVHlwZTogdGV4dC9odG1sOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtTGVuZ3RoOiA2NQoKPGh0bWw+PGgxIGFsaWduPSJjZW50ZXIiPmVycm9yIG9uIGJ1aWxkaW5nIHR1bm5lbCB0byA8L2gxPjwvaHRtbD4="
EndIf
EndIf

if Stringlen($data)<1 Then
$data="SFRUUC8xLjEgMjAwIE9LCkNvbnRlbnQtVHlwZTogdGV4dC9odG1sOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtTGVuZ3RoOiA2NQoKPGh0bWw+PGgxIGFsaWduPSJjZW50ZXIiPmVycm9yIG9uIGJ1aWxkaW5nIHR1bm5lbCB0byA8L2gxPjwvaHRtbD4="
EndIf

$dataxpeg=StringSplit($data, $prega, 1)
if StringInStr($data, $prega, 1)>0 and ubound($dataxpeg)>2 Then
$data=$dataxpeg[2]
EndIf

if $critay=="a" Then $data=_Base64Decode($data)

$hextat=stringsplit($data, "", 1)

if ubound($hextat)<3 Then
$data="SFRUUC8xLjEgMjAwIE9LCkNvbnRlbnQtVHlwZTogdGV4dC9odG1sOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtTGVuZ3RoOiA2NQoKPGh0bWw+PGgxIGFsaWduPSJjZW50ZXIiPmVycm9yIG9uIGJ1aWxkaW5nIHR1bm5lbCB0byA8L2gxPjwvaHRtbD4="
$data=_Base64Decode($data)
$data=_HexToString($data)
$hextat=stringsplit($data, "", 1)
EndIf
if $hextat[1] & $hextat[2]=="0x" or $hextat[1] & $hextat[2]=="0X" Then
$data=_HexToString($data)
EndIf

if StringInStr($data, @CRLF & @CRLF, 1)>0 then
$daaxtar=StringSplit($data, @CRLF & @CRLF, 1)

$iar=2
$daaxta=""
while $iar<UBound($daaxtar)
if $iar>2 Then
$daaxta&=@CRLF & @CRLF & $daaxtar[$iar]
Else
$daaxta&=$daaxtar[$iar]
EndIf
$iar=$iar+1
WEnd

Else
$daaxtar=StringSplit($data, @CR & @CR, 1)

$iar=2
$daaxta=""
while $iar<UBound($daaxtar)
if $iar>2 Then
$daaxta&=@CR & @CR & $daaxtar[$iar]
Else
$daaxta&=$daaxtar[$iar]
EndIf
$iar=$iar+1
WEnd

EndIf

if StringInStr($daaxtar[1], ": chunked", 1)>0 then
if StringInStr($data, @CRLF & @CRLF, 1)>0 then
$daxta=StringSplit($data, @CRLF & @CRLF, 1)
$data=$daaxtar[1] & @CRLF & "Content-Length: " & stringlen($daaxta) & @CRLF & @CRLF & $daaxta
$data=StringReplace($data, "Transfer-Encoding: chunked" & @CRLF, "")
Else
$daxta=StringSplit($data, @CR & @CR, 1)
$data=$daaxtar[1] & @CR & "Content-Length: " & stringlen($daaxta) & @CR & @CR & $daaxta
$data=StringReplace($data, "Transfer-Encoding: chunked" & @CR, "")
EndIf
EndIf
TCPSend($socket, $data)

if $headersa=="b" and $infclearstax=="a" Then
$infheaderstext=$infheaderstext & "#---------------------------incoming---------------------------# (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ")" & @CRLF & $data & @crlf
$infheaderstext=stringreplace($infheaderstext, Chr(00), "")
if stringlen($filteria)>0 then
filter()
else
WinSetTitle($guiheaders, "", "http-headers (loading...)")
GUICtrlSetData($infheaders, $infheaderstext)
if stringlen($filteria)>0 then
WinSetTitle($guiheaders, "", "http-headers #filter: " & $filteria)
Else
WinSetTitle($guiheaders, "", "http-headers")
EndIf
endif
_GUICtrlEdit_Scroll($infheaders, $SB_SCROLLCARET)
EndIf

if StringLower($logfiles)=="true" Then
filewrite($lfilel, "#---------------------------incoming---------------------------# (" & @MDAY & "." & @MON & "." & @YEAR & " - " & @HOUR & ":" & @MIN & ":" & @SEC & ")" & @CRLF & $data & @crlf)
EndIf
;----------
Else
if $breakewh=="b" and $errormsg=="cant understand header data. please use 5 or more chars in your header data." then
Else
if $errormsg<>"cant understand header data. please use 5 or more chars in your header data." Then
msgbox(4096, "error", $errormsg, 99999999999999)
endif
EndIf
EndIf
TCPCloseSocket($socket)
$socket=-1
EndIf
WEnd
TCPShutdown()
EndIf

;if $socket<0 Then
;$mainsocket=TCPListen($ip, $port,  1000)
;EndIf
WEnd

Func _Base64Decode($Data)
Local $Opcode = "0xC81000005356578365F800E8500000003EFFFFFF3F3435363738393A3B3C3DFFFFFF00FFFFFF000102030405060708090A0B0C0D0E0F10111213141516171819FFFFFFFFFFFF1A1B1C1D1E1F202122232425262728292A2B2C2D2E2F303132338F45F08B7D0C8B5D0831D2E9910000008365FC00837DFC047D548A034384C0750383EA033C3D75094A803B3D75014AB00084C0751A837DFC047D0D8B75FCC64435F400FF45FCEBED6A018F45F8EB1F3C2B72193C7A77150FB6F083EE2B0375F08A068B75FC884435F4FF45FCEBA68D75F4668B06C0E002C0EC0408E08807668B4601C0E004C0EC0208E08847018A4602C0E00624C00A46038847028D7F038D5203837DF8000F8465FFFFFF89D05F5E5BC9C21000"

Local $CodeBuffer = DllStructCreate("byte[" & BinaryLen($Opcode) & "]")
DllStructSetData($CodeBuffer, 1, $Opcode)

Local $Ouput = DllStructCreate("byte[" & BinaryLen($Data) & "]")
Local $Ret = DllCall("user32.dll", "int", "CallWindowProc", "ptr", DllStructGetPtr($CodeBuffer), _
"str", $Data, _
"ptr", DllStructGetPtr($Ouput), _
"int", 0, _
"int", 0)

Return BinaryMid(DllStructGetData($Ouput, 1), 1, $Ret[0])
EndFunc

Func _Base64Encode($Data, $LineBreak = 76)
Local $Opcode = "0x5589E5FF7514535657E8410000004142434445464748494A4B4C4D4E4F505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392B2F005A8B5D088B7D108B4D0CE98F0000000FB633C1EE0201D68A06880731C083F901760C0FB6430125F0000000C1E8040FB63383E603C1E60409C601D68A0688470183F90176210FB6430225C0000000C1E8060FB6730183E60FC1E60209C601D68A06884702EB04C647023D83F90276100FB6730283E63F01D68A06884703EB04C647033D8D5B038D7F0483E903836DFC04750C8B45148945FC66B80D0A66AB85C90F8F69FFFFFFC607005F5E5BC9C21000"

Local $CodeBuffer = DllStructCreate("byte[" & BinaryLen($Opcode) & "]")
DllStructSetData($CodeBuffer, 1, $Opcode)

$Data = Binary($Data)
Local $Input = DllStructCreate("byte[" & BinaryLen($Data) & "]")
DllStructSetData($Input, 1, $Data)

$LineBreak = Floor($LineBreak / 4) * 4
Local $OputputSize = Ceiling(BinaryLen($Data) * 4 / 3) 
$OputputSize = $OputputSize + Ceiling($OputputSize / $LineBreak) * 2 + 4

Local $Ouput = DllStructCreate("char[" & $OputputSize & "]")
DllCall("user32.dll", "none", "CallWindowProc", "ptr", DllStructGetPtr($CodeBuffer), _
"ptr", DllStructGetPtr($Input), _
"int", BinaryLen($Data), _
"ptr", DllStructGetPtr($Ouput), _
"uint", $LineBreak)
Return DllStructGetData($Ouput, 1)
EndFunc

Func _CryptImportKey($CALG, $bKey, $iKeyLength = -1)
If $iKeyLength < 1 Then $iKeyLength = BinaryLen($bKey)
Local $blob = DllStructCreate("align 1;BYTE   bType;BYTE   bVersion;WORD   reserved;dword aiKeyAlg;dword keysize;byte key[" & $iKeyLength & "]")
DllStructSetData($blob, 1, 0x8)
DllStructSetData($blob, 2, 2)
DllStructSetData($blob, 4, $CALG)
DllStructSetData($blob, 5, $iKeyLength)
DllStructSetData($blob, 6, Binary($bKey))
Local $aRet = DllCall(__Crypt_DllHandle(), "bool", "CryptImportKey", "handle", __Crypt_Context(), "ptr", DllStructGetPtr($blob), "dword", DllStructGetSize($blob), "ptr", 0, "dword", 0, "ptr*", 0)
If @error Then Return SetError(2, @error, 0)
Return SetError(Not $aRet[0], 0, $aRet[6])
EndFunc

Func _CryptSetKeyParam($hKey, $iParam, $vValue, $iFlags=0, $sValType=Default)
If Not $sValType Or $sValType = Default Then $sValType = "ptr"
Local $aRet = DllCall(__Crypt_DllHandle(), "bool", "CryptSetKeyParam", "handle", $hKey, "uint", $iParam, $sValType, $vValue, "dword", $iFlags)
If @error Then Return SetError(2, @error, 0)
Return SetError(Not $aRet[0], 0, $aRet[0])
EndFunc

func traffic($traffix)
if ($traffix<1024) Then
return $traffix & " B"
ElseIf($traffix<1048576) Then
return $traffix/1024 & " KB"
ElseIf($traffix<1073741824) Then
return $traffix/1048576 & " MB"
ElseIf($traffix<1099511627776) Then
return $traffix/1048576 & " GB"
ElseIf($traffix<1125899906842624) Then
return $traffix/1099511627776 & " TB"
ElseIf($traffix<1152921504606846976) Then
return $traffix/1125899906842624 & " PB"
ElseIf($traffix>=1180591620717411303424) Then
return $traffix/1152921504606846976 & " EB"
EndIf
EndFunc

func credits()
msgbox(4096, "credits (exarp " & $v & ")", @CRLF & "~~~ script by unnex ~~~" & @CRLF & @crlf & "visit: www.unnex.de" & @CRLF & "---------" & @CRLF & @CRLF & "download & discussion: https://new-crew.net/showthread.php?tid=416")
EndFunc

func exiti()
$itr=255
while $itr>=25.5
sleep(50)
WinSetTrans($gui, "", $itr)
$itr=$itr-25.5
WEnd
tcpshutdown()
Exit
EndFunc

func headers()
if $headersa=="a" Then
$infclearstax="a"
$guiheaders=GUICreate("http-headers", 700, 560, -1, -1, BitXOR($GUI_SS_DEFAULT_GUI, $WS_SYSMENU))
$infheaders=GUICtrlCreateEdit($infheaderstext, 10, 10, 680, 250)
$inffilterinput=GUICtrlCreateInput("", 10, 265, 600, 20)
$inffilterbutton=GUICtrlCreatebutton("filter", 610, 265, 80, 20)
$infclear=GUICtrlCreatebutton("clear log", 10, 285, 600, 20)
$infclearsta=GUICtrlCreatebutton("stop", 610, 285, 80, 20)
_GUICtrlEdit_SetReadOnly($infheaders, True)
GUICtrlCreategroup("new header - reload the page or visit another addr to execute the given header", 10, 310, 680, 220)
$infnewtext=GUICtrlCreateEdit("", 20, 330, 660, 150)
$infnheaderbutton=GUICtrlCreatebutton("set new header" & $yinfheader, 20, 485, 660, 20)
$tamperyaa=GUICtrlCreatebutton("start tamper", 20, 505, 660, 20)
$infncheaderbutton=GUICtrlCreatebutton("close" & $yinfheader, 10, 535, 680, 20)
GUISetState(@SW_SHOW, $guiheaders)

$headersa="b"
$tampera="a"
$filteria=""
EndIf
EndFunc

func filter()
if stringlen($filteria)>0 then
WinSetTitle($guiheaders, "", "http-headers (loading...)")
$searchyia=stringsplit(@crlf & $infheaderstext, @crlf & "#---------------------------outgoing---------------------------# (", 1)
$searchyiai=1
$infheaderstextra=""
while $searchyiai<=$searchyia[0]
if stringlen($searchyia[$searchyiai])>0 Then
if StringInStr(@crlf & "#---------------------------outgoing---------------------------# (" & $searchyia[$searchyiai], $filteria)>0 then $infheaderstextra&=@crlf & "#---------------------------outgoing---------------------------# (" & $searchyia[$searchyiai]
EndIf
$searchyiai+=1
WEnd

if stringleft($infheaderstextra, 2)==@CRLF Then $infheaderstextra=stringright($infheaderstextra, stringlen($infheaderstextra)-2)
if $infheaderstextra<>GUICtrlRead($infheaders) then GUICtrlSetData($infheaders, $infheaderstextra)
WinSetTitle($guiheaders, "", "http-headers #filter: " & $filteria)
Else
WinSetTitle($guiheaders, "", "http-headers (loading...)")
GUICtrlSetData($infheaders, $infheaderstext)
WinSetTitle($guiheaders, "", "http-headers")
EndIf
EndFunc
