/// @description Insert description here
// You can write your code in this editor
if(raycast_info==noone)return;
draw_set_color(c_green);

draw_line_width(x,y,raycast_info.x,raycast_info.y,2);

if(raycast_info.type!=rc_type.nothing){
	draw_set_color(c_red);
	draw_circle(raycast_info.x,raycast_info.y,2,false);
}

draw_set_color(c_black)
draw_text(8,8,"Select modes: (Current:" +string(demo_mode)+ ") \r Press Key 1: The Advanced Raycast(Precise Mode On) \r Press Key 2: To Only Objects  \r Press Key 3: To Only Blue and Pink Objects \r Press Key 4:To Only Blue Objects\r Press Key 5: To Only Tiles ")

//Code side
draw_set_color(c_dkgray);
draw_rectangle(0,512,512,640,false);
draw_set_color(c_gray);
draw_text(16,512, method_struct);
draw_set_color(c_green);
draw_text(16,552, method_code);
draw_set_color(c_white);
var data_info_str=raycast_info.type==rc_type.nothing ? "":"\rraycast_data.index="+string(raycast_info.index) +"(tilemap index or instance id) \r" + "raycast_info.x="+string(raycast_info.x)+",raycast_info.y="+string(raycast_info.y);
draw_text(16,570, "raycast_data.type="+string(raycast_info.type)+"(0:nothing,1:tilemap,2:object)"+data_info_str );

