local EnemyBattler, super = HookSystem.hookScript(EnemyBattler)

function EnemyBattler:getEncounterText()
    local has_spareable_text = self.spareable_text and self:canSpare()

    local priority_spareable_text = Game:getConfig("prioritySpareableText")
    if priority_spareable_text and has_spareable_text then
        return self.spareable_text
    end

    if self.low_health_text and self.health <= (self.max_health * self.low_health_percentage) then
        return self.low_health_text

    elseif self.tired_text and self.tired then
        return self.tired_text

    elseif has_spareable_text then
        return self.spareable_text

    elseif self.one_turn_text_override then
        local t = self.one_turn_text_override;
        self.one_turn_text_override = nil;
        return t;
    end

    return TableUtils.pick(self.text)
end

return EnemyBattler