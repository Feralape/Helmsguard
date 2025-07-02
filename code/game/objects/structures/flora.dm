/obj/structure/flora
	resistance_flags = FLAMMABLE
	max_integrity = 150
	anchored = TRUE

/obj/structure/flora/Initialize()
	. = ..()
	if(isclosedturf(loc))
		return INITIALIZE_HINT_QDEL

/obj/structure/flora/rogueflora
    icon = 'modular_stonehedge/herbology.dmi'

/obj/structure/flora/rogueflora/wormwood
	name = "wormwood"
	desc = "A bitter herb known for being an ingredient in herbology."
	icon_state = "Wormwoodbush"

/obj/structure/flora/rogueflora/marigold
	name = "marigold"
	desc = "A beautiful plant with large, fully double flowers in yellow."
	icon_state = "Marigoldbush"

/obj/structure/flora/rogueflora/nettles
	name = "nettle"
	desc = "A herbaceous plant with jagged leaves and stinging hairs."
	icon_state = "Nettlesbush"

/obj/structure/flora/rogueflora/thistle
	name = "thistle"
	desc = "A prickly plant with purple flowers."
	icon_state = "Thistlebush"

/obj/structure/flora/rogueflora/poppy
	name = "poppy"
	desc = "A flowering plant with large, showy blooms."
	icon_state = "Poppybush"

/obj/structure/flora/rogueflora/slavender
	name = "slavender"
	desc = "A fragrant herb with purple flowers."
	icon_state = "Slavenderbush"

/obj/effect/spawner/lootdrop/rogueflora
	name = "herb spawner"
	desc = "A spawner for rogue flora."
	loot = list(
	/obj/structure/flora/rogueflora/wormwood = 10,
	/obj/structure/flora/rogueflora/marigold = 10,
	/obj/structure/flora/rogueflora/nettles = 10,
	/obj/structure/flora/rogueflora/thistle = 10,
	/obj/structure/flora/rogueflora/poppy = 10,
	/obj/structure/flora/rogueflora/slavender = 10
		)
	lootcount = 1




//trees
/obj/structure/flora/tree
	name = "tree"
	desc = ""
	density = TRUE
	pixel_x = -16
	layer = FLY_LAYER
	var/log_amount = 10

/obj/structure/flora/tree/attackby(obj/item/W, mob/user, params)
	if(log_amount && (!(flags_1 & NODECONSTRUCT_1)))
		if(W.get_sharpness() && W.force > 0)
			if(W.hitsound)
				playsound(get_turf(src),  W.hitsound, 100, FALSE, FALSE)
			user.visible_message(span_notice("[user] begins to cut down [src] with [W]."),span_notice("I begin to cut down [src] with [W]."), span_hear("I hear the sound of sawing."))
			if(do_after(user, 1000/W.force, target = src)) //5 seconds with 20 force, 8 seconds with a hatchet, 20 seconds with a shard.
				user.visible_message(span_notice("[user] fells [src] with the [W]."),span_notice("I fell [src] with the [W]."), span_hear("I hear the sound of a tree falling."))
				playsound(get_turf(src), 'sound/blank.ogg', 100 , FALSE, FALSE)
				for(var/i=1 to log_amount)
					new /obj/item/grown/log/tree(get_turf(src))

				var/obj/structure/flora/stump/S = new(loc)
				S.name = "[name] stump"

				qdel(src)

	else
		return ..()

/obj/structure/flora/stump
	name = "stump"
	desc = "" //running naked through the trees
	icon_state = "tree_stump"
	density = FALSE
	pixel_x = -16

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/deadtrees.dmi'
	desc = ""
	icon_state = "tree_1"

/obj/structure/flora/tree/palm
	icon = 'icons/misc/beach2.dmi'
	desc = ""
	icon_state = "palm1"

/obj/structure/flora/tree/palm/Initialize()
	. = ..()
	icon_state = pick("palm1","palm2")
	pixel_x = 0

/obj/structure/flora/tree/dead/Initialize()
	icon_state = "tree_[rand(1, 6)]"
	. = ..()

/obj/structure/flora/tree/jungle
	name = "tree"
	icon_state = "tree"
	desc = ""
	icon = 'icons/obj/flora/jungletrees.dmi'
	pixel_x = -48
	pixel_y = -20

/obj/structure/flora/tree/jungle/Initialize()
	icon_state = "[icon_state][rand(1, 6)]"
	. = ..()

/obj/structure/flora/tree/jungle/small
	pixel_y = 0
	pixel_x = -32
	icon = 'icons/obj/flora/jungletreesmall.dmi'


/obj/structure/flora/tree/evil/Initialize()
	. = ..()
	icon_state = "wv[rand(1,2)]"
	soundloop = new(src, FALSE)
	soundloop.start()

/obj/structure/flora/tree/evil/Destroy()
	soundloop.stop()
	if(controller)
		controller.endvines()
		controller.tree = null
		controller = null
	. = ..()

