;;;; defprep-0.lisp

(in-package #:defprep)

(defvar *db* nil
  "A list of 4 connection parameters to use when running the tests.  The
  order is: database name, user, password, hostname. Database name defaults to
  'defprep'. Hostname defaults to 'localhost'.")

(defparameter *dbname* "defprep")
(defparameter *hostname* "localhost")
(defparameter *username* nil)
(defparameter *password* nil)


(defun get-db-params ()
  (format t "~%Database Name: ~A (enter to keep '~a') ~%" *dbname* *dbname*)
  (let ((answer (read-line)))
    (if (not (string= answer ""))
        (setf *dbname* answer)))
  (format t "~%User or Role Name:  ~%")
  (let ((answer (read-line)))
    (setf *username* answer))
  (format t "~%Password:  ~%")
  (let ((answer (read-line)))
    (setf *password* answer))
    (format t "~%HostName: ~A (enter to keep '~a') ~%" *hostname* *hostname*)
  (let ((answer (read-line)))
    (if (not (string= answer ""))
        (setf *hostname* answer)))
  (setf *db* (list *dbname* *username* *password* *hostname*))
  (format t "~%Setting *db* to ~a~%" *db*))

(get-db-params)

(pomo:defprepared 'query-sessions-id "select * from sessions where id = $1")

(pomo:defprepared query-sessions-sid "select * from sessions where sid = $1")
