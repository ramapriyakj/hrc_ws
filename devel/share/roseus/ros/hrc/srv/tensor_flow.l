;; Auto-generated. Do not edit!


(when (boundp 'hrc::tensor_flow)
  (if (not (find-package "HRC"))
    (make-package "HRC"))
  (shadow 'tensor_flow (find-package "HRC")))
(unless (find-package "HRC::TENSOR_FLOW")
  (make-package "HRC::TENSOR_FLOW"))
(unless (find-package "HRC::TENSOR_FLOWREQUEST")
  (make-package "HRC::TENSOR_FLOWREQUEST"))
(unless (find-package "HRC::TENSOR_FLOWRESPONSE")
  (make-package "HRC::TENSOR_FLOWRESPONSE"))

(in-package "ROS")





(defclass hrc::tensor_flowRequest
  :super ros::object
  :slots (_prediction_input ))

(defmethod hrc::tensor_flowRequest
  (:init
   (&key
    ((:prediction_input __prediction_input) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _prediction_input __prediction_input)
   self)
  (:prediction_input
   (&optional __prediction_input)
   (if __prediction_input (setq _prediction_input __prediction_input)) _prediction_input)
  (:serialization-length
   ()
   (+
    ;; float64[] _prediction_input
    (* 8    (length _prediction_input)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _prediction_input
     (write-long (length _prediction_input) s)
     (dotimes (i (length _prediction_input))
       (sys::poke (elt _prediction_input i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _prediction_input
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _prediction_input (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _prediction_input i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass hrc::tensor_flowResponse
  :super ros::object
  :slots (_prediction_output ))

(defmethod hrc::tensor_flowResponse
  (:init
   (&key
    ((:prediction_output __prediction_output) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _prediction_output __prediction_output)
   self)
  (:prediction_output
   (&optional __prediction_output)
   (if __prediction_output (setq _prediction_output __prediction_output)) _prediction_output)
  (:serialization-length
   ()
   (+
    ;; int64[] _prediction_output
    (* 8    (length _prediction_output)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _prediction_output
     (write-long (length _prediction_output) s)
     (dotimes (i (length _prediction_output))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _prediction_output i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _prediction_output i)) (= (length ((elt _prediction_output i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _prediction_output i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _prediction_output i) . bv) 1) -1) s))
             ((and (class (elt _prediction_output i)) (= (length ((elt _prediction_output i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _prediction_output i) . bv) 0) s)
              (write-long (if (>= (elt _prediction_output i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _prediction_output i) s)(write-long (if (>= (elt _prediction_output i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _prediction_output
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _prediction_output (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _prediction_output i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _prediction_output i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;;
   self)
  )

(defclass hrc::tensor_flow
  :super ros::object
  :slots ())

(setf (get hrc::tensor_flow :md5sum-) "08ddcce5c57815791cd846df0faa9864")
(setf (get hrc::tensor_flow :datatype-) "hrc/tensor_flow")
(setf (get hrc::tensor_flow :request) hrc::tensor_flowRequest)
(setf (get hrc::tensor_flow :response) hrc::tensor_flowResponse)

(defmethod hrc::tensor_flowRequest
  (:response () (instance hrc::tensor_flowResponse :init)))

(setf (get hrc::tensor_flowRequest :md5sum-) "08ddcce5c57815791cd846df0faa9864")
(setf (get hrc::tensor_flowRequest :datatype-) "hrc/tensor_flowRequest")
(setf (get hrc::tensor_flowRequest :definition-)
      "float64[] prediction_input
---
int64[] prediction_output
")

(setf (get hrc::tensor_flowResponse :md5sum-) "08ddcce5c57815791cd846df0faa9864")
(setf (get hrc::tensor_flowResponse :datatype-) "hrc/tensor_flowResponse")
(setf (get hrc::tensor_flowResponse :definition-)
      "float64[] prediction_input
---
int64[] prediction_output
")



(provide :hrc/tensor_flow "08ddcce5c57815791cd846df0faa9864")


