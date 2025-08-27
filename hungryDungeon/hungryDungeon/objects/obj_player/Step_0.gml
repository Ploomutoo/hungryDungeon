//checkInput
var cRotate = 0;
var cMove = 0;
var cStrafe = 0;

//check strafe
if(keyboard_check(vk_alt))
	cStrafe = true;

if(keyboard_check(vk_left))
	cRotate -= 1;

if(keyboard_check(vk_right))
	cRotate += 1;

if(keyboard_check(vk_up))
	cMove += 1;

if(keyboard_check(vk_down))
	cMove -= 1;
	
//move
movePlayer(cMove * MOVE_SPEED);
	
if(cStrafe)
	strafePlayer(cRotate * MOVE_SPEED);
else
	rotatePlayer(cRotate * ROTATION_SPEED);
	
if(posX < 0)
	posX = 0;
if(posY < 0)
	posY = 0;
if(posX > obj_level_display.worldWidth)
	posX = obj_level_display.worldWidth;
if(posY > obj_level_display.worldHeight)
	posY = obj_level_display.worldHeight;
