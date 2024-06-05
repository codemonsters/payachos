require "objetos/heroe"

local pantalla = {
    init = function(self)
        self.heroe = nuevo_heroe()
        self.imagen_fondo = love.graphics.newImage("assets/imagenes/fondo.png")
    end,
    update = function(self, dt)
        self.heroe:update(dt)

    end,
    draw = function(self, dt)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.imagen_fondo, 0, 0)
        self.heroe:draw()
        love.graphics.setColor(1, 0, 0, 0.5)
        self.heroe:draw_hitbox()
    end,
}
return pantalla
