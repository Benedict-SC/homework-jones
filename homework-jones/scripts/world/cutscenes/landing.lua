return {
    go = function(cutscene,event)
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        cutscene:wait(1);
        cutscene:setSpeaker("susie");
        susie:setFacing("right");
        cutscene:text("* Alright, Kris! Let's go find Ralsei!","sincere_smile")
        cutscene:setSpeaker("ralsei");
        susie.sprite:set("shock_right");
        kris:setFacing("up");
        Game.world.timer:after(1,function()
            susie.sprite:set("away_hips");
        end);
        local ralsei = cutscene:getCharacter("ralsei");
        cutscene:text("* Susie! Kris!","blush_pleased_open")
        cutscene:walkTo(ralsei,320,100,1,"down");
        cutscene:wait(1.5);
        cutscene:text("* I thought you weren't going to be able to visit today...?","surprise_smile");
        susie.sprite:set("away_scratch");
        cutscene:setSpeaker("susie");
        cutscene:text("* Yeah, I know I said that, but - hear me out, alright?","nervous");
        susie.sprite:set("away_turn");
        cutscene:text("* Look, with the entire world on the line...","angry");
        susie.sprite:set("away_hand");
        cutscene:text("* There's no way me and Kris can finish our worksheets in time.","surprise_frown");
        susie.sprite:set("away_hips");
        cutscene:text("* That's why we brought 'em HERE.","closed_grin");
        cutscene:setSpeaker("ralsei");
        cutscene:text("* Er, I know I promised to do your homework, Susie, but -","concern_smile");
        susie.sprite:set("away_turn");
        cutscene:setSpeaker("susie");
        cutscene:text("* Nah, Queen can do it. You're way too busy.","nervous");
        cutscene:text("* Means we can finally get some use out of all those recruits, too.","small_smile");
        cutscene:text("* Am I a genius or what?","closed_grin");
        cutscene:setSpeaker("ralsei");
        ralsei:setFacing("up");
        cutscene:text("* Um, you could certainly\ntrust Queen to answer\n...some questions.","blush");
        ralsei:setFacing("right");
        cutscene:text("* And none of the Darkners in Castle Town would mind helping you.","blush_smile");
        ralsei:setFacing("down");
        cutscene:text("* It's just that...","small_smile_side");
        kris:alert();
        cutscene:wait(1);
        Assets.playSound("sparkle_gem");

        local jones = cutscene:getCharacter("homework");
        jones.sprite:set("static");
        local overlay = Sprite(jones.sprite.texture,0,0);
        overlay.alpha = 1;
        overlay.color_mask = overlay:addFX(ColorMaskFX());
        jones.sprite:addChild(overlay);
        jones.x = 500;
        jones.y = 380;
        jones.sprite:setScale(0,0);
        Game.world.timer:approach(2,0,1,function(num) 
            jones.sprite:setScale(num,num);
            jones.x = 500 - (180*num);
            jones.y = 380 - (160*num);
        end);
        cutscene:wait(2);
        Game.world.timer:approach(1,1,0,function(num) 
            overlay.alpha = num;
        end);
        susie.sprite:set("shock_right");
        cutscene:setSpeaker("susie");
        cutscene:text("What the -","shock");
        cutscene:setSpeaker(nil);
        jones.sprite:setAnimation("onespin");
        cutscene:text("* Kya ha ha! I'm Homework Jones!")
        jones.sprite:setAnimation("onespin");
        cutscene:text("* Solve my puzzles and problems!")
        cutscene:wait(2);
        cutscene:setSpeaker("ralsei");
        ralsei.sprite:set("laugh");
        cutscene:text("* I really don't know what you thought would happen.","surprise_neutral");
        cutscene:wait(cutscene:fadeOut(1));
        Game:addPartyMember("ralsei");
        jones:remove();
        cutscene:startEncounter("hjones")
        --local flash = FlashFade(kris.sprite.texture, offset_x or 0, offset_y or 0)
        --flash.flash_speed = 0.3
        --flash.layer = layer or 100 -- TODO: Unhardcode?
        --kris.sprite:addChild(flash)
        cutscene:gotoCutscene("postbattle","postbattle");
    end
}