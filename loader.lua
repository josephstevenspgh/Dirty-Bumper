--load assets

--load art

--classes
gfx_warrior = love.graphics.newImage("runred.png")
gfx_thief = love.graphics.newImage("runblue.png")
gfx_portraits = love.graphics.newImage("sprites/portraits.png")
--stuff
gfx_bar_background_small = love.graphics.newImage("sprites/bars/small_background.png")
gfx_bar_blue_small = love.graphics.newImage("sprites/bars/small_blue.png")
gfx_bar_background = love.graphics.newImage("sprites/bars/background.png")
gfx_bar_red = love.graphics.newImage("sprites/bars/red.png")
gfx_bar_orange_tiny = love.graphics.newImage("sprites/bars/tiny_orange.png")
gfx_cursor = love.graphics.newImage("sprites/cursor.png")
gfx_lighteffect = love.graphics.newImage("sprites/testlight.png")
--interactables
gfx_exclamation = love.graphics.newImage("sprites/exclamation.png")
gfx_rock1 = love.graphics.newImage("sprites/rock.png")
gfx_bombwall = love.graphics.newImage("sprites/bombwall.png")
gfx_bush1 = love.graphics.newImage("sprites/bush.png")
gfx_sign = love.graphics.newImage("sprites/sign.png")
gfx_chest = love.graphics.newImage("sprites/chest.png")
gfx_nullchest = love.graphics.newImage("sprites/nullchest.png")
--cosmetics
gfx_tuft1 = love.graphics.newImage("sprites/deco/grass.png")
gfx_flowers = love.graphics.newImage("sprites/deco/flowers.png")
gfx_flowerl = love.graphics.newImage("sprites/deco/flowerleft.png")
gfx_flowerr = love.graphics.newImage("sprites/deco/flowerright.png")
gfx_tree = love.graphics.newImage("sprites/deco/tree.png")
gfx_waterrock1 = love.graphics.newImage("sprites/deco/waterrock1.png")
gfx_waterrock2 = love.graphics.newImage("sprites/deco/waterrock2.png")
--abilities
gfx_fire = love.graphics.newImage("sprites/fire.png")
gfx_bomb = love.graphics.newImage("sprites/bomb.png")
gfx_cut = love.graphics.newImage("cut.png")
--ui
gfx_hud = love.graphics.newImage("ui.png")
--gfx_textbox = love.graphics.newImage("textbox#tiles.png")
gfx_textbox = love.graphics.newImage("sprites/textbox8#tiles.png")
gfx_itemicons = love.graphics.newImage("itemicons.png")
gfx_weaponicons = love.graphics.newImage("weaponicons.png")
gfx_armoricons = love.graphics.newImage("armoricons.png")
gfx_shieldicons = love.graphics.newImage("shieldicons.png")
gfx_ringicons = love.graphics.newImage("ringicons.png")
gfx_menuicons = love.graphics.newImage("menuicons.png")
gfx_abilityicons = love.graphics.newImage("abilityicons.png")
--enemies
gfx_slime = love.graphics.newImage("slime.png")
gfx_smallslime = love.graphics.newImage("smallslime.png")
gfx_bat = love.graphics.newImage("sprites/bat.png")
gfx_beastman_fighter = love.graphics.newImage("sprites/beastman_fighter.png")
gfx_beastman_scout = love.graphics.newImage("sprites/enemies/beastman_scout.png")
gfx_fireball = love.graphics.newImage("sprites/fireball.png")
--npc
gfx_npc = love.graphics.newImage("sprites/npcs/bad_npc.png")
gfx_oldman = love.graphics.newImage("sprites/npcs/old man.png")
gfx_youngman = love.graphics.newImage("sprites/npcs/young man.png")
gfx_youngwoman = love.graphics.newImage("sprites/npcs/young woman.png")
gfx_girl = love.graphics.newImage("sprites/npcs/girl.png")
gfx_boy = love.graphics.newImage("sprites/npcs/boy.png")
gfx_shopkeep = love.graphics.newImage("sprites/npcs/shopkeep.png")
gfx_beastman_man = love.graphics.newImage("sprites/npcs/beastman villager.png")
gfx_beastman_woman = love.graphics.newImage("sprites/npcs/beastman villager female.png")
--misc
gfx_null = love.graphics.newImage("sprites/null.png")
 
--load fonts
font_classic = love.graphics.newImageFont("ClassicFont.png", "abcdefghijklmnopqrstuvwxyz:.!-,()|?<>\"+0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ/'")
font_damage = love.graphics.newImageFont("damagefont.png", "-1234567890", 1)
font_hud = love.graphics.newImageFont("hudFont.png", "hp0123456789:ex%", 1)

--load sounds
sfx_hit = love.sound.newSoundData("hit.wav")
sfx_win = love.sound.newSoundData("win.wav")
sfx_levelup = love.sound.newSoundData("levelup.wav")
sfx_textblip = love.sound.newSoundData("sfx/textblip.wav")
sfx_alert = love.sound.newSoundData("sfx/alert.wav")

--background images
gfx_bg_mountains = love.graphics.newImage("maps/shitsky_bg.png")

--load maps
map = {}
for i=1,2000 do
	map[i] = {}
