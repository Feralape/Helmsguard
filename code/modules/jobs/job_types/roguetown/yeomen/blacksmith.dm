/*
/datum/job/roguetown/armorsmith
	title = "Armorer"
	flag = ARMORSMITH
	department_flag = TOWNER
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain,\
	/datum/species/demihuman,\
	/datum/species/tieberian,\
	)

	tutorial = "You studied for many decades under your master with a few other apprentices to become an Armorer--a trade that certainly has seen a boom in recent times, with many a bannerlord keenly aware of the importance in maintaining a well-equipped army."

	outfit = /datum/outfit/job/roguetown/armorsmith
//	display_order = JDO_ARMORER
	give_bank_account = 11
	min_pq = 0
	max_pq = null
	round_contrib_points = 3

/datum/outfit/job/roguetown/armorsmith/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/armorsmithing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/smelting, 1, TRUE)
	if(H.gender == FEMALE)
		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/blacksmith
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/storage/keyring/guild
	else if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/storage/keyring/guild
		cloak = /obj/item/clothing/cloak/apron/blacksmith

	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)

/datum/job/roguetown/weaponsmith
	title = "Weaponsmith"
	flag = WEAPONSMITH
	department_flag = TOWNER
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain,\
	/datum/species/demihuman,\
	/datum/species/tieberian,\
	)

	tutorial = "You studied for many decades under your master with a few other apprentices to become a Weaponsmith, a trade that is as ancient as the secrets of steel itself! You've repaired the blades of cooks, the cracked hoes of peasants and greased the spears of many soldiers into war."

	outfit = /datum/outfit/job/roguetown/weaponsmith
//	display_order = JDO_WEAPONSMITH
	give_bank_account = 11
	min_pq = 0
	max_pq = null
	round_contrib_points = 3

/datum/outfit/job/roguetown/weaponsmith/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/smelting, 1, TRUE)
	if(H.gender == FEMALE)
		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/blacksmith
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/storage/keyring/guild
	else if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/storage/keyring/guild
		cloak = /obj/item/clothing/cloak/apron/blacksmith
	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
*/
/datum/job/roguetown/blacksmith
	title = "Blacksmith"
	flag = BLACKSMITH
	department_flag = TOWNER
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_ALL_KINDS
	tutorial = "You've studied for many decades under quite a number of master smiths. Whether it's cookware or tools of war, you're unmatched at the art of bending metal to your will."

	outfit = /datum/outfit/job/roguetown/blacksmith
	display_order = JDO_BLACKSMITH
	give_bank_account = 11
	min_pq = 0
	max_pq = null
	round_contrib_points = 3

/datum/outfit/job/roguetown/blacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/hatfur
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves/blacksmith
	ADD_TRAIT(H, TRAIT_TRAINED_SMITH, TRAIT_GENERIC)
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/blacksmithing, 5, TRUE)
		H.adjust_skillrank(/datum/skill/craft/armorsmithing, 5, TRUE)
		H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 5, TRUE)
		H.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/smelting, 1, TRUE)
	if(H.gender == FEMALE)
		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer/iron = 1, /obj/item/rogueweapon/tongs = 1)
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/blacksmith
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/storage/keyring/guild
	else if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer/iron = 1, /obj/item/rogueweapon/tongs = 1)
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/storage/keyring/guild
		cloak = /obj/item/clothing/cloak/apron/blacksmith

	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
