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