end
map[1].tileset = love.graphics.newImage("maps/Meadow#tiles.png")
map[1].tilemap, map[1].width, map[1].height = load_tileset("maps/Meadow#map001.txm")
map[1].collision = generatecollision("maps/Meadow#Collision1.png")
map[1].npctable = {	
					{"slime", 250, 25}, 
					{"pickupable", 336, 258, 4, 5, "chest"},
					{"pickupable", 240, 530, 5, 6, "chest"},
					{"bombwall", 336, 256},
					{"bombwall", 240, 528},

					{"slime", 154, 244}, 
					{"slime", 306, 202}, 
					{"slime", 336, 114}, 
					{"slime", 160, 205}, 
					{"slime", 546, 208},
					{"slime", 476, 82},
					{"slime", 381, 401},
					{"slime", 227, 473},
					{"slime", 339, 305},
					{"slime", 364, 506},
					{"slime", 175, 554},
					{"sideexit", "left", 3, 592, 380},
					{"sideexit", "right", 4, 16, 528},
					{"tilewarp", 480, 192, 101, 148, 194},
					{"tilewarp", 224, 320, 102, 92, 618},
					{"tilewarp", 560, 400, 102, 516, 618},
					{"tilewarp", 432, 464, 103, 272, 618},
					{"npc", 442, 88, "You'll find a lot of\nsecrets like this all over\nthe world, if you look good\nand hard.", 0, gfx_oldman},
					{"sign", 90, 248, "Wastelands\nyou'll want to be strong\nto get through here.", 0},
					{"tree1", 87, 162},
					{"flower1", 42, 130},
					{"flower1", 63, 106},
					{"flower1", 82, 74},
					{"flower1", 44, 74},
					{"flower1", 30, 101},
					{"flower1", 17, 139},
					{"flower3", 36, 145},
					{"flower3", 64, 132},
					{"tuft1", 62, 119},
					{"tuft1", 503, 91},
					{"tuft1", 447, 82},
					{"tuft1", 464, 95},
					{"tuft1", 440, 205},
					{"tuft1", 475, 224},
					{"tuft1", 461, 222},
					{"tuft1", 504, 238},
					{"tuft1", 532, 226},
					{"tuft1", 554, 209},
					{"tuft1", 566, 199},
					{"tuft1", 569, 177},
					{"flower2", 463, 212},
					{"flower3", 537, 212},
					{"flower3", 547, 205},
					{"flower3", 564, 190},
					{"flower1", 547, 104},
					{"flower1", 490, 120},
					{"flower2", 429, 94},
					{"flower2", 440, 86},
					{"flower3", 526, 101},
					{"flower3", 532, 110},
					{"flower3", 517, 110},
					{"flower3", 525, 118},
					{"flower3", 510, 126},
					{"flower2", 510, 115},
					{"flower2", 473, 118},
					{"flower2", 457, 113},
				}

