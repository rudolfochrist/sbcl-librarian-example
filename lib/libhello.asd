(asdf:defsystem #:libhello
  :description "Shared Library for HELLO "
  :defsystem-depends-on (#:sbcl-librarian)
  :depends-on (#:sbcl-librarian #:HELLO)
  :serial t
  :components ((:file "package")
               (:file "bindings")))
