load 'maps/level_map.rb'

class Demo < LevelMap
    def initialize(b_x, b_y, s_x, s_y)
        super b_x, b_y, s_x, s_y
    end
end

MAP = Demo.new(20, 15, 10, 7)