/obj/structure/flora/tree/evil
	var/datum/looping_sound/boneloop/soundloop
	var/datum/vine_controller/controller

//grass
/obj/structure/flora/grass
	name = "grass"
	desc = ""
	icon = 'icons/obj/flora/snowflora.dmi'
	gender = PLURAL	//"this is grass" not "this is a grass"

/obj/structure/flora/grass/brown
	icon_state = "snowgrass1bb"

/obj/structure/flora/grass/brown/Initialize()
	icon_state = "snowgrass[rand(1, 3)]bb"
	. = ..()


/obj/structure/flora/grass/green
	icon_state = "snowgrass1gb"

/obj/structure/flora/grass/green/Initialize()
	icon_state = "snowgrass[rand(1, 3)]gb"
	. = ..()

/obj/structure/flora/grass/both
	icon_state = "snowgrassall1"

/obj/structure/flora/grass/both/Initialize()
	icon_state = "snowgrassall[rand(1, 3)]"
	. = ..()


//bushes
/obj/structure/flora/bush
	name = "bush"
	desc = ""
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowbush1"
	anchored = TRUE

/obj/structure/flora/bush/Initialize()
	icon_state = "snowbush[rand(1, 6)]"
	. = ..()

// ausbush

/obj/structure/flora/roguegrass/ausbushes
	name = "bush"
	desc = ""
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "firstbush_1"

/obj/structure/flora/roguegrass/ausbushes/Initialize()
	. = ..()
	if(icon_state == "firstbush_1")
		icon_state = "firstbush_[rand(1, 4)]"


/obj/structure/flora/roguegrass/ausbushes/reedbush
	icon_state = "reedbush_1"

/obj/structure/flora/roguegrass/ausbushes/reedbush/Initialize()
	. = ..()
	icon_state = "reedbush_[rand(1, 4)]"


/obj/structure/flora/roguegrass/ausbushes/leafybush
	icon_state = "leafybush_1"

/obj/structure/flora/roguegrass/ausbushes/leafybush/Initialize()
	. = ..()
	icon_state = "leafybush_[rand(1, 3)]"


/obj/structure/flora/roguegrass/ausbushes/palebush
	icon_state = "palebush_1"

/obj/structure/flora/roguegrass/ausbushes/palebush/Initialize()
	. = ..()
	icon_state = "palebush_[rand(1, 4)]"


/obj/structure/flora/roguegrass/ausbushes/stalkybush
	icon_state = "stalkybush_1"

/obj/structure/flora/roguegrass/ausbushes/stalkybush/Initialize()
	icon_state = "stalkybush_[rand(1, 3)]"
	. = ..()

/obj/structure/flora/roguegrass/ausbushes/grassybush
	icon_state = "grassybush_1"

/obj/structure/flora/roguegrass/ausbushes/grassybush/Initialize()
	. = ..()
	icon_state = "grassybush_[rand(1, 4)]"


/obj/structure/flora/roguegrass/ausbushes/fernybush
	icon_state = "fernybush_1"

/obj/structure/flora/roguegrass/ausbushes/Initialize()
	. = ..()
	icon_state = "fernybush_[rand(1, 3)]"


/obj/structure/flora/roguegrass/ausbushes/sunnybush
	icon_state = "sunnybush_1"

/obj/structure/flora/roguegrass/ausbushes/sunnybush/Initialize()
	. = ..()
	icon_state = "sunnybush_[rand(1, 3)]"


/obj/structure/flora/roguegrass/ausbushes/genericbush
	icon_state = "genericbush_1"

/obj/structure/flora/roguegrass/ausbushes/genericbush/Initialize()
	. = ..()
	icon_state = "genericbush_[rand(1, 4)]"


/obj/structure/flora/roguegrass/ausbushes/pointybush
	icon_state = "pointybush_1"

/obj/structure/flora/roguegrass/ausbushes/pointybush/Initialize()
	. = ..()
	icon_state = "pointybush_[rand(1, 4)]"


/obj/structure/flora/roguegrass/ausbushes/lavendergrass
	icon_state = "lavendergrass_1"

/obj/structure/flora/roguegrass/ausbushes/lavendergrass/Initialize()
	. = ..()
	icon_state = "lavendergrass_[rand(1, 4)]"


/obj/structure/flora/roguegrass/ausbushes/ywflowers
	name = "yellow flowers"
	icon_state = "ywflowers_1"

/obj/structure/flora/roguegrass/ausbushes/ywflowers/Initialize()
	. = ..()
	icon_state = "ywflowers_[rand(1, 3)]"


/obj/structure/flora/roguegrass/ausbushes/brflowers
	name = "blue flowers"
	icon_state = "brflowers_1"

/obj/structure/flora/roguegrass/ausbushes/brflowers/Initialize()
	. = ..()
	icon_state = "brflowers_[rand(1, 3)]"


