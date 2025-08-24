///@function raycast(_x,_y,_dir,_length,_per_pixel,_object,_tilemap_layer_name,_precise_mode)
///@param {int} _x	 start position x
///@param {int} _y	 start position y
///@param {int} _dir		 angle of the ray
///@param {int} [_lenght=100]	 length of the ray
///@param {int} [_per_pixel=16]	 check per pixel
///@param [_object]	 target object or objects array
///@param {string} [_tilemap_layer_name]	target tilemap layer name
///@param {bool} [_precise_mode] for the precise mask collisions(slow)
///@return {raycast_data}	
function raycast(_x,_y,_dir,_length,_per_pixel,_object=undefined,_tilemap_layer_name="",_precise_mode=true) {
	//Saving first position
	var sx=_x;
	var sy=_y;
	
	//Current Positions
	var cx=_x;
	var cy=_y;
	
	//We will return this
	var raycast_data = {
		type : rc_type.nothing, //all options nothing,tilemap,object
		index : noone, //instance id or tilemap index of the collision
		x : -1, // collision position x
		y : -1 //collision position y
	}

	//Checking _tilemap_layer_name argument
	var no_tilemaps = true;
	var layer_id = undefined;
	var tilemap_id = undefined;
	if(_tilemap_layer_name!=""){
		layer_id = layer_get_id(_tilemap_layer_name);
		tilemap_id = layer_tilemap_get_id(layer_id);
		no_tilemaps = false;
	}
	
	var _x_move = lengthdir_x(_per_pixel,_dir);
    var _y_move = lengthdir_y(_per_pixel,_dir);
	
	var _move_small = 0.5;
	if (!_precise_mode)
		_move_small = 1
	
    var _x_move_small= lengthdir_x(_move_small, _dir);
    var _y_move_small= lengthdir_y(_move_small, _dir);
	
	var _length_sqr = _length * _length;
	var _x_vec = 0;
	var _y_vec = 0;
	
	var inc_amt = _per_pixel / _move_small;
	
	
	if (!no_tilemaps){
		while(_x_vec * _x_vec + _y_vec * _y_vec < _length_sqr){
			cx+=_x_move;
	        cy+=_y_move;
			
			var col_tile=tilemap_get_at_pixel(tilemap_id,cx,cy);
			if(col_tile>0){
				for (var i = 0; i < inc_amt; i++){
					if(!tilemap_get_at_pixel(tilemap_id,cx,cy))
						break
						
					cx-=_x_move_small;
					cy-=_y_move_small;
				}
				
				raycast_data.type=rc_type.tilemap;
				raycast_data.index=col_tile;
				raycast_data.x=cx;
				raycast_data.y=cy;
				return raycast_data
			}
			
			
			_x_vec = cx - _x;
	        _y_vec = cy - _y;
		}
	}
	
	if (_object == undefined){
		if(raycast_data.type==rc_type.nothing){
			raycast_data.x=cx;
			raycast_data.y=cy;
		}

		return raycast_data;
	}
		
	var obj_finded=true;
	var _array_length = 1
	if(is_array(_object)){
		obj_finded=false;
		_array_length = array_length(_object);	
	}
	else{
		_object = [_object]
	}
	
	_x_vec = 0
	_y_vec = 0
	cx=sx;
	cy=sy;
	while(_x_vec * _x_vec + _y_vec * _y_vec < _length_sqr){
		cx+=_x_move;
	    cy+=_y_move;
			
		for (var i = 0; i < _array_length; i++){
			var obj = _object[i];
			var col_obj = collision_line(_x, _y, cx, cy, obj, _precise_mode, false);
			if(col_obj != noone){
				for (var j = 0; j < inc_amt; j++){
					if(!collision_line(_x, _y, cx, cy,_object,_precise_mode,true))
						break
						
					cx-=_x_move_small;
					cy-=_y_move_small;
				}
					
				raycast_data.type=rc_type.object;
				raycast_data.index=col_obj;
				raycast_data.x=cx;
				raycast_data.y=cy;
				return raycast_data
			}
		}
		
		_x_vec = cx - _x;
	    _y_vec = cy - _y;
	}
	
	
	if(raycast_data.type==rc_type.nothing){
		raycast_data.x=cx;
		raycast_data.y=cy;
	}

	return raycast_data;
}

//Raycast Types
enum rc_type{
	nothing,
	tilemap,
	object
}