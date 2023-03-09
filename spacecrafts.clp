(deffunction check_input (?question $?allowed_values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member$ ?answer ?allowed_values)) do
      (printout t crlf "Некорректный ввод данных, повторите попытку" crlf)
      (printout t crlf ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
    ?answer
)

(defglobal ?*answer* = nil)

(defrule output_answer
    (declare (salience -10))
	=>
    (printout t crlf "Это " ?*answer* "!" crlf)
)

(defrule question-1
    (declare (salience 40))
    =>
    (switch (check_input "Используется для пассажироперевозок (1) или в индустрии (2)? " 1 2)
        (case 1 then (assert (ship_passenger)))
        (case 2 then (assert (ship_industry)))
    )
)

(defrule question-2
    (declare (salience 30))
	(ship_passenger)
    =>
    (switch (check_input "Красный (3) или синий (4)? " 3 4)
        (case 3 then (bind ?*answer* Red_Ship))
        (case 4 then (bind ?*answer* Blue_Ship))
    )
)

(defrule question-3
    (declare (salience 30))
	(ship_industry)
    =>
    (switch (check_input "Используется в строительстве (5), добыче полезных ископаемых (6) или оборонке (7)? " 5 6 7)
        (case 5 then (assert (ship_building)))
        (case 6 then (bind ?*answer* Miner))
		(case 7 then (assert (ship_military)))
    )
)

(defrule question-4
    (declare (salience 20))
	(ship_industry)
	(ship_building)
    =>
    (switch (check_input "Используется для сборки аппаратов (8) или грузоперевозок (9)? " 8 9)
        (case 8 then (bind ?*answer* Constructor))
        (case 9 then (bind ?*answer* Cargo_Ship))
    )
)

(defrule question-5
    (declare (salience 20))
	(ship_industry)
	(ship_military)
    =>
    (switch (check_input "Основная боевая сила (10) или машина боевой поддержки (11)? " 10 11)
        (case 10 then (bind ?*answer* Cruiser))
        (case 11 then (bind ?*answer* Fighter))
    )
)