map[2].tileset = love.graphics.newImage("maps/Meadow#tiles.png")
map[2].tilemap, map[2].width, map[2].height = load_tileset("maps/Meadow#map002.txm")
map[2].collision = generatecollision("maps/Meadow#Collision2.png")
map[2].npctable = {	
					{"sideexit", "bottom", 3, 350, 8},
					{"tilewarp", 240, 256, 200, 148, 262},
					{"tilewarp", 448, 240, 201, 148, 262},
					{"tilewarp", 160, 368, 202, 356, 266},
					{"tilewarp", 352, 160, 204, 260, 265},
					{"tilewarp", 464, 400, 203, 260, 265},
					{"sign", 390, 494, "Welcome to Firston!\npopulation: too many", 0},
					--townsdudes
					{"npc", 194, 471, "I like to come here to fish.\nNot much else to do in this\ntown.\nIt's a shame about princess.\nshe was beautiful.", 0, gfx_youngman},
					{"npc", 204, 135, "When I grow up, I'm gonna\nleave this town.\nI hear theres a town in\na forest full of elves!\nthats where I want to go.", 0, gfx_girl, "walk_wherever"},
					{"npc", 368, 289, "Hey, welcome to Firston!\n|We've got a shop in the southwest.\nwe've got an inn in the southeast.\nall the way at the end of town\nis the elder's house.\n|It might be a good idea to talk\nto the elder. he knows things.", 0, gfx_youngwoman, "walk_wherever"},
					--{"npc", 480, 425, "my ypos is 420\n|yeee", 0, gfx_youngman, "walk_wherever"},
					{"npc", 480, 425, "my mother always told me nothing\ngood ever comes from drinking.\n|but i kind of want to go drink\nanyway.", 0, gfx_youngman, "walk_points", {{460, 450}, {433, 433}, {480, 433}, {480, 425}, {"wait", "wait"}, {"wait", "wait"}}},
					{"npc", 420, 120, "that elders always saying\nthe worlds gonna end.\ni dont believe him one bit.", 0, gfx_boy, "walk_wherever"},
					{"npc", 270, 333, "i live in the house\nright up there\n|my wife has been nagging\nme about something..\nshut her up for me yea?", 0, gfx_youngman},

					--decoration
					{"cbush", 101, 585},
					{"cbush", 43, 599},
					{"cbush", 10, 547},
					{"tuft1", 122, 547},
					{"tuft1", 161, 559},
					{"tuft1", 98, 544},
					{"tuft1", 49, 526},
					{"tuft1", 7, 479},
					{"tree1", 6, 489},
					{"tree1", 43, 553},
					{"tree1", 222, 566},
					{"flower1", 166, 576},
					{"flower1", 114, 557},
					{"flower1", 44, 525},
					{"flower2", 101, 553},
					{"flower2", 132, 589},
					{"flower2", 5, 502},
					{"flower3", 14, 494},
					{"flower3", 63, 538},
					{"flower3", 135, 553},
					{"flower3", 150, 568},
					{"flower3", 283, 613},
					{"flower3", 291, 625},
					{"tuft1", 128, 347},
					{"tuft1", 98, 347},
					{"tuft1", 148, 251},
					{"tuft1", 332, 187},
					{"tuft1", 369, 187},
					{"tuft1", 380, 187},
					{"tuft1", 466, 268},
					{"tuft1", 395, 512},
					{"tree1", 536, 364},
					{"tree1", 514, 237},
					{"tree1", 439, 101},
					{"tree1", 91, 167},
					{"tree1", 43, 211},
					{"tree1", 278, 171},
					{"tree1", 372, 150},
					{"tree1", 361, 203},
					{"tree1", 369, 346},
					{"flower1", 282, 364},
					{"flower1", 191, 360},
					{"flower1", 95, 448},
					{"flower1", 77, 412},
					{"flower1", 54, 390},
					{"flower1", 38, 377},
					{"flower1", 55, 362},
					{"flower1", 39, 328},
					{"flower1", 63, 296},
					{"flower1", 96, 254},
					{"flower1", 123, 267},
					{"flower1", 196, 212},
					{"flower1", 210, 192},
					{"flower1", 202, 167},
					{"flower1", 295, 167},
					{"flower1", 412, 167},
					{"flower1", 418, 50},
					{"flower1", 529, 54},
					{"flower1", 578, 54},
					{"flower1", 592, 76},
					{"flower1", 584, 10},
					{"flower1", 359, 18},
					{"flower1", 196, 5},
					{"flower1", 154, 22},
					{"flower1", 104, 36},
					{"flower1", 53, 47},
					{"flower1", 26, 47},
					{"flower1", 18, 68},
					{"flower1", 36, 61},
					{"flower2", 17, 53},
					{"flower2", 11, 79},
					{"flower2", 48, 56},
					{"flower2", 97, 45},
					{"flower2", 148, 27},
					{"flower2", 189, 11},
					{"flower2", 176, 22},
					{"flower2", 132, 41},
					{"flower2", 124, 13},
					{"flower2", 148, 4},
					{"flower2", 83, 25},
					{"flower2", 355, 26},
					{"flower2", 345, 22},
					{"flower2", 335, 31},
					{"flower2", 350, 34},
					{"flower2", 412, 59},
					{"flower2", 524, 52},
					{"flower2", 572, 62},
					{"flower2", 583, 85},
					{"flower2", 578, 23},
					{"flower2", 587, 29},
					{"flower2", 576, 36},
					{"flower2", 424, 415},
					{"flower2", 278, 272},
					{"flower2", 275, 255},
					{"flower2", 204, 200},
					{"flower2", 198, 183},
					{"flower2", 198, 235},
					{"flower2", 218, 257},
					{"flower2", 117, 278},
					{"flower2", 74, 286},
					{"flower2", 53, 310},
					{"flower2", 41, 323},
					{"flower2", 27, 342},
					{"flower2", 53, 371},
					{"flower2", 46, 396},
					{"flower2", 70, 413},
					{"flower2", 83, 447},
					{"flower3", 121, 460},
					{"flower3", 110, 449},
					{"flower3", 88, 419},
					{"flower3", 71, 395},
					{"flower3", 55, 379},
					{"flower3", 58, 327},
					{"flower3", 85, 305},
					{"flower3", 113, 263},
					{"flower3", 144, 275},
					{"flower3", 183, 275},
					{"flower3", 196, 351},
					{"flower3", 211, 241},
					{"flower3", 216, 224},
					{"flower3", 223, 178},
					{"flower3", 223, 154},
					{"flower3", 203, 154},
					{"flower3", 300, 161},
					{"flower3", 283, 262},
					{"flower3", 283, 248},
					{"flower3", 275, 235},
					{"flower3", 265, 373},
					{"flower3", 410, 351},
					{"flower3", 419, 362},
					{"flower3", 521, 401},
					{"flower3", 514, 408},
					{"flower3", 550, 62},
					{"flower3", 601, 59},
					{"flower3", 609, 84},
					{"flower3", 605, 16},
					{"flower3", 460, 16},
					{"flower3", 445, 36},
					{"flower3", 434, 51},
					{"flower3", 382, 37},
					{"flower3", 378, 27},
					{"flower3", 360, 13},
					{"flower3", 215, 13},
					{"flower3", 141, 13},
					{"flower3", 116, 25},
					{"flower3", 101, 25},
					{"flower3", 73, 52},
					{"flower3", 58, 65},
					{"flower3", 100, 237}
					}

