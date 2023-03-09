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
    (switch (check_input "Транспортное средство колесное (1) или гусеничное (2)? " 1 2)
        (case 1 then (assert (car_wheeled)))
        (case 2 then (assert (car_crawler)))
    )
)

(defrule question-2
    (declare (salience 30))
    (car_wheeled)
    =>
    (switch (check_input "Имеет два колеса (3) или четыре колеса и больше (4)? " 3 4)
        (case 3 then (assert (wheels_two)))
        (case 4 then (assert (wheels_four_and_more)))
    )
)

(defrule question-3
    (declare (salience 30))
    (car_crawler)
    =>
    (switch (check_input "Основная функция пахать (5), стрелять (6) или копать (7)? " 5 6 7)
        (case 5 then (bind ?*answer* трактор))
        (case 6 then (bind ?*answer* танк))
        (case 7 then (bind ?*answer* экскаватор))
    )
)

(defrule question-4
    (declare (salience 20))
    (car_wheeled)
	(wheels_two)
    =>
    (switch (check_input "Для движения используется двигатель (8) или мускульная сила (9)? " 8 9)
        (case 8 then (bind ?*answer* мотоцикл))
        (case 9 then (bind ?*answer* велосипед))
    )
)

(defrule question-5
    (declare (salience 20))
    (car_wheeled)
	(wheels_four_and_more)
    =>
    (switch (check_input "Предназначен для перевозки пассажиров (10) или грузов (11)? " 10 11)
        (case 10 then (bind ?*answer* легковушка))
        (case 11 then (bind ?*answer* грузовичок))
    )
)