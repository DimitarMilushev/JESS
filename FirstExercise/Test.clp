(defglobal ?*timespan* = 0)
(defglobal ?*probability* = 0)
(defglobal ?*chance* = 0)
(defglobal ?*timespanFactorial* = 0)


(defrule getTimeSpan
    =>
    (printout t "Enter timespan: ")
    (bind ?*timespan (read)))

(defrule getProbability
    =>
    (printout t "Enter annual flood probability: ")
    (bind ?*probability (read)))

(defrule getChance
    =>
    (printout t "Enter chance of exceeding probability rate: ")
    (bind ?*chance* (read)))


(defrule getFactorial
    =>
    (bind ?num ?*timespan*)
    (bind ?r 1)
    (while (> ?num 1)
    	(bind ?r (* ?r ?num))
    	(bind ?n (- ?n 1)))
    (bind ?*timespanFactorial* ?r)
    (printout t ?*timespanFactorial*))



(reset)
(run)
