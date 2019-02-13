# @File Name: createEmptyTT.py
# @File Path: K:\work\MAS2\PRM_robotic_arm\Verilog_RA_Script\klampt-2-Truetable\createEmptyTT.py
# @Author: 29505
# @Date:   2019-02-13 11:04:49
# @Last Modified by:   29505
# @Last Modified time: 2019-02-13 12:23:42
# @Email: 295054118@whut.edu.cn

import sys
import time

import json

trueTable = []

ptah = '../Result/250msx3/Sp/trueTable/'

def create_empty_trueTable():
	global trueTable

	output = [ 0 for k in range(0,512) ]
	
	#print output
	for i in range(0,16384):
		trueTable.append(output)
	#print trueTable
	
	data = json.dumps(trueTable)

	with open(ptah + 'trueTable512p0.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(ptah + 'trueTable512p1.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(ptah + 'trueTable512p2.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(ptah + 'trueTable512p3.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(ptah + 'trueTable512p4.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(ptah + 'trueTable512p5.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(ptah + 'trueTable512p6.json','w') as poseFile:
		poseFile.write(data)
	pass
	with open(ptah + 'trueTable512p7.json','w') as poseFile:
		poseFile.write(data)
	pass



create_empty_trueTable()



