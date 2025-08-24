/obj/item/gun/ballistic/revolver/pistol
	name = "revolver pistol"
	desc = "A standard revolver pistol."
	icon_state = "detective_peacemaker"
	force = 10
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder
	possible_item_intents = list(/datum/intent/shoot/revolver_pistol, /datum/intent/arc/revolver_pistol, /datum/intent/mace/strike/wood)
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	randomspread = 1
	spread = 0
	can_parry = TRUE
	minstr = 6
	walking_stick = FALSE
	cartridge_wording = "revolver cartridge"
	load_sound = 'modular_meridia/sounds/guns/revolver/load_bullet.ogg'
	fire_sound = list('modular_meridia/sounds/guns/revolver/shot_1.ogg', 
				'modular_meridia/sounds/guns/revolver/shot_2.ogg', 
				'modular_meridia/sounds/guns/revolver/shot_3.ogg')
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	pickup_sound = 'modular_helmsguard/sound/sheath_sounds/draw_from_holster.ogg'
	holster_sound = 'modular_helmsguard/sound/sheath_sounds/put_back_to_holster.ogg'
	slot_flags = ITEM_SLOT_HIP
	damfactor = 15
	var/spread_num = 3
	var/can_spin = TRUE
	var/last_spunned
	var/spin_cooldown = 3 SECONDS
	associated_skill = /datum/skill/combat/firearms // NPC related
	npc_reload_sound = 'modular_meridia/sounds/guns/revolver/npc_revolver_reload.ogg'
	npc_aim_sound = 'modular_meridia/sounds/guns/revolver/empty.ogg'
	muzzle = "light" // Whether the gun has a muzzle effect when firing, used for NPCs

/obj/item/gun/ballistic/revolver/pistol/examine(mob/user)
	. = ..()
	var/live_ammo = get_ammo(FALSE, FALSE)
	. += "[live_ammo ? live_ammo : "None"] of those are live rounds."
	if (current_skin)
		. += "It can be spun with <b>alt+click</b>"

/obj/item/gun/ballistic/revolver/pistol/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -10,"sy" = -7,"nx" = 13,"ny" = -7,"wx" = -8,"wy" = -6,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 30,"sturn" = -30,"wturn" = -30,"eturn" = 30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/gun/ballistic/revolver/pistol/shoot_with_empty_chamber(mob/living/user as mob|obj)
	..()
	chamber_round(TRUE)


/obj/item/gun/ballistic/revolver/pistol/attack_right(mob/user)
	..()
	spin()

/obj/item/gun/ballistic/revolver/pistol/verb/spin()
	set name = "Spin Chamber"
	set hidden = 1
	set desc = ""

	var/mob/M = usr
	var/list/spin_sounds = list('modular_meridia/sounds/guns/revolver/spin1.ogg',
								'modular_meridia/sounds/guns/revolver/spin2.ogg',
								'modular_meridia/sounds/guns/revolver/spin3.ogg')

	if(M.stat || !in_range(M,src))
		return

	if (recent_spin > world.time)
		return
	recent_spin = world.time + spin_delay

	if(do_spin())
		playsound(usr, pick(spin_sounds), 30, FALSE)
		usr.visible_message(span_notice("[usr] spins [src]'s chamber."), span_notice("I spin [src]'s chamber."))
	else
		verbs -= /obj/item/gun/ballistic/revolver/pistol/verb/spin

/obj/item/gun/ballistic/revolver/pistol/proc/do_spin()
	var/obj/item/ammo_box/magazine/internal/cylinder/C = magazine
	. = istype(C)
	if(.)
		C.spin()
		chamber_round(FALSE)


/obj/item/gun/ballistic/revolver/pistol/MiddleClick(mob/living/user, params)
	. = ..()
	var/string = "smoothly"
	var/list/strings_noob = list("unsurely", "nervously", "anxiously", "timidly", "shakily", "clumsily", "fumblingly", "awkwardly")
	var/list/strings_moderate = list("smoothly", "confidently", "determinately", "calmly", "skillfully", "decisively")
	var/list/strings_pro = list("masterfully", "expertly", "flawlessly", "elegantly", "artfully", "impeccably")
	var/firearm_skill = (user.get_skill_level(/datum/skill/combat/firearms))
	var/noob_spin_sound = 'sound/combat/weaponr1.ogg'
	var/pro_spin_sound = 'modular_helmsguard/sound/arquebus/gunspin.ogg'
	var/spin_sound
	if(firearm_skill <= 2)
		string = pick(strings_noob)
		spin_sound = noob_spin_sound
	if((firearm_skill > 2) && (firearm_skill <= 4))
		string = pick(strings_moderate)
		spin_sound = pro_spin_sound
	if((firearm_skill > 4) && (firearm_skill <= 6))
		string = pick(strings_pro)
		spin_sound = pro_spin_sound
	if(world.time > last_spunned + spin_cooldown)
		can_spin = TRUE
	if(can_spin)
		user.play_overhead_indicator('icons/effects/effects.dmi', "emote", 10, OBJ_LAYER)
		user.visible_message("<span class='emote'>[user] spins the [src] around their fingers [string]!</span>")
		playsound(src, spin_sound, 100, FALSE, ignore_walls = FALSE)
		last_spunned = world.time
		can_spin = FALSE
/*		if(firearm_skill <= 2)
			if(prob(35))
				shoot_live_shot(message = 0)
				user.visible_message("<span class='danger'>[user] accidentally discharged the [src]!</span>")
		if(firearm_skill <= 3)
			if(prob(50))
				user.visible_message("<span class='danger'>[user] accidentally dropped the [src]!</span>")
				user.dropItemToGround(src)
*/



/obj/item/gun/ballistic/revolver/pistol/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	. = ..()
	user.changeNext_move(get_click_speed(user))

/obj/item/gun/ballistic/revolver/pistol/equipped(mob/user, slot, initial)
	. = ..()
	spread = get_spread_amount(user)

/obj/effect/particle_effect/smoke/revolver
	name = "smoke"
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	opacity = FALSE
	layer = FLY_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	animate_movement = 0
	amount = 1
	lifetime = 2
	opaque = FALSE


/datum/intent/shoot/revolver_pistol
	chargedrain = 0

/datum/intent/arc/revolver_pistol
	chargedrain = 0


/datum/intent/shoot/revolver_pistol/prewarning()
	if(mastermob)
		playsound(mastermob, pick('modular_meridia/sounds/guns/revolver/empty.ogg'), 100, FALSE)

/datum/intent/arc/revolver_pistol/prewarning()
	if(mastermob)
		playsound(mastermob, pick('modular_meridia/sounds/guns/revolver/empty.ogg'), 100, FALSE)









/*
/datum/intent/shoot/revolver_pistol/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
    	//skill block
		newtime = newtime + 50
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 10)
    	//per block
		newtime = newtime + 8
		newtime = newtime - ((mastermob.STAPER)*1)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/shoot/revolver_pistol/can_charge()
	if(mastermob)
		return TRUE



/datum/intent/arc/revolver_pistol/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
    	//skill block
		newtime = newtime + 50
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 10)
    	//per block
		newtime = newtime + 8
		newtime = newtime - ((mastermob.STAPER)*1)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime


/datum/intent/arc/revolver_pistol/can_charge()
	if(mastermob)
		return TRUE



/obj/item/gun/ballistic/revolver/pistol/shoot_with_empty_chamber()
	playsound(src.loc, 'modular_meridia/sounds/guns/revolver/dry_fire.ogg', 100, FALSE)
	update_icon()
*/
