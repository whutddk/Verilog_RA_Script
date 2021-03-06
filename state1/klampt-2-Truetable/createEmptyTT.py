# -*- coding: utf-8 -*-
# @File Name: createEmptyTT.py
# @File Path: M:\MAS2\PRM_Robotic_Arm\Verilog_RA_Script\klampt-2-Truetable\createEmptyTT.py
# @Author: Ruige_Lee
# @Date:   2019-02-19 11:59:19
# @Last Modified by:   Ruige_Lee
# @Last Modified time: 2019-03-04 15:48:01
# @Email: 295054118@whut.edu.cn"

# @File Name: createEmptyTT.py
# @File Path: M:\MAS2\PRM_Robotic_Arm\Verilog_RA_Script\klampt-2-Truetable\createEmptyTT.py
# @Author: 29505
# @Date:   2019-02-13 11:04:49
# @Last Modified by:   29505
# @Last Modified time: 2019-02-13 12:23:42
# @Email: 295054118@whut.edu.cn

import sys
import time

import json

trueTable = []

path = '../Result/Sp/100msx3/3-4-4/trueTable/'

def create_empty_trueTable():
	global trueTable

	output = [ 0 for k in range(0,512) ]
	
	#print output
	for i in range(0,2048):
		trueTable.append(output)
	#print trueTable
	
	data = json.dumps(trueTable)

	with open(path + 'trueTable512p0.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(path + 'trueTable512p1.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(path + 'trueTable512p2.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(path + 'trueTable512p3.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(path + 'trueTable512p4.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(path + 'trueTable512p5.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(path + 'trueTable512p6.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(path + 'trueTable512p7.json','w') as poseFile:
		poseFile.write(data)
	pass



create_empty_trueTable()



