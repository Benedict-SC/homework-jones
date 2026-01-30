
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
            cutscene:text("* Homework Jones fell asleep.")
            cutscene:setSpeaker("susie")
            cutscene:text("* Well,[wait:5] you bubbled in all the answers while you were...","smile")
            cutscene:text("* ...beating the crap out of him.","nervous")
            cutscene:text("* Must be nice to be able to write with your sword.","small_smile")
            cutscene:text("* Even if your handwriting's worse than mine,[wait:5] heh.","sincere_smile")
            cutscene:setSpeaker("ralsei")
            cutscene:text("* We can just erase those answers later,[wait:5] Susie.","blush_smile")
            cutscene:text("* Once Mr. Jones is awake,[wait:5] perhaps he'll be calmer?","small_smile_side")
            cutscene:text("* I'd be happy to help you with his puzzles and problems!","smile")
            cutscene:text("* Though it'll take a little while to reconstruct him.","surprise_neutral")
            cutscene:setSpeaker("susie")
            cutscene:text("* Let's just,[wait:3] uh...[wait:5] call that[wait:3] 'healing magic homework.'","nervous_side")
            cutscene:text("* ...Let's go,[wait:3] Kris.","smile")
        else --you fought him presumably.
            cutscene:setSpeaker(nil)
            Assets.playSound("escaped");
            cutscene:text("* Homework Jones was LOST.")
            cutscene:setSpeaker("susie")
            cutscene:text("* Damn.","suspicious")
            cutscene:text("* Guess we're getting an F.","suspicious")
            cutscene:text("* ...uh,[wait:5] what happens if one of our recruits gets lost?","surprise_frown")
            cutscene:setSpeaker("ralsei")
            cutscene:text("* Oh,[wait:5] I...","surprise_neutral")
            cutscene:text("* ...I-[wait:2]I'm not sure?[wait:5] Castle Town shouldn't have...","surprise_confused")
            cutscene:text("* ...anywhere he could get lost in,[wait:5] really.","surprise_neutral_side")
            cutscene:text("* Perhaps Mr. Jones is just,[wait:2] erm,[wait:3] hiding.","pleased")
            cutscene:text("* I'll check my filing cabinets later.","pensive")
            cutscene:setSpeaker("susie")
            cutscene:text("* Right.","annoyed_down")
            cutscene:text("* Let's go,[wait:3] Kris.","neutral_side")
            cutscene:text("* (...don't rely on me for plans,[wait:4] I guess.)","bangs_neutral")
        end
    end
}