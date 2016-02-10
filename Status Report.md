# Gnoll Raider Status Report

##Introduction:

I know it sounds crazy to use a development methodology for a team of one programmer/writer/graphicsman, but sometimes people do crazy things, and since I'm already making a video game about man-eating hyena creatures, I don't really have much to lose. Anyway, I'm using a methodology referred to among software developers as agile/scrum (I did not invent these terms, I learned them in my software development class. just throwing that out there), which is basically jargon for developing software in short periods called sprints (Its kind of a metaphor), which usually last about two weeks. Each sprint begins with a meeting in which the team decides on a set of objectives for that sprint and decides who will do what. at the end of each sprint, the team reviews their work and adjusts their planning strategy as needed based on data gathered from the last sprint. in addition to planning and retrospection meetings, every day of a sprint the team members have a "daily scrum" in which each member updates his teammates on his progress since the last daily scrum, the idea being that if you spend a day playing video games instead of working, your team mates get mad at you and make you feel guilty for slacking off. So even though I don't have any team-mates, I try to keep track of what I do every day and do my best to be my own grouchy boss and make myself feel guilty if I slack off. 

##Now about that progress...
Status Report 9: (01/23/2016)
	At the end of this sprint, we had mostly completed the AI. The AI was expected to take multiple sprints. The subtasks completed this sprint were the research and development of fast and accurate pathfinding algorithms, the command stack framework, and enemy awareness model.
	
Status Report 8: (01/09/2016)
	And this was the sprint where I cleaned up some of the loose ends from the last sprint, fixed the level editor, merged the new systems into the project, and started working on the AI. A new build was uploaded after this sprint.

Status Report 7: (12/26/2015)
	So this was the sprint where I got back and spent two weeks completely redoing the pathing system, and menus. also added an arena.

Status Report 6: (12/13/2015)
	Now that finals are over Progress on gnoll raider will resume. I'm going to keep working on the HUD and UI because that's almsot ready, but I will also try and have some kind of working AI.

Status Report 5: (11/24/2015)
	If anyone was to wonder why there have been no new updates in the last couple of weeks, I would tell them that its because I can't work on the game until christmas break. Working on gnoll raider is fun and I don't like leaving a project to hang, but sometimes life is evil. It is especially likely to be so if you are a pathological procrastinator, and you have two term projects that were supposed to have been 50% done half a semester ago. The last sprint and this one are skipped, and the next one will be partially commandeered for studying for finals. after that though...
	I did fix that bug though, the one that would cause your guy to stick to diagonal surfaces.

Status Report 4.5: (11/07/2015)
So, after I fixed all that, I remembered that I still hadn't started on the two term projects that are going to be due in about four weeks, and then had to attend a funeral the next week anyway, thereby forfeiting most of my available time to work on gnoll raider. 
I wish I could go on for a few paragraphs about all the cool new features I implemented in the last two weeks, but actually I only worked on the game for 2 out of the 14 days available.
And here I thought I couldn't do worse than the last sprint, but that would imply that I actually worked at all...
However, now that midterms and funerals and halloween are over, productivity should rise back to normal. right?

I spent most of the last four weeks of development time fixing these problems.

However, there is some good news
Thanks to Zin (Gamejolt Community), I now have a level editor. With this I have been able to produce some decent dungeon chambers, and as I continue to improve the complexity of the editor, the levels will get better. 
The lag that occurred when entering a new chamber is gone now, and some bugs have been removed (like how you could walk through doors and right out the other side into the void).

Also, I have been busy revising the User Interface (UI) and Heads-Up Display (HUD) which were pretty inexcusable, even for me.
the graphics are still more or less an abomination, but I keep trying to make the keyboard inputs more intuitive.
One thing I have done is to design 2 separate HUDs, one for Xbox controllers and one for Keyboard

After I finish the HUD, my top priority is AI. I think that the terrible enemies are by far the most appalling flaw in the current game design. With my new physics engine and a decent level editor, hopefully I will be able to provide this soon.
	
Status Report 4: (??/??/2015)
or
Why the developer took twice as long to do half as much.
Well, things haven't been going that smoothly, which you might have guessed from the fact that there hasn't been an updated build in four weeks.
I have sort of been slacking off (not really, it was homework and other projects mostly, but still) but not as bad as you might think. The trouble is that for the last couple of weeks I've been busy doing back end stuff. Most of what I've been doing involves refactoring code to make it better and faster and less likely to break in the future, which is important in the long run, but doesn't tend to impress customers. The biggest thing I've done is to switch over from gamemaker 8.1 to gamemaker:studio.

Why does this matter? well, for one thing, yoyo games, the company that developed game maker, decided they didn't want to have to keep their update servers running for pre-studio versions of gamemaker. Normally, in a well-designed piece of software, this wouldn't be a problem. but game maker isn't a well designed piece of software. Every time you launch the program, if you're connected to the internet, it looks for the update server, and if it doesn't find it, it crashes your computer. 
I eventually found out that I could circumvent this by turning off my wireless before opening gamemaker, but since I already switched over, I decided to stick with it.
Although I would have preferred to make the switch on my own terms, it looks like this was probably for the best. Gamemaker:studio is much better for two important reasons:
1. It is compiled instead of interpreted (it is a million times faster)
2. It has non-worthless collision detection
Truth be told, I had actually spent the last couple of weeks trying to write a physics extension in C++ since gamemaker 8.1's built in line of sight functions are worthless for what I need them for and game maker is too slow to allow me to write my own in GML. It was probably quicker to switch to studio than to write the dll.

Unfortunately, this broke all the menus, all the message boxes, all the multiplayer (which relied on a dll. gamemaker:studio does not support dlls), and anything involving saving stuff to text files.


