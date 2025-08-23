/obj/item/ammo_casing/bullet/update_icon()
	..()
	icon_state = "[initial(icon_state)][BB ? "-live" : ""]"
	desc = ""
