Board = Class{}

function Board:init(center, width, height)
  self.center = center
  self.width = width
  self.height = height
  
  self.rects = {}
  for i = -10, 10, 1 do
    local rect_center = tiny.Vector2D(center.x, center.y + i)
    table.insert(self.rects, Rect(rect_center, width, height))
  end
end

function Board:Draw()
  for i, rect in pairs(self.rects) do
    love.graphics.setColor(0.1, 0.6, 0.1)
    rect:DrawIsometric()
  end
end