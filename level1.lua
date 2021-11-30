-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	local sceneGroup = self.view

	physics.start()

	function gravity_changer(event)
		--- First gravity 
		physics.setGravity( 2.5, -0.5 )
		print("gravity 1")

			--- Fifth gravity
			function gravity_five(event)
				physics.setGravity( 1, 1.5)
				print("gravity 5")
				timer.performWithDelay( 2000, gravity_changer, 1)
			end

			--- Fourth gravity
			function gravity_four(event)
				physics.setGravity( 3, 4 )
				print("gravity 4")
				timer.performWithDelay( 2000, gravity_five, 1)
			end

			--- Third gravity
			function gravity_three(event)
				physics.setGravity( 0, 3 )
				print("gravity 3")
				timer.performWithDelay( 2000, gravity_four, 1)
			end

			--- Second gravity
			function gravity_two(event)
				physics.setGravity( -2.5, 0 )
				print("gravity 2")
				timer.performWithDelay( 2000, gravity_three, 1)
			end
	
		timer.performWithDelay( 2000, gravity_two, 1)
	
	end

	gravity_changer()


	-- local background = display.newRect( display.screenOriginX, display.screenOriginY, screenW, screenH )
	local background = display.newImage( "assets/bgpro.jpg" )
	background.x = 150
	background.y = 200
	background.alpha = 0.5
	background:scale(0.1, 0.1)
	--background:setFillColor( .5 )

		local planet1 = display.newImage( "assets/planet1.png" )
		planet1.x = 525
		planet1.y = 175
		planet1.alpha = 1
		planet1:scale(0.8, 0.8)

		local planet2 = display.newImage( "assets/planet2.png" )
		planet2.x = -100
		planet2.y = 175
		planet2.alpha = 1
		planet2:scale(0.8, 0.8)

		local planet3 = display.newImage( "assets/planet3.png" )
		planet3.x = 250
		planet3.y = -45
		planet3.alpha = 1
		planet3:scale(0.8, 0.8)

		
		local planet4 = display.newImage( "assets/planet4.png" )
		planet4.x = 250
		planet4.y = 315
		planet4.alpha = 1
		planet4:scale(0.8, 0.8)

	sceneGroup:insert( background )
	sceneGroup:insert( planet1 )
	sceneGroup:insert( planet2 )
	sceneGroup:insert( planet3 )
	sceneGroup:insert( planet4 )


end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then

		physics.start()

		------------------------------------------- MOUSE FUNCTION PURE ---------------------------------------------
			-- Called when a mouse event has been received.
			local function onMouseEvent( event )
				if event.type == "down" and event.x < 445 then
					if event.isPrimaryButtonDown then
						print( "Left mouse button clicked." )

						print(event.x)
						print(event.y)

						local decider = math.random( 1, 2 )

					--- Generating RECTANGLE ORIENTED shapes on click
					function rect_gen()
						--- Random number generators
						local random1 = math.random( 1, 200 )
							print(random1)
						local random2 = math.random( 1, 200 )
							print(random2)
						local random3 = math.random( 1, 200 )
							print(random3)
						local random4 = math.random( 1, 200 )
							print(random4)
						local random5 = math.random( 0.1, 1 )
							print(random5)
						local random6 = math.random( 0.1, 1 )
							print(random6)
						local random7 = math.random( 0.1, 1 )
							print(random7)
	
						-- Generating a shape with color from pure code, via mouse click.
						local rect1 = display.newRect( event.x, event.y-50, (random3), (random4) ) ---- The four coordinates are: x, y, width & height :)
						local paint1 = { (random5), (random6), (random7) }
						rect1.path.x1 = random1
						rect1.path.x2 = random2
						rect1.path.x3 = (('+') .. (random3))
						rect1.path.x4 = random4
						rect1.path.y1 = (('-') .. (random4))
						rect1.path.y2 = random3
						rect1.path.y3 = (('-') .. (random2))
						rect1.path.y4 = random1
						rect1.fill = paint1
						rect1:rotate(random4)
						rect1:scale(0.1, 0.1)
						physics.addBody( rect1, { density=-2.0, friction=0.9, bounce=0.1 } )
					end

					function roundrect_gen()
						--- Random number generators
						local random1 = math.random( 1, 200 )
							print(random1)
						local random2 = math.random( 1, 200 )
							print(random2)
						local random3 = math.random( 1, 200 )
							print(random3)
						local random4 = math.random( 1, 200 )
							print(random4)
						local random5 = math.random( 0.1, 1 )
							print(random5)
						local random6 = math.random( 0.1, 1 )
							print(random6)
						local random7 = math.random( 0.1, 1 )
							print(random7)
	
						-- Generating a shape with color from pure code, via mouse click.
						local myRoundedRect = display.newRoundedRect( event.x, event.y, (random1), (random2), (random3) )
						myRoundedRect:setFillColor( 0.5 )

						local paint3 = { (random5), (random6), (random7) }
						myRoundedRect.fill = paint3
						myRoundedRect:scale(0.3, 0.3)
						physics.addBody( myRoundedRect, { density=-0.3, friction=0.5, bounce=0.3 } )

					end


					if decider == 1 then
						roundrect_gen()
					elseif decider == 2 then
						rect_gen()
					else
					end

						
					elseif event.isSecondaryButtonDown then
						print( "Right mouse button clicked." )        
					end
				end
			end

			-- Add the mouse event listener.
			Runtime:addEventListener( "mouse", onMouseEvent )
			------------------------------------------- MOUSE FUNCTION PURE ---------------------------------------------

	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene