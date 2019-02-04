class LevelMap
    def self.getMap
        self.new(20, 15, 10, 7)
    end
    
    def initialize(b_x, b_y, s_x, s_y)
        @b_x, @b_y, @s_x, @s_y = b_x, b_y, s_x, s_y
    end

    def getBound
        [@b_x, @b_y]
    end
    
    def getStart
        [@s_x, @s_y]
    end
    
    def getGrounds
        Array.new(@b_y) do |i|
            Array.new(@b_x) { |j| 2 }
        end
    end
    
    def getSolidMiscs
        Array.new(@b_y) do |i|
            Array.new(@b_x) { |j| 0 }
        end
    end
    
    def getMiscs
        Array.new(@b_y) do |i|
            Array.new(@b_x) { |j| 0 }
        end
    end
    
    def getBreakableItems
        Array.new(@b_y) do |i|
            Array.new(@b_x) { |j| 0 }
        end
    end
    
    def getPickup
        Array.new(@b_y) do |i|
            Array.new(@b_x) { |j| 0 }
        end
    end
end