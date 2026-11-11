(defrule find-men
   (person
      (name $?name)
      (gender male))
   =>
   (printout t "Man: " $?name crlf)
)
