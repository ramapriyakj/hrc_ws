Human-Robot Collaboration on an Assembly Line (Industrial Scenario)
============

by Mike Funk (mike.c.funk@campus.tu-berlin.de)

Below are the instructions to record diverse datasets for actions in MORSE.

---

## Start MORSE Simulation:

```
cd code/
source ros_ws/devel/setup.bash # should source for both the morse and ros terminals
roscore
morse run hrc_morse hrc_scenario.py
```

---

## Start Record Node:

```
cd record_morsedata/
```

if not already there - create folder to save recorded data
```
mkdir  RecordedFiles
```

adjust changes in File 'human_pose_translator_nodeRecord.py' according to recording task and then start it
- specify filename to save actions
- specify time to record
- specify what kind of data you want to record (walking/idle or actions)

```
python human_pose_translator_nodeRecord.py
```

---

## Start Action Handler Node:

```
cd record_morsedata/
```

adjust changes in File 'human_actionhandler_node.py' according to recording task and then start it
- what human action services should be called
- in what order should services be called
- time.sleep between service calls
- number of repetitions of service calls

```
python human_actionhandler_node.py
```


