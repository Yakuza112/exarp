require 'openssl'
require 'timeout'
require 'socket'
require 'base64'

print "\n~~~exarp-client: ruby (it's just one addition of exarp v1.2)~~~\n"
if ARGV.length<8
print "\nusage: ruby exarp.rb [exarp-link] [agent] [ip] [port] [output: 1=yes] [aes-key] [threads] [stabilizer] [logfile (no=nolog)]\n\nexample: ruby exarp.rb \"http://exap-link/exarp.php?p=pw123\" \"exarp (ruby)\" 127.0.0.1 80 1 \"myaespw\" 200 logfile.txt\n"
exit
end

threads=ARGV[6].clone.to_i
a=ARGV[0].clone.split(/:\/\//)
b=a[0].length
a=a[1].split(/\//)
b+=a[0].length+3
host=a[0]
get=ARGV[0].clone[b, ARGV[0].clone.length-b]
arglog=ARGV[4].clone

$logfile=ARGV[7].clone
if $logfile.downcase!='no'
$logfilea=File.open($logfile, "a")
$logfilea.sync=true
end

cyp="b"
if get.include? "?c&" or get.include? "&c&"
cyp="a"
else
if get[get.length-2, 2]=="?c" or get[get.length-2, 2]=="&c"
cyp="a"
end
end

cypa="no"
if get.include? "?h&" or get.include? "&h&"
cypa="yes"
else
if get[get.length-2, 2]=="?h" or get[get.length-2, 2]=="&h"
cypa="yes"
end
end

browser=Base64.encode64(ARGV[1].clone)
ip=ARGV[2].clone
port=ARGV[3].clone

keya=ARGV[5].clone
while keya.length<32
keya=keya+"0"
end
iva='1234567890123456'

output="no"
if ARGV[4].clone=="1"
output="yes"
end
aes="no"
if cyp=="a"
aes="yes"
end

print "\nlink: "+ARGV[0].clone+"\nuser-agent: "+ARGV[1].clone+"\nip: "+ARGV[2].clone+"\nport: "+ARGV[3].clone+"\noutput: "+output+"\nhttps: "+cypa+"\ncrypt: "+aes+"\nthreads: "+ARGV[6].clone+"\nlogfile: "+$logfile+"\n\n---output---\n"
server=TCPServer.open(ip, port)
cache=2048

$tid=Array.new
def main(ip, port, threads, server)
while 1
tii=1
while tii<threads
if $tid[tii]=="a"
while $tid[tii]=='a'
$tid[tii]=server.accept
end
end
tii+=1
end
end
end

def body(host, get, cyp, cypa, keya, iva, tii, browser, cache, arglog)
while 1
$tid[tii]="a"
while $tid[tii]=="a"
sleep 0.000001
end
client=$tid[tii]
recv=""

begin
complete_results = Timeout.timeout(5) do
recv=""+client.recv(6316032);
#                   ^6mb upload-header
end
rescue Timeout::Error
end

if recv.length<1
recv=""
end

if arglog=="1"
log=recv.split(/ /)
if log.count>1
puts client.peeraddr[3]+': ['+log[0]+'] '+log[1]
else
#puts client.peeraddr[3]+': unknown action'
end
end

if recv.length>0
if recv.include? "\r\nConnection: keep-alive\r\n"
recv["\r\nConnection: keep-alive\r\n"]="\r\nConnection: close\r\n"
else
if recv.include? "\nConnection: Keep-Alive\n"
recv["\nConnection: Keep-Alive\n"]="\nConnection: close\n"
end
end
if recv.include? "\r\nProxy-Connection: keep-alive\r\n"
recv["\r\nProxy-Connection: keep-alive\r\n"]="\r\nProxy-Connection: close\r\n"
else
if recv.include? "\nProxy-Connection: Keep-Alive\n"
recv["\nProxy-Connection: Keep-Alive\n"]="\nProxy-Connection: close\n"
end
end
end

if $logfile.downcase!='no'
$logfilea.write("#---------------------------outgoing---------------------------# ("+Time.now.to_s+") (thread: "+tii.to_s+") user-agent: "+ARGV[1].clone+"\r\n"+recv+"\r\n")
end

if cyp=="a" and recv.length>0
cipher=OpenSSL::Cipher::AES.new(256, :CBC)
cipher.encrypt
cipher.key=keya
cipher.iv=iva
recv=cipher.update(recv)+cipher.final
end

recv=Base64.encode64(recv)
recv=recv.gsub('+', '%2B').gsub("\n", '')
recv+="&b="+browser
if get[0]!="/"
get="/"+get
end
recvlen=recv.length+2
recv="POST "+get+" HTTP/1.1\r\nHost: "+host+"\r\nUser-Agent: recieve\r\nConnection: close\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: deflate\r\nContent-Type: application/x-www-form-urlencoded\r\nContent-Length: "+recvlen.to_s()+"\r\n\r\nh="+recv

out=TCPSocket.open(host, 80)
out.send(recv, 0)

recv=""
while 1
recva=out.recv(cache)
if recva.length<1
break
end
recv+=""+recva
end
out.close()

recv=recv.split(/#01111000#/)

#---for (X-Pad: avoid browser bug)---
if recv[1].include? "\n"
recv[1]=recv[1].gsub("\r", "")
recvaj=recv[1].split(/\n/)
iju=0
recv[1]=""
recvajj=recvaj.count
while iju<recvajj
recv[1]+=recvaj[iju]
iju+=2
end
end
#------------------------------------

if recv.count>1
recv=Base64.decode64(recv[1])
else
recv="error"
end

if cyp=="a" and recv.length>0
cipher=OpenSSL::Cipher::AES.new(256, :CBC)
cipher.decrypt
cipher.key=keya
cipher.iv=iva
cipher.padding=4
recv=cipher.update(recv)+cipher.final
end

if recv.include? "Transfer-Encoding: chunked"
if recv.include? "\r\n\r\n"
recva=recv.split(/\r\n\r\n/)
recvb=recva[0]
i=recva.count
ii=1
recvc=""
while ii<i
recvc+=""+recva[ii]
ii+=1
end

if recvb.include? "Transfer-Encoding: chunked"
recvb["Transfer-Encoding: chunked"]="Content-Length: "+recvc.length.to_s()
recv=recvb+"\r\n\r\n"+recvc
end
else
recva=recv.split(/\n\n/)
recvb=recva[0]
i=recva.count
ii=1
recvc=""
while ii<i
recvc+=""+recva[ii]
ii+=1
end

if recvb.include? "Transfer-Encoding: chunked"
recvb["Transfer-Encoding: chunked"]="Content-Length: "+recvc.length.to_s()
recv=recvb+"\n\n"+recvc
end
end
end

if $logfile.downcase!='no'
$logfilea.write("#---------------------------incoming---------------------------# ("+Time.now.to_s+") (thread: "+tii.to_s+")\r\n"+recv+"\r\n")
end

client.send(recv, 0)
client.close()
end
end

t=Array.new
t[0]=Thread.new{main(ip, port, threads, server)}
ti=1
tii=0
while ti<=threads
t[ti]=Thread.new{body(host, get, cyp, cypa, keya, iva, tii+=1, browser, cache, arglog)}
ti+=1
end
ti=1
t[0].join
while ti<threads
t[ti].join
ti+=1
end
