function nuevos_ayudantes(velocidad)
    local ayudantes = {
        init = function(self)
            --self.x = 20  -- coordenada x del héroe
            --self.y = 20  -- coordenada y del héroe
            self.velocidad = velocidad
            self.ancho = 45 -- ancho del hitbox
            self.alto = 20 -- alto del hitbox (realmente va hacia abajo respecto a la posición self.y)
            self.desplz_img_x = -60
            self.desplz_img_y = -66
            self.imagenes = {
                love.graphics.newImage("assets/imagenes/ayudantes_0001.png"),
                love.graphics.newImage("assets/imagenes/ayudantes_0002.png"),
                love.graphics.newImage("assets/imagenes/ayudantes_0003.png"),
                love.graphics.newImage("assets/imagenes/ayudantes_0004.png"),
                love.graphics.newImage("assets/imagenes/ayudantes_0005.png"),
                love.graphics.newImage("assets/imagenes/ayudantes_0004.png"),
                love.graphics.newImage("assets/imagenes/ayudantes_0003.png"),
                love.graphics.newImage("assets/imagenes/ayudantes_0002.png"),
            }
            self.indice_imagen_actual = 1
        end,
        update = function(self, dt)
            if self.moving_left then
                self.x = self.x - self.velocidad * dt
            end
            if self.moving_right then
                self.x = self.x + self.velocidad * dt
            end
            -- TODO: cambiar de fotograma
        end,
        draw = function(self)
            love.graphics.draw(self.imagenes[1], self.x + self.desplz_img_x, self.y + self.desplz_img_y)
        end,
        draw_hitbox = function(self)
            love.graphics.rectangle("line", self.x, self.y, self.ancho, self.alto)
        end
    }
    ayudantes:init()

    return ayudantes
end
