Sprint Planning Document:

Sprint 01:
start date: 08/30/2015
end date: 09/12/2015

Sprint 01 Goals:
For this Sprint, we have the following short term goals:
	1. Complete one set of fully functional 64x64 sprites for each of the following animations
			stand
			walk
			jump
	2. Add jumping into the game.
			must be able to visibly distinguish jump height
			must be able to use variables and timers and things to know about jumping
	3. fix broken multiplayer
			clean up the broken variables
			fix the portal glitch
			set up the map to correctly send the players to the dungeon room
	4. Revise Customization System
			Improve UI
			Add at least one class
			revise appearance editor to be not embarrassing.
	5. Rescale characters
			Fix pathing
			Fix weapon offsets
			Fix UI Drawing
	6. Add xbox controller support
			At startup, check if xbox controllers are used or not and set stuff up accordingly.
			use keycodes that can be assigned to arbitrary buttons rather than hardcoded ones.
			use script to handle input instead of gamemaker events
	7. Add an interactive map to the game
	8. Make Walls Isometric
			Dynamically set depth to x coordinate
	
Sprint Retrospective 01:
	we completed 1/3 sprites, but compensated by doing work on menus and things
	we added jumping, but not aerial pathing.
	all known multiplayer glitches were fixed.
	customization was left in a partially complete state. Skill and Ability menus were not complete, since they will require an extensive reworking of the skill & ability systems.
	most of the game was successfully rescaled. Notable Exceptions were npcs and the start menus.
	xbox controller support was not added, but much of the code dealing with button input has been refactored with future implementation in mind.
	a hasty overland map was added to bridge the gap between lair and dungeon, but this is in a primitive state. it is not viewable from the start menu
	some initial sketches were made, but this was put on hold, since this would require a complete revision of all pathing in the game.

	Conclusion: we estimated this task surprisingly accurately. We found out that making high quality sprites is extremely time-consuming, much more than initially expected. While this list of features may seem small relative to the time invested, a lot of work was put into creating extensible systems and refactoring old code. redesigning the menus was expected to take a lot of time, and it did, especially since the old system was almost completely worthless. 
	
Sprint 02:
start date: 09/13/2015
end date: 09/26/2015

Sprint 02 Goals:
	1. Complete Skill and Ability Menus
			revise ability and skill systems, using lists of objects instead of more primitive approaches
			set up menus that can read these lists
	2. rescale start menus (make it look bearable)
	3. fix enemy AI
	4. Create the Main Skulker Abilities
			Apply Poison
			Stealth
			Crippling Strike
			
	5. add Xbox controller support
			create a persistent object to manage input
			use global-ish variables 
	6. Create Boss
			generate stairs that lead to the boss chamber
			write a boss AI
			make the boss sprite
	7. Create Quest
			cinematic explains to players what their quest is
			quest stored in logbook
	8. More Graphics
			Stand Animation
			Jump Animation
			Attack Animation
			Upgrade Shopkeeper to not be that resident evil guy
			Better Zombie and Evil Eye Sprites (walk, stand, attack)
	9. Isomorphic Pathing
			design isomorphic sprites for terrain
			use isomorphic pathing for stuff
			Dynamically set depth to x coordinate
			
