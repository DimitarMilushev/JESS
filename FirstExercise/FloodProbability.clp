;N as records of annual peak discharge
;M as discharges with highest given rank	
;p avg probablity of occureance
;k times exceeds

(deftemplate Info
    (slot timespan)
    (slot prob)
    (slot chance)
    (slot facTimespan)
    (slot facChance)
    (slot facBoth))

(assert (Info(timespan (bind ?t(read))) (prob (bind ?p(read))) (chance (bind ?c (read)))))


(bind ?r1 1)
(bind ?n1 ?t)
    (while (> ?n1 1)
        (bind ?r1 (* ?r1 ?t))
        (bind ?n1 (- ?n1 1)))
    (assert (Info(facTimespan (bind ?ft ?r1))))

(bind ?r2 1)
(bind ?n2 ?c)
    (while (> ?n2 1)
        (bind ?r2 (* ?r2 ?c))
        (bind ?n2 (- ?n2 1)))
    (assert (Info(facChance (bind ?fc ?r2))))

(bind ?both (- ?t ?c))
(bind ?r3 1)
(bind ?n3 ?both)
    (while (> ?n3 1)
        (bind ?r3 (* ?r3 ?both))
        (bind ?n3 (- ?n3 1)))
    (assert (Info(facBoth (bind ?fb ?r3))))



(printout t (+ ?t ?c) crlf)
(printout t ?ft crlf)
(printout t ?fc crlf)
(printout t (/ ?t (* ?c ?fb)) crlf)
(printout t (*(*(/ ?t (* ?c ?fb))(** (- 1 ?p) (- ?t ?c)))) (** ?p ?c))
(reset)
(run)