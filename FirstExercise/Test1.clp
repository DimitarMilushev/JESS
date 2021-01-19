(deftemplate Info
    (slot timespan)
    (slot prob))

(printout t "Enter timespan: ")
(assert (Info (timespan (bind ?t (read)))))

(printout t "Enter annual probability: ")
(assert (Info (prob (bind ?p (read)))))

(bind ?result (- 1 (**(- 1 ?p) ?t)))
(printout t ?result " (That is, "(* ?result 100) "% probability of flood in the next " ?t " years.)")
(reset)
(run)