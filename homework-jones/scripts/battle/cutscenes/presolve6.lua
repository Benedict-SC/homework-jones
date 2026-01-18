return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    presolve6 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"All we want\nis the best\nfor you,[wait:5] kids.");
        cutscene:battlerText(enemy,"Pass grades.[wait:5]\nValedictoriels.[wait:5]\nCool leg scholarships.");
        cutscene:battlerText(enemy,"Opportunities to do\nwhatever you want,");
        enemy.sprite:setAnimation("static");
        cutscene:battlerText(enemy,"even if you want to move\nhalfway across the country\nwhere no one knows you,");
        enemy.sprite:setAnimation("nonplussed");
        cutscene:battlerText(enemy,"and start teaching\nmiddle-to-high school\nwith your bachelor's\nin robotics while\nliving in a studio\napartment half the\nsize of your classroom.");
        enemy.sprite:setAnimation("lecture");
        cutscene:battlerText(enemy,"That's why it's fun and\nexciting to do age-appropriate\neducational material until you\ngo to bed every night!");
        enemy.sprite:setAnimation("idle");
        cutscene:battlerText(enemy,"And it keeps you out\nof trouble,[wait:5] too.");
        cutscene:battlerText(enemy,".[wait:3].[wait:3].");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"...not that anyone\never gets in real\ntrouble in Hometown!");
        enemy.sprite:setAnimation("idle");
        enemy.dialogue_override = "Let's have a\nLONG ANSWER!";
    end
}