map[3].tileset = love.graphics.newImage("maps/Meadow#tiles.png")
map[3].tilemap, map[3].width, map[3].height = load_tileset("maps/Meadow#map003.txm")
map[3].collision = generatecollision("maps/Meadow#Collision3.png")
map[3].npctable = {	
					--temp
					{"npc", 120, 470, "free climbing hooks!", 2, gfx_boy, "walk_wherever"},
					--{"beastman_fighter", 120, 470},

					{"pickupable", 418, 171, 2, 3, "hidden"},
					{"pickupable", 114, 229, 3, 4, "chest"},
					--enemies
					{"slime", 186, 540}, 
					{"slime", 322, 408}, 
					{"slime", 460, 522}, 
					{"slime", 486, 374}, 
					{"slime", 510, 278}, 
					{"slime", 500, 200},
					{"slime", 488, 72},
					{"slime", 294, 90},
					{"slime", 206, 190},
					{"slime", 60, 140},
					{"slime", 114, 286},
					--warps
					{"sideexit", "top", 2, 352, 592},
					{"sideexit", "right", 1, 8, 300},
					{"tilewarp", 64, 100, 100, 148, 150},
					{"tilewarp", 544, 244, 104, 153, 235},
					--interactables
					{"sign", 80, 112, "This is the debug cave.\n|freely gain cheats here\nalso, ability testing.", 0},
					{"sign", 196, 390, "welcome to dirty bumper!", 0},
					{"cbush", 544, 264},
					--pretties
					{"waterrock1", 53, 433},
					{"waterrock1", 174, 316},
					{"waterrock1", 224, 254},
					{"waterrock1", 159, 229},
					{"waterrock1", 69, 235},
					{"waterrock1", -8, 190},
					{"waterrock1", 243, 388},
					{"waterrock1", 135, 608},
					{"waterrock1", 156, 618},
					{"waterrock1", 238, 618},
					{"waterrock2", 353, 629},
					{"waterrock2", 443, 636},
					{"waterrock2", 572, 606},
					{"waterrock2", 633, 552},
					{"waterrock2", 630, 191},
					{"waterrock1", 464, 163},
					{"waterrock1", 376, 195},
					{"waterrock1", 603, 518},
					{"waterrock1", 403, 506},
					{"flower1", 76, 436},
					{"flower1", 111, 507},
					{"flower1", 153, 547},
					{"flower1", 302, 564},
					{"flower1", 368, 521},
					{"flower1", 340, 455},
					{"flower1", 219, 413},
					{"flower1", 257, 334},
					{"flower1", 106, 345},
					{"flower1", 82, 366},
					{"flower1", 60, 330},
					{"flower1", 79, 285},
					{"flower1", 70, 160},
					{"flower1", 42, 142},
					{"flower1", 42, 51},
					{"flower1", 109, 39},
					{"flower1", 172, 69},
					{"flower1", 207, 88},
					{"flower1", 264, 128},
					{"flower1", 248, 156},
					{"flower1", 315, 195},
					{"flower1", 348, 233},
					{"flower1", 386, 115},
					{"flower1", 418, 82},
					{"flower1", 465, 65},
					{"flower1", 491, 106},
					{"flower1", 533, 123},
					{"flower1", 602, 151},
					{"flower1", 636, 222},
					{"flower1", 518, 225},
					{"flower1", 476, 244},
					{"flower1", 417, 266},
					{"flower1", 525, 315},
					{"flower1", 560, 345},
					{"flower1", 529, 499},
					{"flower1", 551, 544},
					{"flower1", 516, 573},
					{"flower1", 585, 621},
					{"flower1", 610, 621},
					{"flower1", 630, 621},
					{"flower1", 618, 603},
					{"flower1", 597, 603},
					{"flower1", 609, 587},
					{"flower1", 636, 587},
					{"flower1", 446, 541},
					{"flower2", 364, 533},
					{"flower2", 298, 556},
					{"flower2", 144, 550},
					{"flower2", 110, 506},
					{"flower2", 104, 520},
					{"flower2", 69, 452},
					{"flower2", 76, 380},
					{"flower2", 50, 343},
					{"flower2", 73, 300},
					{"flower2", 96, 358},
					{"flower2", 86, 358},
					{"flower2", 112, 332},
					{"flower2", 97, 212},
					{"flower2", 101, 50},
					{"flower2", 35, 62},
					{"flower2", 162, 79},
					{"flower2", 240, 79},
					{"flower2", 386, 105},
					{"flower2", 405, 96},
					{"flower2", 394, 87},
					{"flower2", 377, 125},
					{"flower2", 455, 82},
					{"flower2", 455, 68},
					{"flower2", 498, 98},
					{"flower2", 471, 110},
					{"flower2", 516, 120},
					{"flower2", 598, 165},
					{"flower2", 588, 197},
					{"flower2", 628, 244},
					{"flower2", 633, 259},
					{"flower2", 633, 282},
					{"flower2", 551, 344},
					{"flower2", 537, 336},
					{"flower2", 540, 557},
					{"flower2", 503, 574},
					{"flower2", 510, 592},
					{"flower2", 601, 595},
					{"flower2", 591, 615},
					{"flower2", 579, 630},
					{"flower2", 603, 630},
					{"flower2", 628, 594},
					{"flower3", 453, 560},
					{"flower3", 464, 552},
					{"flower3", 522, 563},
					{"flower3", 534, 580},
					{"flower3", 564, 563},
					{"flower3", 602, 619},
					{"flower3", 625, 584},
					{"flower3", 636, 576},
					{"flower3", 546, 507},
					{"flower3", 546, 331},
					{"flower3", 541, 310},
					{"flower3", 596, 183},
					{"flower3", 533, 221},
					{"flower3", 493, 241},
					{"flower3", 433, 266},
					{"flower3", 401, 110},
					{"flower3", 417, 101},
					{"flower3", 436, 82},
					{"flower3", 445, 76},
					{"flower3", 513, 106},
					{"flower3", 534, 116},
					{"flower3", 267, 147},
					{"flower3", 334, 197},
					{"flower3", 225, 91},
					{"flower3", 189, 68},
					{"flower3", 64, 60},
					{"flower3", 59, 52},
					{"flower3", 52, 164},
					{"flower3", 107, 210},
					{"flower3", 97, 281},
					{"flower3", 78, 328},
					{"flower3", 121, 343},
					{"flower3", 104, 372},
					{"flower3", 94, 435},
					{"cbush", 111, 429},
					{"cbush", 202, 503},
					{"cbush", 327, 529},
					{"cbush", 397, 455},
					{"cbush", 399, 257},
					{"cbush", 551, 287},
					{"cbush", 523, 268},
					{"cbush", 538, 207},
					{"cbush", 529, 79},
					{"tuft1", 331, 18},
					{"tuft1", 374, 25},
					{"tuft1", 333, 111},
					{"tuft1", 321, 133},
					{"tuft1", 302, 138},
					{"tuft1", 296, 239},
					{"tuft1", 317, 261},
					{"tuft1", 286, 293},
					{"tuft1", 297, 298},
					{"tuft1", 423, 361},
					{"tuft1", 534, 423},
					{"tuft1", 559, 429},
					{"tuft1", 596, 411},
					{"tuft1", 579, 386},
					{"tuft1", 421, 394},
					{"tuft1", 332, 439},
					{"tuft1", 215, 439},
					{"tuft1", 190, 538},
					{"tuft1", 168, 510},
					{"tuft1", 229, 485},
					{"tuft1", 205, 481},
					{"tuft1", 156, 477},
					{"tuft1", 136, 487},
					{"tree1", 304, 490},
					{"tree1", 446, 384},
					{"tree1", 472, 274},
					{"tree1", 393, 134},
					{"tree1", 434, -2},
					{"tree1", 400, -18},
					{"tree1", 267, -18},
					{"tree1", 211, -8},
					{"tree1", 145, 10},
					{"tree1", 55, -15},
					{"tree1", -23, 5},
					{"tree1", 104, 67},
					{"tree1", 116, 214},
					{"tuft1", -8, 564},
					{"tuft1", 10, 578},
					{"tuft1", -2, 449},
					{"tuft1", 35, 365},
					{"tuft1", -4, 256},
					{"tuft1", 16, 245},
					{"tuft1", -6, 233},
					{"tuft1", 38, 225},
					{"tuft1", 38, 64},
					{"tuft1", 185, 128},
					{"tuft1", 204, 143},
					{"tuft1", 267, 206},
					{"tuft1", 279, 225},
					{"tuft1", 305, 315},
					{"tuft1", 338, 373},
					{"tuft1", 355, 380},
					{"tuft1", 532, 475},
					{"tuft1", 497, 487},
					{"tuft1", 498, 520},
					{"flower3", 120, 497}
					}						

