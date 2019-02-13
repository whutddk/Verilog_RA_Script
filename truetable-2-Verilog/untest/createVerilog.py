# @File Name: createVerilog.py
# @File Path: K:\work\MAS2\PRM_robotic_arm\Verilog_RA_Script\truetable-2-Verilog\createVerilog.py
# @Author: 29505
# @Date:   2019-02-13 11:04:49
# @Last Modified by:   29505
# @Last Modified time: 2019-02-13 12:33:53
# @Email: 295054118@whut.edu.cn

import sys
import time

import json

trueTable = []

def load_trueTable():
	global trueTable

	with open('./trueTable.json','r') as trueTableFile:
		data = trueTableFile.read()
		trueTable = json.loads(data)
	#print trueTable

	pass


def write_verilog():
	global trueTable

	with open('./PRMM.v','w') as verilogFile:

		for i in range(0,32768):	#all case all pix
			strSyntax =  '15\'d'+ str(i) + ': edgeMask <= 1034\'b'
			strData = ''
			for j in range(0,1034): # all edge
				strData = strData + str(trueTable[i][j])
			strSyntax = strSyntax + strData + ';\n'
			verilogFile.write(strSyntax)
			#print strSyntax

		pass
	#print trueTable

	pass


load_trueTable()
write_verilog()
print 'done!'



