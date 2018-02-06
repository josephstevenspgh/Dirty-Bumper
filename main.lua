-- Dirty Bumper main file
-- made by setz @splixel on twitter

--maped = true
--testbed = true

--[[
	ideas !

	plot progression	-- ill likely cut some things -- this would be a lot of art to make
	1	green fields		town			cave
	2	riverlands			marsh			ruined lake town
	3 	autumn fields		town			town guardhouse
	4	mountains			ice caps		frozen temple
	5	lava cave			dwarf town		monster attack
	6	demon world			demon village	arena
	7	final boss

	enemy spawning
	visible enemy spawners in each area. spawn enemies every x seconds infinitely. killing them gives ??? reward -- once off?
	enemies respawn after x time
	enemies respawn when there are less than max enemies, but offscreen
	enemies will fucking spawn anywhere

	classes
	
	name	stats 							natural abilities				special features

	hero	- base							utility abilities
	warrior	- atk/def++						-								lower ability regen
	wizard	- atk/def-						attack and status abilities		fast ability regen
	monk	- agi-		 					healing abilities	 			hp regen
	rogue	- def- agi+						status abilities 				
	tank 	- atk-- def++ 			 		healing abilities 				hp regen
	bard	- all-- 						- 			 					invisible to monsters? dodge chance?
	glass	- atk/agi++++ def----			attack abilities 				dodge chance
	merchant- base							-								gain gold over time, higher drop chance
	vampire	- def--							utility abilities				lifesteal on attack
	esper	- all+							???								fixed ability, changes randomly after a period of time
	beast	- all++							-								can never use abilities

	godmode	- all++++						all abilities					special unlock only - all positive effects

	hybrid	- class 1						class 2 						new game + only - inherits special features of class 2, any sprite

	stats
	attack	- base damage
	defence	- base damage reduction
	agility	- affects cooldown between attacks. maybe affects ability regen rate?
	smarts	- not sure if i want this one in, affect ability damage/regen?

	items
	weapon	- generally attack++
	armor 	- generally defence++
	necklace- generally agility++
	ring 	- random attributes, possibly give ability while equipped
	usables - hp recovery, ability recovery, status clear, temporary stat boosts, ability-like items, etc

	abilities	- abilities should have a way to become more effective over time. exp? individual or pooled?
	hadoken		- forward moving projectile
	slash		- slashes an area infront of you, close range
	ball		- close range attack, damaging an area all around you
	stun		- stun every enemy on the screen for x seconds
	sleep 		- sleep every enemy on the screen
	power		- increase attack for x seconds
	armor 		- increase defence for x seconds
	shield		- block 1 attack completely
	speed 		- faster movement
	zap			- attack every enemy on the screen
	suck blood	- steal hp
	growl		- lower enemy attack
	glare		- lower enemy defence
	spit 		- lower enemy agility
	heal		- increase current hp
	bonk		- lower enemy max hp
	poison		- poisons enemy
finit	mute		- prevent enemy skills
	warp		- warp to any area
	push		- damage + knock enemy back
]]

