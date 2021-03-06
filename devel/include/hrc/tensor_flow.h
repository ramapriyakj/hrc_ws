// Generated by gencpp from file hrc/tensor_flow.msg
// DO NOT EDIT!


#ifndef HRC_MESSAGE_TENSOR_FLOW_H
#define HRC_MESSAGE_TENSOR_FLOW_H

#include <ros/service_traits.h>


#include <hrc/tensor_flowRequest.h>
#include <hrc/tensor_flowResponse.h>


namespace hrc
{

struct tensor_flow
{

typedef tensor_flowRequest Request;
typedef tensor_flowResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct tensor_flow
} // namespace hrc


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::hrc::tensor_flow > {
  static const char* value()
  {
    return "08ddcce5c57815791cd846df0faa9864";
  }

  static const char* value(const ::hrc::tensor_flow&) { return value(); }
};

template<>
struct DataType< ::hrc::tensor_flow > {
  static const char* value()
  {
    return "hrc/tensor_flow";
  }

  static const char* value(const ::hrc::tensor_flow&) { return value(); }
};


// service_traits::MD5Sum< ::hrc::tensor_flowRequest> should match 
// service_traits::MD5Sum< ::hrc::tensor_flow > 
template<>
struct MD5Sum< ::hrc::tensor_flowRequest>
{
  static const char* value()
  {
    return MD5Sum< ::hrc::tensor_flow >::value();
  }
  static const char* value(const ::hrc::tensor_flowRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::hrc::tensor_flowRequest> should match 
// service_traits::DataType< ::hrc::tensor_flow > 
template<>
struct DataType< ::hrc::tensor_flowRequest>
{
  static const char* value()
  {
    return DataType< ::hrc::tensor_flow >::value();
  }
  static const char* value(const ::hrc::tensor_flowRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::hrc::tensor_flowResponse> should match 
// service_traits::MD5Sum< ::hrc::tensor_flow > 
template<>
struct MD5Sum< ::hrc::tensor_flowResponse>
{
  static const char* value()
  {
    return MD5Sum< ::hrc::tensor_flow >::value();
  }
  static const char* value(const ::hrc::tensor_flowResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::hrc::tensor_flowResponse> should match 
// service_traits::DataType< ::hrc::tensor_flow > 
template<>
struct DataType< ::hrc::tensor_flowResponse>
{
  static const char* value()
  {
    return DataType< ::hrc::tensor_flow >::value();
  }
  static const char* value(const ::hrc::tensor_flowResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // HRC_MESSAGE_TENSOR_FLOW_H
