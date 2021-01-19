; comments

(deffunction maxOfTwo (?a ?b)
    (if (> ?a ?b) then
        (return ?a)
        else
        (return ?b)))

(printout t "Answer to life " (maxOfTwo 5 10) " ooga!" crlf)

;template declaration
(deftemplate prospect
    (slot name(default ''))
    (slot salary(default 1000))
    (slot age(default 50)))

;rule declaration


(run)

;j4


; declare a variable and assign its' value
(bind ?x "godsho")

(bind ?sound quack)
quack

(defrule make-quack
    (duck-sound ?sound)
    =>
    ;(assert (sound-is ?sound)))
    (printout t "The duck said " ?sound ?sound crlf))
 (bind ?sound quack) 
;(assert (duck-sound quack))
(run)

(assert (light yellow))
(defrule cautions
    (light ?color&blinking-yellow|yellow)
    =>
    (printout t "Be cautious - " ?color crlf))
(run)

(assert (light green))
(defrule cautions
    (light ?color &~red&~yellow)
    =>
    (printout t "Go on since the light is - " ?color crlf))
(run)

; console input
(assert (color-is pink))
(defrule read-input (color-is pink)
    =>
    (printout t "Name a primary color" crlf)
    (bind ?color-is (readline t))
    (printout t "color is " ?color-is crlf))
(run)

; iterator
(assert (start))
(defrule test-while
  (start)
  =>
  (bind ?num 1)
  (while (<= ?num 3) do (printout t ?num crlf)
      (bind ?num (+ ?num 1))))
(run)

(assert (number 1))
(defrule selection1
  (number ?num)
  => (if (< ?num 10) then
     (printout t "Less than ten" crlf)))
(run)

(assert (numbers 4 5))
(defrule addition 
  (numbers ?x ?y)
  =>
  (assert (answer-plus (+ ?x ?y)))
    (facts))
(run)

(defrule addition
  (numbers ?x ?y)
  =>
  (bind ?answer (+ ?x ?y))
  (printout t "answer is " ?answer crlf))
  (assert (numbers 2 2))
(run)


