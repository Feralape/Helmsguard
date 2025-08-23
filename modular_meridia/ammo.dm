/obj/item/ammo_casing/bullet/revolver
	name = "revolver bullet casing"
	icon = 'modular_meridia/icons/ammo.dmi'
	icon_state = "revolver"
	desc = ""
	caliber = "revolver"
	projectile_type = /obj/projectile/bullet/reusable/bullet/rogue/revolver
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect


/obj/projectile/bullet/reusable/bullet/rogue/revolver
	name = "revolver round"
	damage = 100 //higher damage than crossbow
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/bullet/revolver
	range = 25		//Higher than arrow, but not halfway through the entire town.
	hitsound = list(
	'sound/combat/hits/hi_bolt (1).ogg',
	'sound/combat/hits/hi_bolt (2).ogg',
	'sound/combat/hits/hi_bolt (3).ogg'
	)
	embedchance = 100
	woundclass = BCLASS_PIERCE
	flag = "bullet"
	armor_penetration = 120
