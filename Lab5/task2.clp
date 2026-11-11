(deftemplate team-member
   (slot name)
   (slot position)
)

(deffacts all-data
   (name Andy)
   (name Ed)
   (name Harry)
   (name Paul)
   (name Allen)
   (name Sam)
   (name Bill)
   (name Jerry)
   (name Mike)

   (position pitcher)
   (position catcher)
   (position first-base)
   (position second-base)
   (position third-base)
   (position shortstop)
   (position right-field)
   (position left-field)
   (position center-field)
)

(defrule generate-all-positions
   (name ?name)
   (position ?position)
   =>
   (assert
      (team-member
         (name ?name)
         (position ?position)))
)

(defrule find-solution

   (team-member
      (name Andy)
      (position
         ?andy
         &~catcher
         &~right-field
         &~left-field
         &~center-field
         &~shortstop
         &~second-base))

   (team-member
      (name Ed)
      (position
         ?ed
         &~?andy
         &~second-base
         &~right-field
         &~left-field
         &~center-field
         &~catcher
         &~third-base
         &~pitcher
         &~shortstop))

   (team-member
      (name Harry)
      (position
         ?harry
         &~?andy
         &~?ed
         &~third-base
         &~right-field
         &~left-field
         &~center-field
         &~catcher
         &~second-base))

   (team-member
      (name Paul)
      (position
         ?paul
         &~?andy
         &~?ed
         &~?harry
         &~pitcher
         &~shortstop
         &~catcher
         &~second-base
         &~right-field
         &~center-field
         &~third-base))

   (team-member
      (name Allen)
      (position
         ?allen
         &~?andy
         &~?ed
         &~?harry
         &~?paul
         &~pitcher
         &~right-field
         &~left-field
         &~center-field
         &~second-base))

   (team-member
      (name Sam)
      (position
         ?sam
         &~?andy
         &~?ed
         &~?harry
         &~?paul
         &~?allen
         &~right-field
         &~center-field
         &~second-base
         &~catcher
         &~third-base
         &~shortstop))

   (team-member
      (name Bill)
      (position
         ?bill
         &~?andy
         &~?ed
         &~?harry
         &~?paul
         &~?allen
         &~?sam
         &~catcher
         &~second-base
         &~shortstop
         &~third-base))

   (team-member
      (name Jerry)
      (position
         ?jerry
         &~?andy
         &~?ed
         &~?harry
         &~?paul
         &~?allen
         &~?sam
         &~?bill
         &~right-field
         &~center-field
         &~catcher
         &~third-base
         &~pitcher))

   (team-member
      (name Mike)
      (position
         ?mike
         &~?andy
         &~?ed
         &~?harry
         &~?paul
         &~?allen
         &~?sam
         &~?bill
         &~?jerry
         &~third-base))

   (test
      (or
         (eq ?mike right-field)
         (eq ?mike left-field)
         (eq ?mike center-field)

         (eq ?andy right-field)
         (eq ?andy left-field)
         (eq ?andy center-field)))

   (test
      (not
         (or
            (and
               (eq ?mike center-field)
               (or
                  (eq ?jerry right-field)
                  (eq ?bill right-field)))

            (and
               (eq ?bill center-field)
               (eq ?jerry right-field)))))

   =>

   (printout t crlf "Solution" crlf)
   (printout t "-----------------" crlf)
   (printout t "Andy:  " ?andy crlf)
   (printout t "Ed:    " ?ed crlf)
   (printout t "Harry: " ?harry crlf)
   (printout t "Paul:  " ?paul crlf)
   (printout t "Allen: " ?allen crlf)
   (printout t "Sam:   " ?sam crlf)
   (printout t "Bill:  " ?bill crlf)
   (printout t "Jerry: " ?jerry crlf)
   (printout t "Mike:  " ?mike crlf)
)
