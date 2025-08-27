/// @function rotatePlayer(angle)
/// @param angle the angle in degree
function rotatePlayer(argument0) {

	var angle = argument0;

	var angleInRadian = angle * (pi / 180);

	var tmpDirectionX = directionX;
	directionX = directionX *    cos(angleInRadian) - directionY * sin(angleInRadian);
	directionY = tmpDirectionX * sin(angleInRadian) + directionY * cos(angleInRadian);

	var tmpPlaneX = planeX;
	planeX = planeX *    cos(angleInRadian) - planeY * sin(angleInRadian);
	planeY = tmpPlaneX * sin(angleInRadian) + planeY * cos(angleInRadian);


}
