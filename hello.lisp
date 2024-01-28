
(defpackage #:hello
  (:use :cl)
  (:export
   #:hello))

(in-package #:hello)

(defun hello ()
  "Hello!")
