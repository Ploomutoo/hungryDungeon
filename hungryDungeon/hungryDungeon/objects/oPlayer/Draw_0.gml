#macro caWidth 960
#macro caHeight 540

var ix = -caWidth/10
var iy = 250

for(var i = 4; i>=0; i--)
{
	draw_sprite_ext(sWall,gonna_draw[i,gdraw.tile_index],ix,iy,
	1,1,
	0,c_white,0.5+0.25/gonna_draw[i,gdraw.distance])
	ix-= caWidth/5	
}


draw_sprite_pos(sWall,gonna_draw[5,gdraw.tile_index],
-caWidth,0,
-caWidth*(4/5),0,
-caWidth*(4/5),250,
-caWidth,375,1)
draw_self()