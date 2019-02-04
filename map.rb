GROUND = [
    *(587 .. 631)
]

class Map
    attr_reader :width, :height, :start_x, :start_y
    
    def initialize(map_name)
        load "maps/#{map_name}.rb"
        
        # Coordination
        @width = MAP.getBound[0]
        @height = MAP.getBound[1]
        @start_x = MAP.getStart[0]
        @start_y = MAP.getStart[1]
    end
    
    def update
    end
    
    def draw(tileset)
        MAP.getGrounds.each_with_index do |row, y|
            row.each_with_index do |ele, x|
                tileset[GROUND[ele]].draw(x * PIXEL, y * PIXEL, 0)
            end
        end
    end
end