Sprint Retrospective 02:
	added full xbox controller support
	added in enemy attacks and abilities, including delay, but did not fix the glitchy looking movement
	successfully added a fully functional skill menu
	opted to not add an ability menu, and instead set starting abilities in the class step
	set up the new ability and skill systems, which are pretty good if I do say so myself.
	updated save/load/create systems
	refactored a lot of code, got rid of or changed some obsolete or misleading variables, and generally improved code quality
	added stairs to maze generation algorithm (though probably just a temporary measure)
	added a boss and a boss chamber that can be reached via the stairs
	designed, implemented, and tested isomorphic blocks and isometric pathing
	updated start menus
	vastly improved the multiplayer menus, and did away with that manual ip typing thing.
	resized graphics for the enemies (quality remains poor however)
	deleted a lot of old worthless sprites and objects to help reduce load time
	npcs were not updated at all: dialog and shop menus are as broken as they were at the end of last sprint
	no additional character graphics were added, and existing ones were not improved.
	No cinematics were added, and the one bad cinematic we had was removed from the map
	No quests were added
	
	Conclusion: Though I was a little disappointed at how few noticeable changes were made, I have to admit that we managed to meet most of our goals. a lot of the problems with the game are graphical or level-related, and those just take time. At this stage its way more important to provide solid gameplay than to make the game look pretty. Once again, most of the time spent on the game isn't evident on the surface. considering how much work we put into the abilities, we don't have much to show for it. Once again, we estimated this sprint pretty well, though we ended up spending a lot of time on things that weren't initially in our sprint goals, like reworking the multiplayer lobbies, and towards the end of the sprint we had to rush to get the boss up. The shopkeeper and npcs were sort of low-priority items, but I was disappointed that I couldn't get the abilities working. It seems like we ran into more impediments this sprint than last, and like I said, we spent a lot of time on things that just sort of came up, like resizing enemy sprites and stuff.
	
Sprint 03:
start date: 09/27/2015
end date: 10/10/2015

Sprint 03 Goals:
	1. Complete Basic Abilities
		make sure that all the starting abilities work in single player and multiplayer
		apply poison: revisit poison system
		critical strike: modify damage on each attack (or hit)
		reflexes: just make sure it works in multiplayer
		shadow meld: change to smoke bomb or something. work on aggro
	2. Improved (non-embarrassing) Enemy AI
		fix that stupid path finding algorithm
		give a little nuance to enemy movement, don't just dog the footsteps of the players
		make enemies update in multiplayer at each step
	3. Greater variety of enemies
		static shooter (like the eyeballs in rogue legacy)
		flying harasser (like the charites in rogue legacy)
	4. Add on-screen feedback and start menu descriptions of abilities and skills
		draw the hotkey for each ability on the UI
		give some indication that the ability slots can be toggled;
		make something in the start menu to check traits, skills, and abilities
	5. Fix the Dialogue and Shop Menus
		resize them and update broken variable names
		make them work with xbox controller
	6. Put Enemy Drops back in
		maybe enemies just drop corpses, and you get the items when you loot the corpse while you eat it
	7. Skills and Traits Actually do stuff
		just call their event1 on charload, and add functions as neccessary
	8. Witchdoctor
		we already have 3 of the abilities, just add them
		The kicker is that we also need the sprites, so only do this if you have time
	9. Shopkeeper
		This basically amounts to making another couple of sprites (albeit mostly stationary ones)
		Don't forget to make a portrait, and maybe even a big portrait if you improve the dialogue system
	10. In-game documentation
		Please try to give some indication in game of whether a given functionality is working or not
		This mostly applies to all the skills and traits we aren't currently supporting
		Don't just write stuff in the game to help you remember

	Conclusion: Definitely the worst sprint so far. The only thing we really did was streamline room generation. We did a lot of knowledge acquisition, and spent a lot of time porting the game over to gamemaker:studio. We did work on some graphics assets, but not nearly what I hoped to accomplish. So in the end, we did not complete a single item on the list. Impediments were midterms, a lot of homework, and gamemaker suddenly breaking on me. also that halloween costume took a lot of time.
	
Sprint 04:
start date: 09/11/2015
end date: 10/24/2015

