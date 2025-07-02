

//these mobs run away when attacked
/mob/living/simple_animal/hostile/retaliate/rogue
	turns_per_move = 5
	see_in_dark = 6
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	faction = list("rogueanimal")
	robust_searching = 1
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	attack_sound = PUNCHWOOSH
	health = 40
	maxHealth = 40
	move_to_delay = 5
	d_intent = INTENT_DODGE
	minbodytemp = 180
	lose_patience_timeout = 150
	vision_range = 5
	aggro_vision_range = 18
	harm_intent_damage = 5
	attack_same = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	blood_volume = BLOOD_VOLUME_NORMAL
	food_type = list(
		/obj/item/reagent_containers/food/snacks/grown
		)
	var/food_max = 50
	var/obj/item/udder/udder = null
	footstep_type = FOOTSTEP_MOB_SHOE
	var/milkies = FALSE
	stop_automated_movement_when_pulled = 0
	tame_chance = 0
	retreat_distance = 10
	minimum_distance = 10
	dodge_sound = 'sound/combat/dodge.ogg'
	dodge_prob = 0

	var/deaggroprob = 10
	var/eat_forever
	
	candodge = TRUE

	//If the creature is doing something they should STOP MOVING.
	var/summon_tier = 0 // Tier of summoning
	var/summon_primer = null // The message they get when summoned

	var/can_act = TRUE
	var/charge = 0
	var/charge_add = 0
	var/charge_power = 0
	var/def_prob = 0
	var/atk_prob = 0
	
/mob/living/simple_animal/hostile/retaliate/rogue/Move()
	//If you cant act and dont have a player stop moving.
	if(!can_act && !client)
		return FALSE
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/apply_damage(damage = 0,damagetype = BRUTE, def_zone = null, blocked = FALSE, forced = FALSE)
	..()
	if(damagetype == BRUTE)
		if(damage > 5 && prob(damage * 3))
			emote("pain")
		if(damage > 10)
			Immobilize(clamp(damage/2, 1, 30))
			shake_camera(src, 1, 1)
		if(damage < 10)
			flash_fullscreen("redflash1")
		else if(damage < 20)
			flash_fullscreen("redflash2")
		else if(damage >= 20)
			flash_fullscreen("redflash3")
	if(damagetype == BURN)
		if(damage > 10 && prob(damage))
			emote("pain")
			shake_camera(src, 1, 1)
		if(damage < 10)
			flash_fullscreen("redflash1")
		else if(damage < 20)
			flash_fullscreen("redflash2")
		else if(damage >= 20)
			flash_fullscreen("redflash3")

/mob/living/simple_animal/hostile/retaliate/rogue/death(gibbed)
	emote("death")
	..(gibbed)

/mob/living/simple_animal/hostile/retaliate/rogue/handle_automated_movement()
	set waitfor = FALSE
	if(!stop_automated_movement && wander && !doing)
		if(ssaddle && has_buckled_mobs())
			return 0
		if(find_food())
			return
		else
			..()

/mob/living/simple_animal/hostile/retaliate/rogue/proc/find_food()
	if(food > 50 && !eat_forever)
		return
	var/list/around = view(1, src)
	var/list/foundfood = list()
	if(stat)
		return
	for(var/obj/item/F in around)
		if(is_type_in_list(F, food_type))
			foundfood += F
			if(src.Adjacent(F))
				face_atom(F)
				playsound(src,'sound/misc/eat.ogg', rand(30,60), TRUE)
				qdel(F)
				food = max(food + 30, 100)
				return TRUE
	for(var/obj/item/F in foundfood)
		if(is_type_in_list(F, food_type))
			var/turf/T = get_turf(F)
			Goto(T,move_to_delay,0)
			return TRUE
	return FALSE

/mob/living/simple_animal/hostile/retaliate/rogue/AttackingTarget()
	//If you can't act and dont have a player stop moving.
	if(!can_act && !client)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/proc/eat_bodies()
	var/mob/living/L
