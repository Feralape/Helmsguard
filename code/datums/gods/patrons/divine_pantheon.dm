/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine

/datum/patron/divine/astrata
	name = "Anar"
	domain = "The Sun, Patriarchs and Wisdom."
	desc = "The father of the Court of Saints paired with his wife Isil, priest of the Temple of the Six-Pointed Sun. The couple disappeared in the Eclipse of Anno Nihilo without a clearly defined heir, shattering the Sun Elves into the War of Brothers."
	worshippers = "Fathers, Healers and the Enlightened."
	mob_traits = list(TRAIT_APRICITY)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/ignition				= CLERIC_T0,
					/obj/effect/proc_holder/spell/self/astrata_gaze				= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt/sacred_flame_rogue	= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/heal					= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/revive				= CLERIC_T3,
	)
	confess_lines = list(
		"ANAR IS MY LIGHT!",
		"ANAR IS THE ALL-FATHER!",
		"I SERVE THE UNCONQUERED SUN!",
	)
	storyteller = /datum/storyteller/astrata

/datum/patron/divine/noc
	name = "Isil"
	domain = "The Moon, Matriarchs and Mystery."
	desc = "The mother of the Court of Saints paired with her husband Anar, priestess of the Temple of the Six-Pointed Sun. The couple disappeared in the Eclipse of Anno Nihilo, the mystery of their end dooming her beloved children to centuries of strife."
	worshippers = "Mothers, Lovers and Whisperers."
	mob_traits = list(TRAIT_NIGHT_OWL)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/noc_sight				= CLERIC_T0,
					/obj/effect/proc_holder/spell/targeted/touch/darkvision/miracle	= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/invisibility/miracle	= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/blindness				= CLERIC_T2,
					/obj/effect/proc_holder/spell/self/noc_spell_bundle			= CLERIC_T3,
	)
	confess_lines = list(
		"ISIL IS MY SHROUD!",
		"ISIL HEARS MY CRIES!",
		"I REVEL IN THE MOONLIGHT!",
	)
	traits_tier = list(TRAIT_DARKVISION = CLERIC_T1)
	storyteller = /datum/storyteller/noc

	// Patrons below should be selectable as the Elven Saints.

/datum/patron/divine/abyssor
	name = "Calarost"
	domain = "Fame, Adventure and Vainglory."
	desc = "Calarost, the ever-striving brother of Beroth, sought greatness and glory in adventures abroad. Slaying horrific monsters and venturing ever further upon his ships, his return from slaying a very dragon was overshadowed by the Couple's disappearance only days later at the eclipse of Anno Nihilo. Driven back to sea by Beroth's rage, he and Lissae established their realm east of what would become the Sea of Tears, fighting centuries of battle in the War of Brothers."
	worshippers = "Adventurers, Champions and the Reckless."
	mob_traits = list(TRAIT_ABYSSOR_SWIM, TRAIT_SEA_DRINKER)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/aquatic_compulsion	= CLERIC_T0,
					/obj/effect/proc_holder/spell/self/abyssor_wind				= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/abyssor_bends			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/abyssheal				= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/call_mossback			= CLERIC_T3,
					/obj/effect/proc_holder/spell/invoked/call_dreamfiend		= CLERIC_T4,
					/obj/effect/proc_holder/spell/invoked/abyssal_infusion		= CLERIC_T4
	)
	confess_lines = list(
		"REMEMBER MY NAME!",
		"CALAROST! REMEMBER THEIR CRIMES!",
		"IN GLORY I AM IMMORTAL!",
	)

/datum/patron/divine/malum
	name = "Vanesse"
	domain = "Beauty, Artifice and Indulgence."
	desc = "Vanesse's fiery hair was a wonder that captivated the suitors who laid endless gifts before her, and so when she deigned at last to wed she issued a challenge. He who can create that which matches my beauty, she declared, shall have me. Despite gems and diadems from the greatest craftsmen, it was Calarost who won her challenge; presenting her with a silver mirror."
	worshippers = "Artists and Artisans, the Vain and Self-Indulgent."
	mob_traits = list(TRAIT_FORGEBLESSED, TRAIT_BETTER_SLEEP)	
	t1 = /obj/effect/proc_holder/spell/invoked/vigorousexchange
	t2 = /obj/effect/proc_holder/spell/invoked/heatmetal
	t3 = /obj/effect/proc_holder/spell/invoked/hammerfall
	t4 = /obj/effect/proc_holder/spell/invoked/craftercovenant
	extra_spell = /obj/effect/proc_holder/spell/invoked/malum_flame_rogue
	confess_lines = list(
		"HER ART SHALL ENDURE!",
		"BLISS AND BEAUTY, HOW FLEETING!",
		"VANESSE! CURSE THESE RUINERS OF BEAUTY!",
	)

	storyteller = /datum/storyteller/abyssor

