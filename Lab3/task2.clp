(deftemplate material
   (slot type)
)

(deftemplate fire
   (slot class
      (allowed-values A B C D))
)


(defrule determine-class-A
   (material
      (type ?type&:(or
         (eq ?type paper)
         (eq ?type wood)
         (eq ?type cloth))))
   =>
   (assert
      (fire
         (class A)))
)


(defrule determine-class-B
   (material
      (type ?type&:(or
         (eq ?type oil)
         (eq ?type gas)
         (eq ?type grease))))
   =>
   (assert
      (fire
         (class B)))
)


(defrule determine-class-C
   (material
      (type energized-electrical-equipment))
   =>
   (assert
      (fire
         (class C)))
)


(defrule determine-class-D
   (material
      (type ?type&:(or
         (eq ?type magnesium)
         (eq ?type sodium)
         (eq ?type potassium))))
   =>
   (assert
      (fire
         (class D)))
)


(defrule extinguish-class-A
   (fire
      (class A))
   =>
   (printout t "Тип пожежі: A" crlf)
   (printout t
      "Як погасити: fires should be extinguished with heat-absorbing or combustion-retarding extinguishers such as water or water-based liquids and dry chemicals."
      crlf)
)


(defrule extinguish-class-B
   (fire
      (class B))
   =>
   (printout t "Тип пожежі: B" crlf)
   (printout t
      "Як погасити: fires should be extinguished by excluding air, inhibiting the release of combustible vapors, or interrupting the combustion chain reaction. Extinguishers include dry chemicals, carbon dioxide, foam, and bromotrifluoromethane."
      crlf)
)


(defrule extinguish-class-C
   (fire
      (class C))
   =>
   (printout t "Тип пожежі: C" crlf)
   (printout t
      "Як погасити: fires should be extinguished with a nonconducting agent to prevent short circuits. If possible the power should be cut. Extinguishers include dry chemicals, carbon dioxide, and bromotrifluoromethane."
      crlf)
)


(defrule extinguish-class-D
   (fire
      (class D))
   =>
   (printout t "Тип пожежі: D" crlf)
   (printout t
      "Як погасити: fires should be extinguished with smothering and heat-absorbing chemicals that do not react with the burning metals. Such chemicals include trimethoxyboroxine and screened graphitized coke."
      crlf)
)
