require "objetos/acrobata"
require "objetos/cama"

local pantalla = {
    VELOCIDAD_REBOTE_CON_CAMA = 120,
    FACTOR_REBOTE_VEL_X = 2000,
    init = function(self)
        self.imagen_fondo = love.graphics.newImage("assets/imagenes/fondo.png")
        self.acrobata = nuevo_acrobata(20, 10, 20, 60)
        self.cama = nueva_cama()
    end,
    update = function(self, dt)
        self.acrobata:update(dt)
        self.cama:update(dt)
        -- detección colisiones paredes laterales
        if self.acrobata.x < 0 or self.acrobata.x + self.acrobata.ancho > ANCHO_VIRTUAL then
            self.acrobata.vel_x = -1 * self.acrobata.vel_x
        end
        -- detección colisiones acróbata-cama
        if colisionando(self.acrobata, self.cama) then
            self.acrobata.y = self.cama.y - self.acrobata.alto
            local distancia_entre_centros = (self.acrobata.x + self.acrobata.ancho / 2) - (self.cama.x + self.cama.ancho / 2)
            self.acrobata.vel_x = self.acrobata.vel_x + distancia_entre_centros * dt * self.FACTOR_REBOTE_VEL_X
            self.acrobata.vel_y = self.VELOCIDAD_REBOTE_CON_CAMA
        end


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
    keypressed = function(self, key)
        if key == "left" then
            self.cama.moving_left = true
        elseif key == "right" then
            self.cama.moving_right = true
        end
    end,
    keyreleased = function(self, key)
        if key == "left" then
            self.cama.moving_left = false
        elseif key == "right" then
            self.cama.moving_right = false
        end
    end,
}
return pantalla
