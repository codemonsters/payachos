function nuevo_heroe()
    local heroe = {
        init = function(self)
            self.x = 20  -- coordenada x del héroe
            self.y = 20  -- coordenada y del héroe
            self.ancho = 8 -- ancho del hitbox
            self.alto = 19 -- alto del hitbox (realmente va hacia abajo respecto a la posición self.y)
            self.desplz_img_x = -80
            self.desplz_img_y = -29
            self.imagenes = {
                love.graphics.newImage("assets/imagenes/heroe_0001.png"),
                love.graphics.newImage("assets/imagenes/heroe_0002.png"),
                love.graphics.newImage("assets/imagenes/heroe_0003.png"),
                love.graphics.newImage("assets/imagenes/heroe_0004.png"),
                love.graphics.newImage("assets/imagenes/heroe_0005.png"),
                love.graphics.newImage("assets/imagenes/heroe_0006.png"),
                love.graphics.newImage("assets/imagenes/heroe_0007.png"),
                love.graphics.newImage("assets/imagenes/heroe_0008.png"),
            }
        end,
        update = function(self, dt)
            -- TODO: No implementado
        end,
        draw = function(self)
            love.graphics.draw(self.imagenes[1], self.x + self.desplz_img_x, self.y + self.desplz_img_y)
        end,
        draw_hitbox = function(self)
            love.graphics.rectangle("line", self.x, self.y, self.ancho, self.alto)
        end
    }
    heroe:init()

    return heroe
end
