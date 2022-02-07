Jogo  = Classe:extend()

function Jogo:new()

    nave = Nave()
end

function Jogo:update(dt)
    nave:update(dt)
end

function Jogo:draw()
    nave:draw()
end