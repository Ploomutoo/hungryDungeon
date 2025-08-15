#macro caWidth 960
#macro caHeight 540

var ix = -caWidth
var iy = caHeight/2

var _ray;

_ray = tileRaycast(x,y,mouse_x,mouse_y,global.map)
if (_ray[0]) draw_line(x,y,_ray[1],_ray[2])
/*for(var i = -45; i<45; i++)
{
	_ray = tileRaycast(x,y,mouse_x,mouse_y,global.map)
	draw_line(x,y,_ray[0],_ray[1])
}*/


draw_self()