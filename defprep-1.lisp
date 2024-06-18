;;;; defprep.lisp

(in-package #:defprep)

(pomo:with-connection *db*
  (format t "~%1. Before Actually Calling Any Prepared Statements~%")
  (format t "~%Postmodern Prepped:~%~a~%" (pomo:list-postmodern-prepared-statements))
  (format t "~%Postgresql Prepped:~%~a~%" (pomo:list-prepared-statements)))

(pomo:with-connection *db*
  (let ((account (query-sessions-sid "abc123")))
    (format t "~%Point 2 ~a~%" account)
    (format t "~%Postmodern Prepped:~%~a~%" (pomo:list-postmodern-prepared-statements))
    (format t "~%Postgresql Prepped:~%~a~%" (pomo:list-prepared-statements))))

(pomo:with-connection *db*
  (let ((id (query-sessions-id 2))
        (sid (query-sessions-sid "abc123")))
    (format t "~%Point 3 Id Call: ~a Sid Call: ~a~%" id sid)
    (format t "~%Postmodern Prepped:~%~a~%" (pomo:list-postmodern-prepared-statements))
    (format t "~%Postgresql Prepped:~%~a~%" (pomo:list-prepared-statements))))

(defun test-point4 ()
  (pomo:with-connection *db*
    (let ((id (query-sessions-id 2))
        (sid (query-sessions-sid "abc123")))
      (format t "~%Point 4 Id Call: ~a Sid Call: ~a~%" id sid)
    (format t "~%Postmodern Prepped:~%~a~%" (pomo:list-postmodern-prepared-statements))
    (format t "~%Postgresql Prepped:~%~a~%" (pomo:list-prepared-statements)))))

(test-point4)

(defun test-point5 ()
  (pomo:with-connection *db*
    (let ((id (query-sessions-id 27))
        (sid (query-sessions-sid "xyz456")))
      (format t "~%Point 5 Id Call: ~a Sid Call: ~a~%" id sid)
      (format t "~%Postmodern Prepped:~%~a~%" (pomo:list-postmodern-prepared-statements))
      (format t "~%Postgresql Prepped:~%~a~%" (pomo:list-prepared-statements)))))

