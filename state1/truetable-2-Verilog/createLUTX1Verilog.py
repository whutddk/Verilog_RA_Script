# -*- coding: utf-8 -*-
# @File Name: createLUTX1Verilog.py
# @File Path: M:\MAS2\PRM_Robotic_Arm\Verilog_RA_Script\truetable-2-Verilog\createLUTX1Verilog.py
# @Author: Ruige_Lee
# @Date:   2019-02-19 11:59:19
# @Last Modified by:   Ruige_Lee
# @Last Modified time: 2019-03-04 17:07:15
# @Email: 295054118@whut.edu.cn"

# @File Name: createLUTX1Verilog.py
# @File Path: M:\MAS2\PRM_Robotic_Arm\Verilog_RA_Script\truetable-2-Verilog\createLUTX1Verilog.py
# @Author: 29505
# @Date:   2019-02-13 11:04:49
# @Last Modified by:   29505
# @Last Modified time: 2019-02-13 16:00:23
# @Email: 295054118@whut.edu.cn

import sys
import time

import json

import time

gridStyle = 'Ca'
x = 3
y = 4
z = 4
lenth = 2048
style = '100msx3'

Path = '../Result/'+ gridStyle +'/'+style+'/'+str(x)+'-'+str(y)+'-'+str(z)+'/'
# veriPath = '../Result/250msx3/Ca/verilog/LUTX1/'
# TTPath = '../Result/250msx3/Ca/trueTable'

trueTable = []

def load_trueTable(k):
	global trueTable

	with open( Path + 'trueTable/trueTable512p'+ str(k) +'.json','r') as trueTableFile:
		data = trueTableFile.read()
		trueTable = json.loads(data)
	#print trueTable

	pass


def write_verilog(k):
	global trueTable

	nowtime = time.localtime(time.time())

	with open(Path + 'verilog/prm_LUTX1_512p'+ str(k) +'.v','w') as verilogFile:

		strSyntax = '/*******************************************\n'
		strSyntax = strSyntax + '****** Wuhan university of technology ******\n'
		strSyntax = strSyntax + '****** Ruige Lee ******\n'
		strSyntax = strSyntax + 'year: ' + str(nowtime.tm_year) + '\n'
		strSyntax = strSyntax + 'month: ' + str(nowtime.tm_mon) + '\n'
		strSyntax = strSyntax + 'date: ' + str(nowtime.tm_mday) + '\n'
		strSyntax = strSyntax + 'hour: ' + str(nowtime.tm_hour) + '\n'
		strSyntax = strSyntax + 'minutes: ' + str(nowtime.tm_min) + '\n'
		strSyntax = strSyntax + 'second: ' + str(nowtime.tm_sec) + '\n'
		strSyntax = strSyntax + '********************************************/\n\n'



		strSyntax = strSyntax +'module prm_LUTX1_'+gridStyle+'_'+str(x)+'_'+str(y)+'_'+str(z)+'_chk512p'+ str(k) +'(\n'
		strSyntax = strSyntax + '	input ['+str(x-1)+':0] x,\n'
		strSyntax = strSyntax + '	input ['+str(y-1)+':0] y,\n'
		strSyntax = strSyntax + '	input ['+str(z-1)+':0] z,\n'
		strSyntax = strSyntax + '	output [511:0] edge_mask_512p'+ str(k) + '\n'
		strSyntax = strSyntax + ');\n\n'
		strSyntax = strSyntax + '	reg [511:0] edge_mask_reg_512p'+ str(k) + ';\n'
		strSyntax = strSyntax + '	assign edge_mask_512p' + str(k) + '= edge_mask_reg_512p'+ str(k) +';\n\n'
		strSyntax = strSyntax + 'always @( *) begin\n' 


		verilogFile.write(strSyntax);
		for j in range(0,512): #all edge
			strData = '    case({x,y,z})\n'
			active  = False
			
			for i in range(0,lenth): #all pix
				if (trueTable[i][j] == 1):
					active  = True
					strData = strData + str(x+y+z)+'\'b' + bin(i)[2:x+y+z+2] +',\n'
			if ( active == True ):
				strData = strData[0:-2]
				strData = strData + ': edge_mask_reg_512p'+ str(k) + '[' + str(j) + '] <= 1\'b1;\n '
			strData = strData + '		default: edge_mask_reg_512p'+ str(k) + '[' + str(j) + '] <= 1\'b0;\n '
			strData = strData + '	endcase\n\n'
			verilogFile.write(strData)

		strSyntax =  'end\n'
		strSyntax = strSyntax + 'endmodule\n\n'

		verilogFile.write(strSyntax) 

	pass

for k in range(0,8):
	load_trueTable(k)
	write_verilog(k)
print ('done!')



