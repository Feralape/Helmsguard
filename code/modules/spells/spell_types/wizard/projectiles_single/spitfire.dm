
/obj/effect/proc_holder/spell/invoked/projectile/spitfire
	name = "Spitfire"
	desc = "Shoot out a low-powered ball of fire that shines brightly on impact, potentially blinding a target. \n\
	Damage is increased by 100% versus simple-minded creechurs."
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/rogue2
	overlay_state = "fireball_multi"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE
	releasedrain = 30
	chargedrain = 1
	chargetime = 1
	recharge_time = 4 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	spell_tier = 2
	invocation = "Evomere Flammas!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_FIRE
	glow_intensity = GLOW_INTENSITY_LOW
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokefire
	associated_skill = /datum/skill/magic/arcane
	cost = 3

/obj/projectile/magic/aoe/fireball/rogue2
	name = "spitfire"
	exp_heavy = 0
	exp_light = 0
	exp_flash = 1
	exp_fire = 0
	damage = 20
	npc_damage_mult = 2 // Makes it more effective against NPCs.
	damage_type = BURN
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/blank.ogg'
	aoe_range = 0