Sprint 04 Goals:
	1. Fix the broken Stuff in Gamemaker:Studio
		Everything related to Multiplayer
		Creation-based depth-sensitive menus
	2. Improved (non-embarrassing) Enemy AI
		fix that stupid path finding algorithm
		give a little nuance to enemy movement, don't just dog the footsteps of the players
		make enemies update in multiplayer at each step
	3. Greater variety of enemies
		static shooter (like the eyeballs in rogue legacy)
		flying harasser (like the charites in rogue legacy)
	4. Complete Basic Abilities
		make sure that all the starting abilities work in single player and multiplayer
		apply poison: revisit poison system
		critical strike: modify damage on each attack (or hit)
		reflexes: just make sure it works in multiplayer
		shadow meld: change to smoke bomb or something. work on aggro
	5. Add on-screen feedback and start menu descriptions of abilities and skills
		draw the hotkey for each ability on the UI
		give some indication that the ability slots can be toggled;
		make something in the start menu to check traits, skills, and abilities
	6. Fix the Dialogue and Shop Menus
		resize them and update broken variable names
		make them work with xbox controller
	7. Put Enemy Drops back in
		maybe enemies just drop corpses, and you get the items when you loot the corpse while you eat it
	8. Skills and Traits Actually do stuff
		just call their event1 on charload, and add functions as neccessary
	9. Witchdoctor
		we already have 3 of the abilities, just add them
		The kicker is that we also need the sprites, so only do this if you have time
	10. Shopkeeper
		This basically amounts to making another couple of sprites (albeit mostly stationary ones)
		Don't forget to make a portrait, and maybe even a big portrait if you improve the dialogue system
	11. In-game documentation
		Please try to give some indication in game of whether a given functionality is working or not
		This mostly applies to all the skills and traits we aren't currently supporting
		Don't just write stuff in the game to help you remember

	Conclusion: Well, we did some stuff, just none of the stuff we wanted to do. The game is still terrible, even though we have finished all the basic components of the stage editor. Level design still sucks, since we only have walls and floors and doors. the HUD is still a piece of garbage, and the UI is still awful. So basically, we spent this sprint fixing bugs and upgrading the level editor.
	
Sprint 05:
start date: 10/25/2015
end date: 11/07/2015

Sprint 05 Goals:
 - 1. Revise User Interface
	 - Upgrade HUD, including separate HUD schemes for keyboard and xbox controller
	 - Revise Keyboard Hotkey layout (do not insist on 1-to-1 correspondence with xbox)
	 - Upgrade menus and stuff to be more convenient.
 - 2. Enemy AI
	 - line of sight checking
	 - more complex movement (avoid clumping up, getting hit, etc.)
	 - different tactics for different enemies
	 - hitboxes and stuff
 - 3. make abilities at least non-broken.
 - 4. If you make it this far, go improve the level design

	Conclusion: Ok, I admit it, this sprint basically didn't happen. I sort of... looked at it... a couple times... but no, nothing was accomplished. This is what happens if you put things off and then your grandmother dies and you have to go on a long road trip to set up a funeral all week. So, in the future, try not to let any more relatives die, and don't take time off, since you never know when something unexpected is going to happen and absorb a weekend.
	
### Sprint 06:
Start Date: 11/08/2015
End Date: 11/21/2015

##### Sprint 06 Goals
 - 1. Fix Pathing
 - 2. Revise User Interface
	 - Upgrade HUD, including separate HUD schemes for keyboard and xbox controller
	 - Revise Keyboard Hotkey layout (do not insist on 1-to-1 correspondence with xbox)
	 - Upgrade menus and stuff to be more convenient.
 - 3. Enemy AI
	 - line of sight checking
	 - more complex movement (avoid clumping up, getting hit, etc.)
	 - different tactics for different enemies
	 - hitboxes and stuff
 - 4. make abilities at least non-broken.
 - 5. If you make it this far, go improve the level design
	Conclusion: Yet another weak sprint. either I've overestimated my abilities or I've underestimated the challenge. We revised some of the menus and did some artwork. The only really important thing we did was fix the movement glitch left over from the sprint before. 

### Sprint 07:
Start Date: 12/13/2015
End Date: 12/26/2015

##### Sprint 07 Goals
 - 1. Fix Hitboxes
 - 2. Revise User Interface
	 - Upgrade HUD, including separate HUD schemes for keyboard and xbox controller
	 - Revise Keyboard Hotkey layout (do not insist on 1-to-1 correspondence with xbox)
	 - Upgrade menus and stuff to be more convenient.
 - 3. Enemy AI
	 - line of sight checking
	 - more complex movement (avoid clumping up, getting hit, etc.)
	 - different tactics for different enemies
	 - hitboxes and stuff
 - 4. Improve Collision system to use height of terrain
		new pathing system
		new collision system
		ramps
		upgrade jumping
 - 5. Create a testing mode where we can debug AI and new terrain.
 - 6. If you make it this far, go improve the level design
	Conclusion: Finally a decent sprint. Of course, considering I had a complete holiday, I guess I shouldn't be so excited. We didn't quite get around to AI, which we knew would be a big thing. We have completed the improved Collision system, as well as a new arena mode in which to test new developments. In addition to these, we did many other things which are less directly impactful. most importantly, we found a way to abstract out some of the repetition involved in making and editing menus. We also did a lot of graphics stuff, both conceptual and actual sprites. We also did a lot of planning and thinking, and that does count for something. Overall, the biggest disappointment is how little these things seem to visibly affect the game. I was hoping for something more amazing during christmas break. Oh well, I'll make it up next sprint.

