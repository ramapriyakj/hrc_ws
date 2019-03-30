#include "ros/ros.h"
#include "std_msgs/String.h"
#include "string"
#include <std_srvs/Trigger.h>
class robotExecution {
public:
	ros::NodeHandle n;
	ros::Subscriber subHumanAction;
	ros::ServiceClient client;
	std_srvs::Trigger::Request req;
	std_srvs::Trigger::Response resp;
	void processHumanActionTask(const std_msgs::String::ConstPtr&);
};

//Response to human actions. Robot functions can be called here.
void robotExecution::processHumanActionTask(
		const std_msgs::String::ConstPtr& msg) {
	//call service and perform robot action
	std::string text = msg->data;
	ROS_INFO("Human Action is [%s]", text.c_str());
}

//Robot subscribes to HumanActionEstimationTopic
//Code can be enhanced to subscribe to HumanStateEstimationTopic to include human state of mind
int main(int argc, char **argv) {
	ros::init(argc, argv, "RobotExecution");
	robotExecution obj;
	obj.subHumanAction = obj.n.subscribe("HumanActionEstimationTopic", 1000,
			&robotExecution::processHumanActionTask, &obj);
	ros::spin();
	return 0;
}
