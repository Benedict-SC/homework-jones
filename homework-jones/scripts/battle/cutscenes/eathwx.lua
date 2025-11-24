return {
    ---@param cutscene BattleCutscene
    eathwx = function(cutscene,battler,enemy)
        --local enemy = Game.battle.attackers[1]
        cutscene:text("* You offered to eat Susie's homework for her.");
        cutscene:setSpeaker("susie");
        cutscene:text(".[wait:5].[wait:5].","suspicious");
        cutscene:text("Then I gotta eat yours too.[wait:5] Fair's fair,[wait:5] right?","sincere",{reactions= { {
                    "Why that face?",400,55,"shock_smile","ralsei"
                }}});
        cutscene:setSpeaker(nil);
        cutscene:text("* You and Susie went at Homework\nJones like dogs at a bone.");
        Assets.playSound("impact")
        enemy:shake(4);
        enemy.chewed = enemy.chewed + 4;
        cutscene:battlerText({enemy},"KYA???",{wait=false});
        cutscene:text("[react:1]",nil,{reactions= {{
            "Tastes like printer jam.",300,30,"sincere_smile","susie"
        }}});
        cutscene:text("* Homework Jones got less readable!")
        cutscene:battlerText({enemy},"Whuh--[wait:5] that was worth\nten percent of your grade!");
        cutscene:battlerText({enemy},"...Kya ha,[wait:5] huhh,\n[wait:5]Kris,[wait:5] Susie...");
        cutscene:battlerText({enemy},"A-[wait:3]aren't you two\ngetting enough to eat?");
        cutscene:battlerText({enemy},"School lunches\nare discounted 5% on\nalternating Thursdays!!");
    end
}