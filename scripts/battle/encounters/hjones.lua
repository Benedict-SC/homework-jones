local HJones, super = Class(Encounter)

function HJones:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Solve my puzzles and problems!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("hjones")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
end

return HJones