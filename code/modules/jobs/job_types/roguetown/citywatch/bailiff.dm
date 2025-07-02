/datum/job/roguetown/bailiff // A somewhat ham-fisted merge between bailiff and the old town sheriff role. The latter was built like a modern day officer, but we medieval in this bitch!
	title = "Bailiff"
	flag = BAILIFF
	department_flag = CITYWATCH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = TRUSTED_CLEARANCE
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	display_order = JDO_BAILIFF
	selection_color = JCOLOR_MERCENARY
	tutorial = "You are the leader of the city's watch, your duty is to train and manage the city's watchmen on top of enforcing the Castellan's laws. You also rent or sell the city's smaller homes and use the funds to pay your men, or yourself."

	whitelist_req = FALSE

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/guard) // /obj/effect/proc_holder/spell/self/convertrole/bog
	outfit = /datum/outfit/job/roguetown/marshal

	give_bank_account = 40
	noble_income = 20
	min_pq = 8
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_guard.ogg'
	advclass_cat_rolls = list (CTAG_MARSHAL = 20)

/datum/outfit/job/roguetown/marshal
	job_bitflag = BITFLAG_ROYALTY | BITFLAG_GARRISON	//Same as Captain, you get decent combat stats so might as well be garrison.

/datum/outfit/job/roguetown/marshal/pre_equip(mob/living/carbon/human/H)
	..() 
	head = /obj/item/clothing/head/roguetown/helmet/sallet
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/bailiff
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/red
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	backr = /obj/item/rogueweapon/shield/buckler	
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/mace/cudgel
	beltl = /obj/item/rogueweapon/sword
	belt = /obj/item/storage/belt/rogue/leather/black
	gloves = /obj/item/clothing/gloves/roguetown/angle
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	id = /obj/item/scomstone/garrison
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/storage/keyring/sund/sund_bailiff = 1, /obj/item/war_horn/human = 1)
	if(H.mind)
		
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/slings, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 4, TRUE)
		H.change_stat("strength", 2) //important leadership role, but SHOULDN'T be frontlining
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
		H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/living/carbon/human/proc/request_law, /mob/living/carbon/human/proc/request_law_removal, /mob/living/carbon/human/proc/request_purge)

/mob/living/carbon/human/proc/request_law()
	set name = "Request Law"
	set category = "Voice of Command"
	if(stat)
		return
	var/inputty = input("Write a new law", "BAILIFF") as text|null
	if(inputty)
		if(hasomen(OMEN_NOLORD))
			make_law(inputty)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_law_requested), src, lord, inputty)
			else
				make_law(inputty)

/mob/living/carbon/human/proc/request_law_removal()
	set name = "Request Law Removal"
	set category = "Voice of Command"
	if(stat)
		return
	var/inputty = input("Remove a law", "BAILIFF") as text|null
	var/law_index = text2num(inputty) || 0
	if(law_index && GLOB.laws_of_the_land[law_index])
		if(hasomen(OMEN_NOLORD))
			remove_law(law_index)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_law_removal_requested), src, lord, law_index)
			else
				remove_law(law_index)

/mob/living/carbon/human/proc/request_purge()
	set name = "Request Purge"
	set category = "Voice of Command"
	if(stat)
		return
	if(hasomen(OMEN_NOLORD))
		purge_laws()
	else
		var/lord = find_lord()
		if(lord)
			INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_purge_requested), src, lord)
		else
			purge_laws()

/mob/living/carbon/human/proc/request_outlaw()
	set name = "Request Outlaw"
	set category = "Voice of Command"
	if(stat)
		return
	var/inputty = input("Outlaw a person", "BAILIFF") as text|null
	if(inputty)
		if(hasomen(OMEN_NOLORD))
			make_outlaw(inputty)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_outlaw_requested), src, lord, inputty)
			else
				make_outlaw(inputty)

/proc/find_lord(required_stat = CONSCIOUS)
	var/mob/living/lord
	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(!H.mind || H.job != "Lord Castellan" || (H.stat > required_stat))
			continue
		lord = H
		break
	return lord

/proc/lord_law_requested(mob/living/bailiff, mob/living/carbon/human/lord, requested_law)
	var/choice = alert(lord, "The bailiff requests a new law!\n[requested_law]", "BAILIFF LAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(bailiff)
			to_chat(span_warning("The lord has denied the request for a new law!"))
		return
	make_law(requested_law)

/proc/lord_law_removal_requested(mob/living/bailiff, mob/living/carbon/human/lord, requested_law)
	if(!requested_law || !GLOB.laws_of_the_land[requested_law])
		return
	var/choice = alert(lord, "The bailiff requests the removal of a law!\n[GLOB.laws_of_the_land[requested_law]]", "BAILIFF LAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(bailiff)
			to_chat(span_warning("The lord has denied the request for a law removal!"))
		return
	remove_law(requested_law)

/proc/lord_purge_requested(mob/living/bailiff, mob/living/carbon/human/lord)
	var/choice = alert(lord, "The bailiff requests a purge of all laws!", "BAILIFF PURGE REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(bailiff)
			to_chat(span_warning("The lord has denied the request for a purge of all laws!"))
		return
	purge_laws()

/proc/lord_outlaw_requested(mob/living/bailiff, mob/living/carbon/human/lord, requested_outlaw)
	var/choice = alert(lord, "The bailiff requests to outlaw someone!\n[requested_outlaw]", "BAILIFF OUTLAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(bailiff)
			to_chat(span_warning("The lord has denied the request for declaring an outlaw!"))
		return
	make_outlaw(requested_outlaw)

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")
