% База данных настольных игр
%game('Название', МинимумИгроков, МасимумИгроков, 'Жанр', 'Сложность', Длительность(мин)).
game('Monopoly', 2, 8, 'family', 'easy', 120).
game('Chess', 2, 2, 'abstract', 'hard', 60).
game('Exploding Kittens', 2, 5, 'party', 'easy', 15).
game('Catan', 3, 4, 'strategy', 'medium', 60).
game('Ticket to Ride', 2, 5, 'family', 'easy', 45).
game('Pandemic', 2, 4, 'cooperative', 'medium', 45).
game('Gloomhaven', 1, 4, 'strategy', 'hard', 120).
game('Carcassonne', 2, 5, 'family', 'easy', 35).
game('Twilight Struggle', 2, 2, 'strategy', 'hard', 180).
game('Azul', 2, 4, 'abstract', 'easy', 30).
game('Codenames', 2, 8, 'party', 'easy', 15).
game('7 Wonders', 2, 7, 'strategy', 'medium', 30).
game('Terraforming Mars', 1, 5, 'strategy', 'hard', 120).
game('Dominion', 2, 4, 'strategy', 'medium', 30).
game('Scythe', 1, 7, 'strategy', 'hard', 115).
game('Wingspan', 1, 5, 'family', 'medium', 40).
game('The Resistance', 5, 10, 'party', 'medium', 30).

% Правило для подбора игры по количеству игрков
suitable_players(Game, Players) :-
    game(Game, MinPlayers, MaxPlayers, _, _, _),
    Players >= MinPlayers,
    Players =< MaxPlayers.

% Правило для подбора игры по жанру
suitable_genre(Game, Genre) :-
    game(Game, _, _, Genre, _, _).

% Правило для подбора игры по уровню сложности
suitable_difficulty(Game, Difficulty) :-
    game(Game, _, _, _, Difficulty, _).

% Правило для подбора игры по длительности
suitable_duration(Game, Duration) :-
    game(Game, _, _, _, _, GameDuration),
    Duration >= GameDuration.

% Правило для поиска подходящих игр по всем критериям
find_suitable_game(Game, Players, Genre, Difficulty, Duration) :-
    suitable_players(Game, Players),
    suitable_genre(Game, Genre),
    suitable_difficulty(Game, Difficulty),
    suitable_duration(Game, Duration).

% Запуск опроса (start.)
start :-
    write('Сколько игроков будет участвовать?'),
    read(Players),
    write('Какой жанр игры предпочитаете? (strategy, family, cooperative, abstract, party)'),
    read(Genre),
    write('Какую сложность игры предпочитаете? (easy, medium, hard)'),
    read(Difficulty),
    write('Сколько времени готовы потратить на игру (в минутах)?'),
    read(Duration),
    findall(Game, find_suitable_game(Game, Players, Genre, Difficulty, Duration), Games),
    (	Games = []
    ->	write('Не удалось найти подходящую игру.')
    ;	write('Рекомендуемые игры: '), write(Games)
    ).
