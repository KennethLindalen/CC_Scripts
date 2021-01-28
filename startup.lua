local mon = peripheral.wrap("front")
-- https://pastebin.com/iC3p426N
os.loadAPI("/button")
mon.clear()

id = 0
mId = 0
MATERIAL_RS = "back"
PART_RS = "right"


button.setMonitor(mon)

function partLabel(text)
    mon.setCursorPos(2, 11)
    mon.write("Part: "..text.." - ID: "..id.."           ")
end

function materialLabel(text)
    mon.setCursorPos(2, 12)
    mon.write("Material: "..text.." - ID: "..mId.."           ")
end

-- Activating different redstone channels depending on what's requested
function rsControl()
    -- To check if one of them has not been selected TODO: Error message
    if (id == 0) or (mId == 0) then
        return
    else
        if (mId == 1) then --Cobalt
            redstone.setBundledOutput(MATERIAL_RS, colors.purple)
        elseif (mId == 2) then --Magenta
            redstone.setBundledOutput(MATERIAL_RS, colors.magenta)
        elseif (mId == 3) then -- Manyullyn
            redstone.setBundledOutput(MATERIAL_RS, colors.orange)
        elseif (mId == 4) then -- Iron
            redstone.setBundledOutput(MATERIAL_RS, colors.cyab)
        elseif (mId == 5) then --Electrum
            redstone.setBundledOutput(MATERIAL_RS, colors.pink)
        end

        if (id == 1) then -- Hammer head
            redstone.setBundledOutput(PART_RS, colors.pink)
        elseif (id == 2) then -- Pickaxe head
            redstone.setBundledOutput(PART_RS, colors.cyan)
        elseif (id == 3) then -- Excavator head
            redstone.setBundledOutput(PART_RS, colors.lightBlue)
        elseif (id == 4) then -- Lumberaxe head
            redstone.setBundledOutput(PART_RS, colors.yellow)
        elseif (id == 5) then -- Large plate
            redstone.setBundledOutput(PART_RS, colors.lime)
        elseif (id == 6) then -- Tool Rod
            redstone.setBundledOutput(PART_RS, colors.gray) 
        elseif (id == 7) then -- Tough Tool Rod
            redstone.setBundledOutput(PART_RS, colors.purple) 
        elseif (id == 8) then -- Binding
            redstone.setBundledOutput(PART_RS, colors.magenta)     
        elseif (id == 9) then -- Tough Binding
            redstone.setBundledOutput(PART_RS, colors.blue) 
        end
    end
     -- Sleep 5 to get enough molten liquids into casts
    sleep(5)

    -- Disable redstone signals on all bundled cables
    redstone.setBundledOutput(MATERIAL_RS
, 0)
    redstone.setBundledOutput(PART_RS, 0)

    -- Reset part ID, material ID and monitor display
    id=0
    mId=0
    mon.clear()

end

function buttonCreation(name, sizeX, sizeY, posX, posY, func)
    buttonCreation = button.create(name)
    buttonCreation.setSize(sizeX, sizeY)
    buttonCreation.setPos(posX, posY)
    buttonCreation.onClick(func)
    return buttonCreation
end

-- Part buttons
hammerHead = buttonCreation("Hammer head", 18, 1, 1, 1, function() id=1; part="Hammer head"; partLabel( part)end)
pickaxeButton = buttonCreation("Pickaxe head", 18, 1, 1, 2, function() id=2; part="Pickaxe head"; partLabel( part)end)
excavatorButton = buttonCreation("Excavator head", 18, 1, 1, 3, function() id=3; part="Excavator head"; partLabel( part)end)
lumberaxeButton = buttonCreation("Lumberaxe head", 18, 1, 1, 4, function() id=4; part="Lumberaxe head"; partLabel( part)end)
largePlateButton = buttonCreation("Large Plate", 18, 1, 1, 5, function() id=5; part="Large Plate"; partLabel( part)end)
toolRodButton = buttonCreation("Tool Rod", 18, 1, 1, 6, function() id=6; part="Tool Rod"; partLabel( part)end)
toughToolRodButton = buttonCreation("Tough Tool Rod", 18, 1, 1, 7, function() id=7; part="Tough Tool Rod"; partLabel( part)end)
bindingButton = buttonCreation("Binding", 18, 1, 1, 8, function() id=8; part="Binding"; partLabel( part)end)
toughBindingButton = buttonCreation("Tough Binding", 18, 1, 1, 9, function() id=9; part="Tough Binding"; partLabel( part)end)

-- Material buttons
cobaltButton = buttonCreation("Cobalt", 18, 1, 21, 1, function() mId=1; part="Cobalt"; materialLabel( part)end)
arditeButton = buttonCreation("Ardite", 18, 1, 21, 2, function() mId=2; part="Ardite"; materialLabel( part)end)
manylliumButton = buttonCreation("Manyullyn", 18, 1, 21, 3, function() mId=3; part="Manyullyn"; materialLabel( part)end)
ironButton = buttonCreation("Iron", 18, 1, 21, 4, function() mId=4; part="Iron"; materialLabel( part)end)
electrumButton = buttonCreation("Electrum", 18, 1, 21, 5, function() mId=5; part="Electrum"; materialLabel( part)end)

-- Create button
createButton = buttonCreation("Craft", 18, 3, 21, 7, function() rsControl()end)

partButtonTable = {hammerHead, pickaxeButton, excavatorButton, lumberaxeButton, largePlateButton, toolRodButton, toughToolRodButton, bindingButton, toughBindingButton}
materialButtonTable = {cobaltButton, arditeButton, manylliumButton, ironButton, electrumButton}

while true do
    button.await(createButton, partButtonTable, materialButtonTable)
end