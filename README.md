Human-Robot Collaboration (HRC)
============

by Ramapriya Kyathanahally Janardhan (janardhan@campus.tu-berlin.de)

*   The project detects hunman actions simulated from MORSE
*   Tensorflow model (morse_predict service) detects human actions sit, stand, look around, grasp and walk.

Below are the instructions to succesfully install and run the Human-Robot Collaboration (HRC) code.

---

## Prerequisites

*   MORSE
    *   Install Morse 1.3 - STABLE.
*   ROS
    *   The code is tested with ROS Kinetic on Ubuntu 16.04 machines.
    *   No special ROS packages are needed apart from those which come with a standard installation of ROS.
    *   The only other dependency are the Boost libraries which need to be installed.
*   Modifications to the existing hrc_industry project
    *   Replace below files with files under record_morsedata/Files_To_Be_Changed/ : 
    1.  replace human.blend in /opt/share/morse/data/robots
    2.  relace human.py in /opt/lib/python3/dist-packages/morse/robots
    3.  replace human_posture.py in /opt/lib/python3/dist-packages/morse/sensors
    4.  replace human_overlay.py in /hrc_industry/code/hrc_morse/src
    5.  replace hrc_scenario.py in /hrc_industry/code/hrc_morse 
    6.  or add manually to hrc_scenario.py

```
import morse.sensors.human_posture

humanposture = HumanPosture()
humanposture.add_interface('socket', port = 60005)
human.append(humanposture)

```
    
## Installation
```
cd hrc_ws
catkin_make
```
NOTE: If the above command gives build error, delete build and devel folders and rerun catkin_make.
```
source devel/setup.bash
```

## Running

*   Start MORSE Simulation from hrc_industry code:

```
cd code/
source ros_ws/devel/setup.bash # should source for both the morse and ros terminals
roscore
morse run hrc_morse hrc_scenario.py
roslaunch hrc_ros hrc.launch
```

*   Activating Tensorflow 
    *   tf_source - Tensorflow installation location. eg. ~/Tensorflow/bin
    *   The below commands will activate tensorflow and start morse_predict tensorflow service.

```
source <tf_source>/activate
rosrun hrc MorseTensorFlow.py
```

*   Run human robot collaboration
    *   The below command will run all topics and nodes related to HRC. It open 6 terminals corresponding to the below ROS nodes-
    *   TaskGenerator, HumanControl, HumanExecution, RobotExecution, DataCollectionAndPreprocessing, HumanActionRecognition
    *   Only TaskGenerator and RobotExecution terminals are important to view the simulation results. 
    *   Minimize the rest terminals.
    *   Enter the action to be executed by human under TaskGenerator terminal. RobotExecution terminal dispalys the action executed by human.
    *   When action is issued from TaskGenerator, the actual action can be viewed in blender.

```
roslaunch hrc hrc_launch.launch 
```




