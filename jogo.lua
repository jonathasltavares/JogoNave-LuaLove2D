Jogo  = Classe:extend()

function Jogo:new()
    nave = Nave()
    tempoInimigo = 0
    listaInimigos = {}
end

function Jogo:update(dt)
    tempoInimigo = tempoInimigo+dt

    if tempoInimigo> 1.5 then
       local inimigo = Inimigo(love.math.random(150, 700), -100, 100) 
       table.insert(listaInimigos, inimigo)
       tempoInimigo = 0
    end

    nave:update(dt)

    for i, inimigo in pairs(listaInimigos) do
        inimigo:update(dt)
        if inimigo:saiuDaTela() then
            table.remove(listaInimigos, i)
            
        end


        if verificaColisao(inimigo, nave) then
            nave:perderVidas()
            table.remove(listaInimigos, i)
        end


        for j, tiro in pairs(nave.listaDeTiros, i ) do
           if verificaColisao(inimigo, tiro) then
                table.remove(listaInimigos, i)
                table.remove(nave.listaDeTiros, j)
                nave:incrementarPontos(inimigo.pontosInimigo)
            end
        end
    end

    
end

function Jogo:draw()
    nave:draw()
    for i, inimigo in pairs(listaInimigos) do
    inimigo:draw()
    end
    love.graphics.print("Pontos "..nave.pontos, 20, 50, 0, 1.3)
    
    for i = 1, nave.vidas do
        love.graphics.draw(nave.imagem, 10*i, 10, 0, 0.1)
    end
end

function verificaColisao(A, B)
    if A.x < B.x + B.largura and
    A.x + A.largura > B.x and
    A.y < B.y + B.altura and
    A.y + A.altura > B.y then
        return true
    end
end