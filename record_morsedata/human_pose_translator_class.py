#!/usr/bin/env python

import socket
import json
from std_msgs.msg import Float64
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import MultiArrayDimension
from std_msgs.msg import _Bool

class HumanPoseTranslator():

    def recvSingleJson(self, socket):
      # read the length of the data, letter by letter until we reach EOL
      length_str = ''
      char = socket.recv(1)
      while char != '\n':
        length_str += char
        char = socket.recv(1)
      total = length_str
      return total

    def subscribeToSocket(self):

        ##################### initialize socket stream #####################
        #define socket-stream
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        #define server and port
        server = 'localhost'
        port = 60005
        server_ip = socket.gethostbyname(server)

        #connect to server
        s.connect((server, port))

        return s


    def publishData(self, socket):
            #receive data from socket
            posture = self.recvSingleJson(socket)
            jdata = json.loads(posture.decode('utf-8'))  # string

            #put values into vector for tensorflow
            postureVector = \
                [#jdata["timestamp"],
                 jdata["dof_13"], jdata["dof_12"], jdata["dof_14"], #torso
                 jdata["dof_16"], jdata["dof_17"], jdata["dof_15"], #head
                 jdata["dof_25"], jdata["dof_26"], jdata["dof_27"], #shoulder_left
                 jdata["dof_28"],                                   #elbow_left_z
                 jdata["dof_29"], jdata["dof_30"], jdata["dof_31"], #wrist_left         change:DOF30
                 jdata["dof_18"], jdata["dof_19"], jdata["dof_20"], #shoulder_right
                 jdata["dof_21"],                                   #elbow-right_z      change:DOF21
                 jdata["dof_22"], jdata["dof_23"], jdata["dof_24"], #wrist_right
                 jdata["dof_39"], jdata["dof_40"], jdata["dof_41"], #hip_left
                 jdata["dof_42"],                                   #knee_left_z
                 jdata["dof_43"], jdata["dof_44"], jdata["dof_45"], #ankle_left
                 jdata["dof_32"], jdata["dof_33"], jdata["dof_34"], #hip_rght
                 jdata["dof_35"],                                   #knee_right_z
                 jdata["dof_36"], jdata["dof_37"], jdata["dof_38"]] #ankle_right

            #Publishing Data
            postureMsg = Float32MultiArray(data=postureVector)
            #print(jdata["timestamp"])
            print(postureVector)
            #return postureMsg
            return postureVector
