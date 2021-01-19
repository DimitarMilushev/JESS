
(bind ?firstArray (create$ 1 2 3 4 5))
(bind ?secondArray (create$ milk 2.40 eggs 1.50 bread 1 specialK 4 sugar 2.30 tea 2 coffe 3))

(deffunction avg (?firstArray)
    (bind ?length (length$ ?firstArray))
    (bind ?i 0)
    (bind ?result 0)
     (while (< ?i ?length) do 
        	(bind ?i (+ ?i 1))
            (bind ?result (+ ?result (nth$ ?i ?firstArray))))
        (return (/ ?result ?length)))

(printout t "Average is: "(avg ?firstArray) crlf)

(deffunction maxElement (?firstArray)
    (bind ?length (length$ ?firstArray))
    (bind ?i 0)
    (bind ?max (nth$ 1 ?firstArray))
    (while (< ?i ?length) do
        (bind ?i (+ ?i 1))
        (if (< ?max (nth$ ?i ?firstArray)) then
            (bind ?max (nth$ ?i ?firstArray))))
    (return ?max))

(printout t "Largest number is: "(maxElement ?firstArray) crlf)

(deffunction total (?secondArray)
    (bind ?length (length$ ?secondArray))
    (bind ?total 0)
    (bind ?i 0)
    (while (< ?i ?length) do
        (bind ?i (+ ?i 2))
        (bind ?total (+ ?total (nth$ ?i ?secondArray))))
    (return ?total))

(printout t "Total sum: " (total ?secondArray) crlf)