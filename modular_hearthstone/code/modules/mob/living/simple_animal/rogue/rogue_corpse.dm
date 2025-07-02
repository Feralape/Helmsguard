
/obj/effect/mob_spawn/human/npc
	rot_type = /datum/component/rot/corpse

/obj/effect/mob_spawn/human/npc/orc

	mob_name = "Orc"
	mob_type = /mob/living/carbon/human/species/halforc/orc_raider
	mob_species = /datum/species/halforc
	brute_damage = 80

/obj/effect/mob_spawn/human/npc/orc/corpse/savageorc
	mob_name = "Savage Orc"
	name = "Savage Orc"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/savageorc

/obj/effect/mob_spawn/human/npc/orc/corpse/savageorc2
	mob_name = "Savage Orc"
	name = "Savage Orc"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/savageorc2


/obj/effect/mob_spawn/human/npc/Initialize()
	if(ispath(outfit))
		outfit = new outfit()
	if(!outfit)
		outfit = new /datum/outfit
	return ..()



/datum/outfit/savageorc
	shirt = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	pants =	/obj/item/clothing/under/roguetown/loincloth/brown
	shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets

/datum/outfit/savageorc2
	shirt = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	pants =	/obj/item/clothing/under/roguetown/loincloth/brown
	shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	head = /obj/item/clothing/head/roguetown/helmet/leather

/obj/effect/mob_spawn/human/npc/orc/corpse/orcmarauder
	mob_name = "Orc Marauder"
	name = "Orc Marauder"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/orcmarauder

/datum/outfit/orcmarauder
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants =	/obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
	head = /obj/item/clothing/head/roguetown/helmet/leather

/obj/effect/mob_spawn/human/npc/orc/corpse/orcravager
	mob_name = "Orc Ravager"
	name = "Orc Ravager"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/orcravager

/datum/outfit/orcravager
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants =	/obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	head = /obj/item/clothing/head/roguetown/helmet/skullcap
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	mask = /obj/item/clothing/mask/rogue/skullmask







// GOBLIN
/mob/living/carbon/human/species/goblin/unarmed
	gob_outfit = null
	rot_time = 5 MINUTES
	skeletonize_time = 8 MINUTES // They will skeletonize after 8 minutes, and turn to dust after 10 minutes.
	dust_time = 10 MINUTES  // From rot to dust in the span of 10 minutes.

/mob/living/carbon/human/species/goblin/cave/unarmed
	gob_outfit = null
	rot_time = 5 MINUTES
	skeletonize_time = 8 MINUTES // They will skeletonize after 8 minutes, and turn to dust after 10 minutes.
	dust_time = 10 MINUTES  // From rot to dust in the span of 10 minutes.

/obj/effect/mob_spawn/human/npc/goblin
	rot_type = /datum/component/rot/corpse

/obj/effect/mob_spawn/human/npc/goblin/normal

	mob_name = "goblin"
	mob_type = /mob/living/carbon/human/species/goblin/unarmed
	mob_species = /datum/species/goblin
	brute_damage = 80

/obj/effect/mob_spawn/human/npc/goblin/goblin_cave

	mob_name = "goblin"
	mob_type = /mob/living/carbon/human/species/goblin/cave/unarmed
	mob_species = /datum/species/goblin/cave
	brute_damage = 80

