/obj/effect/landmark/mapGenerator
	var/startTurfX = 0
	var/startTurfY = 0
	var/startTurfZ = -1
	var/endTurfX = 0
	var/endTurfY = 0
	var/endTurfZ = -1
	var/mapGeneratorType = /datum/mapGenerator/roguetownfield
	var/datum/mapGenerator/mapGenerator

/obj/effect/landmark/mapGenerator/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/landmark/mapGenerator/LateInitialize()
	. = ..()
	if(startTurfZ < 0)
		startTurfZ = z
	if(endTurfZ < 0)
		endTurfZ = z
	mapGenerator = new mapGeneratorType()
	mapGenerator.defineRegion(locate(startTurfX,startTurfY,startTurfZ), locate(endTurfX,endTurfY,endTurfZ))
	mapGenerator.generate()
	qdel(src)
