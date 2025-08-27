/// @function strafePlayer(moveSpeed)
/// @param moveSpeed 
function strafePlayer(argument0) {

	var moveSpeed = argument0;

	//move 90 degree left or right from the angle
	var strafeDirectionX = -directionY;
	var strafeDirectionY = directionX;

	posX += strafeDirectionX * moveSpeed;
	posY += strafeDirectionY * moveSpeed;


}
