if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

utilidades = require "utilidades"

ANCHO_VIRTUAL = 160
ALTO_VIRTUAL = 90
GRAVEDAD = 150

function cargar_pantalla(ruta_modulo_pantalla)
    _pantalla = require(ruta_modulo_pantalla)
    _pantalla:init()
end

function love.load()
    utilidades.configuraVentana(ANCHO_VIRTUAL, ALTO_VIRTUAL)
    love.window.setTitle("Payachos")
    cargar_pantalla("pantallas/menu")
end

function love.update(dt)
    _pantalla:update(dt)
end

function love.draw()
    utilidades.antesDeDibujar()
    love.graphics.clear()

    _pantalla:draw()

    utilidades.despuesDeDibujar()
    --pepe = heroe.nuevo_heroe()
end

function love.keypressed(key)
    _pantalla:keypressed(key)
end

function love.keyreleased( key )
    _pantalla:keyreleased(key)
end