if(global.heldCard!=noone)
{
	if(global.heldCard.depth>depth)
	{
		global.heldCard.state = cardState.inHand
	}
	else exit;
}

state = cardState.onMouse
global.heldCard = self