/mob/living/carbon/human/species/orc/npc
	name = "orc"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	var/orc_outfit = /datum/outfit/job/roguetown/orc/npc

	race = /datum/species/orc
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	faction = list("orcs")
	ambushable = FALSE
	
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	possible_mmb_intents = list(INTENT_STEAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/aimed, /datum/rmb_intent/strong, /datum/rmb_intent/weak, /datum/rmb_intent/swift, /datum/rmb_intent/riposte)
	possible_rmb_intents = list()
	aggressive = 1
	rude = TRUE
	mode = NPC_AI_IDLE
	wander = FALSE
	cmode_music = FALSE

/// ROT STUFF
	rot_type = /datum/component/rot/corpse
	rot_time = 5 MINUTES
	skeletonize_time = 8 MINUTES
	dust_time = 10 MINUTES  // From rot to dust in the span of 10 minutes.

/datum/outfit/job/roguetown/orc/npc/pre_equip(mob/living/carbon/human/H) //gives some default skills and equipment for player controlled orcs
	..()
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	head = /obj/item/clothing/head/roguetown/helmet/leather
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	r_hand = /obj/item/rogueweapon/stoneaxe/boneaxe
	l_hand = /obj/item/rogueweapon/shield/wood

	H.STASTR = 16
	H.STASPD = 6
	H.STACON = 15
	H.STAEND = 15
	H.STAINT = 8

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)

	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)

	H.set_patron(/datum/patron/inhuman/graggar)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/swift,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1)


GLOBAL_LIST_INIT(orcraider_quotes, world.file2list("strings/rt/orcraiderlines.txt"))
GLOBAL_LIST_INIT(orcraider_aggro, world.file2list("strings/rt/orcraideraggrolines.txt"))

/mob/living/carbon/human/species/orc/npc/savage_orc/after_creation()
	. = ..()
	job = "Savage Orc"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/savage_orc)

/datum/outfit/job/roguetown/savage_orc/pre_equip(mob/living/carbon/human/H)



/mob/living/carbon/human/species/orc/npc/orc_raider/after_creation()
	. = ..()
	job = "Orc Raider"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/orc_raider)

/datum/outfit/job/roguetown/orc_raider/pre_equip(mob/living/carbon/human/H)
	if(prob(20))
		wrists = /obj/item/clothing/wrists/roguetown/bracers
	if(prob(70))
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	if(prob(60))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	pants =	/obj/item/clothing/under/roguetown/tights/vagrant
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/leather
	else
		head = /obj/item/clothing/head/roguetown/helmet/horned
	if(prob(40))
		mask = /obj/item/clothing/mask/rogue/skullmask
	if(prob(10))
		r_hand = /obj/item/rogueweapon/spear/improvisedbillhook
	else
		r_hand = /obj/item/rogueweapon/stoneaxe/battle
	if(prob(20))
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	else
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	neck = /obj/item/clothing/neck/roguetown/skullamulet
	H.STASTR = rand(14,16)
	H.STASPD = rand(10,11)
	H.STACON = rand(7,10)
	H.STAEND = rand(11,14)
	H.STAINT = rand(3,4)
	H.name = pick( world.file2list("strings/rt/names/other/halforcm.txt") )
	H.real_name = H.name
	H.gender = MALE