### Sprint 08:
Start Date: 12/27/2015
End Date: 01/09/2016

##### Sprint 08 Goals
 - 1. Fix Hitboxes (should have done this a while ago, its not that big of a project)
 - 2. Upgrade Level Editor
		include a way to manipulate height
		add ramps
 - 3. Just do the user interface already
	 - Upgrade HUD, including separate HUD schemes for keyboard and xbox controller
	 - Revise Keyboard Hotkey layout (do not insist on 1-to-1 correspondence with xbox)
	 - Upgrade menus and stuff to be more convenient.
	 - Do SOMETHING about the keyboard controls. they're awful.
 - 4. Combat Mechanics
	 - Start by working on the basics: get a functional enemy awareness model
	 - Try to streamline the character's abilities and movement. maybe its the graphics, but things seem kind of jerky and inaccurate.
	 - Set up a general system for incorporating delays into different actions. every attack should have a casting time.
	 - maybe just scrap the abilities for now, add them back in later when they start making sense.
 - 5. Enemy AI
	 - This is a big one, but this is your last chance to really crack down on it.
	 - develop an awareness model for the enemy, that allows them to remember things.
	 - implement basic collision, line-of-sight and pathfinding routines
	 - besides the primary states, figure in reasonable intermediate states. find a way to make this general and non-glitchy.
	 - fine tune combat behavior. streamline enemy attacks, including delays, tells, and other effects.
	 - develop a system of group behaviors for local mobs
	 - develop a system for dungeon-wide responses from inhabitants.
 - 6. Probably this will take the whole two weeks, but you really need to crank out at least a few levels to include the new system
	 - bigger and better chambers with modern collisions
	 - loading screen system for large levels
	Conclusion: Well, this was a good sprint over all. We did not count on the level editor giving us so much trouble, and integrating the new system took much longer than expected. However, we were still able to finish it in time to get a decent chunk of AI programming done. The only real problem with this sprint was that we got a little burned out at the end and went back to doing concept art. However, such things should not really be avoided, even if they could be. besides, I think a graphical update is overdue. incidentally, we adjusted the hitboxes, but this means very little since the combat system is still so primitive. We finally programmed in the new HUD too (part of it anyway).

### Sprint 09:
Start Date: 01/10/2016
End Date: 01/23/2016

##### Sprint 09 Goals
 - 1. Enemy AI
	 - Complete the basic single player AI
	 - set up general path finding function
	 - Implement stealth detection
	 - Implement camp AI
	 - implement dynamic group creation
	 - After finishing the basic guard-type AI, create variants for wandering monsters and stuff
	 - test in multiplayer
 - 2. Combat Improvement
	 - change the way attacking works (pathing, timing etc.)
	 - make attacks change depending on things like is_airborne and is_jumping
	 - add graphical indicators to show when a unit is being damaged or knocked back
	 - add abilities that work
 - 3. Complete at least one Dungeon
	 - set up the overworld map better than it is (show information and stuff)
	 - set up the dungeon generation algorithm to include things like minibosses, bonus objectives, gold count etc.
	 - put the staircase back in
	 - create a victory indicator or something
 - 4. Graphical tinkering
	 - Fix that obnoxious bug with the tile depth
	 - experiment with large enemies to make sure they work ok
	 - fix all the menus that look like they were made by a six year old
	Conclusion: Considering that we executed this sprint during school-weeks, I was pleasantly surprised at how much progress we made. We anticipated that AI would be extremely complex and delicate, and we were right. However, we have a very sophisticated AI that will be easy to adjust in the future. Our pathfinding algorithm is very good, and can be made better if we tweak the level editor a bit. In fact, we have already done the bulk of the work for this improvement, so I see no reason not to implement it. It does bother me a little that we are putting so much faith in the speed boost from GM:studio's compiled code. I would like to experiment with further optimizations before moving out of the sandbox. However, our biggest hurdle is actually in the aesthetic operations of local movement. we attempted to create a secondary pathfinding routine which will govern the enemy's short-term movement between nodes. this is not strictly necessary, but it is an important visual effect that will be difficult to add in later. While we failed to achieve our stated goals, this was not for lack of effort or creativity. We did a full sprint's worth of work, even though we only partially completed a single goal. by actual workload, we completed the larger portion of the assigned tasks. If there was any failure this sprint, it was in underestimating the amount of time required to complete the assigned tasks.

