larguraDaTela = love.graphics.getWidth()
alturaDaTela = love.graphics.getHeight()

function love.load()
    Classe = require "classic"
    require "jogo"
    require "nave"
    require "tiro"
    require "inimigo"

    jogo = Jogo()
end

function love.update(dt)
    jogo:update(dt)
end

function love.draw()
    jogo:draw()
end