/datum/job/roguetown/knight
	title = "Knight" //Back to proper knights.
	f_title = "Dame"
	flag = KNIGHT
	department_flag = GARRISON
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	allowed_races = TRUSTED_CLEARANCE
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "Having proven yourself both loyal and capable, you have been knighted to serve the realm as the royal family's sentry. \
				You listen to your Liege, the Marshal, and the Knight Captain, defending your Lord and realm - the last beacon of chivalry in these dark times."
	selection_color = JCOLOR_SOLDIER	
	display_order = JDO_KNIGHT
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/knight
	advclass_cat_rolls = list(CTAG_ROYALGUARD = 20)

	give_bank_account = 22
	noble_income = 10
	min_pq = 8
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_knight.ogg'

/datum/outfit/job/roguetown/knight
	job_bitflag = BITFLAG_GARRISON

/datum/job/roguetown/knight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "knight's tabard ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Sir"
		if(should_wear_femme_clothes(H))
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

		for(var/X in peopleknowme)
			for(var/datum/mind/MF in get_minds(X))
				if(MF.known_people)
					MF.known_people -= prev_real_name
					H.mind.person_knows_me(MF)

/datum/outfit/job/roguetown/knight
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	gloves = /obj/item/clothing/gloves/roguetown/chain
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black

/datum/outfit/job/roguetown/knight/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNIGHTSMAN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODTRAINER, TRAIT_GENERIC)



/// SCHOOL OF THE LANCE


/datum/advclass/knight/lance
	name = "School of the Lance"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with polearms, along with some familiarity in swords, shields and riding."
	outfit = /datum/outfit/job/roguetown/knight/lance

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/lance/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE) //Polearms are pretty much explicitly a two-handed weapon, so I gave them a polearm option.
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 2, TRUE)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell


	H.change_stat("strength", 3) 
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Halberd","Bardische","Eaglebeak")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Halberd")
			r_hand = /obj/item/rogueweapon/halberd
			backl = /obj/item/gwstrap
		if("Bardische")
			r_hand =  /obj/item/rogueweapon/halberd/bardiche
			backl = /obj/item/gwstrap
		if("Eaglebeak")
			r_hand = /obj/item/rogueweapon/eaglebeak
			backl = /obj/item/gwstrap

	neck = /obj/item/clothing/neck/roguetown/bevor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Etruscan Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan,
		"Slitted Kettle" = /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)


/// SCHOOL OF THE SWORD


/datum/advclass/knight/sword
	name = "School of the Sword"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with swords of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/knight/sword

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/sword/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 2, TRUE)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell


	H.change_stat("strength", 3) 
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Zweihander","Bastard Sword","Steel Greatsword")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Zweihander")
			r_hand = /obj/item/rogueweapon/greatsword/zwei
			backl = /obj/item/gwstrap
		if("Bastard Sword")
			r_hand =  /obj/item/rogueweapon/sword/long
			backl = /obj/item/rogueweapon/shield/heater
		if("Steel Greatsword")
			r_hand = /obj/item/rogueweapon/greatsword
			backl = /obj/item/gwstrap
	
	neck = /obj/item/clothing/neck/roguetown/bevor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Etruscan Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan,
		"Slitted Kettle"	= /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)



/// SCHOOL OF THE AXE


/datum/advclass/knight/axe
	name = "School of the Axe"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with axes of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/knight/axe

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/axe/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 2, TRUE)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell


	H.change_stat("strength", 3) 
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Battle Axe","Steel Great Axe","Great Double-Headed Axe")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Battle Axe")
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			backl = /obj/item/rogueweapon/shield/heater
		if("Steel Great Axe")
			r_hand = /obj/item/rogueweapon/greataxe/steel
			backl = /obj/item/gwstrap
		if("Great Double-Headed Axe")
			r_hand = /obj/item/rogueweapon/greataxe/steel/doublehead
			backl = /obj/item/gwstrap

	neck = /obj/item/clothing/neck/roguetown/bevor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)


/// SCHOOL OF THE MACE


/datum/advclass/knight/mace
	name = "School of the Mace"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with mace, flail hammers, shields and riding."
	outfit = /datum/outfit/job/roguetown/knight/mace

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/mace/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 2, TRUE)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell


	H.change_stat("strength", 3) 
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Goden Mace","Steel Warhammer","Flail")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Goden Mace")
			r_hand = /obj/item/rogueweapon/mace/goden
			backl = /obj/item/gwstrap
		if("Steel Warhammer")
			r_hand = /obj/item/rogueweapon/mace/warhammer/steel
			backl = /obj/item/rogueweapon/shield/heater
		if("Flail")
			r_hand = /obj/item/rogueweapon/flail
			backl = /obj/item/gwstrap

	neck = /obj/item/clothing/neck/roguetown/bevor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)


/// Knight Errant


/datum/advclass/knight/errant
	name = "Knight Errant"
	tutorial = "You're trained to be more versatile than most knights, able to use a variety of weapons and armor at novice levels, and is very good at horse riding.\
				You are a wandering knight, seeking adventure and glory in the name of your lord."
	outfit = /datum/outfit/job/roguetown/knight/errant

	category_tags = list(CTAG_ROYALGUARD)

/datum/outfit/job/roguetown/knight/errant/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 3, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 4, TRUE)	
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 2, TRUE)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell


	H.change_stat("strength", 3) 
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)
	H.change_stat("intelligence", 1)

	H.adjust_blindness(-3)
	var/weapons = list("Sword and Shield", "Bastard Sword", "Recurve Bow", "Crossbow")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Sword and Shield")
			r_hand = /obj/item/rogueweapon/sword
			backl = /obj/item/rogueweapon/shield/heater
		if("Bastard Sword")
			r_hand = /obj/item/rogueweapon/sword/long
		if("Recurve Bow")
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/quiver/arrows
			beltl = /obj/item/rogueweapon/sword/short
		if("Crossbow")
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			backl = /obj/item/quiver/bolts
			beltl = /obj/item/rogueweapon/sword/short

	neck = /obj/item/clothing/neck/roguetown/chaincoif/full
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail,	
		"Steel Curaiss"	= /obj/item/clothing/suit/roguetown/armor/plate/half,
		"Lamellar Armor"	= /obj/item/clothing/suit/roguetown/armor/plate/scale,
		"Hauberk" = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)
