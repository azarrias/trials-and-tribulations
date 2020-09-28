require 'globals'

function love.load()
  if DEBUG_MODE then
    if arg[#arg] == "-debug" then 
      require("mobdebug").start() 
    end
    io.stdout:setvbuf("no")
  end
  
  math.randomseed(os.time())

  -- use nearest-neighbor (point) filtering on upscaling and downscaling to prevent blurring of text and 
  -- graphics instead of the bilinear filter that is applied by default 
  love.graphics.setDefaultFilter('nearest', 'nearest')
  
  -- Set up window
  push:setupScreen(VIRTUAL_SIZE.x, VIRTUAL_SIZE.y, WINDOW_SIZE.x, WINDOW_SIZE.y, {
    vsync = true,
    fullscreen = MOBILE_OS,
    resizable = not (MOBILE_OS or WEB_OS),
    stencil = not WEB_OS and true or false
  })
  love.window.setTitle(GAME_TITLE)
  
  love.graphics.setNewFont(20)
  fontHeight = love.graphics.getFont():getHeight()
  
  p1 = tiny.Vector2D(VIRTUAL_SIZE.x / 2 - 50, VIRTUAL_SIZE.y / 2 + 30) --bottom-left
  p2 = tiny.Vector2D(VIRTUAL_SIZE.x / 2 - 50, VIRTUAL_SIZE.y / 2 - 30) --top-left
  p3 = tiny.Vector2D(VIRTUAL_SIZE.x / 2 + 50, VIRTUAL_SIZE.y / 2 - 30) --top-right
  p4 = tiny.Vector2D(VIRTUAL_SIZE.x / 2 + 50, VIRTUAL_SIZE.y / 2 + 30) --bottom-right
  
  i1 = tiny.Vector2D(p1.x + p1.y, (p1.y - p1.x) / 2)
  i2 = tiny.Vector2D(p2.x + p2.y, (p2.y - p2.x) / 2)
  i3 = tiny.Vector2D(p3.x + p3.y, (p3.y - p3.x) / 2)
  i4 = tiny.Vector2D(p4.x + p4.y, (p4.y - p4.x) / 2)
  
  -- calculate offset and center
  offsetX = (i1.x + i3.x) / 2 - VIRTUAL_SIZE.x / 2
  offsetY = (i2.y + i4.y) / 2 - VIRTUAL_SIZE.y / 2
  i1.x = i1.x - offsetX
  i2.x = i2.x - offsetX
  i3.x = i3.x - offsetX
  i4.x = i4.x - offsetX
  i1.y = i1.y - offsetY
  i2.y = i2.y - offsetY
  i3.y = i3.y - offsetY
  i4.y = i4.y - offsetY
  
  love.keyboard.keysPressed = {}
  love.mouse.buttonPressed = {}
  love.mouse.buttonReleased = {}
end

function love.update(dt)
  -- exit if esc is pressed
  if love.keyboard.keysPressed['escape'] then
    love.event.quit()
  end
  
  love.keyboard.keysPressed = {}
  love.mouse.buttonPressed = {}
  love.mouse.buttonReleased = {}
end

function love.resize(w, h)
  push:resize(w, h)
end
  
-- Callback that processes key strokes just once
-- Does not account for keys being held down
function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.mousepressed(x, y, button)
  love.mouse.buttonPressed[button] = true
end

function love.mousereleased(x, y, button)
  love.mouse.buttonReleased[button] = true
end

function love.draw()
  push:start()
  love.graphics.setColor(0.5, 1, 0.5)
  love.graphics.polygon('fill', p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y)
  love.graphics.setColor(1, 0.5, 0.5)
  love.graphics.polygon('fill', i1.x, i1.y, i2.x, i2.y, i3.x, i3.y, i4.x, i4.y)
  push:finish()
end