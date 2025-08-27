/// @description Insert description here
// You can write your code in this editor

//here is the raycaster code
for(var i = 0; i < room_width; i++)
{
	//draw the wall slice in the respective column
	
	//calculate ray position and direction
	var cameraX = 2 * i / room_width - 1;
	var rayDirectionX = obj_player.directionX + obj_player.planeX * cameraX;
	var rayDirectionY = obj_player.directionY + obj_player.planeY * cameraX;
	
	var textureSlice = 0;
	var blockType = 0;
	var shaded = 0;
	var floorXWall = 0;
	var floorYWall = 0;
	
	//the box of the map
	var mapX = floor(obj_player.posX);
	var mapY = floor(obj_player.posY);
	
	//length of the ray from current to the next grid line
	var sideDistX;
	var sideDistY;
	
	//length of the ray from one grid to the next
	var deltaDistX = abs(1 / rayDirectionX);
	var deltaDistY = abs(1 / rayDirectionY);
	var perpendicularWallDistance = 0;
	
	//step directions
	var stepX;
	var stepY;
	
	//was a wall hit?
	var hit = false;
	//was it the North/South or East/West side
	var side;
	
	//calculate step and sideDist
	if(rayDirectionX < 0)
    {
        stepX = -1;
        sideDistX = (obj_player.posX - mapX) * deltaDistX;
    }
    else
    {
        stepX = 1;
        sideDistX = (mapX + 1 - obj_player.posX) * deltaDistX;
    }

    if(rayDirectionY < 0)
    {
        stepY = -1;
        sideDistY = (obj_player.posY - mapY) * deltaDistY;
    }
    else
    {
        stepY = 1;
        sideDistY = (mapY + 1 - obj_player.posY) * deltaDistY;
    }
	
	//DDA algorithm
	
	while(!hit)
	{
		
		//jump to next map square in x or y direction
        if(sideDistX < sideDistY)
        {
            sideDistX += deltaDistX;
            mapX += stepX;
            side = GRID_SIDES.EAST_WEST;
        }
        else
        {
            sideDistY += deltaDistY;
            mapY += stepY;
            side = GRID_SIDES.NORTH_SOUTH;
        }
		
		//check if ray hit the wall
        //but first check that the coordinate is not out of bound
		if(mapX < 0 || mapY < 0 || mapX >= worldWidth || mapY >= worldHeight)
        {
            //error - nothing is hit
            break;
        }
		
		if(world[mapY, mapX] > 0)
		{
			hit = true;
			blockType = world[mapY, mapX];
		}
		
	}
	
	if(!hit)
		continue;
		
	//Calculate perpendicular distance on the camera plane
    if(side == GRID_SIDES.EAST_WEST)
        perpendicularWallDistance = (mapX - obj_player.posX + (1 - stepX) / 2) / rayDirectionX;
    else
        perpendicularWallDistance = (mapY - obj_player.posY + (1 - stepY) / 2) / rayDirectionY;
	
	if(perpendicularWallDistance < 0)
		continue;
	
	//shaded or not?
    shaded = false;
    //if(side == GRID_SIDES.NORTH_SOUTH)
    //    shaded = true;
	
	//textureSlice
    //Coordinate on the wall
    var wallX;
    if(side == GRID_SIDES.EAST_WEST)
        wallX = obj_player.posY + perpendicularWallDistance * rayDirectionY;
    else
        wallX = obj_player.posX + perpendicularWallDistance * rayDirectionX;
    wallX -= floor(wallX);
	
	//coordinate on the texture
    textureSlice = floor(wallX * textureWidth);
    //"invert" when on the "other" side
    if(side == GRID_SIDES.EAST_WEST && rayDirectionX > 0)
        textureSlice = textureWidth - textureSlice - 1;
    if(side == GRID_SIDES.NORTH_SOUTH && rayDirectionY < 0)
        textureSlice = textureWidth - textureSlice - 1;

    //FLOOR CASTING
    //here we set floorXWall and floorYWall, the x y position of the floor at the bottom of the hit wall

    //4 different wall directions are possible
    if(side == GRID_SIDES.EAST_WEST && rayDirectionX > 0)
    {
        floorXWall = mapX;
        floorYWall = mapY + wallX;
    }
    else if(side == GRID_SIDES.EAST_WEST && rayDirectionX < 0)
    {
        floorXWall = mapX + 1;
        floorYWall = mapY + wallX;
    }
    else if(side == GRID_SIDES.NORTH_SOUTH && rayDirectionY > 0)
    {
        floorXWall = mapX + wallX;
        floorYWall = mapY;
    }
    else
    {
        floorXWall = mapX + wallX;
        floorYWall = mapY + 1;
    }
	
	//there is no fishbowl effect with this method
	var projHeight = round(room_height / perpendicularWallDistance);
	
	//only even numbers for projection height
	projHeight = round(projHeight / 2) * 2;
	
	
	/////////////////////////////////
	//draw the wall slice
	var wallStart = round(room_height / 2 - projHeight / 2);
	var cutoff = 0;
	if(wallStart < 0)
	{
		cutoff = -wallStart;
		wallStart = 0;
	}
	
	var wallEnd = round(room_height / 2 - projHeight / 2) + projHeight;
	if(wallEnd = room_height)
		wallEnd = room_height;
	
	//for faster drawing: copy a strip of the texture and scale it into position
	//var texY = floor((textureHeight * cutoff) / projHeight);
	//var texHeight = floor((textureHeight * (wallEnd - 1 + cutoff - wallStart)) / projHeight) - texY;
	var texY = 0;
	var texHeight = textureHeight;
	var texHeightScale = projHeight / textureHeight;
	
	var textureType = blockType - 1;
	if(shaded)
		textureType ++;
	
	var drawColor = merge_color(c_black,c_white,100/dist)
	draw_sprite_part_ext(texture, textureType, textureSlice, texY, 1, texHeight, i, wallStart-cutoff, textureWidthScale, texHeightScale * textureHeightScale, drawColor, 1);
	
	//draw the floor and ceiling with floor casting
	var floorTexture = floorTextureType - 1;
	var ceilingTexture = ceilingTextureType - 1;
	
	var cameraDistance = 0;
	var currentDistance = 0;
	//not shure how to do this without drawing every pixel at its own
}