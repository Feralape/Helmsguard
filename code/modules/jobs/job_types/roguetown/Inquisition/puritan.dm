/datum/job/roguetown/puritan
	title = "Inquisitor"
	flag = PURITAN
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = TOLERATED_CLEARANCE	//Not been around long enough to be inquisitor, brand new race to the world.
	allowed_patrons = ALL_CLERIC_PATRONS  //You MUST have a Psydonite character to start. Just so people don't get japed into Oops Suddenly Psydon!
	tutorial = "Emboldened by the clergy of the march, you are charged with rooting out the heretics and monsters that plague the land. \
	You are a member of the Inquisition, a holy order of the Church of the Shepherd, and you will not rest until the world is cleansed of all evil.\
	You are a hunter, a warrior, and a priest all in one. You are an Inquisitor."
	whitelist_req = TRUE
	cmode_music = 'sound/music/combat_inqordinator.ogg'
	selection_color = JCOLOR_INQUISITION

	outfit = /datum/outfit/job/roguetown/puritan
	display_order = JDO_PURITAN
	advclass_cat_rolls = list(CTAG_PURITAN = 20)
	advjob_examine = TRUE
	give_bank_account = 30
	min_pq = 10
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/puritan
	name = "Inquisitor"
	jobtype = /datum/job/roguetown/puritan
	job_bitflag = BITFLAG_CHURCH	//Counts as church.
	allowed_patrons = list(/datum/patron/old_god)

/datum/job/roguetown/puritan/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.grant_language(/datum/language/otavan)
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")


////Classic Inquisitor with a much more underground twist. Use listening devices, sneak into places to gather evidence, track down suspicious individuals. Has relatively the same utility stats as Confessor, but fulfills a different niche in terms of their combative job as the head honcho.

/datum/advclass/puritan/inspector
	name = "Inquisitor"
	title = "Inquisitor"
	f_title = "Inquisitor"
	tutorial = "Investigators from countless backgrounds, personally chosen by the clergy to root out heresy all across the world.\
	Dressed in fashionable leathers and armed with a plethora of equipment, these beplumed officers are ready to tackle the heretics and the impure: \
	anywhere, anytime. Ideal for those who prefer sleuthy-and-clandestine affairs."
	outfit = /datum/outfit/job/roguetown/puritan/inspector

	category_tags = list(CTAG_PURITAN)

/datum/outfit/job/roguetown/puritan/inspector/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 2, TRUE)	
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)	
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 3)
		H.change_stat("perception", 3)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 3)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PURITAN, JOB_TRAIT)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/psydon
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots/otavan/inqboots
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	beltr = /obj/item/quiver/bolts
	head = /obj/item/clothing/head/roguetown/inqhat
	gloves = /obj/item/clothing/gloves/roguetown/otavan/inqgloves
	wrists = /obj/item/clothing/neck/roguetown/psicross/silver
	beltl = /obj/item/rogueweapon/sword/rapier
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale/inqcoat
	backpack_contents = list(/obj/item/storage/keyring/sund/sund_inquisitor = 1, /obj/item/lockpickring/mundane = 1, /obj/item/rogueweapon/huntingknife/idagger/silver/psydagger, /obj/item/grapplinghook = 1, /obj/item/storage/belt/rogue/pouch/coins/rich = 1)

/// JUSTICIAR

/datum/advclass/puritan/justiciar
	name = "Justiciar"
	title = "Justiciar"
	f_title = "Justiciar"
	tutorial = "Justiciars are less of an investigator and more of a judge. They are the ones who decide the fates of those who have been accused of heresy,\
	and in many cases - they are the ones who carry out the punishment. They are equiped and trained for a more direct confrontation and interrogation."
	outfit = /datum/outfit/job/roguetown/puritan/justiciar

	category_tags = list(CTAG_PURITAN)

/datum/outfit/job/roguetown/puritan/justiciar/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 5, TRUE)	
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)	
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 3)
		H.change_stat("perception", 3)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 3)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PURITAN, JOB_TRAIT)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/psydon
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots/otavan/inqboots
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/sword/rapier
	beltr = /obj/item/ammopouch/bullets
	head = /obj/item/clothing/head/roguetown/inqhat
	gloves = /obj/item/clothing/gloves/roguetown/otavan/inqgloves
	wrists = /obj/item/clothing/neck/roguetown/psicross/silver
	beltl = /obj/item/gun/ballistic/arquebus_pistol
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale/inqcoat
	backpack_contents = list(/obj/item/storage/keyring/sund/sund_inquisitor = 1, /obj/item/powderflask = 1, /obj/item/storage/belt/rogue/pouch/coins/rich = 1)



