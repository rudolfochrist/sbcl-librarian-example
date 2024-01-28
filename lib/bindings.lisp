;;;; Library definition

(in-package #:libhello)

(define-api libhello-api (:function-prefix "hello_" )
  (:literal "/* functions */")
  (:function
   (hello:hello :string ())))

(define-aggregate-library libhello (:function-linkage (string-upcase "libhello_API"))
  sbcl-librarian:handles sbcl-librarian:environment libhello-api)
