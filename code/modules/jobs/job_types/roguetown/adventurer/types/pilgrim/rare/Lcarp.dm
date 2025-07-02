/*//human master carpenter

/datum/advclass/masterlaborer
	name = "Master Laborer"
	tutorial = "A master carpenter, unlike the masons you went to discover the secrets of the wood. \
	The elves, created by Dendor ,who taught you how to transform the wood into anything you wish, \
	but you swore to chop down trees only when it is necessary."
	
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/masterlaborer
	category_tags = list(CTAG_TOWNER)
	maximum_possible_slots = 1
	pickprob = 5
	
/datum/outfit/job/roguetown/adventurer/masterlaborer/pre_equip(mob/living/carbon/human/H)
	..()
	
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE) // They use hammers, sawes and axes all day.
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE) 
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE) 
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE) 
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE) // They work at great heights.
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/mining, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/traps, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		pants = null
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/hammer/steel
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/rogueweapon/huntingknife = 1,
						/obj/item/flashlight/flare/torch = 1,
						)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", 1)
	H.change_stat("speed", -1)
*/
