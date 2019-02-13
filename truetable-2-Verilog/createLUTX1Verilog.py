# @File Name: createLUTX1Verilog.py
# @File Path: K:\work\MAS2\PRM_robotic_arm\Verilog_RA_Script\truetable-2-Verilog\createLUTX1Verilog.py
# @Author: 29505
# @Date:   2019-02-13 11:04:49
# @Last Modified by:   29505
# @Last Modified time: 2019-02-13 15:51:02
# @Email: 295054118@whut.edu.cn

import sys
import time

import json

import time


Path = '../Result/250msx3/Ca/'
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

	with open(Path + 'verilog/LUTX1/prm_LUTX1_512p'+ str(k) +'.v','w') as verilogFile:

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



		strSyntax = strSyntax +'module prm_LUTX1_chk512p'+ str(k) +'(\n'
		strSyntax = strSyntax + '	input [3:0] x,\n'
		strSyntax = strSyntax + '	input [4:0] y,\n'
		strSyntax = strSyntax + '	input [4:0] z,\n'
		strSyntax = strSyntax + '	output [511:0] edge_mask_512p'+ str(k) + '\n'
		strSyntax = strSyntax + ');\n\n'
		strSyntax = strSyntax + '	reg [511:0] edge_mask_reg_512p'+ str(k) + ';\n'
		strSyntax = strSyntax + '	assign edge_mask_512p' + str(k) + '= edge_mask_reg_512p'+ str(k) +';\n\n'
		strSyntax = strSyntax + 'always @( *) begin\n' 


		verilogFile.write(strSyntax);
		for j in range(0,512): #all edge
			strData = '    case({x,y,z})\n'
			active  = False
			
			for i in range(0,16384): #all pix
				if (trueTable[i][j] == 1):
					active  = True
					strData = strData + '		14\'b' + bin(i)[2:16] +',\n'
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



