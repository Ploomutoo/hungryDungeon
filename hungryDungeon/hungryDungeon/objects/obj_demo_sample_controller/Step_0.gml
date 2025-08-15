/// @description Insert description here
// You can write your code in this editor
x=mouse_x;
y=mouse_y;
var raycast_length=200;
var raycast_per_pixel=16;
angle+=1;
switch demo_mode{
	case 1:
		raycast_info=raycast(x,y,angle,raycast_length,raycast_per_pixel,all,"Tiles_Collider",true);
		method_code="raycast("+string(x)+","+string(y)+","+string(angle mod 360)+","+string(raycast_length)+","+string(raycast_per_pixel)+",all,'Tiles_Collider',true);";
	break;
	case 2:
		raycast_info=raycast(x,y,angle,raycast_length,raycast_per_pixel,all);
		method_code="raycast("+string(x)+","+string(y)+","+string(angle mod 360)+","+string(raycast_length)+","+string(raycast_per_pixel)+",all);";
	break;
	case 3:
		raycast_info=raycast(x,y,angle,raycast_length,raycast_per_pixel,[obj_blue,obj_pink]);
		method_code="raycast("+string(x)+","+string(y)+","+string(angle mod 360)+","+string(raycast_length)+","+string(raycast_per_pixel)+",[obj_blue,obj_pink]);";
	break;
	case 4:
		raycast_info=raycast(x,y,angle,raycast_length,raycast_per_pixel,obj_blue);
		method_code="raycast("+string(x)+","+string(y)+","+string(angle mod 360)+","+string(raycast_length)+","+string(raycast_per_pixel)+",obj_blue);";
	break;
	case 5:
		raycast_info=raycast(x,y,angle,raycast_length,raycast_per_pixel,noone,"Tiles_Collider");
		method_code="raycast("+string(x)+","+string(y)+","+string(angle mod 360)+","+string(raycast_length)+","+string(raycast_per_pixel)+",noone,'Tiles_Collider');";
	break;
}


if(keyboard_check_pressed(ord("1")) ){
	demo_mode=1;
}else if(keyboard_check_pressed(ord("2"))){
	demo_mode=2;
}else if(keyboard_check_pressed(ord("3"))){
	demo_mode=3;
}else if(keyboard_check_pressed(ord("4"))){
	demo_mode=4;
}else if(keyboard_check_pressed(ord("5"))){
	demo_mode=5;
}

