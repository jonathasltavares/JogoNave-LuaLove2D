Inimigo = Classe:extend()

function Inimigo:new(x, y, velocidade)
    self.x, self.y = x, y
    self.image = love.graphics.newImage("Recursos/Imagem/enemy.png")
    self.largura = self.image:getWidth()*0.3
    self.altura = self.image:getHeight()*0.2
    self.velocidade = velocidade

    self.pontosInimigo = 1
end

function Inimigo:update(dt)
    self.y = self.y + self.velocidade*dt
end

function Inimigo:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 0.3, 0.3)
end

function Inimigo:saiuDaTela()
    if self.y > alturaDaTela then
        return true
    end
    return false
end 
