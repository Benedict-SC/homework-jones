return {
    go = function(cutscene,event)
        cutscene:detachCamera()
        cutscene:detachFollowers()
        --local ralsei = cutscene:getCharacter("ralsei")
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        --ralsei.x = 1000;
        susie:setFacing("right");
        kris:setFacing("left")
        kris:getPartyMember():setDarkTransitionActor("kris_dark_transition");
        susie:getPartyMember():setDarkTransitionActor("susie_dark_transition");
        --ralsei:getPartyMember():setDarkTransitionActor("ralsei");
        kris.x = kris.x - 8;
        susie.x = kris.x - 55;
        cutscene:wait(1);
            cutscene:setSpeaker(susie)
            cutscene:text("Kris get the banana","smile")

            kris.visible = false;
            susie.visible = false;
            local transition = DarkTransition(300)
            transition.rx1 = transition.rx1 - 18;
            transition.ry1 = transition.ry1 - 20;
            transition.rx2 = transition.rx2 - 10;
            transition.ry2 = transition.ry2 - 16;

            transition.loading_callback = function() 
                Game.world:loadMap("entrance")
                local kris3 = Game.world:getCharacter("kris");
                kris3.x = 1000;
                if Game.world.music then
                    Game.world.music:stop()
                end
                for _,party in ipairs(Game.party) do
                    local char = Game.world:getCharacter(party.id)
                    char.visible = false
                end
            end
            transition.end_callback = function()
                cutscene:detachFollowers()
                local kris2 = Game.world:getCharacter("kris");
                local susie2 = Game.world:getCharacter("susie");
                kris2.x = 460;
                susie2.x = 165;
                kris2.y = 302;
                susie2.y = 300;
                susie2:setFacing("down");
                kris2:setFacing("down")
                for _,party in ipairs(Game.party) do
                    local char = Game.world:getCharacter(party.id)
                    char.visible = true
                end
            end
            transition.layer = 99999

            Game.world:addChild(transition)

    end
}