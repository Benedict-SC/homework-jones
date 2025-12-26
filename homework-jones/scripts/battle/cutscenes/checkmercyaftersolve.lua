return {
    ---@param cutscene BattleCutscene
    ---@param battler PartyBattler
    ---@param enemy EnemyBattler
    checkmercyaftersolve = function(cutscene, battler, enemy)

            if enemy.mercy >= 27 and enemy.wordProblemsGiven == 0 then
                cutscene:text("* Homework Jones's face opens to reveal an essay question!");
                enemy.wave_override = "favorite";
                enemy.dialogue_override = "Now,[wait:5] let's get excited\n about LONG ANSWER!"
                enemy.wordProblemsGiven = 1;
            elseif enemy.mercy >= 54 and enemy.wordProblemsGiven == 1 then
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                enemy.wave_override = "solow";
                enemy.dialogue_override = "Let's do the next one!"
                enemy.wordProblemsGiven = 2;
            elseif enemy.mercy >= 81 and enemy.wordProblemsGiven == 2 then
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                cutscene:text("* ...but not really, 'cause we haven't implemented this one yet!");
                --TODO: initiate wordproblem 3
                enemy.wordProblemsGiven = 3;
            end
            enemy:beforeBasicWave(cutscene);
    end
}