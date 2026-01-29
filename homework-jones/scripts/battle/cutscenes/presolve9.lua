return {
    ---@param cutscene BattleCutscene
    presolve9 = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("fear");
        cutscene:battlerText(enemy,"W-[wait:2]w-[wait:2]well,[wait:5]\nkya-ha-ha,[wait:5]\nno problem!");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"M-[wait:2]maybe we could\njust do the first\nLONG ANSWER again?");
        cutscene:battlerText(enemy,"You know your favorite\nfriend,[wait:5] right?[wait:5] That's easy![wait:5]\nYou can have a GoldStar!");
        cutscene:setSpeaker("susie");
        cutscene:text("* ...Listen.","neutral");
        cutscene:text("* I get you're,[wait:3] like,[wait:3] trying to keep me entertained.","neutral");
        cutscene:text("* So I'm too distracted to rob the grocery store,[wait:3] or church,[wait:3] or whatever.","annoyed_down");
        cutscene:text("* But...[wait:5] I've got Kris and Ralsei to help me out.","bangs_smile");
        cutscene:text("* It's a GROUP project for a reason, right?","smile")
        cutscene:text("* Might as well give it a shot.","closed_grin")
        enemy.sprite:setAnimation("hmm");
        cutscene:battlerText(enemy,"S-[wait:2]Susie?[wait:5] You...[wait:5]\nWANT to solve my\npuzzles and problems?");
        cutscene:text("* Pssh,[wait:3] what?[wait:5] Nah,[wait:3] I just can't let them pick the topic.","sincere_smile")
        cutscene:text("* I'd sound like a nerd if I had to present about doilies,[wait:5] or whatever.","smirk")
        cutscene:text("* So,[wait:3] what's it about?","small_smile")
        enemy:shake(4);
        enemy.sprite:setAnimation("static");
        cutscene:battlerText(enemy,"...");
        cutscene:battlerText(enemy,".[wait:3] .[wait:3] .[wait:3] .[wait:3] .");
        cutscene:setSpeaker("susie");
        cutscene:text("Do you not know that either???","surprise_frown")
        enemy.sprite:setAnimation("scold");
        cutscene:battlerText(enemy,"The prompt is vague!!!");
        enemy.dialogue_override = "LONG ANSWER!!!!!";
    end
}