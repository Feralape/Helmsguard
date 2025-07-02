/datum/job/roguetown/dungeoneer
	title = "Dungeoneer"
	flag = DUNGEONEER
	department_flag = COURTIERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = TOLERATED_CLEARANCE
	allowed_sexes = list(MALE, FEMALE)

	display_order = JDO_DUNGEONEER
	selection_color = JCOLOR_COURTIER
	tutorial = "Be you an instrument of sadism for the Lord Castellan or the guarantor of his merciful hospitality, your duties are a service paid for most handsomely. Perhaps you were promoted from the garrison down to these cells to get your brutality off the town streets where cracked skulls caused outcries, or maybe your soft-hearted lord wanted to be sure his justice was done without malice by a faithful servant. In either case, your little world is the lowest office in the Realm; from it your guests see only hell."
	announce_latejoin = FALSE
	outfit = /datum/outfit/job/roguetown/dungeoneer
	give_bank_account = 25
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_dungeoneer.ogg'

/datum/job/roguetown/dungeoneer/New()
	. = ..()
	peopleknowme = list()
	for(var/X in GLOB.garrison_positions)
		peopleknowme += X
	for(var/X in GLOB.noble_positions)
		peopleknowme += X
	for(var/X in GLOB.courtier_positions)
		peopleknowme += X

/datum/outfit/job/roguetown/dungeoneer
	job_bitflag = BITFLAG_GARRISON

/datum/outfit/job/roguetown/dungeoneer/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
	shoes = /obj/item/clothing/shoes/roguetown/boots
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/councillor//Just so I don't have to make another subtype just for it to start black.
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/whip/antique
	beltl = /obj/item/storage/keyring/sund/sund_gate
	backr = /obj/item/storage/backpack/rogue/satchel/black
	id = /obj/item/scomstone/bad/garrison
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 2, /obj/item/flashlight/flare/torch/lantern = 1)//No armoury access
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE) //hilarious
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/traps, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	//Torture victim is for inquisition - doesn't even work without a psicross anymore so maybe come up with a variant for him specifically?
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DUNGEONMASTER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)
	switch(H.patron?.type)
		if(/datum/patron/divine/necra)
			head = /obj/item/clothing/head/roguetown/necrahood
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		else
			cloak = /obj/item/clothing/cloak/stabard/dungeon
			head = /obj/item/clothing/head/roguetown/menacing
