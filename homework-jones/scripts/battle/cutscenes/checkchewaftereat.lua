return {
    ---@param cutscene BattleCutscene
    ---@param battler PartyBattler
    ---@param enemy EnemyBattler
    checkchewaftereat = function(cutscene, battler, enemy, previousChewValue)
        if enemy.chewed > 10 then enemy.chewed = 10 end
        if enemy.chewed == 10 and previousChewValue < 10 then
            enemy:permaPuddle();
        end
        if enemy.chewed == 2 then 
            enemy.check = "AT 11 DF 20\n"..
                "* Miss Alphys has created a\n"..
                "monster. I mean Darkner."
            enemy.attack = 11; 
            enemy.defense = 20; 
        elseif enemy.chewed == 4 then
            enemy.check = "AT 12 DF 15\n"..
                "* Homework Jones is looking\n"..
                "a bit... bit."
            enemy.attack = 12; 
            enemy.defense = 15; 
        elseif enemy.chewed == 6 then
            enemy.check = "AT 13 DF 10\n"..
                "* Getting a bit harder to\n"..
                "read. Due to getting bit."
            enemy.attack = 13; 
            enemy.defense = 10; 
        elseif enemy.chewed == 8 then
            enemy.check = "AT 14 DF 5\n"..
                "* Has only a fraction of\n"..
                "his fractions remaining."
            enemy.attack = 14; 
            enemy.defense = 5; 
        elseif enemy.chewed >= 10 then
            enemy.check = "AT 15 DF 0\n"..
                "* It's only good manners to clean\n"..
                "your paper plate. And then eat it."
            enemy.attack = 15; 
            enemy.defense = 0; 
        end
        enemy:beforeBasicWave(cutscene);
    end
}