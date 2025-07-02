/datum/advclass/sellsword //Strength class, starts with axe or flails and medium armor training
	name = "Sellsword"
	tutorial = "Perhaps a mercenary, perhaps a deserter - at one time, you killed for a master in return for gold. Now you live with no such master over your head - and take what you please."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/sellsword
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit2.ogg'

/datum/outfit/job/roguetown/bandit/sellsword/pre_equip(mob/living/carbon/human/H)
	..()
	if (!(istype(H.patron, /datum/patron/inhumen/zizo) || istype(H.patron, /datum/patron/inhumen/matthios) || istype(H.patron, /datum/patron/inhumen/graggar) || istype(H.patron, /datum/patron/inhumen/baotha)))
		to_chat(H, span_warning("My former deity has abandoned me.. Matthios is my new master."))
		H.set_patron(/datum/patron/inhumen/matthios)	//We allow other heretics into the cool-kids club, but if you are a tennite/psydonian it sets you to matthiosan.
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					)
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	id = /obj/item/mattcoin
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 2)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.adjust_blindness(-3)
	var/weapons = list("Spear & Crossbow","Sword & Buckler")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Spear & Crossbow") //Deserter watchman. Maybe should be shield and spear? spear and crossbow is kinda clumsy
			backl= /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow //we really need to make this not a grenade launcher subtype
			beltr = /obj/item/quiver/bolts
			r_hand = /obj/item/rogueweapon/spear/billhook
			head = /obj/item/clothing/head/roguetown/helmet/kettle
		if("Sword & Buckler") //Mercenary on the wrong side of the law
			backl= /obj/item/rogueweapon/shield/buckler
			beltr = /obj/item/rogueweapon/sword/iron 
			head = /obj/item/clothing/head/roguetown/helmet/sallet
