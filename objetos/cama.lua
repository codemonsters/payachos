require "objetos/ayudantes"

function nueva_cama()
    local cama = {
        init = function(self)
            self.ancho = 22 -- ancho del hitbox
            self.alto = 10 -- alto del hitbox (realmente va hacia abajo respecto a la posición self.y)
            self.desplz_img_x = -72
            self.desplz_img_y = -76
            self.imagenes = {
                love.graphics.newImage("assets/imagenes/cama_0001.png"),
                love.graphics.newImage("assets/imagenes/cama_0002.png"),
                love.graphics.newImage("assets/imagenes/cama_0003.png"),
            }
        end,
        update = function(self, dt)
            self.ayudantes:update(dt) -- self.ayudantes.update(ayudantes, dt)
        end,
        draw = function(self)
            self.ayudantes:draw()
            love.graphics.draw(self.imagenes[1], self.x + self.desplz_img_x, self.y + self.desplz_img_y)
        end,
        draw_hitbox = function(self)
            self.ayudantes:draw_hitbox()
            love.graphics.rectangle("line", self.x, self.y, self.ancho, self.alto)
        end
    }
    cama:init()
    cama.x = (ANCHO_VIRTUAL - cama.ancho ) / 2  -- coordenada x de la cama
    cama.y = 73  -- coordenada y de la cama
    
    cama.ayudantes = nuevos_ayudantes()
    cama.ayudantes.x = cama.x - 12
    cama.ayudantes.y = cama.y - 4

    return cama
end
