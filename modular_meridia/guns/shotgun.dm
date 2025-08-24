/obj/item/gun/ballistic/shotgun/twobarrels
	name = "double barrel shotgun"
	desc = "A double barreled shotgun"
	icon = 'modular_meridia/icons/guns64.dmi'
	icon_state = "2barrels"
	force = 10
	mag_type = /obj/item/ammo_box/magazine/internal/shotgun
	possible_item_intents = list(/datum/intent/shoot/revolver_pistol, /datum/intent/arc/revolver_pistol, /datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/revolver_pistol, /datum/intent/shoot/revolver_pistol, INTENT_GENERIC)
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_LONG
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0

	can_parry = TRUE
	minstr = 6
	walking_stick = TRUE
	experimental_onback = TRUE
	cartridge_wording = "shell"
	rack_sound = 'modular_meridia/sounds/guns/shotgun/rack.ogg'
	load_sound = 'modular_meridia/sounds/guns/shotgun/insert_shell.ogg'
	fire_sound = list('modular_meridia/sounds/guns/shotgun/shot_1.ogg', 
				'modular_meridia/sounds/guns/shotgun/shot_2.ogg', 
				'modular_meridia/sounds/guns/shotgun/shot_3.ogg')
	var/open_sound = 'modular_meridia/sounds/guns/shotgun/shotgun_open.ogg'
	var/close_sound = 'modular_meridia/sounds/guns/shotgun/shotgun_close.ogg'
	dry_fire_sound = 'modular_meridia/sounds/guns/shotgun/dry_fire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	pickup_sound = 'modular_helmsguard/sound/sheath_sounds/draw_from_holster.ogg'
	holster_sound = 'modular_helmsguard/sound/sheath_sounds/put_back_to_holster.ogg'
	damfactor = 10 // Multiplier for projectile damage. Used by arquebuses.
	var/reloaded = FALSE
	var/open = FALSE
	associated_skill = /datum/skill/combat/firearms // NPC related
	npc_reload_sound = 'modular_helmsguard/sound/NPC_reload/npc_musket_reload.ogg'
	npc_aim_sound = 'modular_helmsguard/sound/arquebus/musketcock.ogg'
	muzzle = "light" // Whether the gun has a muzzle effect when firing, used for NPCs

/obj/item/gun/ballistic/shotgun/twobarrels/examine(mob/user)
	. = ..()
	var/live_ammo = get_ammo(FALSE, FALSE)
	. += "[live_ammo ? live_ammo : "None"] of those are live rounds."

/obj/item/gun/ballistic/shotgun/twobarrels/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -1,"wx" = -8,"wy" = 2,"ex" = 8,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 1,"nturn" = -45,"sturn" = 45,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/gun/ballistic/shotgun/twobarrels/attack_self(mob/living/user)
	if(twohands_required)
		return
	if(altgripped || wielded) //Trying to unwield it
		ungrip(user)
		return
	if(alt_intents)
		altgrip(user)
	if(gripped_intents)
		wield(user)
	update_icon()


/obj/item/gun/ballistic/shotgun/twobarrels/MiddleClick(mob/living/user, params)
	. = ..()
	if(!open)
		open = TRUE
		icon_state = "[icon_state]-break"
		chambered = null
		var/num_unloaded = 0
		playsound(user, open_sound, 100)
		for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
			CB.forceMove(drop_location())
			CB.bounce_away(FALSE, NONE)
			num_unloaded++
		if (num_unloaded)
			playsound(user, eject_sound, eject_sound_volume, eject_sound_vary)
		update_icon()
		return
	if(open)
		open = FALSE
		icon_state = "[icon_state]"
		playsound(user, close_sound, 100)
		update_icon()



/*

/obj/item/gun/ballistic/shotgun/twobarrels/attackby(obj/item/A, mob/user, params)
	var/obj/item/ammo_box/magazine/internal/shotgun/mag = mag_type
	var/obj/item/ammo_casing/bullet/shotgun/shell = mag_type.ammo_type

	if(open)
		if(istype(A, shell))

*/
