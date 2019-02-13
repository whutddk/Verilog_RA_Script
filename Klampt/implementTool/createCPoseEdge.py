import sys
import time

import json


Pose = []
edgeIndex = []

def load_Pose():
	global Pose
	global edgeIndex


	with open('./pose.json','r') as poseFile:
		data = poseFile.read()
		Pose = json.loads(data)
		#print Pose
	pass

def load_Index():

	global Pose
	global edgeIndex


	with open('./edgeIndex.json','r') as edgeIndexFile:
		data = edgeIndexFile.read()
		edgeIndex = json.loads(data)
		


def write_Ccode():
	global Pose
	global edgeIndex

	with open('./CMemoryPoseEdgeIndex.h','w') as CFile:

		strSyntax =	'/** ---------------------------------------------------------------------------\n * Copyright (c) 2018, Wuhan University of Technology All rights reserved.\n *\n * @file    CMemoryPoseEdgeIndex.h\n * @date    2018-11-14\n * @version 0.1.1  2018.11\n---------------------------------------------------------------------------- */\n\n'
		strSyntax = strSyntax + '#include <stdint.h>\n#include \"math/qformat.h\"\n\n'

		strSyntax = strSyntax + 'q6_t poseTable[65][6] = {\n'
		CFile.write(strSyntax)

		result = ''
		for i in range(0,65):	#all case all pix	
			result = result +  '	{'		
			for j in range(0,6): # all edge
				
				data = Pose[i][j]*64
				#print data
				result = result + str(format(data,'.0f')) + ','
			result = result[0:-1]
			result = result + '},\n'
		result = result[0:-2]
		CFile.write(result)

		strSyntax = '\n};\n'
		CFile.write(strSyntax)

########################################

		CFile.write('\n\n\n\n\n')
		strSyntax = 'uint8_t edgeIndexTable[1034][2] = {\n'
		CFile.write(strSyntax)
		

		result = ''
		for i in range(0,1034):	
			result = result +  '	{'		
			for j in range(0,2):			
				result = result + str(edgeIndex[i][j]) + ','
			result = result[0:-1]
			result = result + '},\n'
		result = result[0:-2]
		CFile.write(result)

		strSyntax = '\n};\n'
		CFile.write(strSyntax)
			



load_Pose()
load_Index()
write_Ccode()
print 'done!'



