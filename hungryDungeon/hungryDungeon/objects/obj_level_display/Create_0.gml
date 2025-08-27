/// @description Insert description here
// You can write your code in this editor

worldWidth = global.world_width;
worldHeight = global.world_height;
world1D = global.world_data;
	
for(var height = 0; height < worldHeight; height++)
{
	for(var width = 0; width < worldWidth; width++)
	{
		world[height,width] = world1D[height*worldHeight + width];
	}
}

floorTextureType = 1;
ceilingTextureType = 1;
	
enum GRID_SIDES {
	NORTH_SOUTH,
	EAST_WEST
}

texture = global.textures[global.texures_index] //textureSheet;
textureWidth = sprite_get_width(texture);
textureHeight = sprite_get_height(texture);
textureWidthScale = 1;
textureHeightScale = 1;