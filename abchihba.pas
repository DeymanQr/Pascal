uses crt, graph;

const x0 = 100; y0 = 100; size = 100;
var g, h, x, y: integer; a: array[1..3, 1..3] of integer; c: char; p: boolean;

procedure curs(i, j, col: integer);
begin
setcolor(col);
rectangle((i-1)*size + size div 4 + x0, (j-1)*size + size div 4 + y0, i*size - size div 4 + x0, j*size - size div 4 + y0);
end;

procedure paint(i, j, col: integer; p: boolean);
begin
setcolor(col);
if p then begin
line((i-1)*size + 1 + x0, (j-1)*size + 1 + y0, i*size - 1 + x0, j*size - 1 + y0);
line((i-1)*size + 1 + x0, j*size - 1 + y0, i*size - 1 + x0, (j-1)*size + 1 + y0);
end else circle(size div 2 + x0, size div 2 + y0, size div 2 - 1);
end;

begin
g := detect; initgraph(g, h, '');
line(size+x0, y0, size+x0, size*3+y0); line(size*2+x0, y0, size*2+x0, size*3+y0);
line(x0, size+y0, size*3+x0, size+y0); line(x0, size*2+y0, size*3+x0, size*2+y0);
x := 1; y := 1;
p := true;
curs(1, 1, 15);
repeat
c := readkey;
case c of
 #77: begin curs(x, y, 0); x := x+1; if x > 3 then x := 3; curs(x, y, 15); end;
 #75: begin curs(x, y, 0); x := x-1; if x < 1 then x := 1; curs(x, y, 15); end;
 #72: begin curs(x, y, 0); y := y-1; if y < 1 then y := 1; curs(x, y, 15); end;
 #80: begin curs(x, y, 0); y := y+1; if y > 3 then y := 3; curs(x, y, 15); end;
 #13: if a[x, y] = 0 then begin curs(x, y, 0); paint(x, y, 15, p); p := not(p); end;
until c = #27;
end.