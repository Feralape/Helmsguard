/datum/job/roguetown/niteman
	title = "Bawdyhouse Master"
	f_title = "Bawdyhouse Mistress"
	flag = NITEMASTER
	department_flag = RABBLE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_ALL_KINDS
	tutorial = "You are renting out the bathhouse in a joint operation with the Innkeep. You provide security for the bathwenches and help them to find work--when you're not being a trouble-making rake that others suffer to tolerate."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/niteman
	display_order = JDO_NITEMASTER
	selection_color = JCOLOR_RABBLE
	give_bank_account = 20
	min_pq = 1
	max_pq = null
	bypass_lastclass = TRUE
	round_contrib_points = 3

/datum/outfit/job/roguetown/niteman/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/lockpick/goldpin/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/purple // Tunics are far swaggier than shirts
	wrists = /obj/item/storage/keyring/sund/sund_bawdymaster
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	pants = /obj/item/clothing/under/roguetown/trou/leather
	beltl = /obj/item/rogueweapon/whip

	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry = 2, /obj/item/reagent_containers/powder/moondust = 2, /obj/item/reagent_containers/powder/spice = 1)
	H.grant_language(/datum/language/thievescant)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CICERONE, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE) // Need the strongarm to wrestle people out of the baths
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE) // Below here are skills bath attendants have. Only makes sense to have them >= for the head honcho
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE) // Being a more rowdy type, they should be capable with a knife
		H.change_stat("strength", 1)
		H.change_stat("intelligence", -1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)

	if(should_wear_masc_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
		H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()
	else if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/armor/armordress/alt
