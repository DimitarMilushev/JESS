(deftemplate blood-donor (slot name) (slot type) (slot enum))

(deffacts blood-bank ; put names & their types ;into [[working memory]]
   (blood-donor (name "Alice")(type "A")(enum 1))
   (blood-donor (name "Agatha")(type "A") (enum 1))
   (blood-donor (name "Bob")(type "B") (enum 2))
   (blood-donor (name "Barbara")(type "B") (enum 2)) 
   (blood-donor (name "Jess")(type "AB")(enum 3))
   (blood-donor (name "Karen")(type "AB") (enum 3))
   (blood-donor (name "Onan")(type "O") (enum 0))
   (blood-donor (name "Osbert")(type "O") (enum 0))
   (blood-donor (name "gosho") (type "N1") (enum -1)))

(defrule can-give-to-same-type-but-not-self 
; handles A > A, B > B, O > O, AB > AB, but not ;N1 > N1
  (blood-donor (name ?name)(type ?type&: (neq ?type "N1"))(enum ?enum))
  (blood-donor (name ?name2)(type ?type2&: (neq ?type2 "N1"))(enum ?enum2&:(< ?enum ?enum2)))
  =>
  (printout t ?name ?type" can give blood to " ?name2 ?type2
      crlf))
(reset)
(run)

