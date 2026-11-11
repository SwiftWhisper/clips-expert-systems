(deftemplate route
   (slot from)
   (slot to)
)
(deffacts airline
   (route (from Чикаго) (to Индианаполис))
   (route (from Индианаполис) (to Хьюстон))
   (route (from Хьюстон) (to Нью-Йорк))
   (route (from Хьюстон) (to Сан-Франциско))
   (route (from Нью-Йорк) (to Чикаго))
   (route (from Сан-Франциско) (to Чикаго))
   (route (from Сан-Франциско) (to Лос-Анджелес))
   (route (from Лос-Анджелес) (to Хьюстон))
)
