Nave = Classe:extend()

function Nave:new()
    self.x, self.y = 400, 300
    self.largura =  50
    self.altura = 50
    self.velocidade = 200
end

function Nave:update(dt)
    self:mover(dt)
    self:manterNaTela()

end

function Nave:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.largura, self.altura)
end

function Nave:mover(dt)
    if love.keyboard.isDown("up") then
        self.y = self.y - self.velocidade*dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.velocidade*dt
    end
    
    if love.keyboard.isDown("left") then
        self.x = self.x - self.velocidade*dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.velocidade*dt
    end   
end

function Nave:manterNaTela()
    if self.x < 0 then
        self.x = 0
    elseif self.x + self.largura > larguraDaTela then
        self.x = larguraDaTela - self.largura
    end

    if self.y < 0 then
        self.y = 0
    elseif self.y + self.altura > alturaDaTela then
        self.y = alturaDaTela - self.altura
    
    end
    
end