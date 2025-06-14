/datum/advclass/brigand //Strength class, starts with axe or flails and medium armor training
	name = "Brigand"
	tutorial = "Cast from society, you use your powerful physical might and endurance to take from those who are weaker from you."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/brigand
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit_brigand.ogg'

/datum/outfit/job/roguetown/bandit/brigand/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					)
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	neck = /obj/item/clothing/neck/roguetown/coif
	head = /obj/item/clothing/head/roguetown/helmet/leather/wolfhelm
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	id = /obj/item/mattcoin
	H.change_stat("strength", 3) //have you seen this idiot's starting gear and skill spread??
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("intelligence", -1)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.adjust_blindness(-3)
	var/weapons = list("Battleaxe & Cudgel","Flail & Shield")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Battleaxe & Cudgel") //one weapon to hurt people one weapon to kill people
			backl= /obj/item/rogueweapon/stoneaxe/battle
			beltr = /obj/item/rogueweapon/mace/cudgel
		if("Flail & Shield") //plate users beware, you're in for a scare!
			backl= /obj/item/rogueweapon/shield/wood
			beltr = /obj/item/rogueweapon/flail
