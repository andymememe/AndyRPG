require 'gosu'
load 'item.rb'
load 'player.rb'
load 'map.rb'
load 'npc.rb'
load 'ui.rb'

WIDTH, HEIGHT, PIXEL = 640, 480, 32

class AndyRPG < Gosu::Window
    def initialize
        super WIDTH, HEIGHT
        self.caption = "Andy's RPG"
        
        @tileset = Gosu::Image.load_tiles("assets/tileset.png",
                                          PIXEL, PIXEL, tileable: true)
        
        @ui = UI.new(self)
        @map = Map.new('demo')
        
        self.reset
    end
    
    def reset
        # Object
        @player = Player.new('human', 0,
                             @map.start_x, @map.start_y,
                             @map.width, @map.height)
        # State
        @gameover = false
        @camera_x = 0
        @camera_y = 0
    end
    
    def update
        if @player.hp < 1 then
            @gameover = true
        elsif not @gameover then
            @player.update(0)
            @camera_x = [[@player.x - WIDTH / 2, 0].max,
                         @map.width * PIXEL - WIDTH].min
            @camera_y = [[@player.y - HEIGHT / 2, 0].max,
                         @map.height * PIXEL - (HEIGHT - 32)].min
        end
    end
    
    def draw
        @ui.draw
        if @gameover then
            @ui.draw_gameover
        else
            @ui.draw_ui(@player)
        end
        
        Gosu.translate(-@camera_x, -@camera_y + 32) do
            @map.draw(@tileset)
            @player.draw(@tileset)
        end
    end
    
    def button_down(id)
        case id
        when Gosu::KB_ESCAPE
            close
        when Gosu::KB_RETURN
            if @gameover then
                @player.button_down(id)
                self.reset
            end
        when Gosu::KB_NUMPAD_5
            @player.update(50)
        else
            if not @gameover then
                @player.button_down(id)
            end
        end
    end
end

AndyRPG.new.show