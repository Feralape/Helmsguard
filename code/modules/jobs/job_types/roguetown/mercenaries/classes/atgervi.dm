/datum/advclass/mercenary/atgervi
	name = "Nordman"
	tutorial = "Fear. What more can you feel when a stranger tears apart your friend with naught but hand and maw? What more can you feel when your warriors fail to slay an invader? What more could you ask for, when hiring a mercenary?"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/atgervi
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)
	classes = list("Varangian" = "You are a Varangian of the Gronn Highlands. Warrior-Traders whose exploits into the Raneshen Empire will be forever remembered by historians.",
					"Shaman" = "You are a Shaman of the Northern Empty. Savage combatants who commune with their gods through gut-wrenching violence, rather than idle prayer.")

/datum/outfit/job/roguetown/mercenary/atgervi
	allowed_patrons = ALL_INHUMEN_PATRONS

/datum/outfit/job/roguetown/mercenary/atgervi/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Varangian","Shaman")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Varangian")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Varangian of the Gronn Highlands. Warrior-Traders whose exploits into the Raneshen Empire will be forever remembered by historians."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

			H.change_stat("strength", 2)
			H.change_stat("endurance", 3)
			H.change_stat("constitution", 3)
			H.change_stat("perception", 1)
			H.change_stat("speed", -1)

			head = /obj/item/clothing/head/roguetown/helmet/bascinet/nordman
			gloves = /obj/item/clothing/gloves/roguetown/angle/nordman
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/nordman
			pants = /obj/item/clothing/under/roguetown/trou/leather/nordman
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/nordman
			backr = /obj/item/rogueweapon/shield/atgervi
			backl = /obj/item/storage/backpack/rogue/satchel/black
			beltr = /obj/item/rogueweapon/stoneaxe/woodcut/steel/atgervi
			belt = /obj/item/storage/belt/rogue/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/flashlight/flare/torch

			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_vagarian.ogg'
		if("Shaman")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Shaman of the Northern Empty. Savage combatants who commune with their gods through gut-wrenching violence, rather than idle prayer."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)

			H.change_stat("strength", 3)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			H.change_stat("intelligence", -1)
			H.change_stat("perception", -1)
			H.change_stat("speed", 1)

			head = /obj/item/clothing/head/roguetown/helmet/leather/saiga/nordman
			gloves = /obj/item/clothing/gloves/roguetown/plate/nordman
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/nordman
			pants = /obj/item/clothing/under/roguetown/trou/leather/nordman
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/nordman
			backr = /obj/item/storage/backpack/rogue/satchel/black
			belt = /obj/item/storage/belt/rogue/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/flashlight/flare/torch

			ADD_TRAIT(H, TRAIT_STRONGBITE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC) //No weapons. Just beating them to death as God intended.
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) //Their entire purpose is to rip people apart with their hands and teeth. I don't think they'd be too preturbed to see someone lose a limb.
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC) //Either no armor, or light armor.
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_shaman.ogg'

	H.grant_language(/datum/language/gronnic)
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1)

