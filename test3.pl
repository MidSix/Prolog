%trace/0
/*
    Prolog depuration:
    Call: (6) max(2, 4, _M) ? example.
    Estás en un punto interactivo, podés elegir qué hacer escribiendo un comando:

    Comando	Qué hace
    Enter	Ejecuta una vez más el predicado actual (como "step in")
    s	Skip: salta el cuerpo del predicado (no entra a verlo)
    n	Next: como s, pero te muestra la llamada siguiente
    r	Redo: forza que Prolog vuelva a intentar (backtracking)
    f	Fail: forza que este predicado falle
    a	Abort: aborta la ejecución del trace
    c	Creep sin pausa: sigue ejecutando hasta el final, sin detenerse

    Qué significan las etiquetas
    Cada línea del trace tiene una palabra clave al inicio:

    Etiqueta	Significado
    Call	Prolog intenta llamar al predicado
    Exit	El predicado se resolvió con éxito
    Fail	El predicado falló
    Redo	Prolog vuelve atrás para reintentar
    Y entre paréntesis aparece el nivel de profundidad de la llamada.

    Salir:
    notrace.
    nodebug.

    La primera cosa que prolog evalua antes de entrar al body de la rule es ver si puede unificar la head de la rule, esto es, si no hay conflictos como que
    una variable tenga un valor y luego tenga otro valor completamente distinto
    por ejemplo:
    max(3,1,1). no va a unificar la primera rule, esto es porque le esta diciendo que el primer argumento X = 3 y luego el tercero que tambien es X =  1, y X
    no puede ser 3 y 1 al mismo tiempo. Por lo tanto, siquiera ejecuta el body de la rule porque aunque sea verdadero la rule sera falsa. Entonces se va directamente a la segunda
*/

max(X,Y,M) :-
    X>=Y,!,M=X
    ; M=Y.

p(1).
p(2) :- !.
p(3).