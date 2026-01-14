return {
    ---@param cutscene BattleCutscene
    mewmewfreakout = function(cutscene,enemy)
        enemy.sprite:setAnimation("scold");
        cutscene:battlerText(enemy,"You're going to\nlose points.");
        cutscene:battlerText(enemy,"...");
        Game.battle.music:stop();
        enemy.sprite:setAnimation("spinny");
        cutscene:battlerText(enemy,"But you're right.");
        enemy.sprite:setAnimation("spinny2");
        Game.battle.music:play("madmewmew");
        enemy.mewmewing = true;
        cutscene:battlerText(enemy,"MEW MEW KISSY CUTIE 1\nIS FULL OF UPLIFTING\nMESSAGES FOR KIDS!")
        cutscene:battlerText(enemy,"IT TELLS A TIMELESS STORY\nTHAT IS INCIDENTALLY\nABOUT CATGIRLS!")
        cutscene:battlerText(enemy,"SHE HELPS YOU LEARN\nAND GROW AND\nBELIEVE IN YOURSELF!");
        enemy.sprite:setAnimation("spinny3");
        cutscene:battlerText(enemy,"MISS ALPHYS IS\nWRONG![wait:5] WRONG!");
        cutscene:battlerText(enemy,"SHE HAS BAD\nTASTE IN ANIME!!!");
        cutscene:battlerText(enemy,"KYA HA HA\nHA HA HA HA\nHA HA!!!!!");
        enemy.sprite:setAnimation("spinny2");
        cutscene:battlerText(enemy,"Kya ha ha ha\nha ha ha ha...");
        enemy.sprite:setAnimation("spinny");
        cutscene:battlerText(enemy,"Kya ha ha ha\nha ha ha ha...");
        Game.battle.music:play("studysession");
        enemy.mewmewing = false;
        enemy.sprite:setAnimation("onespin");
        cutscene:battlerText(enemy,"Heeehhhhh...");
    end
}