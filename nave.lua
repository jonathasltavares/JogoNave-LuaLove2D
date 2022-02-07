Nave = Classe:extend()

function Nave:new()
    self.imagem = love.graphics.newImage("Recursos/Imagem/spaceship.png")
    self.x, self.y = 400, 300
    self.largura =  500*0.3
    self.altura = 500*0.2
    self.velocidade = 500
    self.listaDeTiros = {}
end

function Nave:update(dt)
    self:mover(dt)
    self:manterNaTela()
    if love.keyboard.isDown("space") then
        self:atirar(dt)
    end

    for i, tiro in pairs(self.listaDeTiros) do 
        tiro:update(dt)

        if tiro:saiuDaTela() then
            table.remove(self.listaDeTiros, i)
        end
    end
end

function Nave:draw()
    for i, tiro in pairs(self.listaDeTiros) do 
        tiro:draw()
    end

    love.graphics.draw(self.imagem, self.x, self.y, 0, 0.3, 0.3)
    
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

function Nave:atirar(dt)
    tiro = Tiro(self.x + self.largura/2.0  , self.y + self.altura/2.1)
    table.insert(self.listaDeTiros, tiro)
end