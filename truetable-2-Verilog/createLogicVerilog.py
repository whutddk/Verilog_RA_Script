# @File Name: createLogicVerilog.py
# @File Path: K:\work\MAS2\PRM_robotic_arm\Verilog_RA_Script\truetable-2-Verilog\createLogicVerilog.py
# @Author: 29505
# @Date:   2019-02-14 16:37:58
# @Last Modified by:   29505
# @Last Modified time: 2019-02-15 22:00:53
# @Email: 295054118@whut.edu.cn

import sys
import time

import json



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

	nowtime = time.localtime(time.time())

	with open(Path + 'verilog/Logic/prm_Logic_512p'+ str(k) +'.v','w') as verilogFile:

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

		strSyntax = strSyntax +'module prm_Logic_'+gridStyle+'_chk512p'+ str(k) +'(\n'
		strSyntax = strSyntax + '	input [3:0] x,\n'
		strSyntax = strSyntax + '	input [4:0] y,\n'
		strSyntax = strSyntax + '	input [4:0] z,\n'
		strSyntax = strSyntax + '	output [511:0] edge_mask_512p'+ str(k) + '\n'
		strSyntax = strSyntax + ');\n\n'

		strSyntax = strSyntax + '	wire A;\n	wire B;\n	wire C;\n	wire D;\n	wire E;\n	wire F;\n	wire G;\n	wire H;\n	wire I;\n	wire J;\n	wire K;\n	wire L;\n	wire M;\n	wire N;\n\n'
		strSyntax = strSyntax + '	assign {A,B,C,D,E,F,G,H,I,J,K,L,M,N} = {x,y,z};\n\n'
		verilogFile.write(strSyntax);



		for j in range(0,512): #all edge
			strData = '	assign edge_mask_512p' + str(k) + '['+str(j)+']=('
			for i in range(0,16384): #all pix
				if  trueTable[i][j] == 1 :
					fun = bin(i)
					fun = fun[2:]
					lenth = len(fun)
					while ( lenth < 14 ):
						fun =  '0' + fun
						lenth = lenth + 1
					if ( fun[0] == '1' ):
						strData = strData + '(A)&'
					else :
						strData = strData + '(~A)&'
					if ( fun[1] == '1' ):
						strData = strData + '(B)&'
					else :
						strData = strData + '(~B)&'
					if ( fun[2] == '1' ):
						strData = strData + '(C)&'
					else :
						strData = strData + '(~C)&'
					if ( fun[3] == '1' ):
						strData = strData + '(D)&'
					else :
						strData = strData + '(~D)&'
					if ( fun[4] == '1' ):
						strData = strData + '(E)&'
					else :
						strData = strData + '(~E)&'
					if ( fun[5] == '1' ):
						strData = strData + '(F)&'
					else :
						strData = strData + '(~F)&'
					if ( fun[6] == '1' ):
						strData = strData + '(G)&'
					else :
						strData = strData + '(~G)&'
					if ( fun[7] == '1' ):
						strData = strData + '(H)&'
					else :
						strData = strData + '(~H)&'
					if ( fun[8] == '1' ):
						strData = strData + '(I)&'
					else :
						strData = strData + '(~I)&'
					if ( fun[9] == '1' ):
						strData = strData + '(J)&'
					else :
						strData = strData + '(~J)&'
					if ( fun[10] == '1' ):
						strData = strData + '(K)&'
					else :
						strData = strData + '(~K)&'
					if ( fun[11] == '1' ):
						strData = strData + '(L)&'
					else :
						strData = strData + '(~L)&'
					if ( fun[12] == '1' ):
						strData = strData + '(M)&'
					else :
						strData = strData + '(~M)&'
					if ( fun[13] == '1' ):
						strData = strData + '(N)&'
					else :
						strData = strData + '(~N)&'


					strData = strData + '1\'b1)\n 		|('

			strData = strData + '1\'b0);\n'
			verilogFile.write(strData)

		pass
	#print trueTable

	
		strSyntax = '\nendmodule\n\n'
		verilogFile.write(strSyntax)

for k in range (0,8):
	load_trueTable(k)
	write_verilog(k)
print ('done!')



