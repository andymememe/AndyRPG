class Item
    def initialize(id=0, pickup_id=0)
        @id = id
        @pickup_id = pickup_id
    end
    
    def update
    end
    
    def draw(tileset, x, y)
        tileset[@id].draw(x, y, 14)
    end
    
    def draw_pickup(tileset, x, y)
        tileset[@pickup_id].draw(x, y, 4)
    end
end