map[4].tileset = love.graphics.newImage("maps/Meadow#tiles.png")
map[4].tilemap, map[4].width, map[4].height = load_tileset("maps/Meadow#map004.txm")
map[4].collision = generatecollision("maps/Meadow#Collision4.png")
map[4].npctable = {	

					
					{"bombwall", 228, 228},
					{"bombwall", 272, 512},

					{"sideexit", "left", 1, 608, 544},
					{"sideexit", "right", 5, 16, 400},

					{"tilewarp", 224, 432, 105, 84, 246},
					{"tilewarp", 464, 464, 105, 500, 244},

					{"tilewarp", 240, 528, 106, 148, 340},
					{"tilewarp", 432, 384, 106, 484, 250},


					{"tilewarp", 160, 240, 107, 100, 422},
					{"tilewarp", 368, 96, 107, 452, 200},


					{"tilewarp", 432, 128, 108, 180, 168},
					{"tilewarp", 432, 272, 108, 420, 610},

					{"sign", 196, 390, "welcome to dirty bumper!", 0},
					{"cbush", 544, 264}}						

map[5].tileset = love.graphics.newImage("maps/Meadow#tiles.png")
map[5].tilemap, map[5].width, map[5].height = load_tileset("maps/Meadow#map005.txm")
map[5].collision = generatecollision("maps/Meadow#Collision5.png")
map[5].npctable = {	

					{"bombwall", 224, 496},
					{"sideexit", "left", 4, 608, 256},

					{"tilewarp", 352, 256, 150, 608, 1216},
					{"cbush", 544, 264}}			

