local BattleCutscene, super = HookSystem.hookScript(BattleCutscene)

function BattleCutscene:init(group, id, ...)
    local scene, args = self:parseFromGetter(Registry.getBattleCutscene, group, id, ...)

    self.changed_sprite = {}
    self.move_targets = {}
    self.waiting_for_text = nil
    self.waiting_for_enemy_text = nil

    self.last_battle_state = Game.battle.state
    if not ((group == "solowstart" and id == "solowstart") 
            or (group == "mewmewstart" and id == "mewmewstart")
            or (group == "mewmewfreakout" and id == "mewmewfreakout")
            or (group == "mewmewgaiden" and id == "mewmewgaiden")
            or (group == "favoritewrong" and id == "favoritewrong")
        ) then
        Game.battle:setState("CUTSCENE")
    end

    super.super.init(self, scene, unpack(args))
end

return BattleCutscene