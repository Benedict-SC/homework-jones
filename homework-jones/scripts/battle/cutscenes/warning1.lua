return {
    ---@param cutscene BattleCutscene
    warning1 = function(cutscene,battler,enemy)
        self.dialogue = self.solveDialogue;
        enemy.sprite:setAnimation("fear");
        cutscene:battlerText(enemy,"I,[wait:5] uh,[wait:5] guess that's a\nGood Star for enthusiasm!");
        cutscene:battlerText(enemy,"But you're not supposed\nto be so hungry for\nknowledge that you...");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"Eat...[wait:5] my body.");
        enemy.sprite:setAnimation("lecture");
        cutscene:battlerText(enemy,"Studies show,[wait:5] learning\nretention is much higher\nwhen you read words!");
        enemy.sprite:setAnimation("nonplussed");
        cutscene:battlerText(enemy,"Instead of eating them.");
        enemy.sprite:setAnimation("idle");
        cutscene:battlerText(enemy,"Let's just,[wait:5] uh,[wait:5] get back\nto the assignment!");
        enemy.dialogue_override = "...Please?";
    end
}