--caves
map[100].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[100].tilemap = load_tileset("maps/cave#map001.txm")
map[100].width = 320
map[100].height = 232
map[100].collision = generatecollision("maps/cave#collision.png")
map[100].npctable = {	
					{"sideexit", "bottom", 3, 60, 116},
					{"cbush", 50, 50},
					{"rock1", 100, 100},
					{"npc", 250, 60, "free push gauntlet!", 1, gfx_oldman},
					{"npc", 225, 60, "free experience!", 11, gfx_oldman},
					{"npc", 225, 100, "free climbing hooks!", 2, gfx_youngman},
					{"npc", 250, 100, "free swimming lessons!", 3, gfx_youngwoman},
					{"npc", 275, 100, "free jumping lessons!", 4, gfx_girl},
					{"npc", 275, 60, "free money!", 10, gfx_boy},
					{"smallslime", 150, 100},
					{"smallslime", 160, 100},
					{"smallslime", 170, 100},
					{"bat", 100, 120},
					{"beastman_scout",  120, 100},
					{"beastman_fighter", 70, 70},
					{"light1", 133, 2},
					{"slime", 100, 60}}

map[101].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[101].tilemap = load_tileset("maps/cave#map002.txm")
map[101].width = 320
map[101].height = 232
map[101].collision = generatecollision("maps/cave#collision101.png")
map[101].npctable = {	
					{"sideexit", "bottom", 1, 480, 224},
					{"npc", 100, 60, "You'll need climbing spikes\nto get up this mountain.", 0, gfx_oldman}}

map[102].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[102].tilemap, map[102].width, map[102].height = load_tileset("maps/cave#map003.txm")
map[102].collision = generatecollision("maps/cave#collision102.png")
map[102].npctable = {	
					--{"sideexit", "bottom", 3, 60, 116},
					{"tilewarp", 80, 640, 1, 224, 352},
					{"tilewarp", 96, 640, 1, 224, 352},
					{"tilewarp", 112, 640, 1, 224, 352},
					{"tilewarp", 512, 640, 1, 560, 432},
					{"tilewarp", 528, 640, 1, 560, 432},
					{"bat", 218, 420},
					{"bat", 374, 243},
					{"bat", 480, 226},
					{"bat", 414, 460},

					{"pickupable", 440, 180, 6, 7, "chest"},
				}

map[103].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[103].tilemap, map[103].width, map[103].height = load_tileset("maps/cave#map004.txm")
map[103].collision = generatecollision("maps/cave#collision103.png")
map[103].npctable = {	
					--{"sideexit", "bottom", 3, 60, 116},
					{"tilewarp", 256, 640, 1, 432, 496},
					{"tilewarp", 272, 640, 1, 432, 496},
					{"tilewarp", 288, 640, 1, 432, 496},
					{"tilewarp", 304, 640, 1, 432, 496},
					{"rock1", 310, 210},
					{"bat", 233, 329},
					{"bat", 416, 362},
					{"bat", 416, 272},
					{"npc", 282, 130, "You saved me!\nI couldn't get any of my food\nI thought I was going to die!\nHere, you can have my old set\nof climbing spikes.\n\n|You can reach new areas now!", 5, gfx_oldman}}

map[104].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[104].tilemap = load_tileset("maps/cave#map005.txm")
map[104].width = 352
map[104].height = 272
map[104].collision = generatecollision("maps/cave#collision104.png")
map[104].npctable = {	
					{"tilewarp", 144, 256, 3, 530, 272},
					{"tilewarp", 152, 256, 3, 530, 272},
					{"npc", 115, 40, "", 21, gfx_boy}}

map[105].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[105].tilemap = load_tileset("maps/cave#map006.txm")
map[105].width = 656
map[105].height = 288
map[105].collision = generatecollision("maps/cave#collision105.png")
map[105].npctable = {	
					{"tilewarp", 64, 272, 4, 224, 464},
					{"tilewarp", 80, 272, 4, 224, 464},
					{"tilewarp", 96, 272, 4, 224, 464},
					{"tilewarp", 112, 272, 4, 224, 464},


					{"tilewarp", 480, 272, 4, 464, 496},
					{"tilewarp", 496, 272, 4, 464, 496},
					{"tilewarp", 512, 272, 4, 464, 496},
					{"tilewarp", 528, 272, 4, 464, 496},

					{"bat", 178, 89},
					{"bat", 204, 155},
					{"bat", 437, 173}

				}

map[106].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[106].tilemap = load_tileset("maps/cave#map007.txm")
map[106].width = 656
map[106].height = 384
map[106].collision = generatecollision("maps/cave#collision106.png")
map[106].npctable = {	
					{"tilewarp", 144, 368, 4, 240, 560},
					{"tilewarp", 152, 368, 4, 240, 560},

					{"tilewarp", 480, 272, 4, 432, 416},
					{"tilewarp", 480+16, 272, 4, 432, 416},
					{"bat", 139, 161},
					{"bat", 170, 145},
					{"bat", 329, 276},
					{"bat", 355, 255},
					{"bat", 373, 238},
					{"bat", 373, 157},
					{"bat", 417, 124},
					{"bat", 467, 166}


				}