/datum/patron/divine/ravox
	name = "Beroth"
	domain = "Prowess and Valor, Tyranny."
	desc = "Beroth was the Lord-Guardian of the Court of Saints, and the disappearance of the Couple wounded him grievously. Believing only betrayal could be responsible, he drove out his brother Calarost and brother-in-law Saeran, striving to imprison their families. Only the call of his wife Lissae for mercy stayed his hand from tyranny, although the War of Brothers would rage for centuries after."
	worshippers = "Warriors, Oath-Keepers, and Rulers."
	mob_traits = list(TRAIT_SHARPER_BLADES, TRAIT_JUSTICARSIGHT)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/tug_of_war			= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/self/divine_strike			= CLERIC_T1,
					/obj/effect/proc_holder/spell/self/call_to_arms				= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/persistence			= CLERIC_T3,
	)
	confess_lines = list(
		"BEROTH GIVE ME STRENGTH!",
		"I KEEP MY OATHES!",
		"BETRAYERS, ALL OF YOU!",
	)

/datum/patron/divine/eora
	name = "Lissae"
	domain = "Mercy, Altruism and Guilelessness."
	desc = "Lissae was blinded by her own beauty, legends say, and Beroth heard from her the first tears wept by elves as she wandered sightless and lost in the primordial forest. Taking her hand and returning her to his hall, they were beloved ever since; yet as Lissae cannot imagine betrayal by the faithful Beroth, she likewise assumes the best in all."
	worshippers = "Virgins and Faithful Brides, Charitable Souls, Innocent Fools."
	mob_traits = list(TRAIT_EMPATH, TRAIT_EXTEROCEPTION)
	t1 = /obj/effect/proc_holder/spell/invoked/bud
	t2 = /obj/effect/proc_holder/spell/invoked/eoracurse
	t3 = null
	confess_lines = list(
		"FORGIVE THEM!",
		"PLEASE! HAVE YOU NO MERCY?",
		"LISSAE FORGIVE YOU!",
	)

/datum/patron/divine/dendor
	name = "Saeran"
	domain = "Simplicity, the Hunt, and Seclusion."
	desc = "Saeran boldly hunted for the Court of Saints, ranging ever further into the wilds as stone and civilization grew around the ancient Sun-Elf palaces. Solitary until nearly slain in a hunt, he was the first to realize death was possible even for elves, and strove to never be bound to a prize or place he was unwilling to forsake to spare his life or his beloved's. With the War of Brothers wandering elves gathered to the realm he formed with Naime, welcoming travellers until the fateful Betrayal."
	worshippers = "Hunters, Druids, and Recluses."
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_LEECHIMMUNE)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/shapeshift/dendor
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/self/howl/call_of_the_moon
	confess_lines = list(
		"DENDOR PROVIDES!",
		"THE TREEFATHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "God of the Ocean, Storms and the Tide"
	desc = "The strongest of the Ten; when awakened, the world flooded for a thousand daes and a thousand nights before he was put to slumber. Resting fitfully did Dendor split from his skull like a gaping wound. Communes rarely with his followers, only offering glimpses in dreams. Gifted primordial Man water. "
	worshippers = "Men of the Sea, Primitive Aquatics"
	mob_traits = list(TRAIT_ABYSSOR_SWIM, TRAIT_SEA_DRINKER)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/aquatic_compulsion	= CLERIC_T0,
					/obj/effect/proc_holder/spell/self/abyssor_wind				= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/abyssor_bends			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/abyssheal				= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/call_mossback			= CLERIC_T3,
					/obj/effect/proc_holder/spell/invoked/call_dreamfiend		= CLERIC_T4,
					/obj/effect/proc_holder/spell/invoked/abyssal_infusion		= CLERIC_T4
	)
	confess_lines = list(
		"REMEMBER MY NAME!",
		"CALAROST! REMEMBER THEIR CRIMES!",
		"IN GLORY I AM IMMORTAL!",
	)

