(deftemplate person
   (multislot name)
   (slot age (type INTEGER))
   (slot gender (allowed-values male female))
)

(deffacts people
   (person
      (name Anna Test)
      (age 18)
      (gender female))

   (person
      (name John Johns)
      (age 30)
      (gender male))

   (person
      (name Nikita Tsebro)
      (age 20)
      (gender male))
)
