Tiro = Classe:extend()

function Tiro:new(x, y)
    self.x, self.y = x, y
    self.velocidade = 1000
    self.altura = 8
    self.largura = 3
end

function Tiro:update(dt)
    self.y = self.y - self.velocidade*dt
end

function Tiro:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.largura, self.altura)
end

function Tiro:saiuDaTela()
    if self.y < -self.altura  then
        return true
    end
    return false
end 
