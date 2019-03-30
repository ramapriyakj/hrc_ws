#!/usr/bin/env python
import rospy
import time
from std_msgs.msg import String
from hrc.srv import *

#Time to sample morse actions in seconds
sample_time = 4;

#start time for sampling morse actions
start_time = 0;

#sampled morse action data for sample_time seconds
sampledata = []

#0 - sample top 30 frames from sampledata
#1 - sample random 30 frames from sampledata, skip int(len(sampledata)/30) - 1 records for every 1 sampled record
sample_flag = 1;

#initialies node,subscibes and publishes topics
def initialize():
    global pub;
    rospy.init_node('HumanActionRecognition', anonymous=True);
    pub = rospy.Publisher('HumanActionEstimationTopic', String, queue_size=1250)
    rospy.wait_for_service('morse_predict')
    rospy.Subscriber('HumanJointTopic', String, processMessages)
    rospy.spin()

#method samples frames streamed to HumanJointTopic topic
#sample time and logic can be controlled by flags sample_time,sample_flag
def getData(sampledata):
    global sample_flag;
    records = len(sampledata);
    data = "";
    data_arr = []
    if records >= 30:
        if sample_flag == 0:
            for i in range(30):
                data = data + (sampledata[i].replace(" ", ""))[:-1][1:]+",";
            data_arr = [float(x) for x in data[:-1].split(',')]
        elif sample_flag == 1:
            result = int(records/30);
            skip = result - 1;
            index = 0;
            for i in range(30):
                data = data + (sampledata[index].replace(" ", ""))[:-1][1:]+",";
                index = index+1;
                for j in range(skip):
                    index = index + 1;
            data_arr = [float(x) for x in data[:-1].split(',')]
    return data_arr;

#method to call tensor flow service.
#sampled frame is passed to tensor flow to get the human action.
def getResult(tensor_data):
    try:
        morse_predict = rospy.ServiceProxy('morse_predict', tensor_flow)
        resp = morse_predict(tensor_data)
        return list(resp.prediction_output)
    except Exception as inst:
        print("Service call failed: %s" % inst);

#method calls getData,getResult to sample data and get human action.
#The results are then published to HumanActionEstimationTopic.
def processMessages(data):
    global pub;
    global start_time;
    global sampledata;
    if start_time == 0:
        start_time = time.time();
    if (time.time() - start_time) > sample_time:
        tensor_data = getData(sampledata);
        result = getResult(tensor_data);
        temp = result[0]
        text = ""
        if temp == 0:
            text = "grasp"
        elif temp == 1:
            text = "lookaround"
        elif temp == 2:
            text = "sitdown"
        elif temp == 3:
            text = "standup"
        elif temp == 4:
            text = "warn"
        elif temp == 5:
            text = "walk"
        pub.publish(text)
        sampledata = []
        start_time = 0;
    sampledata.append(data.data);

if __name__ == '__main__':
    try:
        initialize();
    except rospy.ROSInterruptException:
        pass