/obj/structure/flora/roguegrass/ausbushes/ppflowers
	name = "purple flowers"
	icon_state = "ppflowers_1"

/obj/structure/flora/roguegrass/ausbushes/ppflowers/Initialize()
	. = ..()
	icon_state = "ppflowers_[rand(1, 3)]"

/obj/structure/flora/roguegrass/ausbushes/sparsegrass
	icon_state = "sparsegrass_1"

/obj/structure/flora/roguegrass/ausbushes/sparsegrass/Initialize()
	. = ..()
	icon_state = "sparsegrass_[rand(1, 3)]"


/obj/structure/flora/roguegrass/ausbushes/fullgrass
	icon_state = "fullgrass_1"

/obj/structure/flora/roguegrass/ausbushes/fullgrass/Initialize()
	. = ..()
	icon_state = "fullgrass_[rand(1, 3)]"


/obj/effect/spawner/lootdrop/ausflora
	name = "flower spawner"
	desc = "A spawner for random flowers."
	loot = list(
	/obj/structure/flora/roguegrass/ausbushes/lavendergrass = 10,
	/obj/structure/flora/roguegrass/ausbushes/brflowers = 10,
	/obj/structure/flora/roguegrass/ausbushes/ppflowers = 10,
	/obj/structure/flora/roguegrass/ausbushes/ywflowers = 10.
		)
	lootcount = 1




/obj/item/twohanded/required/kirbyplants
	name = "potted plant"
	icon = 'icons/obj/flora/plants.dmi'
	icon_state = "plant-01"
	desc = ""
	layer = ABOVE_MOB_LAYER
	w_class = WEIGHT_CLASS_HUGE
	force = 10
	force_wielded = 10
	throwforce = 13
	throw_speed = 2
	throw_range = 4

/obj/item/twohanded/required/kirbyplants/Initialize()
	. = ..()
	AddComponent(/datum/component/tactical)
	addtimer(CALLBACK(src, TYPE_PROC_REF(/datum, _AddComponent), /datum/component/beauty, 500), 0)

/obj/item/twohanded/required/kirbyplants/random
	icon_state = "random_plant"
	var/list/static/states

/obj/item/twohanded/required/kirbyplants/random/Initialize()
	. = ..()
	icon = 'icons/obj/flora/plants.dmi'
	if(!states)
		generate_states()
	icon_state = pick(states)

/obj/item/twohanded/required/kirbyplants/random/proc/generate_states()
	states = list()
	for(var/i in 1 to 25)
		var/number
		if(i < 10)
			number = "0[i]"
		else
			number = "[i]"
		states += "plant-[number]"
	states += "applebush"


/obj/item/twohanded/required/kirbyplants/dead
	name = "RD's potted plant"
	desc = ""
	icon_state = "plant-25"

/obj/item/twohanded/required/kirbyplants/photosynthetic
	name = "photosynthetic potted plant"
	desc = ""
	icon_state = "plant-09"
	light_color = "#2cb2e8"
	light_outer_range = 3


//a rock is flora according to where the icon file is
//and now these defines

/obj/structure/flora/rock
	icon_state = "basalt"
	desc = ""
	icon = 'icons/obj/flora/rocks.dmi'
	resistance_flags = FIRE_PROOF
	density = TRUE

/obj/structure/flora/rock/Initialize()
	. = ..()
	icon_state = "[icon_state][rand(1,3)]"

/obj/structure/flora/rock/pile
	icon_state = "lavarocks"
	desc = ""

//Jungle grass

/obj/structure/flora/grass/jungle
	name = "jungle grass"
	desc = ""
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa"


/obj/structure/flora/grass/jungle/Initialize()
	icon_state = "[icon_state][rand(1, 5)]"
	. = ..()

/obj/structure/flora/grass/jungle/b
	icon_state = "grassb"

//Jungle rocks

/obj/structure/flora/rock/jungle
	icon_state = "rock"
	desc = ""
	icon = 'icons/obj/flora/jungleflora.dmi'
	density = FALSE

/obj/structure/flora/rock/jungle/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(1,5)]"


//Jungle bushes

/obj/structure/flora/junglebush
	name = "bush"
	desc = ""
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha"

/obj/structure/flora/junglebush/Initialize()
	icon_state = "[icon_state][rand(1, 3)]"
	. = ..()

/obj/structure/flora/junglebush/b
	icon_state = "bushb"

/obj/structure/flora/junglebush/c
	icon_state = "bushc"

/obj/structure/flora/junglebush/large
	icon_state = "bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	pixel_x = -16
	pixel_y = -12
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/flora/rock/pile/largejungle
	name = "rocks"
	icon_state = "rocks"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	density = FALSE
	pixel_x = -16
	pixel_y = -16

/obj/structure/flora/rock/pile/largejungle/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(1,3)]"















