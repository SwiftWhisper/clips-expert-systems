(defrule find-woman
   (person
      (name $?name)
      (gender female))
   =>
   (printout t "Woman: " $?name crlf)
)