function love.load()
	love.math.setRandomSeed(50000)

	love.filesystem.setIdentity("DirtyBumper")
	--setzlib
	require("setzlib")

	--load art/map/sound assets
	require("loader")
	--items
	require("items")
	--abilities
	require("abilities")

	--sprites
	require("dirtybumper")

	--game states
	if maped then
		require("maped")
	else
		require("ingame")
	end
		--substates
		require("shop")
		require("pausemenu")

	require("titlescreen")
	gamestate_ingame = 0
	gamestate_title = 1

	--screen size and scaling
	screen = {}
	screen.width = 320
	screen.height = 180
	scaleamount = 2
	love.graphics.setDefaultFilter("nearest", "nearest", 1)
	-- scale with a canvas, not with scale()
	canvas = love.graphics.newCanvas(320, 180)
	
	--ingame init




	--initial game state
	if testbed then 
		gamestate = gamestate_testbed
	else
		gamestate = gamestate_title
	end
	previousstate = 0
	nextstate = 0
   	love.graphics.setFont(font_classic)
	nextspriteid = 0
	init_titlescreen()

	--menus
	menuposx = 0
	menuposy = 0

	--options
	textspeed = 3
	musiclevel = 4
	sfxlevel = 5

	--buttonconfig
	buttonnames = {"action", "cancel", "pause"}

	joysticks = get_joysticks()

	--control vars
	pause_button = init_button("return")
	action_button = init_button("z")
	cancel_button = init_button("x")
	up_button = init_button("up")
	down_button = init_button("down")
	left_button = init_button("left")
	right_button = init_button("right")
	--default joypad controls
	--[[button_add_joypad_button(pause_button, joysticks[1], 8)
	button_add_joypad_button(action_button, joysticks[1], 3)
	button_add_joypad_button(cancel_button, joysticks[1], 1)
	button_add_joypad_hat(up_button, joysticks[1], 1, "u")
	button_add_joypad_hat(down_button, joysticks[1], 1, "d")
	button_add_joypad_hat(left_button, joysticks[1], 1, "l")
	button_add_joypad_hat(right_button, bjoysticks[1], 1, "r")]]

	buttons = {}
	table.insert(buttons, pause_button)
	table.insert(buttons, action_button)
	table.insert(buttons, cancel_button)
	table.insert(buttons, down_button)
	table.insert(buttons, up_button)
	table.insert(buttons, left_button)
	table.insert(buttons, right_button)

	if testbed then
		init_testbed()
	end
end

function love.update(dt)
	control_mechanics()
	if gamestate == gamestate_ingame then
		update_ingame()
	elseif gamestate == gamestate_title then
		update_titlescreen()
	elseif gamestate == gamestate_testbed then
		update_testbed()
	end
end

function love.draw()
	love.graphics.setCanvas(canvas)
	if gamestate == gamestate_ingame then
		draw_ingame()
	elseif gamestate == gamestate_title then
		draw_titlescreen()
	elseif gamestaet == gamestate_testbed then
		draw_testbed()
	end
	love.graphics.setCanvas()
	love.graphics.draw(canvas, 0, 0, 0, scaleamount)
end

function love.quit()
	print("thanks man")
end

--controls
function control_mechanics()
	for i=1,#buttons do
		button_mechanics(buttons[i])
	end
end

--menus
function menu_controls(xamount, yamount)
	if left_button.justpressed then
		menuposx = menuposx - 1
	elseif right_button.justpressed then
		menuposx = menuposx + 1
	end
	if up_button.justpressed then
		menuposy = menuposy - 1
	elseif down_button.justpressed then
		menuposy = menuposy + 1
	end

	--wrap
	if menuposx < 0 then
		menuposx = xamount - 1
	elseif menuposx > xamount - 1 then
		menuposx = 0
	end

	if menuposy < 0 then
		menuposy = yamount - 1
	elseif menuposy > yamount - 1 then
		menuposy = 0
	end
end

--new game
function new_game(class)
	init_ingame()
	sp_player = player_init(136, 490, class)
	changemap(3)
	gamestate = gamestate_ingame
end