/datum/patron/divine/malum
	name = "Vanesse"
	domain = "Beauty, Artifice and Indulgence."
	desc = "Vanesse's fiery hair was a wonder that captivated the suitors who laid endless gifts before her, and so when she deigned at last to wed she issued a challenge. He who can create that which matches my beauty, she declared, shall have me. Despite gems and diadems from the greatest craftsmen, it was Calarost who won her challenge; presenting her with a silver mirror."
	worshippers = "Artists and Artisans, the Vain and Self-Indulgent."
	mob_traits = list(TRAIT_FORGEBLESSED, TRAIT_BETTER_SLEEP)	
	t1 = /obj/effect/proc_holder/spell/invoked/vigorousexchange
	t2 = /obj/effect/proc_holder/spell/invoked/heatmetal
	t3 = /obj/effect/proc_holder/spell/invoked/hammerfall
	t4 = /obj/effect/proc_holder/spell/invoked/craftercovenant
	extra_spell = /obj/effect/proc_holder/spell/invoked/malum_flame_rogue
	confess_lines = list(
		"HER ART SHALL ENDURE!",
		"BLISS AND BEAUTY, HOW FLEETING!",
		"VANESSE! CURSE THESE RUINERS OF BEAUTY!",
	)
	
/datum/patron/divine/ravox
	name = "Ravox"
	domain = "God of Justice, Glory, Battle"
	desc = "Stalwart warrior, glorious justicier; legends say he came down to the Basin to repel the vile hordes of demons with his own hands, and that he seeks warriors for his divine army among mortals."
	worshippers = "Warriors, Sellswords & those who seek Justice"
	mob_traits = list(TRAIT_SHARPER_BLADES, TRAIT_JUSTICARSIGHT)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/tug_of_war			= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/self/divine_strike			= CLERIC_T1,
					/obj/effect/proc_holder/spell/self/call_to_arms				= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/persistence			= CLERIC_T3,
	)
	confess_lines = list(
		"BEROTH GIVE ME STRENGTH!",
		"I KEEP MY OATHES!",
		"BETRAYERS, ALL OF YOU!",
	)

/datum/patron/divine/eora
	name = "Lissae"
	domain = "Mercy, Altruism and Guilelessness."
	desc = "Lissae was blinded by her own beauty, legends say, and Beroth heard from her the first tears wept by elves as she wandered sightless and lost in the primordial forest. Taking her hand and returning her to his hall, they were beloved ever since; yet as Lissae cannot imagine betrayal by the faithful Beroth, she likewise assumes the best in all."
	worshippers = "Virgins and Faithful Brides, Charitable Souls, Innocent Fools."
	mob_traits = list(TRAIT_EMPATH, TRAIT_EXTEROCEPTION)
	t1 = /obj/effect/proc_holder/spell/invoked/bud
	t2 = /obj/effect/proc_holder/spell/invoked/eoracurse
	t3 = null
	confess_lines = list(
		"FORGIVE THEM!",
		"PLEASE! HAVE YOU NO MERCY?",
		"LISSAE FORGIVE YOU!",
	)

/datum/patron/divine/dendor
	name = "Saeran"
	domain = "Simplicity, the Hunt, and Seclusion."
	desc = "Saeran boldly hunted for the Court of Saints, ranging ever further into the wilds as stone and civilization grew around the ancient Sun-Elf palaces. Solitary until nearly slain in a hunt, he was the first to realize death was possible even for elves, and strove to never be bound to a prize or place he was unwilling to forsake to spare his life or his beloved's. With the War of Brothers wandering elves gathered to the realm he formed with Naime, welcoming travellers until the fateful Betrayal."
	worshippers = "Hunters, Druids, and Recluses."
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_LEECHIMMUNE)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/shapeshift/dendor
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/self/howl/call_of_the_moon
	confess_lines = list(
		"SAERAN! FREE ME OF THIS SNARE!",
		"THE HUNTER SHALL HAVE YOUR SCENT!",
		"YOU SLAVES TO STONE AND GOLD! FREE ME!",
	)

