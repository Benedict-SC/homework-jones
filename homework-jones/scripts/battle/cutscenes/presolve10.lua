return {
    ---@param cutscene BattleCutscene
    presolve10 = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("static");
        cutscene:battlerText(enemy,"...kids...");
        cutscene:battlerText(enemy,"...that's the last problem.");
        enemy.sprite:setAnimation("lecture");
        cutscene:battlerText(enemy,"Congrat on solving\nLONGEST ANSWERS.");
        cutscene:battlerText(enemy,"I award you all some flower\nstamps and Special Pluses\nfor a good job well done.");
        enemy.sprite:setAnimation("idle");
        cutscene:battlerText(enemy,"Susie...");
        cutscene:setSpeaker("susie");
        cutscene:text("...Yeah?","surprise");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"I'll be back soon!");
        enemy.sprite:setAnimation("spinny");
        cutscene:battlerText(enemy,"Kris can take me to\nwork out at the librarby!");
        cutscene:battlerText(enemy,"We'll do special research![wait:5]\nI'll eat some textbooks![wait:5]\nAb crunch some numbers!");
        enemy.sprite:setAnimation("lecture");
        cutscene:battlerText(enemy,"Pointedly not read or\nlook at Miss Alphys's\nanime commentary!");
        enemy.sprite:setAnimation("idle");
        cutscene:battlerText(enemy,"And the next\ntime we meet...");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"I'll definitely be able\nto teach you what\nyour project's about!");
        enemy.sprite:setAnimation("idle");
        cutscene:text("Uh, sure, dude. Good luck.","smile");
        cutscene:text("(...guess I've had WORSE teachers.)","nervous_side");
        enemy.mercy = 100;
        enemy.dialogue_override = "Sign me off,[wait:5] Kris!";
    end
}