--save game
function savegame(slot)
	local savetable = {}
   	--player
   	table.insert(savetable, sp_player.class)
   	table.insert(savetable, sp_player.maxhp)
   	table.insert(savetable, sp_player.hp)
   	table.insert(savetable, sp_player.attack)
   	table.insert(savetable, sp_player.hp)
   	table.insert(savetable, sp_player.defence)
   	table.insert(savetable, sp_player.agility)
   	table.insert(savetable, sp_player.level)
   	table.insert(savetable, sp_player.exp)
   	table.insert(savetable, sp_player.gold)
   	table.insert(savetable, sp_player.swordequipped)
   	table.insert(savetable, sp_player.shieldequipped)
   	table.insert(savetable, sp_player.armorequipped)
   	table.insert(savetable, sp_player.ringequipped)
   	table.insert(savetable, sp_player.currentability)
   	if sp_player.canpush then
   		table.insert(savetable, "true")
   	else
   		table.insert(savetable, "false")
   	end
   	if sp_player.hooks then
   		table.insert(savetable, "true")
   	else
   		table.insert(savetable, "false")
   	end
   	if sp_player.canswim then
   		table.insert(savetable, "true")
   	else
   		table.insert(savetable, "false")
   	end
   	if sp_player.canjump then
   		table.insert(savetable, "true")
   	else
   		table.insert(savetable, "false")
   	end
   	for i=1,8 do
   		table.insert(savetable, sp_player.itemsowned[i])
   	end
   	for i=1,8 do
   		if sp_player.swordsowned[i] then
   			table.insert(savetable, "true")
   		else
   			table.insert(savetable, "false")
   		end
   	end
   	for i=1,8 do
   		if sp_player.shieldsowned[i] then
   			table.insert(savetable, "true")
   		else
   			table.insert(savetable, "false")
   		end
   	end
   	for i=1,8 do
   		if sp_player.armorsowned[i] then
   			table.insert(savetable, "true")
   		else
   			table.insert(savetable, "false")
   		end
   	end
   	for i=1,8 do
   		if sp_player.ringsowned[i] then
   			table.insert(savetable, "true")
   		else
   			table.insert(savetable, "false")
   		end
   	end
   	for i=1,8 do
   		if sp_player.abilitieslearned[i] then
   			table.insert(savetable, "true")
   		else
   			table.insert(savetable, "false")
   		end
   	end
   	--map
   	table.insert(savetable, currentmap.id)
   	table.insert(savetable, sp_player.x)
   	table.insert(savetable, sp_player.y)


	if internal_savegame(savetable, "savefile"..slot) then
	else
	end
end

--load game
function loadgame(slot)
	--+0 means string to int
	savetable = internal_loadgame("savefile"..slot)

	--ready up a game
	init_ingame()
	--create class
	sp_player = player_init(savetable[69], savetable[70], savetable[1])

	--load player attributes
	sp_player.maxhp = savetable[2]+0
	sp_player.hp = savetable[3]+0
	sp_player.attack = savetable[4]+0
   	sp_player.hp = savetable[5]+0
   	sp_player.defence = savetable[6]+0
   	sp_player.agility = savetable[7]+0
   	sp_player.level = savetable[8]+0
   	sp_player.exp = savetable[9]+0
   	sp_player.gold = savetable[10]+0
   	sp_player.swordequipped = savetable[11]+0
   	sp_player.shieldequipped = savetable[12]+0
   	sp_player.armorequipped = savetable[13]+0
   	sp_player.ringequipped = savetable[14]+0
   	sp_player.currentability = savetable[15]+0
   	sp_player.canpush = stringtobool(savetable[16])
   	sp_player.hooks = stringtobool(savetable[17])
   	sp_player.canswim = stringtobool(savetable[18])
   	sp_player.canjump = stringtobool(savetable[19])
   	for i=1,8 do
   		sp_player.itemsowned[i] = savetable[19+i]+0
   		sp_player.swordsowned[i] = stringtobool(savetable[27+i])
   		sp_player.shieldsowned[i] = stringtobool(savetable[35+i])
		sp_player.armorsowned[i] = stringtobool(savetable[43+i])
   		sp_player.ringsowned[i] = stringtobool(savetable[51+i])
   		sp_player.abilitieslearned[i] = stringtobool(savetable[59+i])
   	end
	--change map and positioning
	changemap(savetable[68]+0)
	gamestate = gamestate_ingame
end

