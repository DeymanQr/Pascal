uses crt, graph;
const cell_size = 10; cell_count = 50; life_cell_color = 2; dead_cell_color = 8; x0 = 100; y0 = 10;
var g, h, i, j, r: integer; p: boolean; a, b, c: array[1..cell_count, 1..cell_count] of byte;

procedure paint_cell(x, y, c: integer);
var i: integer;
begin
setcolor(c);
for i := 1 to cell_size-1 do line((x-1)*cell_size+2 + x0, (y-1)*cell_size + 1 + i + y0, x*cell_size + x0, (y-1)*cell_size + 1 + i + y0);
end;

function neighbors_sum(x, y: integer): byte;
var s: byte;
begin
s := 0;
if y > 1 then s := s + a[x, y-1];
if x > 1 then s := s + a[x-1, y];
if y < cell_count then s := s + a[x, y+1];
if x < cell_count then s := s + a[x+1, y];
if (x > 1) and (y > 1) then s := s + a[x-1, y-1];
if (x < cell_count) and (y < cell_count) then s := s + a[x+1, y+1];
if (x < cell_count) and (y > 1) then s := s + a[x+1, y-1];
if (x > 1) and (y < cell_count) then s := s + a[x-1, y+1];
neighbors_sum := s;
end;

begin
g := detect; initgraph(g, h, '');
p := true;
randomize;
for i := 1 to cell_count do for j := 1 to cell_count do begin
r := random(8);
if r = 0 then paint_cell(j, i, life_cell_color) else paint_cell(j, i, dead_cell_color);
a[j, i] := ord(r = 0); b[j, i] := ord(r = 0);
end;
while p do begin
p := false;
for i := 1 to cell_count do for j := 1 to cell_count do begin
r := neighbors_sum(j, i);
if (r = 3) and (a[j, i] = 0) then begin b[j, i] := 1; paint_cell(j, i, life_cell_color); p := true; end
else if ((r < 2) or (r > 4)) and (a[j, i] = 1) then begin b[j, i] := 0; paint_cell(j, i, dead_cell_color); p := true; end;
end;
for i := 1 to cell_count do for j := 1 to cell_count do a[j, i] := b[j, i];
delay(50);
end;
end.
