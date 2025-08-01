
/obj/item/gun/ballistic/handgonne
	name = "handgonne"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'modular_helmsguard/icons/weapons/handgonne.dmi'
	icon_state = "handgonne"
	item_state = "handgonne"
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/arquebus, /datum/intent/arc/arquebus, INTENT_GENERIC)
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/arquebus
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
	cartridge_wording = "musketball"
	load_sound = 'modular_helmsguard/sound/arquebus/musketload.ogg'
	fire_sound = "modular_helmsguard/sound/arquebus/arquefire.ogg"
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	pickup_sound = 'modular_helmsguard/sound/sheath_sounds/draw_from_holster.ogg'
	holster_sound = 'modular_helmsguard/sound/sheath_sounds/put_back_to_holster.ogg'
	var/spread_num = 10
	var/damfactor = 2
	var/reloaded = FALSE
	var/load_time = 50
	var/gunpowder = FALSE
	var/obj/item/ramrod/myrod = null
	var/gunchannel

/obj/item/gun/ballistic/handgonne/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 6,"nx" = 7,"ny" = 6,"wx" = -2,"wy" = 3,"ex" = 1,"ey" = 3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -43,"sturn" = 43,"wturn" = 30,"eturn" = -30, "nflip" = 0, "sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -1,"wx" = -8,"wy" = 2,"ex" = 8,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 1,"nturn" = -45,"sturn" = 45,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

/obj/item/gun/ballistic/handgonne/Initialize()
	. = ..()
	myrod = new /obj/item/ramrod(src)


/obj/item/gun/ballistic/handgonne/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	fire_sound = pick("modular_helmsguard/sound/arquebus/arquefire.ogg", "modular_helmsguard/sound/arquebus/arquefire2.ogg", "modular_helmsguard/sound/arquebus/arquefire3.ogg",
				"modular_helmsguard/sound/arquebus/arquefire4.ogg", "modular_helmsguard/sound/arquebus/arquefire5.ogg")
	. = ..()

/obj/item/gun/ballistic/handgonne/attack_right(mob/user)
	if(user.get_active_held_item())
		return
	else
		if(myrod)
			playsound(src, "sound/items/sharpen_short1.ogg",  100)
			to_chat(user, "<span class='warning'>I draw the ramrod from the [src]!</span>")
			var/obj/item/ramrod/AM
			for(AM in src)
				user.put_in_hands(AM)
				myrod = null
		else
			to_chat(user, "<span class='warning'>There is no rod stowed in the [src]!</span>")

/obj/item/gun/ballistic/handgonne/shoot_with_empty_chamber()
	playsound(src.loc, 'modular_helmsguard/sound/arquebus/musketcock.ogg', 100, FALSE)
	update_icon()

/obj/item/gun/ballistic/handgonne/attack_self(mob/living/user)
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

/obj/item/gun/ballistic/handgonne/attackby(obj/item/A, mob/user, params)
	user.stop_sound_channel(gunchannel)
	var/firearm_skill = (user?.mind ? user.mind.get_skill_level(/datum/skill/combat/firearms) : 1)
	var/load_time_skill = load_time - (firearm_skill*2)
	gunchannel = SSsounds.random_available_channel()

	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(chambered)
			to_chat(user, "<span class='warning'>There is already a [chambered] in the [src]!</span>")
			return
		if(!gunpowder)
			to_chat(user, "<span class='warning'>You must fill the [src] with gunpowder first!</span>")
			return
		if((loc == user) && (user.get_inactive_held_item() != src))
			return
		playsound(src, "modular_helmsguard/sound/arquebus/insert.ogg",  100)
		user.visible_message("<span class='notice'>[user] forces a [A] down the barrel of the [src].</span>")
		..()

	if(istype(A, /obj/item/powderflask))
		if(gunpowder)
			user.visible_message("<span class='notice'>The [src] is already filled with gunpowder!</span>")
			return
		else
			playsound(src, "modular_helmsguard/sound/arquebus/pour_powder.ogg",  100)
			if(do_after(user, load_time_skill, src))
				user.visible_message("<span class='notice'>[user] fills the [src] with gunpowder.</span>")
				gunpowder = TRUE
			return
	if(istype(A, /obj/item/ramrod))
		var/obj/item/ramrod/R=A
		if(!reloaded)
			if(chambered)
				user.visible_message("<span class='notice'>[user] begins ramming the [R.name] down the barrel of the [src] .</span>")
				playsound(src, "modular_helmsguard/sound/arquebus/ramrod.ogg",  100)
				if(do_after(user, load_time_skill, src))
					user.visible_message("<span class='notice'>[user] has finished reloading the [src].</span>")
					reloaded = TRUE
				return
		if(reloaded && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, "sound/foley/musketload.ogg",  100)
			user.visible_message("<span class='notice'>[user] stows the [R.name] under the barrel of the [src].</span>")
		if(!chambered && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, "sound/foley/musketload.ogg",  100)
			user.visible_message("<span class='notice'>[user] stows the [R.name] under the barrel of the [src] without chambering it.</span>")
		if(!myrod == null)
			to_chat(user, span_warning("There's already a [R.name] inside of the [name]."))
			return
		user.stop_sound_channel(gunchannel)

/obj/item/gun/ballistic/handgonne/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)

	var/accident_chance = 0
	var/firearm_skill = (user?.mind ? user.mind.get_skill_level(/datum/skill/combat/firearms) : 1)
	var/turf/knockback = get_ranged_target_turf(user, turn(user.dir, 180), rand(1,2))
	spread = (spread_num - firearm_skill)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
			adjust_experience(user, /datum/skill/combat/firearms, user.STAINT * 4)
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		BB.damage = BB.damage * damfactor
	gunpowder = FALSE
	reloaded = FALSE
	spark_act()

	playsound(src, "modular_helmsguard/sound/arquebus/fuse.ogg", 100)
	spawn(rand(10,20))
		..()
		new /obj/effect/particle_effect/sparks/muzzle(get_ranged_target_turf(user, user.dir, 1))
		spawn (1)
			new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
		spawn (5)
			new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 2))
		spawn (12)
			new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
		user.mind.adjust_experience(/datum/skill/combat/firearms, (user.STAINT*5))
		for(var/mob/M in range(5, user))
			if(!M.stat)
				shake_camera(M, 3, 1)

/obj/item/gun/ballistic/handgonne/afterattack(atom/target, mob/living/user, flag, params)
	. = ..()
/*	if(!reloaded)
		to_chat(user, span_warning("The [src] is not properly loaded yet!"))
		return*/

/obj/item/gun/ballistic/handgonne/can_shoot()
	if (!reloaded)
		return FALSE
	return ..()


