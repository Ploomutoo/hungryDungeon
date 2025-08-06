var desired_x = x
var desired_y = y

if(keyboard_check_pressed(ord("W")))
{
	desired_x+=lengthdir_x(64,facing)
	desired_y+=lengthdir_y(64,facing)
}
else if(keyboard_check_pressed(ord("S")))
{
	desired_x-=lengthdir_x(64,facing)
	desired_y-=lengthdir_y(64,facing)
}
else if(keyboard_check_pressed(ord("A")))
{
	facing+=90
}
else if(keyboard_check_pressed(ord("D")))
{
	facing-=90
}
else if(keyboard_check_pressed(ord("Q")))
{
	desired_x-=lengthdir_x(64,facing-90)
	desired_y-=lengthdir_y(64,facing-90)
}
else if(keyboard_check_pressed(ord("E")))
{
	desired_x-=lengthdir_x(64,facing+90)
	desired_y-=lengthdir_y(64,facing+90)
}

var desired_tile = tilemap_get_at_pixel(global.tile_world,desired_x,desired_y)

if (desired_tile<2)
{
	x = desired_x
y = desired_y
}

image_angle = facing
scanFacing()