function showicon(n, x, y, t)
	local gfx_this = gfx_menuicons
	if t == "item" then
		gfx_this = gfx_itemicons
	elseif t == "weapon" then
		gfx_this = gfx_weaponicons
	elseif t == "armor" then
		gfx_this = gfx_armoricons
	elseif t == "shield" then
		gfx_this = gfx_shieldicons
	elseif t == "ring" then
		gfx_this = gfx_ringicons
	elseif t == "ability" then
		gfx_this = gfx_abilityicons
	elseif t == "menu" then
		gfx_this = gfx_menuicons
	end

	local q = love.graphics.newQuad(n*16, 0, 16, 16, gfx_this:getWidth(), gfx_this:getHeight())
	love.graphics.draw(gfx_this, q, x, y)
end

--test shit

function init_testbed()
	sp_player = player_init(50, 50, "thief")
	init_ingame()
	changemap(1)

	tmpcanvas = love.graphics.newCanvas(320, 180)
	toplayer = love.graphics.newCanvas(500,500)
	botlayer = love.graphics.newCanvas(500,500)

	gfx_tmp = love.graphics.newImage("sprites/testfog.png")
	gfx_tmp2 = love.graphics.newImage("sprites/testlight.png")
	--get top and bottom quads
	--	--quad = love.graphics.newQuad( x, y, width, height, sw, sh )

	fogheight = 4
	fogdir = "down"
	--topquad = love.graphics.newQuad(0, 0, 24, 16, gfx_tmp2:getWidth(), gfx_tmp2:getHeight())
end

function update_testbed()
	player_controls(sp_player)
	if fogdir == "down" then
		fogheight = fogheight - .01
		if fogheight < 4 then
			fogdir = "up"
		end
	else
		fogheight = fogheight + .01
		if fogheight > 10 then
			fogdir = "down"
		end
	end
end

function draw_testbed()
	--fill black
	love.graphics.setCanvas(toplayer)
	love.graphics.clear()
	love.graphics.setCanvas(botlayer)
	love.graphics.clear()
	love.graphics.setCanvas(canvas)
	love.graphics.clear()
	lprint("test mode")
	test_draw_player()
	love.graphics.draw(botlayer)
	love.graphics.draw(gfx_tmp2, 0, -fogheight)
	love.graphics.draw(toplayer)
	--lprint("fps: "..love.timer.getFPS(), 0, 10)
end

function test_draw_player()
	sprite_playanimation(sp_player)
	test_sprite_draw(sp_player)
end

function test_sprite_draw(sprite)
	--get frame
	
	love.graphics.setCanvas(tmpcanvas)
	love.graphics.clear()
	love.graphics.draw(sprite.artsheet, sprite.frame[sprite.currentframe])
	--love.graphics.draw(sprite.artsheet, sprite.frame[sprite.currentframe], math.floor(sprite.x+sprite.width/2), math.floor(sprite.y+sprite.height/2), sprite.rotation, sprite.scalex, sprite.scaley, sprite.width/2, sprite.height/2)
	
	--draw above fog
	local topquad = love.graphics.newQuad(0, 0, sprite.width, sprite.height-fogheight, tmpcanvas:getWidth(), tmpcanvas:getHeight())
	love.graphics.setCanvas(toplayer)
	love.graphics.draw(tmpcanvas, topquad, math.floor(sprite.x+sprite.width/2), math.floor(sprite.y+sprite.height/2), sprite.rotation, sprite.scalex, sprite.scaley, sprite.width/2, sprite.height/2)
	--draw below fog
	love.graphics.setCanvas(botlayer)
	local botquad = love.graphics.newQuad(0, sprite.height-fogheight, sprite.width, fogheight, tmpcanvas:getWidth(), tmpcanvas:getHeight())
	love.graphics.draw(tmpcanvas, botquad, math.floor(sprite.x+sprite.width/2), math.floor(sprite.y+sprite.height/2)+sprite.height-fogheight, sprite.rotation, sprite.scalex, sprite.scaley, sprite.width/2, sprite.height/2)
	--
	love.graphics.setCanvas(canvas)
end