//	var/list/around = view(aggro_vision_range, src)
	var/list/around = hearers(1, src)
	var/list/foundfood = list()
	if(stat)
		return
	for(var/mob/living/eattarg in around)
		if(eattarg.stat != CONSCIOUS)
			foundfood += eattarg
			L = eattarg
			if(src.Adjacent(L))
				if(iscarbon(L))
					var/mob/living/carbon/C = L
					if(attack_sound)
						playsound(src, pick(attack_sound), 100, TRUE, -1)
					face_atom(C)
					src.visible_message(span_danger("[src] starts to rip apart [C]!"))
					if(do_after(src,100, target = L))
						var/obj/item/bodypart/limb
						var/list/limb_list = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
						for(var/zone in limb_list)
							limb = C.get_bodypart(zone)
							if(limb)
								limb.dismember()
								return TRUE
						limb = C.get_bodypart(BODY_ZONE_HEAD)
						if(limb)
							limb.dismember()
							return TRUE
						limb = C.get_bodypart(BODY_ZONE_CHEST)
						if(limb)
							if(!limb.dismember())
								C.gib()
							return TRUE
				else
					if(attack_sound)
						playsound(src, pick(attack_sound), 100, TRUE, -1)
					src.visible_message(span_danger("[src] starts to rip apart [L]!"))
					if(do_after(src,100, target = L))
						L.gib()
						return TRUE
	for(var/mob/living/eattarg in foundfood)
		var/turf/T = get_turf(eattarg)
		Goto(T,move_to_delay,0)
		return TRUE
	return FALSE