### Sprint 10:
Start Date: 01/24/2016
End Date: 02/06/2016

##### Sprint 10 Goals
 - 1. Enemy AI
	 - Complete the basic single player AI
	 - improve aesthetic path navigation
	 - Implement camp AI
	 - implement dynamic group creation
	 - After finishing the basic guard-type AI, create variants for wandering monsters and stuff
	 - test in multiplayer
 - 2. Combat Improvement
	 - change the way attacking works (pathing, timing etc.)
	 - make attacks change depending on things like is_airborne and is_jumping
	 - add graphical indicators to show when a unit is being damaged or knocked back
	 - add abilities that work
 - 3. Complete at least one Dungeon
	 - set up the overworld map better than it is (show information and stuff)
	 - set up the dungeon generation algorithm to include things like minibosses, bonus objectives, gold count etc.
	 - put the staircase back in
	 - create a victory indicator or something
 - 4. Graphical tinkering
	 - Fix that obnoxious bug with the tile depth
	 - experiment with large enemies to make sure they work ok
	 - fix all the menus that look like they were made by a six year old
	Conclusion: I like to divide this sprint into two subsprints I call week one and week two. Week one was great, we accomplished a lot, fixed some bugs with the AI, started working on an advanced dungeon generation algorithm, almost got the thing ready for production, and then... we hit week two. So in conclusion, we got about half the work done that we wanted to get done, and one week of graphics that we can't use yet.
	
### Sprint 11:
Start Date: 02/07/2016
End Date: 02/20/2016
 - 1. Complete at least one Dungeon
	 - set up the overworld map better than it is (show information and stuff)
	 - set up the dungeon generation algorithm to include things like minibosses, bonus objectives, gold count etc.
	 - put the staircase back in
	 - create a victory indicator or something
 - 2. Graphical tinkering
	 - Fix that obnoxious bug with the tile depth
	 - experiment with large enemies to make sure they work ok
	 - fix all the menus that look like they were made by a six year old
 - 3. AI and Combat Tweaks
	 - change the way attacking works (pathing, timing etc.)
	 - make attacks change depending on things like is_airborne and is_jumping
	 - add graphical indicators to show when a unit is being damaged or knocked back
	 - add abilities that work
	 - Implement camp AI
	 - implement dynamic group creation
	 - create variant AI for wandering monsters and special enemies
	Conclusion: Well, we had a bunch of goals at the beginning, but after we started tinkering with the terrain and the level editor, we decided to just scrap the whole thing and start fresh. So what actually ended up happening this sprint was a lot of graphics stuff. We made a complete run cycle for the rakasha warrior (EE), and made a ton of terrain improvements. We did some theoretical work with the gold system, but that doesn't really count so much. Ironically, though we made no progress towards feature completeness, we probably have more to show from this sprint than any other.
	
### Sprint 12:
Start Date: 02/21/2016
End Date: 03/05/2016
 - 1. Complete at least one Dungeon
	 - set up the overworld map better than it is (show information and stuff)
	 - set up the dungeon generation algorithm to include things like minibosses, bonus objectives, gold count etc.
	 - put the staircase back in
	 - create a victory indicator or something
 - 2. Create Functioning Mission Briefing
	 - create character portraits
	 - response system
	 - revise dialogue menu
 - 3. Improve Menus Again
	 - mostly just make them not look so terrible.