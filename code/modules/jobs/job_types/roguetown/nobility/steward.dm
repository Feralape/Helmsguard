/datum/job/roguetown/steward
	title = "Steward"
	f_title = "Stewardess"
	flag = STEWARD
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = NOBLE_RACES_TYPES
	allowed_sexes = list(MALE, FEMALE)
	display_order = NOBLE_RACES_TYPES
	tutorial = "Coin, Coin, Coin! Oh beautiful coin: You're addicted to it, and you hold the position as the Castellan's personal treasurer of both coin and information. You know the power silver and gold has on a man's mortal soul, and you know just what lengths they'll go to in order to get even more. Keep your festering economy alive- for it is the only thing you can weigh any trust into anymore."
	outfit = /datum/outfit/job/roguetown/steward
	give_bank_account = 22
	noble_income = 16
	min_pq = 3 //Please don't give the vault keys to somebody that's going to lock themselves in on accident
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_noble.ogg'

/datum/outfit/job/roguetown/steward
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/roguetown/steward/pre_equip(mob/living/carbon/human/H)
	..()
	if(should_wear_femme_clothes(H))
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/steward
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random	//Added Silk Stockings for the female nobles
	else if(should_wear_masc_clothes(H))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		pants = /obj/item/clothing/under/roguetown/tights/random
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/silktunic
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/plaquegold/steward
	beltr = /obj/item/storage/keyring/sund/sund_steward
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone

/datum/job/roguetown/steward/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

//LORD STEWARD


/datum/advclass/steward/lordsteward
	name = "Lord Steward"
	title = "Lord Steward"
	f_title = "Lady Stewardess"
	tutorial = "You are the Castellan's most trusted advisor, and the steward of his lands.\
				You are responsible for the management of the realm's wealth, overseeing the economy, and ensuring that everything runs smoothly. \
				You are amongst the few literate subjects in the realm able to assess the value of every items with just a glance."
	outfit = /datum/outfit/job/roguetown/lord_steward

	category_tags = list(CTAG_STEWARD)

/datum/outfit/job/roguetown/lord_steward/pre_equip(mob/living/carbon/human/H)
	..()
	var/datum/job/J = SSjob.GetJobType(jobtype)
	if(!J)
		J = SSjob.GetJob(H.job)
	if(H.gender == FEMALE)
		H.virginity = TRUE
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/green
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random	//Added Silk Stockings for the female nobles
	else

		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		pants = /obj/item/clothing/under/roguetown/tights/random

	cloak = /obj/item/clothing/cloak/raincloak/furcloak/purple
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	head = /obj/item/clothing/head/roguetown/chaperon/greyscale
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	backl = /obj/item/storage/backpack/rogue/satchel

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 2, TRUE)	
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("perception", 2)
		H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/storage/keyring/sund/sund_steward)



// BURGMANN

/datum/advclass/burgmann
	name = "Burgmann"
	title = "Burgmann"
	f_title = "Burgfrau"
	allowed_races = NOBLE_RACES_TYPES
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "Sworn to defend the Castellan's lands, you are both warrior and steward, entrusted with the keep’s defense and the care of its arms.\
	 As Burgmann, you wield blade and shield with skill, but your duties extend beyond the battlefield. You are the quartermaster, \
	responsible for ensuring the keep is stocked with weapons, armor, and supplies to face whatever threat may arise. You are moderately literate but can't\
	gauge the value of items as well as the Lord Steward."
	outfit = /datum/outfit/job/roguetown/burgmann

	category_tags = list(CTAG_STEWARD)

/datum/outfit/job/roguetown/burgmann/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/leather
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	backl = /obj/item/storage/backpack/rogue/satchel

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 2, TRUE)	
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

	var/weapons = list("Sword","Mace","Axe")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Sword")
			r_hand = /obj/item/rogueweapon/sword
		if("Mace")
			r_hand = /obj/item/rogueweapon/mace/goden/steel
		if("Axe")
			r_hand = /obj/item/rogueweapon/mace

	var/helmets = list(
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Hardened Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded,
		"Padded Dress" = /obj/item/clothing/suit/roguetown/armor/armordress
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/storage/keyring/sund/sund_steward)



/// MASTER OF COIN

/datum/advclass/mastercoin
	name = "Master of Coin"
	title = "Master of Coin"
	f_title = "Mistress of Coin"
	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "Reserved only for the steadfast dwarves of Sundmark, the Master of Coin is both the keeper and steward of the realm's wealth. \
	Your fingers are as skilled with gold as they are with a crossbow, and your knowledge of coin and trade is unmatched. Despite your impressive skills, \
	you are not a noble, and your authority is limited to the realm's treasury."
	outfit = /datum/outfit/job/roguetown/mastercoin

	category_tags = list(CTAG_STEWARD)

/datum/outfit/job/roguetown/mastercoin/pre_equip(mob/living/carbon/human/H)
	..()
	var/datum/job/J = SSjob.GetJobType(jobtype)
	if(!J)
		J = SSjob.GetJob(H.job)
	if(H.gender == FEMALE)
		H.virginity = TRUE
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/green
		cloak = /obj/item/clothing/cloak/tabard/knight
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random	//Added Silk Stockings for the female nobles
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		pants = /obj/item/clothing/under/roguetown/tights/random
		armor = /obj/item/clothing/cloak/tabard/knight
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	H.verbs |= /mob/living/carbon/human/proc/adjust_taxes

GLOBAL_VAR_INIT(steward_tax_cooldown, -50000) // Antispam
/mob/living/carbon/human/proc/adjust_taxes()
	set name = "Adjust Taxes"
	set category = "Stewardry"
	if(stat)
		return
	var/lord = find_lord()
	if(lord)
		to_chat(src, span_warning("You cannot adjust taxes while the [SSticker.rulertype] is present in the realm. Ask your liege."))
		return
	if(world.time < GLOB.steward_tax_cooldown + 600 SECONDS)
		to_chat(src, span_warning("You must wait [round((GLOB.steward_tax_cooldown + 600 SECONDS - world.time)/600, 0.1)] minutes before adjusting taxes again! Think of the realm."))
		return FALSE
	var/newtax = input(src, "Set a new tax percentage (1-99)", src, SStreasury.tax_value*100) as null|num
	if(newtax)
		if(findtext(num2text(newtax), "."))
			return
		newtax = CLAMP(newtax, 1, 99)
		if(stat)
			return
		SStreasury.tax_value = newtax / 100
		priority_announce("The new tax in Helmsguard shall be [newtax] percent.", "The Steward Meddles", pick('sound/misc/royal_decree.ogg', 'sound/misc/royal_decree2.ogg'), "Captain")
		GLOB.steward_tax_cooldown = world.time
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	head = /obj/item/clothing/head/roguetown/chaperon/greyscale
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	backr = /obj/item/quiver/bolts
	backl = /obj/item/storage/backpack/rogue/satchel
	r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow


	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 3, TRUE)	
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("perception", 2)
		H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/storage/keyring/sund/sund_steward)
