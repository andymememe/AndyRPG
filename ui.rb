class UI
    @@GameoverText = "GAME OVER"
    @@PressEntText = "Press Enter to Continue..."

    def initialize(windows)
        @title_font = Gosu::Font.new(windows, 'assets/Romulus.ttf', 60)
        @subti_font = Gosu::Font.new(windows, 'assets/Romulus.ttf', 45)
        @ui_font = Gosu::Font.new(windows, 'assets/Romulus.ttf', 30)
    end
    
    def update
    end
    
    def draw
        Gosu.draw_rect(0, 0, WIDTH, 32, Gosu::Color::BLACK, 90, :default)
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
        gameover_width = @title_font.text_width(@@GameoverText)
        pressent_width = @subti_font.text_width(@@PressEntText)
        @title_font.draw_text(@@GameoverText,
                              (WIDTH - gameover_width) / 2, 210, 91,
                              1.0, 1.0,
                              Gosu::Color::WHITE)
        @subti_font.draw_text(@@PressEntText,
                              (WIDTH - pressent_width) / 2, 280, 91,
                              1.0, 1.0,
                              Gosu::Color::WHITE)
    end
end