/datum/patron/divine/necra
	name = "Naime"
	domain = "Forbearance, Humility and Regret."
	desc = "Naime, Veiled Lady of the Wood, came upon Saeran as he lay near death from the failed hunt of a dire bear. With all her art she returned him to health, teaching him at last the value of another. With the fall of their shared realm after the Betrayal, she is yet thought to wander seeking the near-dead, as many wounded claim to have seen her pale face before their strength returns."
	worshippers = "The Humble, Wandering Healers, and Mourners."
	mob_traits = list(TRAIT_SOUL_EXAMINE, TRAIT_NOSTINK)	//No stink is generic but they deal with dead bodies so.. makes sense, I suppose?
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/necras_sight			= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/avert					= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/deaths_door			= CLERIC_T1,
					/obj/effect/proc_holder/spell/targeted/abrogation			= CLERIC_T2,
	)
	confess_lines = list(
		"I SUFFER AS NAIME WEEPS!",
		"NAIME WILL TURN HER FACE FROM YOU!",
		"WOE UPON YOU ALL!",
	)
	storyteller = /datum/storyteller/necra

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "God of Trickery, Freedom and Inspiration"
	desc = "The Laughing God, both famous and infamous for his sway over the forces of luck. Xylix is known for the inspiration of many a bards lyric. Speaks through his gift to man; the Tarot deck."
	worshippers = "Gamblers, Bards, Artists, and the Silver-Tongued"
	mob_traits = list(TRAIT_XYLIX)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/self/xylixslip				= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/wheel					= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/mockery				= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/mastersillusion		= CLERIC_T2,
	)
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"NOC IS NIGHT!",
		"DENDOR PROVIDES!",
		"ABYSSOR COMMANDS THE WAVES!",
		"RAVOX IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!",
		"PESTRA SOOTHES ALL ILLS!",
		"MALUM IS MY MUSE!",
		"EORA BRINGS US TOGETHER!",
		"LONG LIVE ZIZO!",
		"GRAGGAR IS THE BEAST I WORSHIP!",
		"MATTHIOS IS MY LORD!",
		"BAOTHA IS MY JOY!",
		"REBUKE THE HERETICAL- PSYDON ENDURES!",
	)
	storyteller = /datum/storyteller/xylix

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Goddess of Decay, Disease and Medicine"
	desc = "Goddess that blessed many a saint with healing hands, Pestra taught man the arts of medicine and its benefits."
	worshippers = "The Sick, Phyicians, Apothecaries"
	mob_traits = list(TRAIT_EMPATH, TRAIT_ROT_EATER)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/diagnose				= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/pestra_leech			= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/heal					= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/infestation			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/attach_bodypart		= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/cure_rot				= CLERIC_T3,
	)
	confess_lines = list(
		"PESTRA SOOTHES ALL ILLS!",
		"DECAY IS A CONTINUATION OF LIFE!",
		"MY AFFLICTION IS MY TESTAMENT!",
	)
	storyteller = /datum/storyteller/pestra

