return {
    ---@param cutscene BattleCutscene
    ---@param battler PartyBattler
    ---@param enemy EnemyBattler
    solveforx = function(cutscene, battler, enemy)
        if enemy.chewed and (enemy.chewed >= 10) then
            if not enemy.soggySolvePicked then
                cutscene:text("* Ralsei tried to do your homework...");
                cutscene:text("* But the paper was too soggy.");
                cutscene:text("* A disgusting mash got stuck on Ralsei's claws.");
                cutscene:setSpeaker("ralsei");
                cutscene:text("M-[wait:3]Mr. Jones,[wait:5] can I wash my hands,[wait:5] please?","shock");
                cutscene:battlerText({enemy},"I don't know,[wait:5] Prince,[wait:5][wave]CAN[wave:0] you?");
                enemy.soggySolvePicked = true;
            else
                cutscene:text("* Ralsei is still covered in spit wads.");
                cutscene:text("* Doesn't seem like solving is an option.");
            end
        else
            local subjects = {"geography","math","history","science"};
            local randomSubject = subjects[math.random(1,#subjects)];
            if not enemy.solveForXPicked then   
                enemy.solveForXPicked = true;
                cutscene:setSpeaker("ralsei");
                cutscene:text("Kris?[wait:5] You...[wait:8] want to do homework...[wait:8] together?[react:1]","blush_shy",{reactions= { {
                    "Uh, you're blushing.",400,55,"nervous","susie"
                }}});
                cutscene:setSpeaker(nil);
            end
            cutscene:text("* You and Ralsei solve a " .. randomSubject .. " problem!");
            enemy:addMercy(9);
            cutscene:wait(1);
            if enemy.mercy >= 27 and enemy.wordProblemsGiven == 0 then
                cutscene:text("* Homework Jones's face opens to reveal an essay question!");
                enemy.wave_override = "favorite";
                enemy.dialogue_override = "Pencils at the ready,[wait:5] kids!"
                enemy.wordProblemsGiven = 1;
            elseif enemy.mercy >= 54 and enemy.wordProblemsGiven == 1 then
                enemy.wave_override = "solow";
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                enemy.dialogue_override = "Pencils at the ready,[wait:5] kids!"
                --TODO: initiate wordproblem 2
                enemy.wordProblemsGiven = 2;
            elseif enemy.mercy >= 81 and enemy.wordProblemsGiven == 2 then
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                cutscene:text("* ...but not really, 'cause we haven't implemented this one yet!");
                --TODO: initiate wordproblem 3
                enemy.wordProblemsGiven = 3;
            end
        end
    end
}