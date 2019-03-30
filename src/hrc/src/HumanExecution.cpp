#include "ros/ros.h"
#include "std_msgs/String.h"
#include "string"
#include <std_srvs/Trigger.h>
class humanExecution {
public:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::ServiceClient client;
	std_srvs::Trigger::Request req;
	std_srvs::Trigger::Response resp;
	void processAction(const std_msgs::String::ConstPtr&);
};

//Method to execute human actions
//call services in hrc_industry to execute human actions.
void humanExecution::processAction(const std_msgs::String::ConstPtr& msg) {
	//call service and perform human action
	std::string text = msg->data;
	ROS_INFO("Receiving HumanActionExecutionTopic : [%s]", text.c_str());
	if (text.compare("grasp") == 0) 
	{
		ROS_INFO("grasp");
		client = n.serviceClient<std_srvs::Trigger>("/human/grasp");
		client.call(req, resp);
	} 
	else if (text.compare("lookaround") == 0) 
	{
		ROS_INFO("lookaround");
		client = n.serviceClient<std_srvs::Trigger>("/human/look_around");
		client.call(req, resp);
	} 
	else if (text.compare("sitdown") == 0) 
	{
		ROS_INFO("sitdown");
		client = n.serviceClient<std_srvs::Trigger>("/human/sit_down");
		client.call(req, resp);
	} 
	else if (text.compare("standup") == 0) 
	{
		ROS_INFO("standup");
		client = n.serviceClient<std_srvs::Trigger>("/human/stand_up");
		client.call(req, resp);
	} 
	else if (text.compare("warn") == 0) 
	{
		ROS_INFO("warn");
		client = n.serviceClient<std_srvs::Trigger>("/human/warn_robot");
		client.call(req, resp);
	} 
	else if (text.compare("walk") == 0)
	{	
		ROS_INFO("walk");
		client = n.serviceClient<std_srvs::Trigger>("/human/walk_away");
		client.call(req, resp);
	}
}

int main(int argc, char **argv) {
	ros::init(argc, argv, "HumanExecution");
	humanExecution obj;
	obj.sub = obj.n.subscribe("HumanActionExecutionTopic", 1,
			&humanExecution::processAction, &obj);

	ros::spin();
	return 0;
}
