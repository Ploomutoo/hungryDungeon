var desired_x = HAND_XOFFSET + global.HAND_WIDTH/HAND_SIZE*hand_id, 
desired_y = global.handPosY,
delta_x, 
delta_y

if(state = cardState.inHand)
{
	delta_x = (desired_x-x)/8
	delta_y = (desired_y-y)/8
	
	x += delta_x
	y += delta_y
	
	image_angle = delta_x
}
else if(state = cardState.onMouse)
{
	delta_x = (mouse_x-x)/5
	delta_y = (mouse_y-y)/5
	
	x += delta_x
	y += delta_y
	
	image_angle = delta_x
	
	if(y>448)
	{
		if(hand_id+1<ds_list_size(handObj.hand))
		{
			var nextObj = handObj.hand[| hand_id+1]
			if(x>nextObj.x)
			{
				nextObj.hand_id = hand_id;
				nextObj.depth = hand_id;
				handObj.hand[| hand_id] = nextObj
			
				hand_id++;
				depth = hand_id;
				handObj.hand[| hand_id] = self
				
				audio_play_sound(snd_card_deal,0,0,0.5)
			}
		}
		if(hand_id>0) 
		{
			var prevObj = handObj.hand[| hand_id-1]
			if(x<prevObj.x)
			{
				prevObj.hand_id = hand_id;
				prevObj.depth = hand_id;
				handObj.hand[| hand_id] = prevObj
			
				hand_id--;
				depth = hand_id;
				handObj.hand[| hand_id] = self
				
				audio_play_sound(snd_card_deal,0,0,0.5)
			}
		}
	}
}