#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Bool
from sys import exit
import time

import human_pose_translator_class as HumanPoseTranslator

'''
Start this Node first to record Data

Use it in combination with human_actionhandler_node.py
'''

def recordWalking():

    '''
    Record 4 Seconds of Walking (or staying idle) and save it to file
    '''

    #get the HumanPose from HumanPoseTranslator class
    humanPose = HumanPoseTranslator.HumanPoseTranslator()

    print('Start')

    #open file stream
    file = open('RecordedFiles/HumanWalking_100Times.txt', "a")

    numberOfRepetitions = 100

    for x in range(0, numberOfRepetitions):

        #write empty line
        file.write('\n')

        #get starting time
        startTime = time.time()

        print(x)

        while time.time()-startTime<4: #record 4secs of data

            #subscribe to socket
            socket = humanPose.subscribeToSocket()

            #get the humanPosture
            postureMsg = humanPose.publishData(socket)

            #write humanPosture to file
            file.write(str(postureMsg) + '\n')

    #close file stream
    file.close()

def socketNodeRecordData(data):

    '''
    Record HumanPosture Data for 4 seconds and write it to file
    '''

    #get the HumanPose from HumanPoseTranslator class
    humanPose = HumanPoseTranslator.HumanPoseTranslator()

    print('Start', data.data)

    #choose a filename to save recorded data
    file = open('RecordedFiles/HumanGrasp.txt', "a")

    #write empty line
    file.write('\n')

    if data.data == False:
        exit(0)

    #get starting time
    startTime = time.time()

    while data.data == True and time.time()-startTime < 4: #record 4secs of data

        #subscribe to socket
        socket = humanPose.subscribeToSocket()

        #get the humanPosture
        postureMsg = humanPose.publishData(socket)

        # print actual time
        print(time.time()-startTime)

        #write humanPosture to file
        file.write(str(postureMsg) + '\n')

    #close file stream
    file.close()

def waitForAction():

    '''
    Node that subscribes to RecordAction Topic to start recording data
    '''

    #init the node
    rospy.init_node('listenToRecordActionTopic', anonymous=True)

    #when ActionState TRUE - record Data
    message = rospy.Subscriber("RecordAction", Bool, socketNodeRecordData)
    if message:
        print('True')
    else:
        print('False')

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    try:
        #record data according to bool of ActionState Topic
        waitForAction()

        #record continuous data (walking or staying idle)
        #recordWalking()

    except rospy.ROSInterruptException:
        pass