// Auto-generated. Do not edit!

// (in-package hrc.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class tensor_flowRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.prediction_input = null;
    }
    else {
      if (initObj.hasOwnProperty('prediction_input')) {
        this.prediction_input = initObj.prediction_input
      }
      else {
        this.prediction_input = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tensor_flowRequest
    // Serialize message field [prediction_input]
    bufferOffset = _arraySerializer.float64(obj.prediction_input, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tensor_flowRequest
    let len;
    let data = new tensor_flowRequest(null);
    // Deserialize message field [prediction_input]
    data.prediction_input = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.prediction_input.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hrc/tensor_flowRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2fbaeb7f415f285ee82ff6bc6b802be5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] prediction_input
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tensor_flowRequest(null);
    if (msg.prediction_input !== undefined) {
      resolved.prediction_input = msg.prediction_input;
    }
    else {
      resolved.prediction_input = []
    }

    return resolved;
    }
};

class tensor_flowResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.prediction_output = null;
    }
    else {
      if (initObj.hasOwnProperty('prediction_output')) {
        this.prediction_output = initObj.prediction_output
      }
      else {
        this.prediction_output = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tensor_flowResponse
    // Serialize message field [prediction_output]
    bufferOffset = _arraySerializer.int64(obj.prediction_output, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tensor_flowResponse
    let len;
    let data = new tensor_flowResponse(null);
    // Deserialize message field [prediction_output]
    data.prediction_output = _arrayDeserializer.int64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.prediction_output.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hrc/tensor_flowResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b902da4ca3a9e62ff9c4f014b8c7ab06';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[] prediction_output
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tensor_flowResponse(null);
    if (msg.prediction_output !== undefined) {
      resolved.prediction_output = msg.prediction_output;
    }
    else {
      resolved.prediction_output = []
    }

    return resolved;
    }
};

module.exports = {
  Request: tensor_flowRequest,
  Response: tensor_flowResponse,
  md5sum() { return '08ddcce5c57815791cd846df0faa9864'; },
  datatype() { return 'hrc/tensor_flow'; }
};
