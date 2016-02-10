SCRUM LOG - Sprint 02
start date: 09/13/2015
end date: 09/26/2015

Day 1 Scrum Meeting:
Date: 09/13/2015
	wrote something to process global user input
	took a break from work
	
Day 2 Scrum Meeting:
Date: 09/14/2015
	added xbox controller support for main game and main solo menu
	revised overland map
	set up the ability system but did not create the actual abilities
	made a function to add delay to button clicks
	
Day 3 Scrum Meeting:
Date: 09/15/2015
	fixed the start menus to work correctly with xbox controller and mostly rescaled (not very pretty though). code refactored
	created a number of abilities and revised the ability system
	created the witchdoctor skills for some reason.
	set up the skill system, but need to make the traits
	started making isomorphic pathing units and sprites (will need to be consistent, iso-grid is not 64x32, but 68x33)
	
Day 4 Scrum Meeting:
Date: 09/16/2015
	Worked out the isomorphic grids to be 64x32 instead of otherwise and reduced permutation count.
	Actually drew and tested the bulk of the isometric terrain.
	Impediments: 4 homework assignments that need to be done sooner than later
	
Day 5 Scrum Meeting:
Date: 09/17/2015
	Started working on the skill menu
	Impediments: homework till evening, taking breaks
	
Day 6 Scrum Meeting:
Date: 09/18/2015
	Nothing
	Impediments: babysitting
	
Day 7 Scrum Meeting:
Date: 09/19/2015
	Barely worked on the skill menu
	Impediments: babysitting
	
Day 8:
Date: 09/20/2015
	finished skill menu (some graphical readjustments may be desirable, but functionality is in place)
	made some skill icons
	
Day 9:
Date: 09/21/2015
	made sure the skill menu scrolls correctly (and fixed some graphics stuff)
	starting reworking multiplayer menus (this is going to be a big project)
	added in isomorphic stuff, just so people can see that it's there.
	
Day 10:
Date: 09/22/2015
	redid the multiplayer menus (functionality and code-quality only, graphics still suck)
	
Day 11:
Date: 09/23/2015
	???

Day 12:
Date: 09/24/2015
	tweaked the temporary isomorphic thing
	fixed* a multiplayer bug when going to different rooms
	updated the save/load/create functions to work with all implemented systems
	fixed a bunch of bugs that happened in multiplayer due to obsolete systems in packet system
	turned on enemy attacks, fixed a bug that occurred therein
	fixed the ghost
	added more death poems
	
Day 13:
Date: 09/25/2015
	made stairs graphics
	added stairs to dungeon generation algorithm(didn't test)
	added test chamber (didn't use)
	began reworking abilities
	implemented new keyboard system
	changed UI a bunch
	took out some obsolete things like dodge (now reflexes)
	added an interact script (not called)
	
Day 14:
Date: 09/26/2015
	fixed some random bugs that happened while improving variable names and refactoring
	continued working on ability system
	added knockback script (sucks though)
	added bosschamber
	tested bosschamber
	tested & fixed stair generation
	fixed UI, sort of
	added the boss and three terrible abilities
	

By the next daily scrum I will:
	DEBUG
	Improve enemy AI like promised.
			add a delay and channel period to attacks
			change the range of enemy pursuit
			change range of non-melee enemy attacks
			use an offset function for enemies
			add a melee attack
			add knockback to attacks
			have enemies not spawn on top of blocks* Temporary measure, till the level generator is done
			have fewer enemies spawn, but spawn in groups* Temporary measure, till the leveler generator is done
	Create a boss in the bosschamber. should be complicated and memorable.
	make working abilities
	make skills actually take effect
			check stuff on successful attack(crit chance, relative direction, etc.)
			make stealth worth something and not be broken
			
This stuff will wait until Chris gets done with his thing, if he decides to go through with it
	The Level Generator
			just make it simple for now. polish it later when you have time.
	Revise dungeon generation to read levels from a randomly selected room object.
	minor tweaks to isomorphic terrain
			shadows, cliff bases, multilayered terrain
	

	