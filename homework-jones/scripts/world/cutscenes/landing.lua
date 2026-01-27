return {
    go = function(cutscene,event)
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        cutscene:wait(1);
        cutscene:setSpeaker("susie");
        susie:setFacing("right");
        cutscene:text("Alright, Kris! Let's go find Ralsei!","smile")
        cutscene:setSpeaker("ralsei");
        susie.sprite:set("shock_right");
        kris:setFacing("up");
        Game.world.timer:after(1,function()
            susie.sprite:set("away_hips");
        end);
        cutscene:text("Oh, hi Susie! Hi Kris!","smile")
        Game:addPartyMember("ralsei");
        cutscene:startEncounter("hjones")
        --local flash = FlashFade(kris.sprite.texture, offset_x or 0, offset_y or 0)
        --flash.flash_speed = 0.3
        --flash.layer = layer or 100 -- TODO: Unhardcode?
        --kris.sprite:addChild(flash)
    end
}