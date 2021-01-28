local mon = peripheral.wrap("front")
mon.clear()
id = 0
mId = 0
materialRS = "back"
partRS = "right"
-- https://pastebin.com/iC3p426N
os.loadAPI("/button")

button.setMonitor(mon)

function partLabel(text)
    mon.setCursorPos(2, 11)
    mon.write("Part: "..text.." - ID: "..id.."           ")
end


function materialLabel(text)
    mon.setCursorPos(2, 12)
    mon.write("Material: "..text.." - ID: "..mId.."           ")
end


function rsControl()
    -- To check if one of them has not been selected TODO: Error message
    if (id == 0) or (mId == 0) then
        return
    else
        if(mId == 1) then --Cobalt
            redstone.setBundledOutput(materialRS, colors.purple)
        elseif (mId == 2) then --Magenta
            redstone.setBundledOutput(materialRS, colors.magenta)
        elseif (mId == 3) then -- Manyullyn
            redstone.setBundledOutput(materialRS, colors.orange)
        elseif (mId == 4) then -- Iron
            redstone.setBundledOutput(materialRS, colors.cyab)
        elseif (mId == 5) then --Electrum
            redstone.setBundledOutput(materialRS, colors.pink)
        end

        if (id == 1) then -- Hammer head
            redstone.setBundledOutput(partRS, colors.pink)
        elseif (id == 2) then -- Pickaxe head
            redstone.setBundledOutput(partRS, colors.cyan)
        elseif (id == 3) then -- Excavator head
            redstone.setBundledOutput(partRS, colors.lightBlue)
        elseif (id == 4) then -- Lumberaxe head
            redstone.setBundledOutput(partRS, colors.yellow)
        elseif (id == 5) then -- Large plate
            redstone.setBundledOutput(partRS, colors.lime)
        elseif (id == 6) then -- Tool Rod
            redstone.setBundledOutput(partRS, colors.gray) 
        elseif (id == 7) then -- Tough Tool Rod
            redstone.setBundledOutput(partRS, colors.purple) 
        elseif (id == 8) then -- Binding
            redstone.setBundledOutput(partRS, colors.magenta)     
        elseif (id == 9) then -- Tough Binding
            redstone.setBundledOutput(partRS, colors.blue) 
        end
    end
     -- Sleep 5 to get enough molten liquids into casts
    sleep(5)

    -- Disable redstone signals on all bundled cables
    redstone.setBundledOutput(materialRS, 0)
    redstone.setBundledOutput(partRS, 0)

    -- Reset part ID, material ID and monitor
    id=0
    mId=0
    mon.clear()

end
-- Part buttons

hammerButton = button.create("Hammer Head")
hammerButton.setSize(18,1)
hammerButton.setPos(1,1)
hammerButton.onClick(function() id=1; part="Hammer head"; partLabel( part)end)

pickaxeButton = button.create("Pickaxe head")
pickaxeButton.setSize(18,1)
pickaxeButton.setPos(1,2)
pickaxeButton.onClick(function() id=2; part="Pickaxe head"; partLabel(part)end)

excavatorButton = button.create("Excavator Head")
excavatorButton.setSize(18,1)
excavatorButton.setPos(1,3)
excavatorButton.onClick(function() id=3; part="Excavator head"; partLabel( part)end)

lumberaxeButton = button.create("Lumberaxe Head")
lumberaxeButton.setSize(18,1)
lumberaxeButton.setPos(1,4)
lumberaxeButton.onClick(function() id=4; part="Lumberaxe head"; partLabel(part)end)

largePlateButton = button.create("Large Plate")
largePlateButton.setSize(18,1)
largePlateButton.setPos(1,5)
largePlateButton.onClick(function() id=5; part="Large Plate"; partLabel( part)end)

toolRodButton = button.create("Tool Rod")
toolRodButton.setSize(18,1)
toolRodButton.setPos(1,6)
toolRodButton.onClick(function() id=6; part="Tool rod"; partLabel( part)end)

toughToolRodButton = button.create("Tough Tool Rod")
toughToolRodButton.setSize(18,1)
toughToolRodButton.setPos(1,7)
toughToolRodButton.onClick(function() id=7; part="Tough tool rod"; partLabel( part)end)

bindingButton = button.create("Binding")
bindingButton.setSize(18,1)
bindingButton.setPos(1,8)
bindingButton.onClick(function() id=8; part="Binding"; partLabel( part)end)

toughBindingButton = button.create("Tough Binding")
toughBindingButton.setSize(18,1)
toughBindingButton.setPos(1,9)
toughBindingButton.onClick(function() id=9; part="Tough Binding"; partLabel( part)end)

-- Material buttons
cobaltButton = button.create("Cobalt")
cobaltButton.setSize(18,1)
cobaltButton.setPos(21,1)
cobaltButton.onClick(function() mId=1; part="Cobalt"; materialLabel( part)end)

arditeButton = button.create("Ardite")
arditeButton.setSize(18,1)
arditeButton.setPos(21,2)
arditeButton.onClick(function() mId=2; part="Ardite"; materialLabel( part)end)

manylliumButton = button.create("Manyullyn")
manylliumButton.setSize(18,1)
manylliumButton.setPos(21,3)
manylliumButton.onClick(function() mId=3; part="Manyullyn"; materialLabel( part)end)

ironButton = button.create("Iron")
ironButton.setSize(18,1)
ironButton.setPos(21,4)
ironButton.onClick(function() mId=4; part="Iron"; materialLabel( part)end)

electrumButton = button.create("Electrum")
electrumButton.setSize(18,1)
electrumButton.setPos(21,5)
electrumButton.onClick(function() mId=5; part="Electrum"; materialLabel( part)end)

-- Create button
createButton = button.create("Craft")
createButton.setSize(18,3)
createButton.setPos(21,7)
createButton.onClick(function() rsControl()end)


partButtonTable = {hammerButton, pickaxeButton, excavatorButton, lumberaxeButton, largePlateButton, toolRodButton, toughToolRodButton, bindingButton, toughBindingButton}
materialButtonTable = {cobaltButton, arditeButton, manylliumButton, ironButton, electrumButton}

while true do
    button.await(createButton, partButtonTable, materialButtonTable)
end