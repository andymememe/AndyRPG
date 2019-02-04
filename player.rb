RACE = {
    'human' => 5116,
    'elf' => 5086,
    'dwarf' => 5128,
    'orc' => 5124
}

MALE_HAIRS = [
    5442,
    *(5444 .. 5446),
    5457, 5458,
    5465,
    5469,
    5471
]

FEMALE_HAIRS = [*(5443 .. 5475)].select do |i|
    not MALE_HAIRS.include?(i)
end

class Player
    attr_accessor :weapon, :shield, :accessories, :items
    attr_reader :hp, :x, :y
    
    def initialize(race, gender=0, s_x=0, s_y=0, b_x, b_y)
        @hp = 100
        @x = s_x * PIXEL
        @y = s_y * PIXEL
        @bound_x = b_x * PIXEL
        @bound_y = b_y * PIXEL
        
        @base = RACE[race] + gender
        @hair = if gender == 0 then
            FEMALE_HAIRS.sample
        else
            MALE_HAIRS.sample
        end
        
        @weapon = Item.new
        @shield = Item.new
        @accessories = [Item.new]
        @items = [Item.new]
    end
    
    def update
    end
    
    def button_down(id)
        move_x = 0
        move_y = 0
        case id
        when Gosu::KB_UP
          move_y -= PIXEL
        when Gosu::KB_DOWN
          move_y += PIXEL
        when Gosu::KB_LEFT
          move_x -= PIXEL
        when Gosu::KB_RIGHT
          move_x += PIXEL
        end
        
        @x = [[@x + move_x, 0].max, @bound_x - 32].min
        @y = [[@y + move_y, 0].max, @bound_y - 32].min
    end
    
    def draw(tileset)
        tileset[@base].draw(@x, @y, 12)
        tileset[@hair].draw(@x, @y, 13)
        
        @weapon.draw(tileset, @x, @y)
        @shield.draw(tileset, @x, @y)
        
        @accessories.each { |x| x.draw(tileset, @x, @y) }
    end
end