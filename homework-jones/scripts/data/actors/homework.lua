local actor, super = Class(Actor, "homework")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Homework Jones"

    -- Width and height for this actor, used to determine its center
    self.width = 52
    self.height = 46

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {10, 45, 38, 14}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0, 0, 1}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "enemies/jones"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "onespin"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- Table of sprite animations
    self.animations = {
        ["idle"] = {"idle", function(sprite, wait)
            while true do
                sprite:setFrame(2)
                wait(0.08)
                sprite:setFrame(3)
                wait(0.6)
                sprite:setFrame(2)
                wait(0.08)
                sprite:setFrame(1)
                wait(0.08)
                sprite:setFrame(4)
                wait(0.08)
                sprite:setFrame(5)
                wait(0.6)
                sprite:setFrame(4)
                wait(0.08)
                sprite:setFrame(1)
                wait(0.08)
            end
        end},
        ["static"] = {"static", "0.25", true},
        ["spinny"] = {"spinny",function(sprite, wait)
            while true do
                sprite:setFrame(4)
                wait(0.08)
                sprite:setFrame(1)
                wait(0.08)
                sprite:setFrame(2)
                wait(0.08)
                sprite:setFrame(3)
                wait(0.08)
                sprite:setFrame(1)
                wait(0.08)
                sprite:setFrame(2)
                wait(0.08)
                sprite:setFrame(3)
                wait(0.08)
                sprite:setFrame(4)
                wait(0.08)
                sprite:setFrame(5)
                wait(0.08)
                sprite:setFrame(6)
                wait(0.8)
            end
        end},
        ["onespin"] = {"spinny",function(sprite, wait)
            --no loop
                sprite:setFrame(4)
                wait(0.08)
                sprite:setFrame(1)
                wait(0.08)
                sprite:setFrame(2)
                wait(0.08)
                sprite:setFrame(3)
                wait(0.08)
                sprite:setFrame(1)
                wait(0.08)
                sprite:setFrame(2)
                wait(0.08)
                sprite:setFrame(3)
                wait(0.08)
                sprite:setFrame(4)
                wait(0.08)
                sprite:setFrame(5)
                wait(0.08)
                sprite:setFrame(6)
                wait(0.4)
        end,["next"]="idle"}
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Since the width and height is the idle sprite size, the offset is 0,0
        ["idle"] = {0, 0},
    }
end

return actor