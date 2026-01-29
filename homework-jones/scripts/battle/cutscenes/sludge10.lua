return {
    ---@param cutscene BattleCutscene
    sludge10 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"...You know what?");
        cutscene:battlerText(enemy,"Keep eating!");
        enemy:shake(4);
        cutscene:battlerText(enemy,"Make me into origami\nfried chicken,[wait:5] kids!");
        cutscene:battlerText(enemy,"Slurp down my ink\nlike squid spaghetti![wait:5]\nPick your teeth with\na three-ring binder!");
        cutscene:battlerText(enemy,"Fry up some French\nhomework cuisine a\nla modus tollens!");
        enemy:shake(4);
        cutscene:battlerText(enemy,"There's no way I'll ever be\nuseful to you kids in your\nentire lives,[wait:5] but at least you\nwon't pass out all the time with\na few extra bites to eat!");
        cutscene:battlerText(enemy,"If you can't learn crap\nfrom Homework Jones, then\nsup upon my [shake:1]HOMEWORK BONES![shake:0]");
        cutscene:setSpeaker("susie")
        cutscene:text("* (Kris he's making it weird.)","shy_b");
        enemy.dialogue_override = "KEH HEH HUH";
    end
}