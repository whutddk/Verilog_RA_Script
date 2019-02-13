# @File Name: checkoutTT.py
# @File Path: K:\work\MAS2\PRM_robotic_arm\Verilog_RA_Script\klampt-2-Truetable\checkoutTT.py
# @Author: 29505
# @Date:   2019-02-13 11:04:49
# @Last Modified by:   29505
# @Last Modified time: 2019-02-13 12:15:56
# @Email: 295054118@whut.edu.cn

import sys
import time

import json

edgePath = '../../Klampt_Robotic_Arm_Script/gridModelEncode/CartesianCoordinates/250msx3grid/'
TTptah = '../Result/250msx3/Ca/trueTable/'

trueTable = []
edge = []

def load_empty_trueTable(i):
	global trueTable


	with open(TTptah + 'trueTable512p'+ str(i) +'.json','r') as trueTableFile:
		data = trueTableFile.read()
		trueTable = json.loads(data)


	pass


def load_edge(i):

	global edge

	with open(edgePath + 'edge512p'+ str(i) +'.json','r') as edgeFile:
		data = edgeFile.read()
		edge = json.loads(data)

	pass

def checkout_Truetable(i):

	global edge
	global trueTable

	for k in range(0,512):#check all edge
		for j in range(0,16384):#check all pix
			trueTable[j][k] = edge[k][j]
	pass

	data = json.dumps(trueTable)
	with open( TTptah + 'trueTable512p'+ str(i) +'.json','w') as ttFile:
		ttFile.write(data)

	pass


for i in range (0,8):
	load_edge(i)
	load_empty_trueTable(i)
	checkout_Truetable(i)


