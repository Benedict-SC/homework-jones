
return {
    postbattle = function(cutscene,event)
        cutscene:wait(cutscene:fadeOut(1));
        if Game.jonesOutcome == "happy" then
            cutscene:setSpeaker(nil)
            Assets.playSound("item")
            cutscene:text("* Homework Jones became a Key Item.")
            cutscene:setSpeaker("susie")
            cutscene:text("* Wonder if the old man could've taught me math.","smirk")
            cutscene:wait(1.2);
            cutscene:text("* ...he was your brother's teacher?","surprise")
            cutscene:text("* Damn,[wait:5] we could've had a COOL homework Darkner.","surprise_smile")
            cutscene:text("* Bet he'd throw hammers made of fractions,[wait:5] or something.","sincere_smile")
            cutscene:setSpeaker("ralsei")
            cutscene:text("* I'll help you with the assignment if you'd like,[wait:5] Susie!","blush_smile")
            cutscene:text("* Though I'm not sure I can make fractions into hammers.","blush_shy")
            cutscene:text("* But,[wait:5] if you'd help me fold the papers into origami stars...","small_smile_side")
            cutscene:setSpeaker("susie")
            cutscene:text("* Heh.","closed_grin")
            cutscene:text("* Better take notes,[wait:3] Jones!","smile")
            cutscene:text("* ...Let's go,[wait:5] Kris.","smirk")
        elseif Game.jonesOutcome == "munch" then
            cutscene:setSpeaker(nil)
            cutscene:text("* You poured Sludge Puddle Jones into an Ambyu-Lance's head.")
            cutscene:text("* It wee-wooed him off to the castle.")
            cutscene:setSpeaker("susie")
            cutscene:text("* Kris?","neutral_side")
            cutscene:text("* When we get a makeup assignment...","neutral")
            cutscene:text("* Try not to eat him alive.","sus_nervous")
            local choice = cutscene:choicer({"Okay","My mouth\ntastes like\npaper"});
            if choice == 1 then
                cutscene:text("* Could get Noelle to help on the next one,[wait:5] if you want.","smirk")
                cutscene:text("* C'mon,[wait:3] dumbass.[wait:5] Let's go ask.","smile")
            else
                cutscene:text("* YEAH, dumbass, that's what happens when you eat paper.","teeth")
            end
            cutscene:wait(1.2);
            cutscene:text("* I...[wait:5] don't really mean it,[wait:5] you know.","shy")
            cutscene:text("* You're not dumb,[wait:5] Kris.","small_smile")
            cutscene:text("* Berdly's definitely got you beat on being an idiot.","smile")
            cutscene:text("* So...[wait:5] next time...","annoyed_down")
            cutscene:text("* ...whatever.[wait:5] Let's go,[wait:3] Kris.","sus_nervous")
        elseif Game.jonesOutcome == "error" then
            cutscene:setSpeaker(nil)
            cutscene:text("* Uh, somehow neither the spare or pacify route flags triggered...")
            cutscene:text("* How did you win that fight?[wait:5] This shouldn't be possible...")
        elseif Game.jonesOutcome == "beaten" then
            cutscene:setSpeaker(nil)
            cutscene:text("* [no dialogue for the fight route yet]")
        else --you fought him presumably.
            cutscene:setSpeaker(nil)
            cutscene:text("* [no dialogue for oh my god you killed him]")
        end
    end
}