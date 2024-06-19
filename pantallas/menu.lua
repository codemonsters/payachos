local pantalla = {
    init = function(self)
        self.imagen_titulo = love.graphics.newImage("assets/imagenes/titulo.png")
        self.imagen_fondo = love.graphics.newImage("assets/imagenes/fondo.png")
    end,
    update = function(self, dt)
    end,
    draw = function(self, dt)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.imagen_fondo, 0, 0)
        love.graphics.draw(self.imagen_titulo, 0, 0)
    end,
    keypressed = function(self, key)
        if key == "space" then
            cargar_pantalla("pantallas/partida")
            -- TODO: inicializar la partida
        end
    end,
    keyreleased = function(self, key)
    end,
}
return pantalla
