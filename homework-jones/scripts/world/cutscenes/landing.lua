return {
    go = function(cutscene,event)
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        cutscene:wait(1);
        cutscene:setSpeaker("susie");
        susie:setFacing("right");
        cutscene:text("Alright, Kris! Let's go find Ralsei!","smile")
    end
}