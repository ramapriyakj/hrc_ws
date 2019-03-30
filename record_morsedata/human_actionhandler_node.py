#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Bool
from std_srvs.srv import Trigger, TriggerRequest, TriggerResponse
import time

'''
Start this Node second to record Data after MORSE simulation is initialized

Use it in combination with human_pose_translator_nodeRecord.py
'''

def callHumanService():
    '''
    Node that publishes to RecordAction Topic as Trigger to start recording actions
    '''

    pubActionState = rospy.Publisher('RecordAction', Bool, queue_size=100)
    rospy.init_node('RecordActionPublisher')

    #wait for all services to be ready
    rospy.wait_for_service('/human/grasp')
    rospy.wait_for_service('/human/warn_robot')
    rospy.wait_for_service('/human/look_around')
    rospy.wait_for_service('/human/sit_down')
    rospy.wait_for_service('/human/stand_up')
    rospy.wait_for_service('/human/walk_away')
    rospy.wait_for_service('/human/reset')

    numberOfRepetitions = 100 #number of samples to create

    for x in range(0, numberOfRepetitions):
        try:

            #########################################################################################
            #services to be called
            human_grasp = rospy.ServiceProxy("/human/grasp", Trigger)
            human_warn = rospy.ServiceProxy("/human/warn_robot", Trigger)
            human_lookAround= rospy.ServiceProxy("/human/look_around", Trigger)
            human_sitDown = rospy.ServiceProxy("/human/sit_down", Trigger)
            human_standup = rospy.ServiceProxy("/human/stand_up", Trigger)
            human_walk_away = rospy.ServiceProxy("/human/walk_away", Trigger)
            human_reset = rospy.ServiceProxy("/human/reset", Trigger)

            #########################################################################################
            #actions to be executed in preferred order

            #1st Action
            pubActionState.publish(True) #publish TRUE to initialize start of recording
            TriggerRequest #TriggerRequest
            response = human_sitDown() #service to be called
            pubActionState.publish(False) #publish FALSE
            print(response) #print called service

            #2nd Action
            time.sleep(4) #wait so action is definitely finished (adjust this according to action)
            pubActionState.publish(True)
            TriggerRequest
            response2 = human_lookAround()
            pubActionState.publish(False)
            print(response2)
            
            #3rd Action
            time.sleep(4)
            pubActionState.publish(True)
            TriggerRequest
            response3 = human_grasp()
            pubActionState.publish(False)
            print(response3)

            #4th Action
            time.sleep(4)
            #pubActionState.publish(True)
            TriggerRequest
            response4 = human_standup()
            #pubActionState.publish(False)
            print(response4)

            #########################################################################################

            print('Service was called ', x+1, ' times')
            time.sleep(4)

        except rospy.ServiceException, e:
            print ("Service call failed")

if __name__ == '__main__':
    try:
        callHumanService()

    except rospy.ROSInterruptException:
        pass