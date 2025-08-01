/datum/job/roguetown/bandit //pysdon above there's like THREE bandit.dms now I'm so sorry. This one is latejoin bandits, the one in villain is the antag datum, and the one in the 'antag' folder is an old adventurer class we don't use. Good luck!
	title = "Bandit"
	flag = BANDIT
	department_flag = RABBLE
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	antag_job = TRUE
	allowed_races = RACES_NO_CONSTRUCT
	tutorial = "Long ago you did a crime worthy of your bounty being hung on the wall outside of the local inn. You now live with your fellow freemen in the bog, and generally get up to no good."

	outfit = null
	outfit_female = null

	obsfuscated_job = TRUE


	selection_color = JCOLOR_RABBLE
	display_order = JDO_BANDIT
	announce_latejoin = FALSE
	min_pq = 6
	max_pq = null
	round_contrib_points = 5

	advclass_cat_rolls = list(CTAG_BANDIT = 20)
	PQ_boost_divider = 10

	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = FALSE //no endless stream of bandits, unless the migration waves deem it so
	same_job_respawn_delay = 1 MINUTES
	cmode_music = 'sound/music/cmode/antag/combat_deadlyshadows.ogg'

/datum/job/roguetown/bandit/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		if(!H.mind)
			return
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		H.ambushable = FALSE

/datum/outfit/job/roguetown/bandit/post_equip(mob/living/carbon/human/H)
	..()
	var/datum/antagonist/new_antag = new /datum/antagonist/bandit()
	H.mind.add_antag_datum(new_antag)
	H.grant_language(/datum/language/thievescant)
	addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, choose_name_popup), "BANDIT"), 5 SECONDS)
	var/wanted = list("I am a notorious criminal", "I am a nobody")
	var/wanted_choice = input("Are you a known criminal?") as anything in wanted
	switch(wanted_choice)
		if("I am a notorious criminal") //Extra challenge for those who want it
			bandit_select_bounty(H)
			ADD_TRAIT(H, TRAIT_KNOWNCRIMINAL, TRAIT_GENERIC)
		if("I am a nobody") //Nothing ever happens
			return

// Changed up proc from Wretch to suit bandits bit more
/proc/bandit_select_bounty(mob/living/carbon/human/H)
	var/bounty_poster = input(H, "Who placed a bounty on you?", "Bounty Poster") as anything in list("The Justiciary of Helmsguard", "The Grenzelhoftian Holy See")
	var/bounty_severity = input(H, "How notorious are you?", "Bounty Amount") as anything in list("Small Fish", "Bay Butcher", "Helmsguardian Boogeyman")
	var/bounty_total = rand(300, 600) // Just in case
	switch(bounty_severity)
		if("Small Fish")
			bounty_total = rand(300, 400)
		if("Bay Butcher")
			bounty_total = rand(400, 500)
		if("Helmsguardian Boogeyman")
			bounty_total = rand(500, 600)
	var/my_crime = input(H, "What is your crime?", "Crime") as text|null
	if (!my_crime)
		my_crime = "Brigandry"
	add_bounty(H.real_name, bounty_total, FALSE, my_crime, bounty_poster)
