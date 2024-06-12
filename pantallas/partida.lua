require "objetos/acrobata"
require "objetos/cama"

local pantalla = {
    init = function(self)
        self.imagen_fondo = love.graphics.newImage("assets/imagenes/fondo.png")
        self.acrobata = nuevo_acrobata(20, 10)
        self.cama = nueva_cama()
    end,
    update = function(self, dt)
        self.acrobata:update(dt)
        self.cama:update(dt)

    end,
    draw = function(self, dt)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.imagen_fondo, 0, 0)
        self.acrobata:draw()
        self.cama:draw()
        love.graphics.setColor(1, 0, 0, 0.5)
        self.acrobata:draw_hitbox()
        self.cama:draw_hitbox()
    end,
}
return pantalla