map[107].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[107].tilemap = load_tileset("maps/cave#map008.txm")
map[107].width = 656
map[107].height = 464
map[107].collision = generatecollision("maps/cave#collision107.png")
map[107].npctable = {	
					{"tilewarp", 96, 448, 4, 160, 272},
					{"tilewarp", 96+16, 448, 4, 160, 272},

					{"tilewarp", 448, 224, 4, 354, 114},
					{"tilewarp", 448+16, 224, 4, 354, 114},
					{"bat", 102, 255},
					{"bat", 171, 277},
					{"bat", 291, 113},
					{"bat", 381, 113},
					{"bat", 479, 126}
				}

map[108].tileset = love.graphics.newImage("maps/cave#tiles.png")
map[108].tilemap = load_tileset("maps/cave#map009.txm")
map[108].width = 656
map[108].height = 656
map[108].collision = generatecollision("maps/cave#collision108.png")
map[108].npctable = {	
					{"tilewarp", 176, 192, 4, 432, 160},
					{"tilewarp", 176+16, 192, 4, 432, 160},

					{"tilewarp", 400, 640, 4, 432, 304},
					{"tilewarp", 400+16, 640, 4, 432, 304},
					{"tilewarp", 400+16+16, 640, 4, 432, 304},
					{"tilewarp", 400+16+16+16, 640, 4, 432, 304},

					{"bat", 148, 63},
					{"bat", 340, 164},
					{"bat", 460, 285},
					{"bat", 528, 404},
					{"bat", 479, 466},
					{"bat", 224, 424},
					{"bat", 293, 390}
				}
--dungeon
map[150].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[150].tilemap, map[150].width, map[150].height = load_tileset("maps/dungeon#map002.txm")
map[150].collision = generatecollision("maps/dungeon#collision002.png")
map[150].npctable = {	
						{"sign", 623, 1011, "Welcome to Beaston", 0},
						{"npc", 741, 966, "words 1", 0, gfx_beastman_man},
						{"npc", 427, 708, "words 2", 0, gfx_beastman_man},
						{"npc", 348, 404, "words 3", 0, gfx_beastman_woman},
						{"npc", 780, 404, "words 4", 0, gfx_beastman_man},

						{"tilewarp", 208, 560, 151, 596, 1230},
						{"tilewarp", 544, 592, 152, 596, 1230},
						{"tilewarp", 672, 336, 153, 616, 1230},
						{"tilewarp", 784, 720, 154, 660, 1230},
						{"tilewarp", 960, 752, 155, 670, 1230},
						{"sideexit", "left", 156, 1232, 712},
						{"sideexit", "bottom", 5, 352, 304}
					}
map[151].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[151].tilemap, map[151].width, map[151].height = load_tileset("maps/dungeon#map003.txm")
map[151].collision = generatecollision("maps/dungeon#collision003.png")
map[151].npctable = {	
						{"sideexit", "bottom", 150, 208, 608}
					}
map[152].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[152].tilemap, map[152].width, map[152].height = load_tileset("maps/dungeon#map004.txm")
map[152].collision = generatecollision("maps/dungeon#collision004.png")
map[152].npctable = {	
						{"sideexit", "bottom", 150, 544, 640}
					}
map[153].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[153].tilemap, map[153].width, map[153].height = load_tileset("maps/dungeon#map005.txm")
map[153].collision = generatecollision("maps/dungeon#collision005.png")
map[153].npctable = {	
						{"sideexit", "bottom", 150, 672, 384}
					}
map[154].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[154].tilemap, map[154].width, map[154].height = load_tileset("maps/dungeon#map006.txm")
map[154].collision = generatecollision("maps/dungeon#collision006.png")
map[154].npctable = {	
						{"sideexit", "bottom", 150, 784, 768}
					}
map[155].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[155].tilemap, map[155].width, map[155].height = load_tileset("maps/dungeon#map007.txm")
map[155].collision = generatecollision("maps/dungeon#collision007.png")
map[155].npctable = {	
						{"sideexit", "bottom", 150, 960, 800}
					}
map[156].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[156].tilemap, map[156].width, map[156].height = load_tileset("maps/dungeon#map008.txm")
map[156].collision = generatecollision("maps/dungeon#collision008.png")
map[156].npctable = {	
						--{"tilewarp", 208, 560, 151, 1, 1},
						{"pickupable", 304, 831, 7, 8, "chest"},
						{"beastman_fighter", 202, 917},
						{"beastman_fighter", 328, 896},
						{"beastman_fighter", 435, 966},
						{"beastman_fighter", 606, 690},
						{"beastman_scout", 767, 637},
						{"beastman_scout", 526, 579},
						{"beastman_scout", 703, 483},
						{"beastman_scout", 746, 226},
						{"beastman_fighter", 716, 119},
						{"beastman_fighter", 680, 483},
						{"beastman_fighter", 418, 421},
						{"beastman_fighter", 357, 284},
						{"beastman_fighter", 172, 323},
						{"sideexit", "right", 150, 32, 848},
						{"sideexit", "top", 157, 620, 1230}
					}
