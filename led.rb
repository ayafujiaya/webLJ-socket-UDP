# -*- coding: euc-jp -*-
require 'serialport'


 #シリアルポート通信設定
$serial_port = '/dev/ttyS0' 
$serial_baudrate = 9600
$serial_databit = 8
$serial_stopbit = 1
$serial_paritycheck = 0
$serial_delimiter = "\n"

#シリアルポートを開く
sp = SerialPort.new($serial_port, $serial_baudrate, $serial_databit, $serial_stopbit, $serial_paritycheck) 
sp.read_timeout=1000 #受信時のタイムアウト（ミリ秒単位）

#送信（例えばこんな感じ）
sp.puts "ARM:COUNt 1#{$serial_delimiter}"
sp.write "INIT#{$serial_delimiter}" 

#受信（例えばこんな感じ）
#デリミターを引数として渡しておくとgetsはデリミターが受信されるまで
#あるいは設定されたタイムアウトになるまで待ちます
line = sp.gets("#{$serial_delimiter}") 
#あとは受信された内容を解釈するだけ

#シリアルポートを閉じる
sp.close