/mob/living/simple_animal/hostile/retaliate/rogue/Initialize()
	. = ..()
	if(milkies)
		udder = new()
	if(tame)
		tamed()
	ADD_TRAIT(src, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/LoseTarget()
	..()
	retreat_distance = initial(retreat_distance)
	minimum_distance = initial(minimum_distance)

/mob/living/simple_animal/hostile/retaliate/rogue/tamed()
	del_on_deaggro = 0
	aggressive = 0
	if(enemies.len)
		if(prob(23))
			enemies = list()
			src.visible_message(span_notice("[src] calms down."))
			LoseTarget()
		else
			return
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/Destroy()
	QDEL_NULL(udder)
	return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/Life()
	. = ..()
	if(.)
		if(enemies.len)
			if(target)
				if(target.alpha <= 100)
					LoseTarget()
			if(prob(4))
				emote("cidle")
			if(prob(deaggroprob))
				if(mob_timers["aggro_time"])
					if(world.time > mob_timers["aggro_time"] + 30 SECONDS)
						enemies = list()
						src.visible_message(span_info("[src] calms down."))
						LoseTarget()
				else
					mob_timers["aggro_time"] = world.time
		else
			if(prob(2)) //Plays an idle sound
				emote("idle")

			if(adult_growth)
				growth_prog += 0.5
				if(growth_prog >= 100)
					if(isturf(loc))
						var/mob/living/simple_animal/A = new adult_growth(loc)
						if(tame)
							A.tame = TRUE
						qdel(src)
						return
			else
				if(childtype)
					make_babies()
		if(udder)
			if(production > 0)
				production--
				udder.generateMilk()

/mob/living/simple_animal/hostile/retaliate/rogue/Retaliate()
//	if(!enemies.len && message)
//		src.visible_message(span_warning("[src] panics!"))
//	if(flee)
//		retreat_distance = 10
//		minimum_distance = 10
	mob_timers["aggro_time"] = world.time
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/attackby(obj/item/O, mob/user, params)
	if(!stat && istype(O, /obj/item/reagent_containers/glass))
		if(udder)
			udder.milkAnimal(O, user)
			return 1
	else
		return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/proc/return_action()
	stop_automated_movement = FALSE
	walk(src,0)

/mob/living/simple_animal/hostile/retaliate/rogue/shood(mob/user)
	if(tame)
		Retaliate()

/mob/living/simple_animal/hostile/retaliate/rogue/onkick(mob/M)
	..()
	Retaliate()
	GiveTarget(M)

/mob/living/simple_animal/hostile/retaliate/rogue/beckoned(mob/user)
	if(tame && !stop_automated_movement)
		stop_automated_movement = TRUE
		Goto(user,move_to_delay)
		addtimer(CALLBACK(src, PROC_REF(return_action)), 3 SECONDS)

/mob/living/simple_animal/hostile/retaliate/rogue/food_tempted(obj/item/O, mob/user)
	testing("tempted")
	if(is_type_in_list(O, food_type) && !stop_automated_movement)
		testing("infoodtype")
		stop_automated_movement = TRUE
		Goto(user,move_to_delay)
		addtimer(CALLBACK(src, PROC_REF(return_action)), 3 SECONDS)

/mob/living/simple_animal/hostile/retaliate/rogue/proc/charge_power_add(added as num)
	charge_power += added
	return TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/Move()
	. = ..()
	if(has_buckled_mobs())
		var/mob/living/carbon/H = buckled_mobs[1]
		if(H.m_intent == MOVE_INTENT_RUN)
			charge_power_add(0.5)
		if(H.m_intent == MOVE_INTENT_WALK)
			charge_power = 0

/mob/living/simple_animal/hostile/retaliate/rogue/MobBump(mob/living/M) //CHARGE AND TRAMPLE
	if(has_buckled_mobs())
		var/mob/living/carbon/H = buckled_mobs[1]
		var/obj/item/I = H.get_active_held_item()
		var/obj/item/U = M.get_active_held_item()
		var/amt = (H?.mind ? H.mind.get_skill_level(/datum/skill/misc/riding) : 1)
		var/pole_skill_atk = (H?.mind ? H.mind.get_skill_level(/datum/skill/combat/polearms) : 1)
		var/pole_skill_def = (M?.mind ? M.mind.get_skill_level(/datum/skill/combat/polearms) : 1)
		var/defending = FALSE
/*		var/ori_damfactor = H.used_intent.damfactor
		var/ori_penfactor = H.used_intent.damfactor*/
		charge = amt*10 + charge_power*10
		var/weapon_boost = charge_power + (H.STASTR/2)
		var/def_boost = charge_power + (M.STASTR/2)
		if(H.m_intent == MOVE_INTENT_RUN && dir == get_dir(src, M)) //If you are charging
			if(istype(U, /obj/item/rogueweapon) && U.associated_skill == /datum/skill/combat/polearms && U.wielded && M.dir == get_dir(M, src) && (M.cmode))// Target has a polearm and is facing you with combat mode on
				defending = TRUE
				def_prob = pole_skill_def*10 + M.STACON*10 + rand(10,30) //small defensive buff
			if(istype(I, /obj/item/rogueweapon) && I.associated_skill == /datum/skill/combat/polearms && H.used_intent.type == SPEAR_THRUST && I.wielded && (H.cmode))// If you have a lance/spear is equipped
				atk_prob = pole_skill_atk*10 + charge_power*100

				H.used_intent.damfactor += weapon_boost
				H.used_intent.penfactor += weapon_boost
				M.used_intent.damfactor += def_boost
				M.used_intent.penfactor += def_boost
				if(defending)		// If charging a braced spearman
					if(atk_prob > def_prob)
						I.melee_attack_chain(H, M)
						visible_message(span_warning("[H] hits [M] with a damfactor of [H.used_intent.damfactor] and the penfactor of [H.used_intent.penfactor]"))
					if(atk_prob < def_prob)
						playsound(src,'sound/combat/parry/parrygen.ogg',100,FALSE)
						U.melee_attack_chain(M, H)
						visible_message(span_warning("[M] hits [H] with a damfactor of [M.used_intent.damfactor] and the penfactor of [M.used_intent.penfactor]"))
						Knockdown(rand(15,30))
						Immobilize(30)
						visible_message(span_warning("Current damfactor for [U.name] is [M.used_intent.damfactor] and the penfactor is [M.used_intent.penfactor]"))
						if(H.STACON < 10)
							unbuckle_all_mobs()
							H.Knockdown(rand(15,30))
							H.Immobilize(30)
					if(atk_prob == def_prob)
						playsound(src,'sound/combat/parry/parrygen.ogg',100,FALSE)
						M.Immobilize(30)
				else	//if charging non-spears
					if(STASTR + charge + charge_add >= M.STACON)
						I.melee_attack_chain(H, M)
						visible_message(span_warning("[H] hits [M] with a damfactor of [H.used_intent.damfactor] and the penfactor of [H.used_intent.penfactor]"))
					else
						if(prob(50))
			//				visible_message(span_warning("[M] narrowly avoided [H]'s attack!"))
						else
							I.melee_attack_chain(H, M)
				H.used_intent.damfactor -= weapon_boost
				H.used_intent.penfactor -= weapon_boost
				M.used_intent.damfactor -= def_boost
				M.used_intent.penfactor -= def_boost
				visible_message(span_warning("Current damfactor for [I.name] is [H.used_intent.damfactor] and the penfactor is [H.used_intent.penfactor]"))
			if(STASTR + charge + charge_add > M.STACON)
				M.throw_at(get_edge_target_turf(src, dir),charge_power,5,src,TRUE)
				M.emote("scream")
				M.Knockdown(rand(15,30))
				M.Immobilize(30)
			//	visible_message(span_warning("[M] is knocked away by [H]'s charge!"))
			if(STASTR + charge + charge_add < M.STACON)
				Knockdown(1)
				H.Knockdown(rand(15,30))
				Immobilize(30)
				H.Immobilize(30)
			//	visible_message(span_warning("[M] managed to withstand [H]'s charge! "))
				if(H.STACON < M.STACON)
					unbuckle_all_mobs()
					H.Knockdown(rand(15,30))
					H.Immobilize(30)
				//	visible_message(span_warning("[H] is knocked off of the [src]! "))
				if(M.STASTR > H.STACON)
					if(prob(60))
						unbuckle_all_mobs()
						H.throw_at(get_edge_target_turf(src, dir),rand(1,3),5,src,TRUE)
						H.emote("scream")
						H.Knockdown(rand(15,30))
						H.Immobilize(30)
					//	visible_message(span_warning("[H] is knocked off of their [src]! "))
			if(STASTR + charge + charge_add == M.STACON)
				H.emote("scream")
				M.emote("scream")
				M.Knockdown(rand(15,30))
				Knockdown(30)
			if(defending)
				if(STASTR + charge + charge_add > M.STACON + def_prob + rand(10,20))
					M.throw_at(get_edge_target_turf(src, dir),rand(1,3),5,src,TRUE)
					M.emote("scream")
					M.Knockdown(rand(15,30))
					M.Immobilize(30)
				//	visible_message(span_warning("[M] is knocked away by [H]'s charge!"))
				if(STASTR + charge + charge_add < M.STACON + def_prob + rand(10,20))
					Immobilize(30)
					emote("pain")
					H.Immobilize(30)
				//	visible_message(span_warning("[M] managed to withstand [H]'s charge! "))
					if(H.STACON < 10)
						unbuckle_all_mobs()
						H.Knockdown(rand(15,30))
						H.Immobilize(30)
					//	visible_message(span_warning("[H] is knocked off of their [src]! "))
					if(M.STASTR > 10)
						if(prob(60))
							unbuckle_all_mobs()
							H.throw_at(get_edge_target_turf(src, dir),rand(1,3),5,src,TRUE)
							H.emote("scream")
							H.Knockdown(rand(15,30))
							H.Immobilize(30)
					//		visible_message(span_warning("[H] is knocked off of their [src]! "))
				if(STASTR + charge + charge_add == M.STACON + def_prob + rand(10,20))
					Immobilize(30)
					emote("pain")
					H.Immobilize(30)
					if(H.STACON < 5)
						unbuckle_all_mobs()
						H.Knockdown(rand(15,30))
						H.Immobilize(30)

			/// If target is mounted v


			if(istype(M, /mob/living/simple_animal/hostile/retaliate/rogue))
				var/mob/living/simple_animal/hostile/retaliate/rogue/A = M
				if(A.has_buckled_mobs())
					var/mob/living/carbon/J = A.buckled_mobs[1]
					var/obj/item/E = J.get_active_held_item()
					def_boost = charge_power + (J.STASTR/2)
					if(istype(E, /obj/item/rogueweapon) && E.associated_skill == /datum/skill/combat/polearms && E.wielded && J.dir == get_dir(J, src) && (J.cmode)) // Target is bracing with a polearm
						defending = TRUE
						pole_skill_def = (J?.mind ? J.mind.get_skill_level(/datum/skill/combat/polearms) : 1)
						def_prob = pole_skill_def*10 + rand(10,30)
					if(J.m_intent == MOVE_INTENT_RUN && A.dir == get_dir(A, src)) //Target is charging you too
						if(istype(I, /obj/item/rogueweapon) && I.associated_skill == /datum/skill/combat/polearms && I.wielded && (H.cmode)) //You are charging with a polearm
							atk_prob = pole_skill_atk*10 + rand(10,30)
							H.used_intent.damfactor += weapon_boost
							H.used_intent.penfactor += weapon_boost
							if(A.atk_prob) //Enemy has a polearm
								if(atk_prob > A.atk_prob)
									I.melee_attack_chain(H, J)
									visible_message(span_warning("[H] hits [J] with a damfactor of [H.used_intent.damfactor] and the penfactor of [H.used_intent.penfactor]"))
									if(J.STACON < 10)
										A.unbuckle_all_mobs()
										J.Knockdown(rand(15,30))
										J.Immobilize(30)
								if(atk_prob == A.atk_prob)
									playsound(src,'sound/combat/parry/parrygen.ogg',100,FALSE)
									M.Immobilize(30)
						else					//You are charging WITHOUT a polearm
							if(A.atk_prob) // But the enemy has one
								if(H.STACON + charge + charge_add <= A.atk_prob)
									U.melee_attack_chain(J, H)
									Immobilize(30)
									H.Immobilize(30)
									if(prob(50))
										unbuckle_all_mobs()
								else
									if(prob(50))
										visible_message(span_warning("[J] narrowly avoided [H]'s attack!"))
									else
										U.melee_attack_chain(J, H)
							else //Both are charging each other WITHOUT polearms
								if(H.STACON + charge + charge_add >= J.STACON + A.charge + A.charge_add)
									A.unbuckle_all_mobs()
									A.Immobilize(30)
									J.Immobilize(30)
									J.apply_damage(charge_power, BRUTE, "chest", M.run_armor_check("chest", "blunt", damage = charge_power))
							H.used_intent.damfactor -= weapon_boost
							H.used_intent.penfactor -= weapon_boost
							visible_message(span_warning("Current damfactor is [H.used_intent.damfactor] and the penfactor is [H.used_intent.penfactor]"))
					else 	// target is not charging you
						if(istype(I, /obj/item/rogueweapon) && I.associated_skill == /datum/skill/combat/polearms && I.wielded && (H.cmode)) //You are charging with a polearm
							H.used_intent.damfactor += weapon_boost
							H.used_intent.penfactor += weapon_boost
							J.used_intent.damfactor += def_boost
							J.used_intent.penfactor += def_boost
							if(defending)		// If target is braced with spear on horseback
								if(atk_prob > def_prob)
									I.melee_attack_chain(H, J)
									visible_message(span_warning("[H] hits [J] with a damfactor of [H.used_intent.damfactor] and the penfactor of [H.used_intent.penfactor]"))
									if(J.STACON < 10)
										A.unbuckle_all_mobs()
										J.Knockdown(rand(15,30))
										J.Immobilize(30)
								if(atk_prob < def_prob)
									playsound(src,'sound/combat/parry/parrygen.ogg',100,FALSE)
									U.melee_attack_chain(J, H)
									visible_message(span_warning("[J] hits [H] with a damfactor of [J.used_intent.damfactor] and the penfactor of [J.used_intent.penfactor]"))
									Knockdown(rand(15,30))
									Immobilize(30)
									visible_message(span_warning("Current damfactor for [U.name] is [J.used_intent.damfactor] and the penfactor is [J.used_intent.penfactor]"))
									if(H.STACON < 10)
										unbuckle_all_mobs()
										H.Knockdown(rand(15,30))
										H.Immobilize(30)
								if(atk_prob == def_prob)
									playsound(src,'sound/combat/parry/parrygen.ogg',100,FALSE)
									M.Immobilize(30)
							else	//if target is not braced with spear
								if(STASTR + pole_skill_atk + charge + charge_add >= J.STACON)
									I.melee_attack_chain(H, J)
									if(J.STACON < 10)
										A.unbuckle_all_mobs()
										J.Knockdown(rand(15,30))
										J.Immobilize(30)
							H.used_intent.damfactor -= weapon_boost
							H.used_intent.penfactor -= weapon_boost
							J.used_intent.damfactor -= def_boost
							J.used_intent.penfactor -= def_boost

							visible_message(span_warning("Current damfactor for [I.name]is [H.used_intent.damfactor] and the penfactor is [H.used_intent.penfactor]"))
						if(STASTR + charge + charge_add > J.STACON)
							J.throw_at(get_edge_target_turf(src, dir),rand(1,3),5,src,TRUE)
							J.emote("scream")
							J.Knockdown(rand(15,30))
							J.Immobilize(30)
						if(STASTR + charge + charge_add < J.STACON)
							Knockdown(1)
							H.Knockdown(rand(15,30))
							Immobilize(30)
							H.Immobilize(30)
						if(STASTR + charge + charge_add == J.STACON)
							H.emote("scream")
							J.emote("scream")
							J.Knockdown(rand(15,30))
							Knockdown(30)
						if(defending)
							if(STASTR + charge + charge_add > J.STACON + def_prob)
								J.throw_at(get_edge_target_turf(src, dir),rand(1,3),5,src,TRUE)
								J.emote("scream")
								J.Knockdown(rand(15,30))
								J.Immobilize(30)
							if(STASTR + charge + charge_add < J.STACON + def_prob)
								Immobilize(30)
								emote("pain")
								E.melee_attack_chain(M, H)
								H.Immobilize(30)
								if(H.STACON < 10)
									unbuckle_all_mobs()
									H.Knockdown(rand(15,30))
									H.Immobilize(30)
							if(STASTR + charge + charge_add == J.STACON + def_prob)
								Immobilize(30)
								emote("pain")
								H.Immobilize(30)
								if(H.STACON < 5)
									unbuckle_all_mobs()
									H.Knockdown(rand(15,30))
									H.Immobilize(30)

			Immobilize(30)
			defending = FALSE
			def_prob = 0
			var/playsound = FALSE
			if(M.apply_damage((charge_power*10), BRUTE, "chest", M.run_armor_check("chest", "blunt", damage = (charge_power*10))))
				playsound = TRUE
			if(playsound)
				playsound(src, "genblunt", 100, TRUE)
			emote("aggro")
			visible_message(span_warning("[H] charges into [M] with [src]!"), span_warning("I charge into [M]!"))
			defending = FALSE
			charge_power = 0
			return TRUE