map[157].tileset = love.graphics.newImage("maps/dungeon#tiles.png")
map[157].tilemap, map[157].width, map[157].height = load_tileset("maps/dungeon#map009.txm")
map[157].collision = generatecollision("maps/dungeon#collision009.png")
map[157].npctable = {	
						{"sideexit", "bottom", 156, 712, 56}
					}


--houses
map[200].tileset = love.graphics.newImage("maps/InsideHouses#tiles.png")					
map[200].tilemap = load_tileset("maps/InsideHouses#map002.txm")
map[200].width = 320
map[200].height = 304
map[200].collision = generatecollision("maps/InsideHouses#collision002.png")
map[200].npctable = {
					{"tilewarp", 144, 288, 2, 235, 288},
					{"tilewarp", 152, 288, 2, 235, 288},
					{"npc", 182, 70, "im staying here, its\nwarm by the furnace.", 0, gfx_boy},
					{"npc", 116, 138, "", 20, gfx_youngwoman}
					}

map[201].tileset = love.graphics.newImage("maps/InsideHouses#tiles.png")					
map[201].tilemap = load_tileset("maps/InsideHouses#map003.txm")
map[201].width = 320
map[201].height = 304
map[201].collision = generatecollision("maps/InsideHouses#collision003.png")
map[201].npctable = {
					{"tilewarp", 144, 288, 2, 448, 272},
					{"pickupable", 144, 47, 1, 2, "chest"},
					{"npc", 200, 200, "i live alone.\ni gotta say, its pretty\nawesome.\n|i wouldn't mind living\nwith a cute girl though.\nmaybe princess..", 0, gfx_youngman, "walk_wherever"},
					{"tilewarp", 152, 288, 2, 448, 272}}

map[202].tileset = love.graphics.newImage("maps/InsideHouses#tiles.png")					
map[202].tilemap = load_tileset("maps/InsideHouses#map004.txm")
map[202].width = 512
map[202].height = 304
map[202].collision = generatecollision("maps/InsideHouses#collision004.png")
map[202].npctable = {
					{"tilewarp", 352, 288, 2, 160, 400},
					{"npc", 398, 150, "i wait until the clerk\nisn't looking...\n|then i run out the\ndoor with the shovel.", 0, gfx_boy},
					{"npc", 180, 70, "you shouldn't be able to talk to me.", 0, gfx_youngman, "walk_wherever"},
					{"npc", 344, 80, "", 0, gfx_shopkeep},
					{"npc", 344, 100, "", 102, gfx_null},
					{"tilewarp", 360, 288, 2, 160, 400}}

map[203].tileset = love.graphics.newImage("maps/InsideHouses#tiles.png")					
map[203].tilemap = load_tileset("maps/InsideHouses#map005.txm")
map[203].width = 512
map[203].height = 304
map[203].collision = generatecollision("maps/InsideHouses#collision005.png")
map[203].npctable = {
					{"tilewarp", 256, 288, 2, 464, 432},
					{"npc", 340, 64, "", 0, gfx_shopkeep},
					{"npc", 340, 80, "", 101, gfx_null},
					{"npc", 216, 55, "i like to sneak in here.\noutside all the adults\nact proper, but in here\nthey act just like me!", 0, gfx_boy},
					{"npc", 384, 161, "i hear the elder's princess\nwas kidnapped! how horrible.\nshe had the cutest little nose..", 0, gfx_oldman},
					{"npc", 268, 211, "hey buddy, buy me a drink?", 0, gfx_youngman},
					{"npc", 328, 149, "I'm walkin on sunshine...", 0, gfx_youngman, "walk_wherever"},
					{"npc", 394, 95, "it was such a peaceful town!\nnow our pride and joy,\nprincess is gone..", 0, gfx_youngman, "walk_wherever"},
					{"npc", 156, 208, "our library is in a bar...\nwhy?!", 0, gfx_shopkeep},
					{"tilewarp", 272, 288, 2, 464, 432}}

map[204].tileset = love.graphics.newImage("maps/InsideHouses#tiles.png")					
map[204].tilemap = load_tileset("maps/InsideHouses#map006.txm")
map[204].width = 512
map[204].height = 304
map[204].collision = generatecollision("maps/InsideHouses#collision006.png")
map[204].npctable = {
					{"tilewarp", 256, 288, 2, 352, 192},
					{"npc", 360, 57, "i'm the elders daughter.\nprincess was my best friend.\ni'm so lonely now.", 0, gfx_youngwoman, "walk_wherever"},
					{"npc", 194, 43, "it was a peaceful day like any\nother. i was out in the fields\nwith princess then suddenly we\nwere attacked.\n|when i woke up she was gone.\nshes gone now, and i feel\nresponsible.\nplease help us!", 0, gfx_youngman},
					{"npc", 148, 187, "princess would always\nplay with me.\nshes supposed to live\nhere but i cant seem\nto find her.", 0, gfx_girl, "walk_wherever"},
					{"npc", 200, 85, "my dad says im not supposed\nto talk to strangers.", 0, gfx_girl, "walk_wherever"},
					{"npc", 336, 187, "", 22, gfx_oldman},
					{"tilewarp", 272, 288, 2, 352, 192}}