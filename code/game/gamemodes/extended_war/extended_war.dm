/datum/game_mode/extended/warmode
	name = "extended war"
	config_tag = "extended_war"
	report_type = "extended_war"
	votable = FALSE //until this is done.
	required_players = 10

	announce_span = "danger"
	announce_text = "Preperations for war is almost complete, it will be a dark week to be written in history books."
	//this is set up for two factions.
	var/list/fighting_factions = list("Station","orcs")
	var/list/fighting_faction_names = list("Human","Orc")
	var/faction_one_tickets = 0
	var/faction_two_tickets = 0
	var/tickets_per_person = 2 //total of every player
	var/starting_tickets = null

//WIP, Need help.
//NEED TO MAKE IT CHECK FOR PEOPLE READIED FOR BOTH FACTIONS TO BE ATLEAST 5 EACH
//NEED RECALL PYLONS OR SOMETHING FOR TICKETS TO BE EXPENDED IN TURN FOR PULLING BODY OF A FACTION MEMBER UPON DEATH. (PYLON MUST SHOW REMAINING TICKETS)

//humans vs orcs
/datum/game_mode/extended/warmode/can_start()
	var/playerC = 0
	for(var/i in GLOB.new_player_list)
		var/mob/dead/new_player/player = i
		if(player.ready == PLAYER_READY_TO_PLAY)
			playerC++
	
	if(!GLOB.Debug2)
		if(playerC < required_players)
			return FALSE
	return TRUE

/datum/game_mode/extended/warmode/post_setup()
	starting_tickets = length(GLOB.player_list) * tickets_per_person
	faction_one_tickets = starting_tickets
	faction_two_tickets = starting_tickets
	minor_announce("The amount of starting recall gems available for each side is -[starting_tickets]-.", "A stressful morning is upon Sundmark.", TRUE)
	return TRUE

/datum/game_mode/extended/warmode/check_finished()
	//win by proportion and time
	var/ttime = world.time - SSticker.round_start_time

	if(ttime >= GLOB.round_timer)
		if(roundvoteend) //Win by round end vote/time
			if(ttime >= (GLOB.round_timer + ROUND_END_TIME) )
				//check for total eliminations
				var/faction_one_count
				var/faction_two_count
				for(var/mob/living/defendy in GLOB.alive_player_list_faction[fighting_factions[1]])
					if(defendy.client && !defendy.client.is_afk())
						faction_one_count ++
					else
						continue
				for(var/mob/living/attacky in GLOB.alive_player_list_faction[fighting_factions[2]])
					if(attacky.client && !attacky.client.is_afk())
						faction_two_count ++
					else
						continue
				if(!faction_one_tickets && !faction_two_tickets) //nobody has tickets, we win by numbers
					if(faction_one_count < faction_two_count) //faction_two have more people
						priority_announce("[fighting_faction_names[2]] have achieved a major victory through being more than [fighting_faction_names[1]].")
					if(faction_one_count > faction_two_count) //faction_one more people
						priority_announce("[fighting_faction_names[1]] have achieved a major victory through being more than [fighting_faction_names[2]].")
					if(faction_one_count == faction_two_count) //in the mystical event they are equal
						priority_announce("The war concludes in a draw due to having equal amount of people left.")
				else if(faction_one_tickets || faction_two_tickets) //atleast one side still has tickets
					if(faction_one_tickets < faction_two_tickets) //faction_one have less tickets
						priority_announce("[fighting_faction_names[2]] have achieved a minor victory through having the most recall gems.")
					if(faction_one_tickets > faction_two_tickets) //faction_one have more tickets
						priority_announce("[fighting_faction_names[1]] have achieved a minor victory through having the most recall gems.")
					if(faction_one_tickets == faction_two_tickets) //in the mystical event they are equal
						priority_announce("The war concludes in a draw due to having equal amount of recall gems.")
				return TRUE
		else
			if(!SSvote.mode && SSticker.autovote)
				SSvote.initiate_vote("endround", "Psydon")
	return FALSE

/datum/game_mode/extended/warmode/check_win()
	//only relevant if they are out of tickets so we early return here.
	if(faction_one_tickets || faction_two_tickets)
		return FALSE
	//win by elimination
	var/faction_one_count
	var/faction_two_count
	for(var/mob/living/defendy in GLOB.alive_player_list_faction[fighting_factions[1]])
		if(defendy.client)
			faction_one_count ++
		else
			continue
	for(var/mob/living/attacky in GLOB.alive_player_list_faction[fighting_factions[2]])
		if(attacky.client)
			faction_two_count ++
		else
			continue
	if(!faction_one_count && !faction_two_count) //mystical event where they are both extinct.
		priority_announce("The war ends with the total annihilation of both forts..?")
		return TRUE
	if(!faction_one_count)
		priority_announce("The war ends with [fighting_faction_names[2]]s achieving total annihilation of [fighting_faction_names[1]] fort...")
		return TRUE
	if(!faction_two_count)
		priority_announce("The war ends with [fighting_faction_names[1]]s achieving total annihilation of [fighting_faction_names[2]] fort...")
		return TRUE
