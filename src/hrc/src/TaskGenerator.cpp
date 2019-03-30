#include "ros/ros.h"
#include "std_msgs/String.h"
#include <string>
#include <sstream>

//0 - manual input
//1 - Random actions
int flag = 0;
class taskGenerator {
public:
	ros::NodeHandle n;
	ros::Publisher pub;
	void initialize();
};

/*
    taskGenerator assigns tasks to human and robot.
    Currently configured to provide tasks to human only.
    It generated numbers 0-5 corresponding to actions,
    0-[grasp],1-[lookaround],2-[sitdown],3-[standup],4-[warn],5-[walk]
    flag variable control random generation of action tokens/manual input for action tokens
    Logic of generating human action tokens can be moved to human control.
    But since task generator doesn't has significant functionality, it is included here currently.
*/
void taskGenerator::initialize() {
	pub = n.advertise<std_msgs::String>("TaskTopic", 1);
	ros::Rate loop_rate(0.2);
	srand((unsigned) time(0));
	while (ros::ok()) {
		std_msgs::String msg;
		std::stringstream sstream;
		std::string sstring;
		int value;
		ROS_INFO("Action : 0-[grasp],1-[lookaround],2-[sitdown],3-[standup],4-[warn],5-[walk]");
		if(flag == 0)
		{
		    ROS_INFO("Please select an action : ");
		    std::cin >> sstring;
		    msg.data = sstring;
		}
		else
		{
		    sstream << (rand() % 6);
		    msg.data = sstream.str();
		    ROS_INFO("Random action is [%s]",msg.data.c_str());
		}
		ROS_INFO("Publishing TaskTopic : [%s]", msg.data.c_str());
		pub.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
	}
}
int main(int argc, char **argv) {
	ros::init(argc, argv, "TaskGenerator");
	taskGenerator obj;
	obj.initialize();
	return 0;
}
