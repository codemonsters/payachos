function nuevos_ayudantes(velocidad)
    local ayudantes = {
        init = function(self)
            --self.x = 20  -- coordenada x del héroe
            --self.y = 20  -- coordenada y del héroe
            self.FPS = 20
            self.estado = "parado" -- estados posibles: "parado", "andando_izquierda", "andando_derecha"
            self.tiempo_en_este_estado = 0
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
            if self.moving_left and not self.moving_right then
                self.x = self.x - self.velocidad * dt
                if self.estado ~= "andando_izquierda" then
                    self.estado = "andando_izquierda"
                    self.tiempo_en_este_estado = 0
                else
                    self.tiempo_en_este_estado = self.tiempo_en_este_estado + dt
                end
            elseif self.moving_right and not self.moving_left then
                self.x = self.x + self.velocidad * dt
                if self.estado ~= "andando_derecha" then
                    self.estado = "andando_derecha"
                    self.tiempo_en_este_estado = 0
                else
                    self.tiempo_en_este_estado = self.tiempo_en_este_estado + dt
                end
            else
                if self.estado ~= "parado" then
                    self.estado = "parado"
                    self.tiempo_en_este_estado = 0
                    -- TODO: Considerar si poner aquí self.indice_imagen_actual = 1
                else
                    self.tiempo_en_este_estado = self.tiempo_en_este_estado + dt
                end
            end

            -- cambio de fotograma
            if self.estado == "andando_izquierda" or self.estado == "andando_derecha" then
                local fotograma = math.floor(self.tiempo_en_este_estado * self.FPS)
                self.indice_imagen_actual = 1 + fotograma % #self.imagenes
            end
        end,
        draw = function(self)
            love.graphics.draw(self.imagenes[self.indice_imagen_actual], self.x + self.desplz_img_x, self.y + self.desplz_img_y)
        end,
        draw_hitbox = function(self)
            love.graphics.rectangle("line", self.x, self.y, self.ancho, self.alto)
        end
    }
    ayudantes:init()

    return ayudantes
end
