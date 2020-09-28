Rect = Class{}

function Rect:init(center, width, height)
  self.center = center
  self.width = width
  self.height = height
  
  self.coord = { 
    tiny.Vector2D(-width / 2, height / 2), --bottom-left
    tiny.Vector2D(-width / 2, -height / 2), --top-left
    tiny.Vector2D(width / 2, -height / 2), --top-right
    tiny.Vector2D(width / 2, height / 2) --bottom-right
  }
  
  self.coordIsometric = {}
  for i, coord in pairs(self.coord) do
    table.insert(self.coordIsometric, tiny.Vector2D(coord.x + coord.y, (coord.y - coord.x) / 2))
  end
end

function Rect:Draw()
  love.graphics.polygon('fill', 
    math.floor(self.center.x + self.coord[1].x), 
    math.floor(self.center.y + self.coord[1].y), 
    math.floor(self.center.x + self.coord[2].x), 
    math.floor(self.center.y + self.coord[2].y),
    math.floor(self.center.x + self.coord[3].x), 
    math.floor(self.center.y + self.coord[3].y), 
    math.floor(self.center.x + self.coord[4].x), 
    math.floor(self.center.y + self.coord[4].y))
end

function Rect:DrawIsometric()
  love.graphics.polygon('fill', 
    math.floor(self.center.x + self.coordIsometric[1].x), 
    math.floor(self.center.y + self.coordIsometric[1].y), 
    math.floor(self.center.x + self.coordIsometric[2].x), 
    math.floor(self.center.y + self.coordIsometric[2].y),
    math.floor(self.center.x + self.coordIsometric[3].x), 
    math.floor(self.center.y + self.coordIsometric[3].y), 
    math.floor(self.center.x + self.coordIsometric[4].x), 
    math.floor(self.center.y + self.coordIsometric[4].y))
end
