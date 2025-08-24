enum handState 
{
	draw,
	idle,
	shuffle
}
state = handState.draw

hand = ds_list_create()

#macro HAND_SIZE 10
#macro HAND_XOFFSET 128
hand_size = HAND_SIZE

pause = 60

global.HAND_WIDTH = sprite_width
global.heldCard = noone;
global.handPosY = 608