/datum/patron/divine/malum
	name = "Malum"
	domain = "God of Fire, Destruction and Rebirth"
	desc = "Opinionless god of the crafts. He teaches that great works for killing or saving are great works, either way. The well-oiled guillotine and the well-sharpened axe are tools, and there is no good and evil to their craft."
	worshippers = "Smiths, Miners, Engineers"
	mob_traits = list(TRAIT_FORGEBLESSED, TRAIT_BETTER_SLEEP)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/malum_flame_rogue 	= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/vigorousexchange		= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/heatmetal				= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/hammerfall			= CLERIC_T3,
					/obj/effect/proc_holder/spell/invoked/craftercovenant		= CLERIC_T4,
	)
	confess_lines = list(
		"MALUM IS MY MUSE!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)

	storyteller = /datum/storyteller/malum


/datum/patron/divine/eora
	name = "Eora"
	domain = "Goddess of Love, Life and Beauty"
	desc = "Baotha's fairer half, made from blind, unconditional love. She is without a shred of hate in her heart and taught mankind that true love that even transcends Necra's grasp."
	worshippers = "Lovers, the romantically inclined, and Doting Grandparents"
	mob_traits = list(TRAIT_EMPATH, TRAIT_EXTEROCEPTION)
	miracles = list(/obj/effect/proc_holder/spell/targeted/touch/orison			= CLERIC_ORI,
					/obj/effect/proc_holder/spell/invoked/eora_blessing			= CLERIC_T0,
					/obj/effect/proc_holder/spell/invoked/lesser_heal 			= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/bless_food            = CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/bud					= CLERIC_T1,
					/obj/effect/proc_holder/spell/invoked/heartweave			= CLERIC_T2,
					/obj/effect/proc_holder/spell/invoked/eoracurse				= CLERIC_T3,
					/obj/effect/proc_holder/spell/invoked/pomegranate			= CLERIC_T4,
	)
	confess_lines = list(
		"EORA BRINGS US TOGETHER!",
		"HER BEAUTY IS EVEN IN THIS TORMENT!",
		"I LOVE YOU, EVEN AS YOU TRESPASS AGAINST ME!",
	)
	traits_tier = list(TRAIT_EORAN_CALM = CLERIC_T0, TRAIT_EORAN_SERENE = CLERIC_T2)
	storyteller = /datum/storyteller/eora

/////////////////////////////////
// Does God Hear Your Prayer ? //
/////////////////////////////////

// Astrata - In daylight, church, cross, or ritual chalk.
/datum/patron/divine/astrata/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer during daytime if outside.
	if(istype(get_area(follower), /area/rogue/outdoors) && (GLOB.tod == "day" || GLOB.tod == "dawn"))
		return TRUE
	to_chat(follower, span_danger("For Astrata to hear my prayer I must either be in her blessed daylight, within the church, or near a psycross.."))
	return FALSE


// Noc - In moonlight, church, cross, or ritual chalk
/datum/patron/divine/noc/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer during nightime if outside.
	if(istype(get_area(follower), /area/rogue/outdoors) && (GLOB.tod == "night" || GLOB.tod == "dusk"))
		return TRUE
	// Allows praying atop ritual chalk of the god.
	for(var/obj/structure/ritualcircle/noc in view(1, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Noc to hear my prayer I must either be in his blessed moonlight, within the church, or near a psycross."))
	return FALSE


// Dendor - In grove, bog, cross, or ritual chalk 
// Yes, he is NOT calling the master cus he's unique. Whole bog is his prayer zone. Druids exist for a reason instead of in the church.
/datum/patron/divine/dendor/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the druid tower + houses in the forest
	if(istype(get_area(follower), /area/rogue/indoors/shelter/woods))
		return TRUE
	// Allows prayer in outdoors wilderness, such as bog
	if(istype(get_area(follower), /area/rogue/outdoors/rtfield))
		return TRUE
	for(var/obj/structure/flora/roguetree/wise in view(4, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("I must either be in Dendor's wilds, the Grove, near a wise tree, or near a Panetheon Cross for the 'Tree Father' to hear my prays..."))
	return FALSE


// Abyssor - Near water, cross, or within the church.
/datum/patron/divine/abyssor/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer near any body of water turf.
	for(var/turf/open/water in view(4, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Abyssor to hear my prayer I must either pray within the church, near a psycross, or at any body of water so that the tides of prayer may flow.."))
	return FALSE


// Ravox - Near a knight statue, cross, or within the church
/datum/patron/divine/ravox/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer near any knight statue and its subtypes.
	for(var/obj/structure/fluff/statue/knight/K in view(4, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Ravox to hear my prayer I must either pray within the church, near a psycross, or near a knighly statue in memorium of the fallen.."))
	return FALSE


// Necra - Near a grave, cross, or within the church
/datum/patron/divine/necra/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer near a grave.
	for(var/obj/structure/closet/dirthole/grave/G in view(4, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Necra to hear my prayer I must either pray within the church, near a psycross, or near a grave where we all go to be given our final embrace.."))
	return FALSE


// Xylix - Near a gambling machine, cross, or within the church
/datum/patron/divine/xylix/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer near gambling machines.
	for(var/obj/structure/roguemachine/lottery_roguetown/L in view(4, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Xylix to hear my prayer I must either pray within the church, near a psycross, or near a machine of fortune blessed by the grand jester.."))
	return FALSE


// Pestra - Near a well, cross, within the physicians, or within the church
/datum/patron/divine/pesta/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer in the appothocary's building.
	if(istype(get_area(follower), /area/rogue/indoors/town/physician))
		return TRUE
	// Allows prayer near wells. Weird one, but makes sense for health and disease. Miasma, water, etc.
	for(var/obj/structure/well/W in view(4, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Pestra to hear my prayer I must either pray within the church, phyisican's building, near a psycross, or near a well to observe the full circle of life.."))
	return FALSE


// Malum - Near a smelter, hearth, cross, within the smithy, or within the church
/datum/patron/divine/malum/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows prayer in the smith's building.
	if(istype(get_area(follower), /area/rogue/indoors/town/dwarfin))
		return TRUE
	// Allows prayer near hearths.
	for(var/obj/machinery/light/rogue/hearth/H in view(4, get_turf(follower)))
		return TRUE
	// Allows prayer near smelters.
	for(var/obj/machinery/light/rogue/smelter/H in view(4, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Malum to hear my prayer I must either pray within the church, the smithy's workshop, near a psycross, near a smelter, or hearth to bask in Malum's glory.."))
	return FALSE

// Eora - Near a gambling machine, cross, or within the church
/datum/patron/divine/eora/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer near psycross
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE
	// Allows Eorans to pray using flowers
	var/obj/item/held_item = follower.get_active_held_item()
	if(istype(held_item, /obj/item/reagent_containers/food/snacks/grown/rogue/poppy))
		qdel(held_item)
		return TRUE
	// Allows player to pray while wearing eoran bud.
	if(HAS_TRAIT(follower, TRAIT_PACIFISM))
		return TRUE
	to_chat(follower, span_danger("For Eora to hear my prayer I must either pray within the church, near a psycross, offering her poppy flowers, or wearing one of her blessed flowers atop my head.."))
	return FALSE
*/
