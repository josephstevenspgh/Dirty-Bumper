--main
pause_button = init_button("return")
	action_button = init_button("z")
	cancel_button = init_button("x")
	up_button = init_button("up")
	down_button = init_button("down")
	left_button = init_button("left")
	right_button = init_button("right")
	--default joypad controls
	button_add_joypad_button(pause_button, joysticks[1], 8)
	button_add_joypad_button(action_button, joysticks[1], 3)
	button_add_joypad_button(cancel_button, joysticks[1], 1)
	button_add_joypad_hat(up_button, joysticks[1], 1, "u")
	button_add_joypad_hat(down_button, joysticks[1], 1, "d")
	button_add_joypad_hat(left_button, joysticks[1], 1, "l")
	button_add_joypad_hat(right_button, joysticks[1], 1, "r")

	buttons = {}
	table.insert(buttons, pause_button)
	table.insert(buttons, action_button)
	table.insert(buttons, cancel_button)
	table.insert(buttons, down_button)
	table.insert(buttons, up_button)
	table.insert(buttons, left_button)
	table.insert(buttons, right_button)


--setzlib

--controls
function init_button(kc, keyrepeat, repeatframe)
	local retval = {}
	retval.keycode = kc
	retval.ispressed = false
	retval.justpressed = false
	retval.pressedlastframe = false
	retval.keyrepeat = 0
	retval.type = "none"
	retval.curframe = 0
	if keyrepeat then
		retval.keyrepeat = keyrepeat
	else
		retval.keyrepeat = true
	end
	if repeatframe then
		retval.repeatframe = repeatframe
	else
		retval.repeatframe = 10
	end
	return retval
end
function button_add_joypad_button(button, joypad, num)
	button.joypad = joypad
	button.type = "button"
	button.num = num
end
function button_add_joypad_hat(button, joypad, num, dir)
	button.joypad = joypad
	button.type = "hat"
	button.num = num
	button.dir = dir
end
function button_mechanics(button)
	button.pressedlastframe = button.ispressed
	keydown = love.keyboard.isDown(button.keycode)
	if button.type == "button" then
		joydown = button.joypad:isDown(button.num)
	elseif button.type == "hat" then
		if string.find(button.joypad:getHat(button.num), button.dir) then
			joydown = true
		else
			joydown = false
		end
	end
	if keydown or joydown then
		button.ispressed = true
		button.pressed = true


		if button.pressedlastframe then
			button.justpressed = false
			if button.keyrepeat then
				button.curframe = button.curframe + 1
				if button.curframe == button.repeatframe then
					button.justpressed = true
					button.curframe = 0
				end
			end
		else
			button.justpressed = true
		end
	else
		button.ispressed = false
		button.pressed = false
		button.justpressed = false
		button.pressedlastframe = false
		button.curframe = 0
	end
end
function get_joysticks()
	local retval = {}
	for i,joystick in ipairs(love.joystick.getJoysticks()) do
		table.insert(retval, joystick)
	end
	return retval
end