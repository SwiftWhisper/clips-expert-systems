(deftemplate material
   (slot type)
)

(deftemplate fire
   (slot class
      (allowed-values A B C D))
)


(deffunction determine-fire-class (?type)

   (if (or
         (eq ?type paper)
         (eq ?type wood)
         (eq ?type cloth))
      then
         (return A)
   )

   (if (or
         (eq ?type oil)
         (eq ?type gas)
         (eq ?type grease))
      then
         (return B)
   )

   (if (eq ?type energized-electrical-equipment)
      then
         (return C)
   )

   (if (or
         (eq ?type magnesium)
         (eq ?type sodium)
         (eq ?type potassium))
      then
         (return D)
   )

   (return unknown)
)


(deffunction extinguish-fire (?class)

   (if (eq ?class A)
      then
         (printout t "Тип пожежі: A" crlf)
         (printout t
            "Як погасити: fires should be extinguished with heat-absorbing or combustion-retarding extinguishers such as water or water-based liquids and dry chemicals."
            crlf)
   )

   (if (eq ?class B)
      then
         (printout t "Тип пожежі: B" crlf)
         (printout t
            "Як погасити: fires should be extinguished by excluding air, inhibiting the release of combustible vapors, or interrupting the combustion chain reaction. Extinguishers include dry chemicals, carbon dioxide, foam, and bromotrifluoromethane."
            crlf)
   )

   (if (eq ?class C)
      then
         (printout t "Тип пожежі: C" crlf)
         (printout t
            "Як погасити: fires should be extinguished with a nonconducting agent to prevent short circuits. If possible the power should be cut. Extinguishers include dry chemicals, carbon dioxide, and bromotrifluoromethane."
            crlf)
   )

   (if (eq ?class D)
      then
         (printout t "Тип пожежі: D" crlf)
         (printout t
            "Як погасити: fires should be extinguished with smothering and heat-absorbing chemicals that do not react with the burning metals. Such chemicals include trimethoxyboroxine and screened graphitized coke."
            crlf)
   )
)


(defrule determine-class
   (material
      (type ?type))
   =>
   (bind ?class (determine-fire-class ?type))

   (if (neq ?class unknown)
      then
         (assert
            (fire
               (class ?class))))
)


(defrule determine-extinguish
   (fire
      (class ?class))
   =>
   (extinguish-fire ?class)
)
