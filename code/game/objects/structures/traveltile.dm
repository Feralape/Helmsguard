
/obj/structure/fluff/testportal
	name = "portal"
	icon_state = "shitportal"
	icon = 'icons/roguetown/misc/structure.dmi'
	density = FALSE
	anchored = TRUE
	layer = BELOW_MOB_LAYER
	max_integrity = 0
	var/aportalloc = "a"

/obj/structure/fluff/testportal/Initialize()
	name = aportalloc
	..()

/obj/structure/fluff/testportal/attack_hand(mob/user)
	var/fou
	for(var/obj/structure/fluff/testportal/T in shuffle(GLOB.testportals))
		if(T.aportalloc == aportalloc)
			if(T == src)
				continue
			to_chat(user, "<b>I teleport to [T].</b>")
			playsound(src, 'sound/misc/portal_enter.ogg', 100, TRUE)
			user.forceMove(T.loc)
			fou = TRUE
			break
	if(!fou)
		to_chat(user, "<b>There is no portal connected to this. Report it as a bugs.</b>")
	. = ..()


/obj/structure/fluff/traveltile
	name = "travel"
	icon_state = "travel"
	icon = 'icons/turf/roguefloor.dmi'
	density = FALSE
	anchored = TRUE
	layer = ABOVE_OPEN_TURF_LAYER
	max_integrity = 0
	var/aportalid = "REPLACETHIS"
	var/aportalgoesto = "REPLACETHIS"
	var/aallmig
	var/required_trait = null

/obj/structure/fluff/traveltile/Initialize()
	GLOB.traveltiles += src
	. = ..()

/obj/structure/fluff/traveltile/Destroy()
	GLOB.traveltiles -= src
	. = ..()

/obj/structure/fluff/traveltile/attack_ghost(mob/dead/observer/user)
	if(!aportalgoesto)
		return
	var/fou
	for(var/obj/structure/fluff/traveltile/T in shuffle(GLOB.traveltiles))
		if(T.aportalid == aportalgoesto)
			if(T == src)
				continue
			user.forceMove(T.loc)
			fou = TRUE
			break
	if(!fou)
		to_chat(user, "<b>It is a dead end.</b>")


/obj/structure/fluff/traveltile/attack_hand(mob/user)
	var/fou
	if(!aportalgoesto)
		return
	for(var/obj/structure/fluff/traveltile/T in shuffle(GLOB.traveltiles))
		if(T.aportalid == aportalgoesto)
			if(T == src)
				continue
			if(!can_go(user))
				return
			if(user.pulledby)
				return
			to_chat(user, "<b>I begin to travel...</b>")
			if(do_after(user, 50, needhand = FALSE, target = src))
				var/mob/living/L = user
				var/atom/movable/pullingg = L.pulling
				L.recent_travel = world.time
				if(pullingg)
					pullingg.recent_travel = world.time
					pullingg.forceMove(T.loc)
				L.forceMove(T.loc)
				if(pullingg)
					L.start_pulling(pullingg, supress_message = TRUE)
			fou = TRUE
			break
	if(!fou)
		to_chat(user, "<b>It is a dead end.</b>")
	. = ..()

/obj/structure/fluff/traveltile/proc/can_go(atom/movable/AM)
	. = TRUE
	if(AM.recent_travel)
		if(world.time < AM.recent_travel + 15 SECONDS)
			. = FALSE
	if(. && required_trait && isliving(AM))
		var/mob/living/L = AM
		if(HAS_TRAIT(L, required_trait))
			for(var/mob/living/carbon/human/H in hearers(6,src))
				if(istype(H.head, /obj/item/storage/roguebag))
					return
				if(!HAS_TRAIT(H, required_trait))
					to_chat(H, "<b>I discover a well hidden entrance</b>")
					ADD_TRAIT(H, required_trait, TRAIT_GENERIC)
			return TRUE
		else
			to_chat(L, "<b>It is a dead end.</b>")
			return FALSE

/atom/movable
	var/recent_travel = 0

/obj/structure/fluff/traveltile/Crossed(atom/movable/AM)
	. = ..()
	var/fou
	if(!aportalgoesto)
		return
	if(!isliving(AM))
		return
	for(var/obj/structure/fluff/traveltile/T in shuffle(GLOB.traveltiles))
		if(T.aportalid == aportalgoesto)
			if(T == src)
				continue
			if(!can_go(AM))
				return
			if(AM.pulledby)
				return
			to_chat(AM, "<b>I begin to travel...</b>")
			if(do_after(AM, 50, needhand = FALSE, target = src))
				if(!can_go(AM))
					return
				var/mob/living/L = AM
				var/atom/movable/pullingg = L.pulling
				L.recent_travel = world.time
				if(pullingg)
					pullingg.recent_travel = world.time
					pullingg.forceMove(T.loc)
				L.forceMove(T.loc)
				if(pullingg)
					L.start_pulling(pullingg, supress_message = TRUE)
			fou = TRUE
			break
	if(!fou)
		to_chat(AM, "<b>It is a dead end.</b>")

/obj/structure/fluff/traveltile/bandit
	required_trait = TRAIT_BANDITCAMP
/obj/structure/fluff/traveltile/vampire
	required_trait = TRAIT_VAMPMANSION
/obj/structure/fluff/traveltile/wretch
	required_trait = TRAIT_HERESIARCH //I'd tie this to trait_outlaw but unfortunately the heresiarch virtue exists so we're making a new trait instead.
/obj/structure/fluff/traveltile/dungeon
	name = "gate"
	desc = "This gate's enveloping darkness is so opressive you dread to step through it."
	icon = 'icons/roguetown/misc/portal.dmi'
	icon_state = "portal"
	density = FALSE
	anchored = TRUE
	max_integrity = 0
	bound_width = 96
	appearance_flags = NONE
	opacity = FALSE


/// THE MIST TRAVEL TILE

/obj/structure/travel_mist
	name = "shimmering mist"
	desc = "A shimmering mist that seems to beckon you to step through it."
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"

/obj/structure/mist_destination
	name = "mist destination"
	icon = 'icons/effects/effects.dmi'
	icon_state = ""
	nomouseover = TRUE
	anchored = TRUE
	density = FALSE

/obj/structure/travel_mist/Crossed(mob/living/player)
	var/choices = list("Yes", "No")
	var/warning = input("Once crossed, thou shalt not return...", "Proceed?") in choices
	switch(warning)
		if("Yes")
			to_chat(player, "<b>You begin to cross the mist...</b>")
			if(do_after(player, 50, needhand = FALSE, target = src))
				teleport(player)
		if("No")
			return

/obj/structure/travel_mist/proc/teleport(mob/living/player)
	var/list/dests = list()
	for(var/obj/structure/mist_destination/dest in world)
		dests += dest
	if(dests.len)
		var/obj/structure/mist_destination/target = pick(dests)
		playsound(player, 'sound/magic/shadowstep.ogg', 100, TRUE)
		player.forceMove(target.loc)
		player.Knockdown(2 SECONDS)
		to_chat(player, "<b>You awake in a place so familiar yet so strange...</b>")
