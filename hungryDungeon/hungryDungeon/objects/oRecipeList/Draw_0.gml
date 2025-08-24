draw_rectangle(x,y,bbox_right,bbox_bottom,0)

for(var i = array_length(recipeHand)-1; i>=0; i--)
{
	scribble("[fntStandard][sIconsEffect,0][c_black]"+recipeHand[i].name+"[/color]\n").draw(x+8,y+16*i)
}