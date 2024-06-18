;;;; defprep.asd

(asdf:defsystem #:defprep
  :description "Describe defprep here"
  :author "Sabra Crolleton"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:postmodern)
  :components ((:file "package")
               (:file "defprep-0")
               (:file "defprep-1")))
