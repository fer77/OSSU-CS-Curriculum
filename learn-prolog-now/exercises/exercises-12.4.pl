% 12.1
main :-
    open('hogwarts.houses', write, S),
    tab(S, 7),
    write(S, 'gryffindor'),
    nl(S),
    write(S, 'hufflepuff'),
    tab(S, 4),
    write(S, 'ravenclaw'),
    nl(S),
    tab(S, 7),
    write(S, 'slytherin'),
    close(S).

% 12.2
main:-
    open('hogwarts_houses.txt',read,Str),
    read(Str,House1),
    read(Str,House2),
    read(Str,House3),
    read(Str,House4),
    close(Str),
    write([House1,House2,House3,House4]), nl.