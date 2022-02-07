Tiro = Classe:extend()

function Tiro:new(x, y)
    self.x, self.y = x, y
    self.velocidade = 1000
end

function Tiro:update(dt)
    self.y = self.y - self.velocidade*dt
end

function Tiro:draw()
    love.graphics.rectangle("fill", self.x, self.y, 4, 8)
end
