function recipe(_name,_icon,_effect,_ingredients) constructor
{
	//Example 
	//function hamburger() : recipe("Hamburger,sRecipeHamburger,[Damage,BuffDamage],[Grain,Meat,Veg,Grain])
	
	name = _name
	icon = _icon
	effect = _effect
	ingredients = _ingredients
	ingredIcons = ""
	
	for(var i = 0; i < array_length(ingredients); i++)
	{
		switch(ingredients[i])
		{
			case "Grain":
			ingredIcons += "[sIconsEffect,0]"
			break;
			default:
			
			break;
		}
	}
	
}