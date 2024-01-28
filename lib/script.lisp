(require '#:asdf)
(asdf:load-asd (make-pathname :defaults (uiop:pathname-parent-directory-pathname (uiop:getcwd))
                              :name "hello"
                              :type "asd"))
(asdf:load-system "libhello")

(in-package #:libhello)

(build-bindings libhello ".")
(build-core-and-die libhello "." :compression t)
