#macro caWidth 960
#macro caHeight 540

var ix = -caWidth
var iy = caHeight/2

var drawTo = [0,0]
for(var i = -2; i<3; i++)
{
	drawTo = cast_ray(x,y,facing+i*5)
}


draw_self()