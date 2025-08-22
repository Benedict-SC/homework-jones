local MultipleChoice, super = Class(Wave)

function MultipleChoice:onStart()
    self.time = 4;
    self.bg = Sprite("bullets/scantron", 212, 31)
    self.bg:setLayer(BATTLE_LAYERS["below_soul"])
    Game.battle:addChild(self.bg)
end

function MultipleChoice:update()
    -- Code here gets called every frame

    super.update(self)
end

function MultipleChoice:onEnd()
    self.bg:remove();
end

return MultipleChoice