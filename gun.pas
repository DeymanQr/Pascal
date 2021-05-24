uses crt, graph;
const cell_size = 10; cell_count = 100; life_cell_color = 2; dead_cell_color = 8; x0 = 450; y0 = 10;
var g, h, i, j, r: integer; p: boolean; a, b: array[1..cell_count, 1..cell_count] of byte;

procedure paint_cell(x, y: integer; c: byte);
var i: integer;
begin
setcolor(c);
for i := 1 to cell_size-1 do line((x-1)*cell_size+1 + x0, (y-1)*cell_size + i + y0 - 1, x*cell_size + x0 - 1, (y-1)*cell_size + i + y0 - 1);
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
{for i := 1 to cell_count do for j := 1 to cell_count do begin
r := random(20);
if r = 0 then paint_cell(j, i, life_cell_color) else paint_cell(j, i, dead_cell_color);
a[j, i] := ord(r = 0); b[j, i] := ord(r = 0);
end;}
a[2, 6] := 1; a[2, 7] := 1; a[3, 6] := 1; a[3, 7] := 1; a[12, 6] := 1; a[12, 7] := 1; a[12, 8] := 1; a[13, 5] := 1;
a[13, 9] := 1; a[14, 4] := 1; a[15, 4] := 1; a[14, 10] := 1; a[15, 10] := 1; a[16, 7] := 1; a[17, 5] := 1; a[17, 9] := 1;
a[18, 6] := 1; a[18, 7] := 1; a[18, 8] := 1; a[19, 7] := 1; a[22, 4] := 1; a[22, 5] := 1; a[22, 6] := 1; a[23, 4] := 1;
a[23, 5] := 2; a[23, 6] := 1; a[24, 3] := 1; a[24, 7] := 1; a[26, 2] := 1; a[26, 3] := 1; a[26, 7] := 1; a[26, 8] := 1;
a[36, 4] := 1; a[36, 5] := 1; a[37, 4] := 1; a[37, 5] := 1;
for i := 1 to cell_count do for j := 1 to cell_count do begin
if a[j, i] = 0 then paint_cell(j, i, dead_cell_color) else paint_cell(j, i, life_cell_color);
b[j, i] := a[j, i];
end;
while p do begin
readkey;
//delay(20);
p := false;
for i := 1 to cell_count do for j := 1 to cell_count do begin
r := neighbors_sum(j, i);
if (r = 3) and (a[j, i] = 0) then begin b[j, i] := 1; paint_cell(j, i, life_cell_color); p := true; end
else if ((r < 2) or (r > 3)) and (a[j, i] = 1) then begin b[j, i] := 0; paint_cell(j, i, dead_cell_color); p := true; end;
end;
for i := 1 to cell_count do for j := 1 to cell_count do a[j, i] := b[j, i];
end;
end.
