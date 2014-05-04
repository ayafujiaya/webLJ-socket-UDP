# -*- coding: euc-jp -*-
require 'serialport'


 #���ꥢ��ݡ����̿�����
$serial_port = '/dev/ttyS0' 
$serial_baudrate = 9600
$serial_databit = 8
$serial_stopbit = 1
$serial_paritycheck = 0
$serial_delimiter = "\n"

#���ꥢ��ݡ��Ȥ򳫤�
sp = SerialPort.new($serial_port, $serial_baudrate, $serial_databit, $serial_stopbit, $serial_paritycheck) 
sp.read_timeout=1000 #�������Υ����ॢ���ȡʥߥ���ñ�̡�

#�������㤨�Ф���ʴ�����
sp.puts "ARM:COUNt 1#{$serial_delimiter}"
sp.write "INIT#{$serial_delimiter}" 

#�������㤨�Ф���ʴ�����
#�ǥ�ߥ���������Ȥ����Ϥ��Ƥ�����gets�ϥǥ�ߥ��������������ޤ�
#���뤤�����ꤵ�줿�����ॢ���Ȥˤʤ�ޤ��Ԥ��ޤ�
line = sp.gets("#{$serial_delimiter}") 
#���Ȥϼ������줿���Ƥ��᤹�����

#���ꥢ��ݡ��Ȥ��Ĥ���
sp.close
