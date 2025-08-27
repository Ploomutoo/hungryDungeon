//draw_rectangle(x,y,bbox_right,bbox_bottom,0)

for(var i = array_length(recipeHand)-1; i>=0; i--)
{
	draw_rectangle(x+8,y+24*i,bbox_right,y+24*(i+1),0)
	scribble("[fntStandard][sIconsEffect,0][c_black]"+recipeHand[i].name+"[/color]"+recipeHand[i].ingredIcons).draw(x+8,y+24*i)
}