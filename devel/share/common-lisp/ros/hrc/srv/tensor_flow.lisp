; Auto-generated. Do not edit!


(cl:in-package hrc-srv)


;//! \htmlinclude tensor_flow-request.msg.html

(cl:defclass <tensor_flow-request> (roslisp-msg-protocol:ros-message)
  ((prediction_input
    :reader prediction_input
    :initarg :prediction_input
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass tensor_flow-request (<tensor_flow-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tensor_flow-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tensor_flow-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrc-srv:<tensor_flow-request> is deprecated: use hrc-srv:tensor_flow-request instead.")))

(cl:ensure-generic-function 'prediction_input-val :lambda-list '(m))
(cl:defmethod prediction_input-val ((m <tensor_flow-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrc-srv:prediction_input-val is deprecated.  Use hrc-srv:prediction_input instead.")
  (prediction_input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tensor_flow-request>) ostream)
  "Serializes a message object of type '<tensor_flow-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'prediction_input))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'prediction_input))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tensor_flow-request>) istream)
  "Deserializes a message object of type '<tensor_flow-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'prediction_input) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'prediction_input)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tensor_flow-request>)))
  "Returns string type for a service object of type '<tensor_flow-request>"
  "hrc/tensor_flowRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tensor_flow-request)))
  "Returns string type for a service object of type 'tensor_flow-request"
  "hrc/tensor_flowRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tensor_flow-request>)))
  "Returns md5sum for a message object of type '<tensor_flow-request>"
  "08ddcce5c57815791cd846df0faa9864")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tensor_flow-request)))
  "Returns md5sum for a message object of type 'tensor_flow-request"
  "08ddcce5c57815791cd846df0faa9864")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tensor_flow-request>)))
  "Returns full string definition for message of type '<tensor_flow-request>"
  (cl:format cl:nil "float64[] prediction_input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tensor_flow-request)))
  "Returns full string definition for message of type 'tensor_flow-request"
  (cl:format cl:nil "float64[] prediction_input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tensor_flow-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'prediction_input) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tensor_flow-request>))
  "Converts a ROS message object to a list"
  (cl:list 'tensor_flow-request
    (cl:cons ':prediction_input (prediction_input msg))
))
;//! \htmlinclude tensor_flow-response.msg.html

(cl:defclass <tensor_flow-response> (roslisp-msg-protocol:ros-message)
  ((prediction_output
    :reader prediction_output
    :initarg :prediction_output
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass tensor_flow-response (<tensor_flow-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tensor_flow-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tensor_flow-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hrc-srv:<tensor_flow-response> is deprecated: use hrc-srv:tensor_flow-response instead.")))

(cl:ensure-generic-function 'prediction_output-val :lambda-list '(m))
(cl:defmethod prediction_output-val ((m <tensor_flow-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hrc-srv:prediction_output-val is deprecated.  Use hrc-srv:prediction_output instead.")
  (prediction_output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tensor_flow-response>) ostream)
  "Serializes a message object of type '<tensor_flow-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'prediction_output))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'prediction_output))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tensor_flow-response>) istream)
  "Deserializes a message object of type '<tensor_flow-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'prediction_output) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'prediction_output)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tensor_flow-response>)))
  "Returns string type for a service object of type '<tensor_flow-response>"
  "hrc/tensor_flowResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tensor_flow-response)))
  "Returns string type for a service object of type 'tensor_flow-response"
  "hrc/tensor_flowResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tensor_flow-response>)))
  "Returns md5sum for a message object of type '<tensor_flow-response>"
  "08ddcce5c57815791cd846df0faa9864")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tensor_flow-response)))
  "Returns md5sum for a message object of type 'tensor_flow-response"
  "08ddcce5c57815791cd846df0faa9864")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tensor_flow-response>)))
  "Returns full string definition for message of type '<tensor_flow-response>"
  (cl:format cl:nil "int64[] prediction_output~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tensor_flow-response)))
  "Returns full string definition for message of type 'tensor_flow-response"
  (cl:format cl:nil "int64[] prediction_output~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tensor_flow-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'prediction_output) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tensor_flow-response>))
  "Converts a ROS message object to a list"
  (cl:list 'tensor_flow-response
    (cl:cons ':prediction_output (prediction_output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'tensor_flow)))
  'tensor_flow-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'tensor_flow)))
  'tensor_flow-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tensor_flow)))
  "Returns string type for a service object of type '<tensor_flow>"
  "hrc/tensor_flow")