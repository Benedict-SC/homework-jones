return {
    ---@param cutscene BattleCutscene
    ---@param battler PartyBattler
    ---@param enemy EnemyBattler
    checkchewaftereat = function(cutscene, battler, enemy, previousChewValue)
        if enemy.chewed > 10 then enemy.chewed = 10 end
        if enemy.chewed == 10 and previousChewValue < 10 then
            enemy:permaPuddle();
        end
        enemy:beforeBasicWave(cutscene);
    end
}