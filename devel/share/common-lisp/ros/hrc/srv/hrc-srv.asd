
(cl:in-package :asdf)

(defsystem "hrc-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "tensor_flow" :depends-on ("_package_tensor_flow"))
    (:file "_package_tensor_flow" :depends-on ("_package"))
  ))