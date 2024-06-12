function nuevo_acrobata(x_inicial, y_inicial)
    local acrobata = {
        init = function(self)
            self.x = x_inicial  -- coordenada x del héroe
            self.y = y_inicial  -- coordenada y del héroe
            self.ancho = 8 -- ancho del hitbox
            self.alto = 19 -- alto del hitbox (realmente va hacia abajo respecto a la posición self.y)
            self.desplz_img_x = -80
            self.desplz_img_y = -29
            self.imagenes = {
                love.graphics.newImage("assets/imagenes/acrobata_0001.png"),
                love.graphics.newImage("assets/imagenes/acrobata_0002.png"),
                love.graphics.newImage("assets/imagenes/acrobata_0003.png"),
                love.graphics.newImage("assets/imagenes/acrobata_0004.png"),
                love.graphics.newImage("assets/imagenes/acrobata_0005.png"),
                love.graphics.newImage("assets/imagenes/acrobata_0006.png"),
                love.graphics.newImage("assets/imagenes/acrobata_0007.png"),
                love.graphics.newImage("assets/imagenes/acrobata_0008.png"),
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
    acrobata:init()

    return acrobata
end
