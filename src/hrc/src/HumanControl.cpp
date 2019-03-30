#include "ros/ros.h"
#include "std_msgs/String.h"
#include "string"
class humanControl {
public:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Publisher pub;
	void processNextTask(const std_msgs::String::ConstPtr&);
};

//Decode actions from 0-5 and publishes actual actions to HumanActionExecutionTopic
void humanControl::processNextTask(const std_msgs::String::ConstPtr& msg) {
	//convert numbers sent by task generator into actions.
	std::string text;
	std_msgs::String s;
	//ROS_INFO("Receiving TaskTopic : [%s]", msg->data.c_str());
	switch (atoi(msg->data.c_str())) {
	case 0:
		text = "grasp";
		break;
	case 1:
		text = "lookaround";
		break;
	case 2:
		text = "sitdown";
		break;
	case 3:
		text = "standup";
		break;
	case 4:
		text = "warn";
		break;
	case 5:
		text = "walk";
		break;
	default:
		break;
	}
	s.data = text;
	pub.publish(s);
}

int main(int argc, char **argv) {
	ros::init(argc, argv, "HumanControl");
	humanControl obj;
	obj.pub = obj.n.advertise<std_msgs::String>("HumanActionExecutionTopic",
			1);
	obj.sub = obj.n.subscribe("TaskTopic", 1, &humanControl::processNextTask,
			&obj);
	ros::spin();
	return 0;
}
