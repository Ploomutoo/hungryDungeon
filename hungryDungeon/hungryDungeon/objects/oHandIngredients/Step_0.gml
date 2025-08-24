pause--;
if(pause>0) exit;

if(state=handState.draw)
{
	var i = ds_list_size(hand)
	if(i<hand_size)
	{
		ds_list_add(hand,
		instance_create_depth(64,512,-i,oIngredientCard))
		hand[| i].handObj = self
		
		hand[| i].hand_id = i
		hand[| i].image_index = random(sprite_get_number(hand[| i].sprite_index))
		
		audio_play_sound(snd_card_deal,0,0)
	}
	else state = handState.idle
	pause = 10;	
}
else if(state=handState.idle)
{
	pause = 0	
}