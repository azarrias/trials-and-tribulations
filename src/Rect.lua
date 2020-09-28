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
  local coords = {}
  for i, coord in pairs(self.coord) do
    table.insert(coords, math.floor(self.center.x + coord.x))
    table.insert(coords, math.floor(self.center.y + coord.y))
  end
  love.graphics.polygon('fill', coords)
end

function Rect:DrawIsometric()
  local coords = {}
  for i, coord in pairs(self.coordIsometric) do
    table.insert(coords, math.floor(self.center.x + coord.x))
    table.insert(coords, math.floor(self.center.y + coord.y))
  end
  love.graphics.polygon('fill', coords)
end
