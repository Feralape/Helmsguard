/datum/advclass/sfighter
	name = Vagrant"
	tutorial = "Wandering peasants, milita, deserters... many and varied folk turn to the path of the vagrant. Very few meet anything greater than the bottom of a tankard or the wrong end of a noose."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_OUTLANDER)
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	classes = list("Battlemaster" = "You are a seasoned weapon specialist, clad in maille, with years of experience in warfare and battle under your belt.",
					"Duelist"= "You are an esteemed swordsman who foregoes armor in exchange for a more nimble fighting style.",
					"Barbarian" = "You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling.",
					"Monster Hunter" = "You specialize in hunting down monsters and the undead, carrying two blades - one of silver, one of steel.",
					"Flagellant" = "You are a pacifistic warrior who embraces suffering, believing pain is the path to enlightenment. You take the suffering of others upon yourself.")


/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	shoes = /obj/item/clothing/shoes/roguetown/boots
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/rogueweapon/shield/wood
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	var/armortype = pickweight(list("Straw" = 6, "Gambeson" = 3, "Helm" = 1)) // At best they can get an iron helmet and gambeson
	var/weapontype = pickweight(list("Pitchfork" = 3, "Spear" = 1, "Messer" = 3, "Longsword" = 1)) // Rolls for various weapons, all of them bad
	switch(armortype)
		if("Straw")
			if(prob(50))
				gloves = /obj/item/clothing/gloves/roguetown/fingerless
			if(prob(33))
				head = /obj/item/clothing/head/roguetown/strawhat
			if(prob(33))
				head = /obj/item/clothing/head/roguetown/hatfur
			else
				head = /obj/item/clothing/head/roguetown/hatblu
			if(prob(50))
				shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
			else
				shoes = /obj/item/clothing/shoes/roguetown/shortboots
			if(prob(50))
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			else
				shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
			if(prob(50))
				pants = /obj/item/clothing/under/roguetown/tights/random
			else
				pants = /obj/item/clothing/under/roguetown/trou/leathertights
		if("Gambeson")
			pants = /obj/item/clothing/under/roguetown/tights/random
			if(prob(50))
				armor = /obj/item/clothing/suit/roguetown/armor/gambeson
			else
				armor = /obj/item/clothing/suit/roguetown/armor/gambeson/light
			if(prob(33))
				head = /obj/item/clothing/head/roguetown/strawhat
			if(prob(33))
				head = /obj/item/clothing/head/roguetown/hatfur
			else
				head = /obj/item/clothing/head/roguetown/hatblu
			if(prob(33))
				shoes = /obj/item/clothing/gloves/roguetown/leather
			else
				shoes = /obj/item/clothing/shoes/roguetown/boots
			if(prob(33))
				shoes = /obj/item/clothing/shoes/roguetown/shortboots
			if(prob(50))
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			else
				shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
			if(prob(33))
				gloves = /obj/item/clothing/gloves/roguetown/leather
			else
				gloves = /obj/item/clothing/gloves/roguetown/fingerless
			if(prob(50))
				backr = /obj/item/rogueweapon/shield/wood
		if("Helm") // Big roller gets a helmet too, how lucky
			pants = /obj/item/clothing/under/roguetown/tights/random
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson
			backr = /obj/item/rogueweapon/shield/wood
			if(prob(50))
				gloves = /obj/item/clothing/gloves/roguetown/leather
			else
				gloves = /obj/item/clothing/gloves/roguetown/leather/black
			if(prob(50))
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			else
				shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
			if(prob(50))
				head = /obj/item/clothing/head/roguetown/helmet/nasal
			else
				head = /obj/item/clothing/head/roguetown/helmet/kettle
			if(prob(50))
				shoes = /obj/item/clothing/shoes/roguetown/boots
			else
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	switch(weapontype) // We get +1 weapon skill in either axes/maces, swords, or flails depending on our starting weapon
		if("Pitchfork")
			backl = /obj/item/rogueweapon/pitchfork
			H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.change_stat("strength", 1)
		if("Spear")
			backl = /obj/item/rogueweapon/polearm/spear
			H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		if("Messer")
			beltl = /obj/item/rogueweapon/sword/iron/messer
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.change_stat("strength", 1)
		if("Sword")
			backl = /obj/item/rogueweapon/sword/iron
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)


	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", -1) // Muscle brains
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // MEDIUM armor training to not gimp them TOO MUCH
