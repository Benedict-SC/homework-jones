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
                cutscene:battlerText(enemy,"I don't know,[wait:5] Prince,[wait:5][wave]CAN[wave:0] you?");
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
            cutscene:gotoCutscene("checkmercyaftersolve", "checkmercyaftersolve",battler,enemy);
        end
    end
}