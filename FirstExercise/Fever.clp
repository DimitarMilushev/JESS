(deftemplate Ferver
    (slot level))

(defrule GetTemperature
    =>
    (printout t "Enter patients temperature." crlf)
    (bind ?input (read))
    (assert (temperature ?input)))

(defrule GetSpots
    =>
    (printout t "Does the patient have spots (yes / no)?" crlf)
    (bind ?input (read))
    (assert (spots ?input)))

(defrule GetRash
    =>
    (printout t "Does the patient have rash (yes / no)?" crlf)
    (bind ?input (read))
    (assert (rash ?input)))

(defrule GetThroat
    =>
    (printout t "Does the patient have a sore throat (yes / no)?" crlf)
    (bind ?input (read))
    (assert (sore-throat ?input)))

(defrule GetInnoculated
    (fever high)
    (spots yes)
    =>
    (printout t "Has the patient been innoculated for measles (yes / no)?" crlf)
    (bind ?input (read))
    (assert (isInnoculated ?input)))

(defrule Fever1
    (temperature ?t)
    (test (>= ?t 101))
    =>
    (assert (fever high))
    (printout t "High fever diagnosed" crlf))

(defrule Fever2
    (temperature ?t)
    (test (and (< ?t 101) (> ?t 98.6)))
    =>
    (assert (fever mild))
    (printout t "Mild fever diagnosed" crlf))


(defrule Measles
   (declare (salience 100))
   (spots yes)
   (innoculated no)
   (fever high)
   =>
   (assert (diagnosis measles))
   (printout t "Measles diagnosed" crlf))

(defrule Allergy1
   (declare (salience 200))
   (spots yes) 
   =>
   (assert (diagnosis allergy))
   (printout t "Allergy diagnosed from 
       spots and lack of measles" crlf)) 

(defrule CheckAllergy
    (declare (salience 100))
    (diagnosis measles)
    ?allergyFact <- (diagnosis allergy)
    =>
    (retract ?allergyfact)
    (printout t "Allergy diagnosis being retracted due to measles" crlf))

(defrule Allergy2
   (rash yes)
   =>
   (assert (diagnosis allergy))
   (printout t "Allergy diagnosed from rash" 
        crlf))

(defrule Flu
   (sore_throat yes)
   (fever mild|high)
   =>
   (assert (diagnosis flu))
   (printout t "Flu diagnosed" crlf))

(defrule Penicillin
   (diagnosis measles)
   =>
   (assert (treatment penicillin))
   (printout t "Penicillin prescribed" crlf))

(defrule Allergy_pills
   (diagnosis allergy)
   =>
   (assert (treatment allergy_shot))
   (printout t "Allergy shot prescribed" crlf))

(defrule Bed_rest
   (diagnosis flu)
   =>
   (assert (treatment bed_rest))
   (printout t "Bed rest prescribed" crlf))

(defrule None
   (declare (salience -100))
   (not (diagnosis ?))
   =>
   (printout t "No diagnosis possible – consult
        human expert" crlf))

(reset)
(run)