(defrule find-adult
   (person
      (name $?name)
      (age ?age&:(>= ?age 18)))
   =>
   (printout t $?name " is adult. Age = " ?age crlf)
)
