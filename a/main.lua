--
-- Project: aaa
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2016 . All Rights Reserved.
-- 

--housekeeping stuff
display.setStatusBar ( display.HiddenStatusBar )
cx = display.contentCenterX; --print("x= " .. cx*2)
cy = display.contentCenterY; --print ( "y= " ..cy*2 )
--local physics = require ( "physics" )
--forward references
local sky
local rocket
local starttext
local lefta
local righta
local firea
local startgame
local startscreen

--preload audio

--create start screen
function startscreen()
	sky = display.newImage("sky.png")
	sky.x = cx ; sky.y = cy
	sky:scale(2,2)
	
	rocket = display.newImage("rocket.png")
	rocket.x = cx ; rocket.y = display.contentHeight-300
	rocket:scale ( 0.3, 0.3 )
	
	starttext = display.newText(  "START", 0, 0, "Verdana", 70 )
	starttext.x = cx ; starttext.y = cy
	starttext:addEventListener ( "tap", startgame )
end

--functions
function startgame(event)
	display.remove( event.target )
	lefta = display.newImage("left.png") ; lefta.x = 60 ; lefta.y = display.contentHeight-60 ; lefta:scale(2,2)
	righta = display.newImage("right.png") ; righta.x = 200 ; righta.y = display.contentHeight-60 ; righta:scale(2,2)
	firea = display.newImage("fire.png") ; firea.x = display.contentWidth-70 ; firea.y = display.contentHeight-60 ; firea:scale ( 2, 2 )
	lefta:addEventListener ( "tap", golefta )
	righta:addEventListener ( "tap", gorighta )
	firea:addEventListener ( "tap", fireaaa )
end
function golefta(event)
	rocketleft = transition.to ( rocket, {time = 500, x = rocket.x-40} )
	return true
end
function gorighta(event)
		rocketright = transition.to ( rocket, {time = 500, x = rocket.x+40} )
		return true
end
function fireaaa(event)
	local function pewpewpew()
		local pew = display.newText(  "pew", 0, 0, "Verdana", 50 )
		pew:setFillColor ( 1, 0, 0 )
		pew.x = math.random(70, display.contentWidth - 70) ; pew.y = math.random(cy+30, cy+130)
		local function byepew()
			display.remove( pew )
		end
		pew.trans = transition.to ( pew, {time=500, rotation=math.random(-30,30), onComplete=byepew} )
	end
	pewpewpew()
	return true
end
function rocketup()
--start
startscreen()