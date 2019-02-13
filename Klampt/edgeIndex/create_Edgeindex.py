
import sys
import time


import json

import random


edgeIndex = []

def create_Edge():
	# all connection
	poseCnt = 0
	edgeCnt = 0
	while(edgeCnt < 100000):

		poseCnt = poseCnt + 1

		for i in range(0,poseCnt):
			edgeIndex.append([i,poseCnt])
			edgeCnt = edgeCnt + 1


	print edgeCnt
	print poseCnt

create_Edge()


# print edgeIndex


data = json.dumps(edgeIndex)
with open('./edgeIndex.json','w') as edgeIndexFile:
	edgeIndexFile.write(data)



