class Player

    attr_reader :name, :hp

    def initialize(name)
        @name = name
        @hp = 100
    end

    def take_damage
        damage = Kernel.rand(1..20)
        @hp -= damage
        damage
    end

    def gain_hp
        hp_gained = Kernel.rand(1..20)
        if @hp + hp_gained > 100
            hp_gained = 100 - @hp
        end
        @hp += hp_gained
        hp_gained
    end
end