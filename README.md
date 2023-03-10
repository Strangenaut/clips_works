# Представление знаний в ИС - Дерновой Денис И507Б
Практические работы

## Практическая работа 1

### Основное задание *(car_type.clp)*
![image](https://user-images.githubusercontent.com/98609700/224122057-fb3611a4-a9de-4f63-89c5-018656812274.png)

Вопросы: 
1.	Транспортное средство колесное (1)/ гусеничное (2)?
2.	Имеет два колеса (3) / четыре колеса и больше (4)?
3.	Основная функция пахать (5) / стрелять (6) / копать (7)?
4.	Для движения используется двигатель (8) / мускульная сила (9)?
5.	Предназначен для перевозки пассажиров (10) / грузов (11)?

Факты:
1.	Колесо
2.	Гусеницы
3.	Два
4.	Четыре

Ответы:
1.	Мотоцикл
2.	Велосипед
3.	Легковой автомобиль
4.	Грузовик
5.	Трактор
6.	Танк
7.	Экскаватор

### Дополнительное задание *(spacecrafts.clp)*
```mermaid
graph
PassengersOrFactoryAndMilitary[Вопрос 1] -- Факт 2 --> ConstructOrMineOrFight[Вопрос 3]
PassengersOrFactoryAndMilitary -- Факт 1 --> RedOrBlue[Вопрос 2]
RedOrBlue --> RedShip[Ответ 1]
RedOrBlue --> BlueShip[Ответ 2]
ConstructOrMineOrFight -- Факт 3 --> ConstructorOrCargo[Вопрос 4]
ConstructorOrCargo --> Constructor[Ответ 3]
ConstructorOrCargo --> CargoShip[Ответ 4]
ConstructOrMineOrFight --> Miner[Ответ 5]
ConstructOrMineOrFight -- Факт 4 --> CruiserOrFighter[Вопрос 5]
CruiserOrFighter --> Cruiser[Ответ 6]
CruiserOrFighter --> Fighter[Ответ 7]
```

Вопросы:
1.	Используется для пассажироперевозок (1) или в индустрии (2)?
2.	Красный (3) или синий (4)?
3.	Используется в строительстве (5), добыче полезных ископаемых (6) или оборонке (7)?
4.	Используется для сборки аппаратов (8) или грузоперевозок (9)?
5.	Основная боевая сила (10) или машина боевой поддержки (11)?

Факты:
1.	Пассажирный
2.	Индустриальный
3.	Строительный
4.	Военный

Ответы:
1.	Red Ship
2.	Blue Ship
3.	Constructor
4.	Cargo Ship
5.	Miner
6.	Cruiser
7.	Fighter
