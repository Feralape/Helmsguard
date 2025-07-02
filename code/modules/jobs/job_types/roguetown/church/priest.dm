/datum/job/roguetown/priest
	title = "Priest"
	f_title = "Priestess"
	flag = PRIEST
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_CHURCH
	f_title = "Priestess"
	allowed_races = TOLERATED_CLEARANCE	// Being a nominally human city the priest should reflect that. 
	allowed_patrons = list(/datum/patron/old_god)	// Must be Shepherdist.
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "To guide the Flock in green pastures is a fair thing, to Shepherd them through bitter winters is fairer still. You encourage the wavering and temper the vengeful, always seeking to guide both high and low-born to fix their attention on the good and the beautiful."
	whitelist_req = FALSE

	spells = list(/obj/effect/proc_holder/spell/invoked/cure_rot, /obj/effect/proc_holder/spell/self/convertrole/monk)
	outfit = /datum/outfit/job/roguetown/priest

	display_order = JDO_PRIEST
	give_bank_account = 115
	min_pq = 5 // You should know the basics of things if you're going to lead the town's entire religious sector
	max_pq = null
	round_contrib_points = 3

/datum/outfit/job/roguetown/priest
	allowed_patrons = list(/datum/patron/old_god)	// Must be Shepherdist.

/datum/outfit/job/roguetown/priest/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	head = /obj/item/clothing/head/roguetown/priestmask
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	beltl = /obj/item/storage/keyring/sund/sund_priest
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/active/nomag
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/priest
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/needle/pestra = 1,
		/obj/item/natural/worms/leech/cheele = 1
	)
	ADD_TRAIT(H, TRAIT_CHOSEN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
	if(H.mind)
		H.cmode_music = 'sound/music/combat_holy.ogg' 
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/alchemy, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -1)
	var/datum/devotion/C = new /datum/devotion(H, H.patron) // This creates the cleric holder used for devotion spells
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

	H.verbs |= /mob/living/carbon/human/proc/coronate_lord
	H.verbs |= /mob/living/carbon/human/proc/churchexcommunicate
	H.verbs |= /mob/living/carbon/human/proc/churchannouncement

/mob/living/carbon/human/proc/coronate_lord()
	set name = "Coronate"
	set category = "Priest"
	if(!mind)
		return
	if(!istype(get_area(src), /area/rogue/indoors/sund/church/interior/cathedral))
		to_chat(src, span_warning("I need to do this in the cathedral."))
		return FALSE
	for(var/mob/living/carbon/human/HU in get_step(src, src.dir))
		if(!HU.mind)
			continue
		if(HU.mind.assigned_role == "Lord Castellan")
			continue
		if(!HU.head)
			continue
		if(!istype(HU.head, /obj/item/clothing/head/roguetown/crown/serpcrown))
			continue

		//Abdicate previous King
		for(var/mob/living/carbon/human/HL in GLOB.human_list)
			if(HL.mind)
				if(HL.mind.assigned_role == "Lord Castellan" || HL.mind.assigned_role == "Lord Consort")
					HL.mind.assigned_role = "Towner" //So they don't get the innate traits of the king
			//would be better to change their title directly, but that's not possible since the title comes from the job datum
			if(HL.job == "Lord Castellan")
				HL.job = "Lord Castellan Emeritus"
			if(HL.job == "Lord Consort")
				HL.job = "Lord Castellan Dowager"

		//Coronate new King (or Queen)
		HU.mind.assigned_role = "Lord Castellan"
		HU.job = "Lord Castellan"
		if(should_wear_femme_clothes(HU))
			SSticker.rulertype = "Lady Castellan"
		else
			SSticker.rulertype = "Lord Castellan"
		SSticker.rulermob = HU
		SSticker.regentmob = null
		var/dispjob = mind.assigned_role
		removeomen(OMEN_NOLORD)
		say("By the authority of the Church, I pronounce you Ruler of all Sundmark!")
		priority_announce("[real_name] the [dispjob] has named [HU.real_name] the inheritor of SUNDMARK!", title = "Long Live [HU.real_name]!", sound = 'sound/misc/bell.ogg')

/mob/living/carbon/human/proc/churchexcommunicate()
	set name = "Curse"
	set category = "Priest"
	if(stat)
		return
	var/inputty = input("Curse someone... (curse them again to remove it)", "Sinner Name") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/sund/church/interior/cathedral))
			to_chat(src, span_warning("I need to do this from the cathedral."))
			return FALSE
		if(inputty in GLOB.excommunicated_players)
			GLOB.excommunicated_players -= inputty
			priority_announce("[real_name] has forgiven [inputty]. Once more walk in the light!", title = "Forgiveness!", sound = 'sound/misc/bell.ogg')
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.real_name == inputty)
					H.remove_stress(/datum/stressevent/psycurse)
			return
		var/found = FALSE
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H == src)
				continue
			if(H.real_name == inputty)
				found = TRUE
				H.add_stress(/datum/stressevent/psycurse)
		if(!found)
			return FALSE
		GLOB.excommunicated_players += inputty
		priority_announce("[real_name] has banished [inputty] from the Flock for offending the church!", title = "SHAME", sound = 'sound/misc/excomm.ogg')

/mob/living/carbon/human/proc/churchannouncement()
	set name = "Announcement"
	set category = "Priest"
	if(stat)
		return
	var/inputty = input("Make an announcement", "ROGUETOWN") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/sund/church/interior/cathedral))
			to_chat(src, span_warning("I need to do this from the cathedral."))
			return FALSE
		priority_announce("[inputty]", title = "The Priest Speaks", sound = 'sound/misc/bell.ogg', sender = src)

/obj/effect/proc_holder/spell/self/convertrole/knight_hospitaler
	name = "Recruit Knight Hospitaler"
	new_role = "Knight Hospitaler"
	overlay_state = "recruit_templar"
	recruitment_faction = "Templars"
	recruitment_message = "Rise as a Knight of the Hospital, %RECRUIT!"
	accept_message = "By the Shepherd's Will!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/hospitaler_sergeant
	name = "Recruit Hospitaler Sergeant"
	new_role = "Hospitaler Sergeant"
	overlay_state = "recruit_templar"
	recruitment_faction = "Templars"
	recruitment_message = "Pledge thy sword to the Hospital, %RECRUIT!"
	accept_message = "By the Shepherd's Will!"
	refuse_message = "I refuse."


/obj/effect/proc_holder/spell/self/convertrole/monk
	name = "Recruit Disciple"
	new_role = "Monk"
	overlay_state = "recruit_acolyte"
	recruitment_faction = "Church"
	recruitment_message = "Serve the Flock, %RECRUIT!"
	accept_message = "For the Lamb!"
	refuse_message = "I refuse."
