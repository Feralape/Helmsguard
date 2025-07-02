#define VALID_FISHING_SPOTS list(\
	/turf/open/water/river,\
	/turf/open/water/cleanshallow,\
	/turf/open/water/ocean,\
	/turf/open/water/ocean/deep,\
	/turf/open/water/swamp,\
	/turf/open/water/swamp/deep )

//Valid spots for fishing add to it if there's more.
/proc/is_valid_fishing_spot(turf/T)
	for(var/i in VALID_FISHING_SPOTS)
		if(istype(T, i))
			return TRUE
	return FALSE

