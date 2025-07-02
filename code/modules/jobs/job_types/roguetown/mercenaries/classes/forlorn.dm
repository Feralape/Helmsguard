/datum/advclass/mercenary/forlorn
	name = "Forlorn Hope Mercenary"
	tutorial = "The Order of the Forlorn Hope, a order formed off the back of a Ranesheni slave revolt. Drawing from all walks of life, this mercenary company now takes ranks from both purchased and liberated slaves. Coin is power, and power is the path to freedom."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/forlorn
	min_pq = 2
	cmode_music = 'sound/music/combat_blackstar.ogg'
	traits_applied = list(TRAIT_OUTLANDER)
//	category_tags = list(CTAG_MERCENARY)

/datum/outfit/job/roguetown/mercenary/forlorn/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
	head = /obj/item/clothing/head/roguetown/helmet/heavy/wolfplate
	pants = /obj/item/clothing/under/roguetown/tights/black
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/rogueweapon/mace/warhammer/steel
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/shield/heater
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1)

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 3) // tuff boys
		H.change_stat("constitution", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
