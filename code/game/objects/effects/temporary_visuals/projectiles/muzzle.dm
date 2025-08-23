/obj/effect/projectile/muzzle
	name = "muzzle flash"
	icon = 'icons/obj/projectiles_muzzle.dmi'

/obj/effect/projectile/muzzle/laser
	icon_state = "muzzle_laser"

/obj/effect/projectile/muzzle/laser/blue
	icon_state = "muzzle_laser_blue"

/obj/effect/projectile/muzzle/disabler
	icon_state = "muzzle_omni"

/obj/effect/projectile/muzzle/xray
	icon_state = "muzzle_xray"

/obj/effect/projectile/muzzle/pulse
	icon_state = "muzzle_u_laser"

/obj/effect/projectile/muzzle/plasma_cutter
	icon_state = "muzzle_plasmacutter"

/obj/effect/projectile/muzzle/stun
	icon_state = "muzzle_stun"

/obj/effect/projectile/muzzle/heavy_laser
	icon_state = "muzzle_beam_heavy"

/obj/effect/projectile/muzzle/wormhole
	icon_state = "wormhole_g"

/obj/effect/projectile/muzzle/pointline
	icon_state = "point"

/obj/effect/projectile/muzzle/bullet
	name = "muzzle_bullet"
	icon = 'icons/obj/projectiles_muzzle.dmi'

/obj/effect/projectile/muzzle/bullet/Initialize()
	. = ..()
	spawn(5)
		if(!QDELETED(src))
			qdel(src) //Delete the muzzle flash after 5 seconds
