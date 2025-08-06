/* HELMSGUARD LANDMARK */

/obj/effect/landmark/start/marshall
	name = "Marshall"
	icon_state = "arrow"

/obj/effect/landmark/start/chaptermaster
	name = "Chapter Master"
	icon_state = "arrow"

/obj/effect/landmark/start/smith
	name = "Blacksmith"
	icon_state = "arrow"

/obj/effect/landmark/start/artificer
	name = "Artificer"
	icon_state = "arrow"

/obj/effect/landmark/start/apprentice
	name = "Apprentice"
	icon_state = "arrow"

/obj/effect/landmark/start/manatarms
	name = "Apprentice"
	icon_state = "arrow"
///////////////////////
/* LATEJOIN HELMSGUARD */
///////////////////////

/obj/effect/landmark/start/manorlate
	name = "Manorlate"
	icon_state = "arrow"
	delete_after_roundstart = FALSE
	jobspawn_override = list("Lord Elector", "Lord Consort", "Lord Heir", "Hand", "Steward", "Knight", "Court Physician", "Butler", "Dungeoneer")




///////////////////////
/* DEPRECATED */
///////////////////////
/*
/obj/effect/landmark/start/helms/late/noble
	name = "Noble Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Lord Elector",
	"Lord Consort",
	"Lord Heir",
	"Hand",
	"Steward"
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/courtier
	name = "Courtier Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Court Physician",
	"Jester",
	"Keep Servant",
	"Dungeoneer",
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/garrison
	name = "Retinue Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Knight",
	"Master-at-Arms",
	"Man-at-Arms",
	"Gatekeeper"
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/church
	name = "Church Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(	
	"Priest",
	"Inquisitor",
	"Monk",
	"Chapter Master",
	"Knight Templar",
	"Templar Sergeant",
	"Knight Hospitaler",
	"Hospitaler Sergeant"
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/towner
	name = "Towner Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Merchant",
	"Innkeeper",
	"Armorer",
	"Weaponsmith",
	"Apothecary",
	"Leatherworker",
	"Tailor",
	"Blacksmith",
	"Cook",
	"Apprentice",
	"Serving Lad"
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/citywatch
	name = "Citywatch Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list("Marshall",
	"Watchman",
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/peasant
	name = "Peasant Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Soilson",
	"Serf"
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/rabble
	name = "Peasant Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Bawdyhouse Master",
	"Rake",
	"Gutterfolk",
	)
	delete_after_roundstart = FALSE


/obj/effect/landmark/start/helms/late/adventurer
	name = "Adventurer Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Adventurer",
	)
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/helms/late/mercenarylate
	name = "Mercenary Late (Helm)"
	icon_state = "arrow"
	jobspawn_override = list(
	"Mercenary",
	)
	delete_after_roundstart = FALSE

///////////////////////
/* ROUNDSTART SPAWN */
///////////////////////
//These are roles exclusive to Helmsguard//

/obj/effect/landmark/start/helms/noble/markgraf
	name = "Lord Elector"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/noble/consort
	name = "Lord Consort"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/noble/heir
	name = "Lord Heir"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/noble/hand
	name = "Hand"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/noble/steward
	name = "Steward"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/court/physician
	name = "Court Physician"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/court/jester
	name = "Jester"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/court/servant
	name = "Keep Servant"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/garrison/knight
	name = "Knight"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/garrison/manatarms
	name = "Man-at-Arms"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/garrison/masteratarms
	name = "Master-at-Arms"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/garrison/gatekeeper
	name = "Gatekeeper"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/priest
	name = "Priest"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/inquisitor
	name = "Inquisitor"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/monk
	name = "Monk"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/chapmaster
	name = "Chapter Master"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/templar_knight
	name = "Templar Knight"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/templar_sergeant
	name = "Templar Sergeant"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/hospitaler_knight
	name = "Hospitaler Knight"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/church/hospitaler_sergeant
	name = "Hospitaler Sergeant"
	icon_state = "arrow"


/obj/effect/landmark/start/helms/watch/marshall
	name = "Marshall"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/watch/watchman
	name = "Watchman"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/watch/dungeoneer
	name = "Dungeoneer"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/merchant
	name = "Merchant"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/innkeeper
	name = "Innkeeper"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/armorer
	name = "Armorer"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/weaponsmith
	name = "Weaponsmith"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/blacksmith
	name = "Blacksmith"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/builder
	name = "Builder"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/apothecary
	name = "Apothecary"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/leatherworker
	name = "Leather Worker"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/apprentice
	name = "Apprentice"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/yeomen/tailor
	name = "Tailor"
	icon_state = "arrow"
  
/obj/effect/landmark/start/helms/peasants/soilson
	name = "Soilson"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/peasants/serf
	name = "Serf"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/rabble/master
	name = "Bawdyhouse Master"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/rabble/wench
	name = "Rake"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/rabble/gutterfolk
	name = "Gutterfolk"
	icon_state = "arrow"

/obj/effect/landmark/start/helms/rabble/servingwench
	name = "Serving Lad"
	icon_state = "arrow"
*/
