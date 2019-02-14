# @File Name: createLUTX512Verilog.py
# @File Path: K:\work\MAS2\PRM_robotic_arm\Verilog_RA_Script\truetable-2-Verilog\createLUTX512Verilog.py
# @Author: 29505
# @Date:   2019-02-13 11:04:49
# @Last Modified by:   29505
# @Last Modified time: 2019-02-14 17:15:04
# @Email: 295054118@whut.edu.cn

import sys
import time

import json

import time

gridStyle = 'Ca'

Path = '../Result/250msx3/'+ gridStyle +'/'

trueTable = []

def load_trueTable(k):
	global trueTable

	with open(Path + 'trueTable/trueTable512p'+ str(k) +'.json','r') as trueTableFile:
		data = trueTableFile.read()
		trueTable = json.loads(data)
	#print trueTable

	pass


def write_verilog(k):
	global trueTable

	with open(Path + 'verilog/LUTX512/prm_LUTX512_512p'+ str(k) +'.v','w') as verilogFile:

		nowtime = time.localtime(time.time())

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



		strSyntax = strSyntax +'module prm_LUTX512_'+gridStyle+'_chk512p'+ str(k) +'(\n'
		strSyntax = strSyntax + '	input [3:0] x,\n'
		strSyntax = strSyntax + '	input [4:0] y,\n'
		strSyntax = strSyntax + '	input [4:0] z,\n'
		strSyntax = strSyntax + '	output [511:0] edge_mask_512p'+ str(k) + '\n'
		strSyntax = strSyntax + ');\n\n'
		strSyntax = strSyntax + '	reg [511:0] edge_mask_reg_512p'+ str(k) + ';\n'
		strSyntax = strSyntax + '	assign edge_mask_512p' + str(k) + '= edge_mask_reg_512p'+ str(k) +';\n\n'
		strSyntax = strSyntax + 'always @( *) begin\n' 
		strSyntax = strSyntax + '    case({x,y,z})\n'


		verilogFile.write(strSyntax);


		for i in range(0,16384):	#all case all pix
			strSyntax =  '		14\'d'+ str(i) + ': edge_mask_reg_512p'+ str(k) + ' <= 512\'b'
			strData = ''
			for j in range(0,512): # all edge
				strData = strData + str(trueTable[i][j])
			strSyntax = strSyntax + strData + ';\n'
			verilogFile.write(strSyntax)
			#print strSyntax

		pass
		
		strSyntax ='		default: edge_mask_reg_512p'+ str(k) +  ' <= 512\'b0;\n '
		strSyntax = strSyntax + '	endcase\n\n'
		strSyntax = strSyntax +   'end\n'
		strSyntax = strSyntax + 'endmodule\n\n'
		verilogFile.write(strSyntax)
	pass

for k in range(0,8):
	load_trueTable(k)
	write_verilog(k)
print ('done!')