/*
///The dirty, violent side of the Inquisition. Meant for confrontational, conflict-driven situations as opposed to simply sneaking around and asking questions. Templar with none of the miracles, but with all the muscles and more.

/datum/advclass/puritan/ordinator
	name = "Ordinator"
	tutorial = "Adjudicators who - through valor and martiality - have proven themselves to be champions in all-but-name. Now, they have been personally chosen by the High Bishop of the Otavan Sovereignty for a mission-most-imperative: to hunt down and destroy the monsters threatening this fief. Ideal for those who prefer overt-and-chivalrous affairs."
	outfit = /datum/outfit/job/roguetown/puritan/ordinator
	cmode_music = 'sound/music/combat_inqordinator.ogg'

	category_tags = list(CTAG_PURITAN)

/datum/outfit/job/roguetown/puritan/ordinator/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 3)
		H.change_stat("perception", 3)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 3)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PURITAN, JOB_TRAIT)
	hand_r = /obj/item/rogueweapon/huntingknife/idagger/silver/psydagger
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	belt = /obj/item/storage/belt/rogue/leather/steel
	neck = /obj/item/clothing/neck/roguetown/chaincoif/chainmantle
	shoes = /obj/item/clothing/shoes/roguetown/boots/otavan/inqboots
	wrists = /obj/item/clothing/neck/roguetown/psicross/silver
	pants = /obj/item/clothing/under/roguetown/chainlegs/skirt
	cloak = /obj/item/clothing/cloak/psydontabard
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/shield/tower/metal
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/helmet/heavy/psydonhelm
	gloves = /obj/item/clothing/gloves/roguetown/otavan/inqgloves
	beltl = /obj/item/rogueweapon/sword/long/psysword
	backpack_contents = list(/obj/item/storage/keyring/sund/sund_inquisitor = 1, /obj/item/lockpickring/mundane = 1, /obj/item/rogueweapon/huntingknife/idagger/silver/psydagger, /obj/item/grapplinghook = 1, /obj/item/storage/belt/rogue/pouch/coins/rich = 1)
*/
/obj/item/clothing/gloves/roguetown/chain/blk
		color = CLOTHING_GREY

/obj/item/clothing/under/roguetown/chainlegs/blk
		color = CLOTHING_GREY

/obj/item/clothing/suit/roguetown/armor/plate/blk
		color = CLOTHING_GREY

/obj/item/clothing/shoes/roguetown/boots/armor/blk
		color = CLOTHING_GREY

/mob/living/carbon/human/proc/torture_victim()
	set name = "Extract Confession"
	set category = "Inquisition"
	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	var/obj/item/S = get_inactive_held_item()
	var/found = null
	if(!istype(I) || !ishuman(I.grabbed))
		to_chat(src, span_warning("I don't have a victim in my hands!"))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	if (!H.restrained())
		to_chat(src, span_warning ("My victim needs to be restrained in order to do this!"))
		return
	if(!istype(S, /obj/item/clothing/neck/roguetown/psicross/silver))
		to_chat(src, span_warning("I need to be holding a silver psycross to extract this divination!"))
		return
	for(var/obj/structure/fluff/psycross/N in oview(5, src))
		found = N
	if(!found)
		to_chat(src, span_warning("I need a large psycross structure nearby to extract this divination!"))
	if(!H.stat)
		SEND_SIGNAL(src, COMSIG_TORTURE_PERFORMED, H)
		var/static/list/torture_lines = list(
			"CONFESS!",
			"TELL ME YOUR SECRETS!",
			"SPEAK!",
			"YOU WILL SPEAK!",
			"TELL ME!",
		)

		src.visible_message(span_warning("[src] shoves the silver psycross in [H]'s face!"))
		say(pick(torture_lines), spans = list("torture"))
		H.emote("agony", forced = TRUE)
		H.add_stress(/datum/stressevent/tortured)

		if(!(do_mob(src, H, 10 SECONDS)))
			return

		src.visible_message(span_warning("[src]'s silver psycross abruptly catches flame, burning away in an instant!"))
		H.confess_sins("antag")
		qdel(S)
		return
	to_chat(src, span_warning("This one is not in a ready state to be questioned..."))

/mob/living/carbon/human/proc/faith_test()
	set name = "Test Faith"
	set category = "Inquisition"
	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	var/obj/item/S = get_inactive_held_item()
	var/found = null
	if(!istype(I) || !ishuman(I.grabbed))
		to_chat(src, span_warning("I don't have a victim in my hands!"))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	if (!H.restrained())
		to_chat(src, span_warning ("My victim needs to be restrained in order to do this!"))
		return
	if(!istype(S, /obj/item/clothing/neck/roguetown/psicross/silver))
		to_chat(src, span_warning("I need to be holding a silver psycross to extract this divination!"))
		return
	for(var/obj/structure/fluff/psycross/N in oview(5, src))
		found = N
	if(!found)
		to_chat(src, span_warning("I need a large psycross structure nearby to extract this divination!"))
		return
	if(!H.stat)
		SEND_SIGNAL(src, COMSIG_TORTURE_PERFORMED, H)
		var/static/list/faith_lines = list(
			"DO YOU DENY THE SHEPHERD?",
			"WHO IS YOUR GOD?",
			"ARE YOU FAITHFUL?",
			"WHO IS YOUR SHEPHERD?",
		)

		src.visible_message(span_warning("[src] shoves the silver psycross in [H]'s face!"))
		say(pick(faith_lines), spans = list("torture"))
		H.emote("agony", forced = TRUE)

		if(!(do_mob(src, H, 10 SECONDS)))
			return

		src.visible_message(span_warning("[src]'s silver psycross abruptly catches flame, burning away in an instant!"))
		H.confess_sins("patron")
		H.add_stress(/datum/stressevent/tortured)
		qdel(S)
		return
	to_chat(src, span_warning("This one is not in a ready state to be questioned..."))

/mob/living/carbon/human/proc/confess_sins(confession_type = "antag")
	var/static/list/innocent_lines = list(
		"I AM NO SINNER!",
		"I'M INNOCENT!",
		"I HAVE NOTHING TO CONFESS!",
		"I AM FAITHFUL!",
	)
	var/list/confessions = list()
	switch(confession_type)
		if("patron")
			if(length(patron?.confess_lines))
				confessions += patron.confess_lines
		if("antag")
			for(var/datum/antagonist/antag in mind?.antag_datums)
				if(!length(antag.confess_lines))
					continue
				confessions += antag.confess_lines
	if(length(confessions))
		say(pick(confessions), spans = list("torture"))
		return
	say(pick(innocent_lines), spans = list("torture"))
