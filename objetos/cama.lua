require "objetos/ayudantes"

function nueva_cama()
    local cama = {
        VELOCIDAD = 50,
        FPS = 20,
        init = function(self)
            self.ancho = 22 -- ancho del hitbox
            self.alto = 10 -- alto del hitbox (realmente va hacia abajo respecto a la posición self.y)
            self.desplz_img_x = -72
            self.desplz_img_y = -76
            self.imagenes = {
                love.graphics.newImage("assets/imagenes/cama_0001.png"),
                love.graphics.newImage("assets/imagenes/cama_0002.png"),
                love.graphics.newImage("assets/imagenes/cama_0003.png"),
                love.graphics.newImage("assets/imagenes/cama_0002.png"),
            }
            self.estado = "normal"  -- estados posibles: "normal", "rebotando"
            self.indice_imagen_actual = 1
            -- self.moving_left = false
            -- self.moving_right = false
        end,
        update = function(self, dt)
            if self.moving_left then
                self.x = self.x - self.VELOCIDAD * dt
                self.ayudantes.moving_left = true
            else
                self.ayudantes.moving_left = false
            end
            if self.moving_right then
                self.x = self.x + self.VELOCIDAD * dt
                self.ayudantes.moving_right = true
            else
                self.ayudantes.moving_right = false
            end

            -- cambio de frame de la animación
            if self.estado == "rebotando" then
                self.tiempo_rebotando = self.tiempo_rebotando + dt
                if self.tiempo_rebotando > #self.imagenes / self.FPS then
                    self.estado = "normal"
                    self.indice_imagen_actual = 1
                else
                    self.indice_imagen_actual = 1 + math.floor(self.tiempo_rebotando * self.FPS)
                end
            end
            self.ayudantes:update(dt) -- self.ayudantes.update(ayudantes, dt)
        end,
        draw = function(self)
            self.ayudantes:draw()
            love.graphics.draw(self.imagenes[self.indice_imagen_actual], self.x + self.desplz_img_x, self.y + self.desplz_img_y)
        end,
        draw_hitbox = function(self)
            self.ayudantes:draw_hitbox()
            love.graphics.rectangle("line", self.x, self.y, self.ancho, self.alto)
        end,
        inicia_animacion_rebote = function(self)
            if self.estado ~= "rebotando" then
                self.estado = "rebotando"
                self.tiempo_rebotando = 0
                self.indice_imagen_actual = 1
            end
        end
    }
    cama:init()
    cama.x = (ANCHO_VIRTUAL - cama.ancho ) / 2  -- coordenada x de la cama
    cama.y = 73  -- coordenada y de la cama
    
    cama.ayudantes = nuevos_ayudantes(cama.VELOCIDAD)
    cama.ayudantes.x = cama.x - 12
    cama.ayudantes.y = cama.y - 4

    return cama
end
