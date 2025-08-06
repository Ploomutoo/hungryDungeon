global.tile_world = layer_tilemap_get_id("world")

facing = 0
image_angle = facing;

enum gdraw 
{
	tile_index = 0,
	distance
}

gonna_draw[0,0] = 0

function scanFacing()
{
	var cast_dir_x = lengthdir_x(64,facing)
	var cast_dir_y = lengthdir_y(64,facing)
	
	var cast_perpendicular_x = lengthdir_x(64,facing+90)
	var cast_perpendicular_y = lengthdir_y(64,facing+90)
	
	var ix = x - cast_perpendicular_x*2
	var iy = y - cast_perpendicular_y*2
	var ix2= ix
	var iy2= iy
	
	for(var i = 4; i>=0; i--) //iterate perpendicularly
	{
		for(var i2 = 0; i2<5; i2++) //iterate directly
		{
			var tgap = tilemap_get_at_pixel(global.tile_world,ix2,iy2)
			if(tgap>1)
			{
				gonna_draw[i,gdraw.tile_index] = tgap;
				gonna_draw[i,gdraw.distance]   = i2;
				break;
			}
			else
			{
				gonna_draw[i,gdraw.tile_index] = 0;
				gonna_draw[i,gdraw.distance]   = i2;
			}
			ix2 += cast_dir_x
			iy2 += cast_dir_y
		}
		
		ix += cast_perpendicular_x
		iy += cast_perpendicular_y
		
		ix2 = ix
		iy2 = iy
	}	
	//hardcoding the 2 tiles on either side coz i cant figure out something smarter
	ix = x + cast_perpendicular_x
	iy = y + cast_perpendicular_y
	tgap = tilemap_get_at_pixel(global.tile_world,ix,iy)
	gonna_draw[5,gdraw.tile_index] = tgap;
	gonna_draw[5,gdraw.distance]   = 0;
	
	ix = x - cast_perpendicular_x
	iy = y - cast_perpendicular_y
	tgap = tilemap_get_at_pixel(global.tile_world,ix,iy)
	gonna_draw[5,gdraw.tile_index] = tgap;
	gonna_draw[5,gdraw.distance]   = 0;
}
scanFacing()