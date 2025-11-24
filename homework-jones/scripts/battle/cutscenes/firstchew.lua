return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    firstChew = function(cutscene,battler,enemy)
        --local enemy = Game.battle.attackers[1]
        cutscene:text("* You took Homework Jones's hand...");
        cutscene:text("* ...and bit down on it like a paper burrito.");
        Assets.playSound("impact")
        enemy:shake(4);
        enemy.chewed = enemy.chewed + 2;
        cutscene:battlerText({enemy},"KYA???",{wait=false});
        cutscene:text("[react:1][react:2]",nil,{reactions= { {
            "KRIS???",80,5,"surprise_confused","ralsei"
        },{
            "Hell yeah, Kris!",300,30,"surprise_smile","susie"
        }}});
        cutscene:text("* Homework Jones got less readable!")
        cutscene:battlerText({enemy},"Whuh--[wait:5] that was worth\nsix percent of your grade!");
        cutscene:battlerText({enemy},"...Kya ha,[wait:5] uh,[wait:5] Kris,\nif you're confused...");
        cutscene:battlerText({enemy},"You can always ask\nyour smarter friend?");
        enemy:shake(4);
        cutscene:battlerText({enemy},"SMART friend!\nI mean SMART friend!");
    end
}