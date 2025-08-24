/obj/item/gun/proc/get_firearms_skill(mob/living/user)
	if(user.mind)
		return user.get_skill_level(/datum/skill/combat/firearms)
	else
		return 0

/obj/item/gun/ballistic/proc/get_spread_amount(mob/living/user)
	var/skill_level = get_firearms_skill(user)
	if(skill_level >= 5)
		return 5
	else if(skill_level >= 3)
		return 10
	else if(skill_level >= 1)
		return 20
	if(!skill_level)
		return 20

/obj/item/gun/ballistic/proc/get_click_speed(mob/living/user)
	var/skill_level = get_firearms_skill(user)
	if(skill_level >= 5)
		return 6
	else if(skill_level >= 3)
		return 8
	else if(skill_level >= 1)
		return 10
	if(!skill_level)
		return 10
