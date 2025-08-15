global.map = layer_tilemap_get_id("world")
global.mapY= tilemap_get_width(global.map)
global.mapX=tilemap_get_height(global.map)

facing = 0
image_angle = facing;

enum gdraw 
{
	tile_index = 0,
	distance
}