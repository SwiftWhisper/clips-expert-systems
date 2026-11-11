(deftemplate parents
   (slot child)
   (slot relation
      (allowed-values father mother parents))
   (multislot relatives)
)

(deftemplate status
   (slot person)
   (slot status
      (allowed-values father mother son))
)

(deftemplate gender
   (slot person)
   (slot gender
      (allowed-values male female))
)

(deffacts family-facts

   (parents
      (child John)
      (relation father)
      (relatives Tom))

   (parents
      (child John)
      (relation mother)
      (relatives Susan))

   (parents
      (child John)
      (relation parents)
      (relatives Tom Susan))

   (status
      (person Tom)
      (status father))

   (status
      (person Susan)
      (status mother))

   (status
      (person John)
      (status son))

   (gender
      (person Tom)
      (gender male))

   (gender
      (person Susan)
      (gender female))

   (gender
      (person John)
      (gender male))
)

(defrule print-father
   (declare (salience 90))
   (parents
      (child ?child)
      (relation father)
      (relatives ?father))
   =>
   (printout t "The father of " ?child " is " ?father "." crlf)
)


(defrule print-mother
   (declare (salience 80))
   (parents
      (child ?child)
      (relation mother)
      (relatives ?mother))
   =>
   (printout t "The mother of " ?child " is " ?mother "." crlf)
)


(defrule print-parents
   (declare (salience 70))
   (parents
      (child ?child)
      (relation parents)
      (relatives ?father ?mother))
   =>
   (printout t "The parents of " ?child " are "
               ?father " and " ?mother "." crlf)
)


(defrule print-father-status
   (declare (salience 60))
   (status
      (person ?person)
      (status father))
   =>
   (printout t ?person " is a father." crlf)
)


(defrule print-mother-status
   (declare (salience 50))
   (status
      (person ?person)
      (status mother))
   =>
   (printout t ?person " is a mother." crlf)
)


(defrule print-son-status
   (declare (salience 40))
   (status
      (person ?person)
      (status son))
   =>
   (printout t ?person " is a son." crlf)
)


(defrule print-tom-male
   (declare (salience 30))
   (gender
      (person Tom)
      (gender male))
   =>
   (printout t "Tom is a male." crlf)
)


(defrule print-susan-female
   (declare (salience 20))
   (gender
      (person Susan)
      (gender female))
   =>
   (printout t "Susan is a female." crlf)
)


(defrule print-john-male
   (declare (salience 10))
   (gender
      (person John)
      (gender male))
   =>
   (printout t "John is a male." crlf)
)
