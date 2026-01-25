return {
    ---@param cutscene BattleCutscene
    ---@param battler PartyBattler
    ---@param enemy EnemyBattler
    checkmercyaftersolve = function(cutscene, battler, enemy)

            if enemy.mercy >= enemy.mercyThresholds[1] and enemy.wordProblemsGiven == 0 then
                cutscene:text("* Homework Jones's face opens to reveal an essay question!");
                enemy.wave_override = "favorite";
                enemy.dialogue_override = "Now,[wait:5] let's get excited\nabout LONG ANSWER!"
                enemy.wordProblemsGiven = 1;
            elseif enemy.mercy >= enemy.mercyThresholds[2] and enemy.wordProblemsGiven == 1 then
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                enemy.wave_override = "solow";
                enemy.dialogue_override = "Let's do the next one!"
                enemy.wordProblemsGiven = 2;
            elseif enemy.mercy >= enemy.mercyThresholds[3] and enemy.wordProblemsGiven == 2 then
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                enemy.wave_override = "mewmew";
                enemy.wordProblemsGiven = 3;
            end
            if enemy.mercy >= 100 then
                enemy.text = enemy.spareable_text;
            end
            enemy:beforeBasicWave(cutscene);
    end
}