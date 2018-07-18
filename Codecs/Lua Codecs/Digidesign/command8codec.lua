items={}

function remote_init(manufacturer, model)

	--
	-- ITEMS
	--
	
	-- Faders
	for i=1,8 do
		local ctrl = {name="Fader "..i, input="value", output="value", min=0, max=127}
		table.insert(items,ctrl)
	end

	-- Rotarys
	for i=1,8 do
		local ctrl = {name="Rotary "..i, input="value", output="value", min=0, max=127}
		table.insert(items,ctrl)
	end

	-- Solo
	for i=1,8 do
		local ctrl = {name="Solo "..i, input="button", output="value"}
		table.insert(items,ctrl)
	end

	-- Mute
	for i=1,8 do
		local ctrl = {name="Mute "..i, input="button", output="value"}
		table.insert(items,ctrl)
	end

	-- EQ ON/OFF
	for i=1,8 do
		local ctrl = {name="EQ "..i, input="button", output="value"}
		table.insert(items,ctrl)
	end

	-- Bank Right/Left
	table.insert(items,{name="Bank Right trig", input="button",output="value"})
	table.insert(items,{name="Bank Left trig", input="button",output="value"})

	-- Channel Right/Left
	table.insert(items,{name="Channel Right trig", input="button",output="value"})
	table.insert(items,{name="Channel Left trig", input="button",output="value"})

	remote.define_items(items)

	--
	-- INPUTS
	-- 

	local inputs = {}

	-- Faders
	for i=1,8 do
		local chanIndex = i-1
		local inp = {pattern="b"..chanIndex.."07 xx", name="Fader "..i, value="x"}
		table.insert(inputs, inp)
	end

	-- Rotarys
	for i=1,8 do
		local chanIndex = i-1
		local inp = {pattern="b"..chanIndex.."0A xx", name="Rotary "..i, value="x"}
		table.insert(inputs, inp)
	end

	-- Solo
	for i=1,8 do
		local chanIndex = i-1
		local inp = {pattern="b"..chanIndex.."0F xx", name="Solo "..i, value="1"}
		table.insert(inputs, inp)
	end

	-- Mute
	for i=1,8 do
		local chanIndex = i-1
		local inp = {pattern="b"..chanIndex.."0E xx", name="Mute "..i, value="1"}
		table.insert(inputs, inp)
	end

	-- EQ ON/OFF
	for i=1,8 do
		local chanIndex = i-1
		local inp = {pattern="b"..chanIndex.."10 xx", name="EQ "..i, value="1"}
		table.insert(inputs,inp)
	end

	-- Bank Right/Left
	table.insert(inputs,{pattern="b0 7F ?<???x>", name="Bank Right trig", value="1"})
	table.insert(inputs,{pattern="b0 7E ?<???x>", name="Bank Left trig", value="1"})

	-- Channel Right/Left
	table.insert(inputs,{pattern="b0 6F ?<???x>", name="Channel Right trig", value="1"})
	table.insert(inputs,{pattern="b0 6E ?<???x>", name="Channel Left trig", value="1"})

	remote.define_auto_inputs(inputs)

	--
	-- OUTPUTS
	-- 

	local outputs = {}

	-- Faders
	for i=1,8 do
		local chanIndex = i-1
		local outp = {pattern="b"..chanIndex.."07 xx", name="Fader "..i, value="x"}
		table.insert(outputs,outp)
	end

	-- Rotarys
	for i=1,8 do
		local chanIndex = i-1
		local outp = {pattern="b"..chanIndex.."0A xx", name="Rotary "..i, value="x"}
		table.insert(outputs,outp)
	end

	-- Solo
	-- Set x to value*127 in order to make LEDs work as intended, staying lit while active
	for i=1,8 do
		local chanIndex = i-1
		local outp = {pattern="b"..chanIndex.."0F xx", name="Solo "..i, x="value*127"}
		table.insert(outputs,outp)
	end

	-- Mute
	-- Set x to value*127 in order to make LEDs work as intended, staying lit while active
	for i=1,8 do
		local chanIndex = i-1
		local outp = {pattern="b"..chanIndex.."0E xx", name="Mute "..i, x="value*127"}
		table.insert(outputs,outp)
	end

	-- EQ ON/OFF
	-- Set x to value*127 in order to make LEDs work as intended, staying lit while active
	for i=1,8 do
		local chanIndex = i-1
		local outp = {pattern="b"..chanIndex.."10 xx", name="EQ "..i, x="value*127"}
		table.insert(outputs,outp)
	end

	-- Bank Right/Left
	table.insert(inputs,{pattern="b0 7F ?<???x>", name="Bank Right trig", x="0"})
	table.insert(inputs,{pattern="b0 7E ?<???x>", name="Bank Left trig", x="0"})

	-- Channel Right/Left
	table.insert(inputs,{pattern="b0 6F ?<???x>", name="Channel Right trig", x="0"})
	table.insert(inputs,{pattern="b0 6E ?<???x>", name="Channel Left trig", x="0"})

	remote.define_auto_outputs(outputs)
end
