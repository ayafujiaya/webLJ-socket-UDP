# -*- coding: euc-jp -*-
require 'socket.io-client-simple'
require 'socket'
require 'json'

#u1 = UDPSocket.new
#u1.bind("127.0.0.1", 4913)
u2 = UDPSocket.new
u2.connect("127.0.0.1", 4913)

socket = SocketIO::Client::Simple.connect 'http://web-lj.ayafuji.com'

socket.on :connect do  ## 接続イベント
  puts "connect!!!"
end

socket.on :disconnect do  ## 切断イベント
  puts "disconnected!!"
end

## サーバーからイベント"chat"がemitされたら、このコールバックが呼ばれる
socket.on :message do |data|
  #puts data['value']
  dataStr = data['value'].to_s
  jmsg = JSON.generate(data['value']);
   
  u2.send jmsg, 0
  #nmsg = u1.recvfrom(1000)
  #puts msg[0]

  #jsonStr = u1.recvfrom(1000)
  #pust jsonStr.to_s

  #puts "hello"
end

puts "please input and press Enter key"
loop do


  msg = STDIN.gets.strip
  next if msg.empty?

  ## サーバーにchatイベントを送る
  #socket.emit :message, {:msg => msg, :at => Time.now}

end
