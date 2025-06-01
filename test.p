VAR
    x, y: INTEGER;
BEGIN
    x := 2;
    CASE x OF
        1: y := 10;
        2, 3: y := 20;
        4: y := 30;
    END;
    DISPLAY y;
END.