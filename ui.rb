class UI
    @@GameoverText = "GAME OVER"

    def initialize(windows)
        @gameover_font = Gosu::Font.new(windows, 'assets/Romulus.ttf', 60)
        @ui_font = Gosu::Font.new(windows, 'assets/Romulus.ttf', 30)
    end
    
    def update
    end
    
    def draw_menu
    
    end
    
    def draw_ui(player)
        text = "HP: #{player.hp}"
        @ui_font.draw_text(text,
                      5, 5, 91, 1.0, 1.0,
                      Gosu::Color::WHITE)
    end
    
    def draw_gameover
        width = @gameover_font.text_width(@@GameoverText)
        @gameover_font.draw_text(@@GameoverText,
                                 (WIDTH - width) / 2, 210, 91, 1.0, 1.0,
                                 Gosu::Color::WHITE)
    end
end