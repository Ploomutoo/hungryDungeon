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

function cast_ray(posX,posY,angle)
{
	var offsetX = lengthdir_x(32,angle)
	var offsetY = lengthdir_y(32,angle)
	var dof = 8
	
	var positionX1,positionY1
	
	var iterateX,iterateY
	var tempX,tempY
	var out1=-1,out2=-1
	
	if(offsetX!=0) //if not a VERTICAL LINE do HORIZONTAL checks
	{
		positionX1 = posX+offsetX
		positionY1 = (posY+offsetY)>>5<<5
		
		iterateX = 32
		iterateY = 32*offsetY/offsetX
		for(var dofIterator = 0; dofIterator<dof; dofIterator++)
		{
			tempX = positionX1+iterateX*dofIterator
			tempY = positionY1+iterateY*dofIterator
			out1 = [tempX,tempY,tilemap_get_at_pixel(global.map,tempX,tempY)]
			if (out1[2]>1) break;
		}
	}
	/*if(offsetY!=0) //if not a HORIZONTAL LINE do VERTICAL checks
	{
		iterateX = 32*offsetX/offsetY
		iterateY = 32
		for(dofIterator = 0; dofIterator<dof; dofIterator++)
		{
			tempX = positionX1+iterateX*dofIterator
			tempY = positionY1+iterateY*dofIterator
			out2 = [tempX,tempY,tilemap_get_at_pixel(global.map,tempX,tempY)]
			if (out2[2]>1) break;
		}
	}*/
	if(out1!=-1) draw_line(posX,posY,out1[0],out1[1])
	
}