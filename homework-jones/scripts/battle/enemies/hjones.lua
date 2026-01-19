local HJones, super = Class(EnemyBattler)

function HJones:init()
    super.init(self)
    self.name = "Homework Jones"
    self.timer = Timer();

    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("homework")

    self.max_health = 4000
    self.health = 4000
    self.attack = 11
    self.defense = 0
    self.money = 100
    self.dialogue_offset = {0,10};

    self.mercyThresholds = {27,54,82};

    self.TOTAL_CHEW_DIALOGUES = 3;
    self.TOTAL_SLUDGE_DIALOGUES = 11;
    self.TOTAL_SOLVE_DIALOGUES = 10;

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        --"basic"
        --"favorite",
        "mathblaster",
        "multiplechoice",
        --"solow",
        --"mewmew"
    }

    self.dialogue = {
        "Kya ha ha![wait:5] Solve my\npuzzles and problems!"
    }
    -- Dialogue randomly displayed in the enemy's speech bubble
    self.solveDialogue = {
        "Kya ha ha!",
        "No roughhousing,[wait:5] kids!",
        "The bell doesn't\ndismiss you,[wait:5] my\nKOOL SPINS do!",
        "The #2 pencil\nis mightier than\nthe #2 sword!",
        "[POP QUIZ]:[wait:5]\ndefine Fun Times!",
        "Please spin\nfor the pledge!"
    }
    self.sludgeDialogue = {
        "Soggy, soggy...[wait:5]\nkeh huh huh…",
        "Why did you\nhave to Be so\nMinus to me?",
        "They won't let you\neat your teachers\nin college,[wait:5] kids.",
        "I'm confiscating your\nteeth.[wait:5] Come get them\nin the office tomorrow.",
        "Do I have to\ncall your parents?[wait:5]\n...do you even\nHAVE parents?"
    }
    self.finalSludge = {
        "KYAAAAA HA HA HA\nHA HA HAAAA!!!"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 11 DF 0\n"..
        "* Miss Alphys has created a\n"..
        "monster. I mean Darkner."

    -- Text randomly displayed at the bottom of the screen each turn
    self.normalText = {
        "* Homework Jones assigns you three to four hours of mandatory fun.",
        "* Homework Jones asks how your\ncollege applications are going.",
        "* Homework Jones says, \"Kya ha ha!\"",
        "* Homework Jones spins at random speeds.",
        "* Homework Jones makes economic\ntheory 'Kool.'",
        "* Homework Jones teaches you a mnemonic for... something.",
        "* Looking at Homework Jones, you remembered what a mitochondria was.",
        "* Homework Jones can't decide between puzzles and problems.",
        "* Normal to want.\nPossible to achieve.",
        "* Homework just got a little more Jones.",
    }
    self.ouchieText = {
        "* Whatever happened to Homework Jones? ...You. You did.",
        "* Your tooth marks look like angry eyebrows.",
        "* Homework Jones drafts a letter to the PTA.",
        "* Homework Jones leaves a slug trail when he spins.",
        "* Homework Jones says, \"Keh huh huh...\"",
        "* Homework Jones spits out a spitball that used to be a tooth.",
        "* Homework Jones writes your name on the board and circles it.",
        "* Homework Jones looks like an origami dog toy.",
    }
    self.susieActions = {
        "* Susie asks for an extension!",
        "* Susie doodles in the margins!",
        "* Susie diagrams some swears!"
    }
    self.susieBadActions = {
        "* Susie tries to hide Homework Jones in her bag!",
        "* Susie guesses it's 'all of the above'!",
        "* Susie guesses it's 'mitochondria'!",
    }
    self.ralseiActions = {
        "* Ralsei checks your spelling!",
        "* Ralsei builds a Castle Town diorama!",
        "* Ralsei gets hooked on phonics!"
    }
    self.ralseiBadActions = {
        "* Ralsei applies tape and gluesticks!",
        "* Ralsei apologizes profusely!",
        "* Ralsei sends out a rush order for printer ink!"
    }
    
    self.mercyText = { "* Homework Jones reminds you to sign your name on his face." }
    self.pacifyText = { "* Sludge Puddle Jones wants to nap in the teacher's lounge." }
    self.text = self.normalText;
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Shred Jones isn't as cool as his name sounds."

    self.chewed = 0;
    self.multIndex = 1;
    self.mathIndex = 1;
    self.wordProblemsGiven = 0;
    self.solveForXPicked = false;
    self.soggySolvePicked = false;
    self.solveDialoguesSeen = 0;
    self.chewDialoguesSeen = 0;
    self.sludgeDialoguesSeen = 0;
    self.fightDialoguesSeen = 0;

    self.lastSpinTime = Kristal.getTime();
    self.spinDelay = 6;

    self:registerAct("EatHW")
    self:registerAct("EatHWX","",{"susie"})
    self:registerAct("Solve")
    self:registerAct("SolveForX", "", {"ralsei"})
end
function HJones:update()
    local freestate = Game.battle.state == "MENUSELECT" or Game.battle.state == "ENEMYSELECT" or Game.battle.state == "PARTYSELECT" or Game.battle.state == "ACTIONSELECT"
    if freestate and Kristal.getTime() > self.lastSpinTime + self.spinDelay then
        self:spin();
    end
    return super.update(self)
end
function HJones:onAct(battler, name)
    Game.battle.encounter.someoneActed = true;
    if name == "EatHW" then
        self.lastTurnChewed = true;
        if self.solveDialoguesSeen == 3 then
            self.kindnessInterrupted = true;
        end
        if self.chewed == 0 then
            Game.battle:startActCutscene("firstchew", "firstChew",false,self)
            return
        else
            Game.battle:startActCutscene("laterchews", "laterchews",false,self)
            return
        end
    elseif name == "EatHWX" then
        self.lastTurnChewed = true;
        if self.solveDialoguesSeen == 3 then
            self.kindnessInterrupted = true;
        end
        if not self.tagteamed then
            self.tagteamed = true;
            Game.battle:startActCutscene("eathwx", "eathwx",false,self)
            return
        else
            Game.battle:startActCutscene("laterchewsx", "laterchewsx",false,self)
            return
        end
    elseif name == "Solve" then
        self.lastTurnSolved = true;
        Game.battle:startActCutscene("solve","solve",false,self);
    elseif name == "SolveForX" then
        self.lastTurnSolved = true;
        Game.battle:startActCutscene("solveforx","solveforx",false,self);
    elseif name == "Standard" then --X-Action
        local rand = math.random(1,3);
        if battler.chara.id == "ralsei" then
            -- R-Action
            if self.chewed < 10 then 
                return self.ralseiActions[rand];
            else
                return self.ralseiBadActions[rand];
            end
        elseif battler.chara.id == "susie" then
            -- S-Action
            if self.chewed < 10 then 
                return self.susieActions[rand];
            else
                return self.susieBadActions[rand];
            end
        else
            -- Text for any other character (like Noelle)
            return "* Well this isn't supposed to happen."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end
function HJones:beforeBasicWave(cutscene)
    local fought = self.lastTurnHurt;
    self.lastTurnHurt = false;
    local chewed = self.lastTurnChewed;
    self.lastTurnChewed = false;
    local solved = self.lastTurnSolved;
    self.lastTurnSolved = false;

    if self.chewed == 2 then
        return --cutscene logic for first chew handled by act cutscenes. don't increment counter.
    elseif self.chewed >= 10 then
        self.sludgeDialoguesSeen = self.sludgeDialoguesSeen + 1;
        if self.sludgeDialoguesSeen > self.TOTAL_SLUDGE_DIALOGUES then
            return
        end
        --do sludge puddle dialogue
        cutscene:gotoCutscene("sludge" .. self.sludgeDialoguesSeen, "sludge" .. self.sludgeDialoguesSeen,false,self);
    elseif chewed then
        self.chewDialoguesSeen = self.chewDialoguesSeen + 1;
        if self.chewDialoguesSeen > self.TOTAL_CHEW_DIALOGUES then
            return
        end
        --do chew warning dialogue
        cutscene:gotoCutscene("warning" .. self.chewDialoguesSeen, "warning" .. self.chewDialoguesSeen,false,self);
    elseif solved then
        if self.solveDialoguesSeen == 2 and self.wordProblemsGiven < 1 then
            return;
        end
        if self.solveDialoguesSeen == 5 and self.wordProblemsGiven < 2 then
            return;
        end
        if self.solveDialoguesSeen == 8 and self.wordProblemsGiven < 3 then
            return;
        end
        self.solveDialoguesSeen = self.solveDialoguesSeen + 1;
        if self.solveDialoguesSeen > self.TOTAL_SOLVE_DIALOGUES then
            return
        end
        --do happy solving dialogue
        cutscene:gotoCutscene("presolve" .. self.solveDialoguesSeen, "presolve" .. self.solveDialoguesSeen,false,self);
    end
end
function HJones:hurt(amount, battler, on_defeat, color, show_status, attacked)
    Game.battle.encounter.someoneAttacked = true;
    self.lastTurnHurt = true;
    self.kindnessInterrupted = true;
    self.sprite:setAnimation("pain_normal");
    super.hurt(self,amount, battler, on_defeat, color, show_status, attacked)
end
function HJones:spin()
    self.lastSpinTime = Kristal.getTime();
    self.spinDelay = 6 + 3*math.random();
    self.sprite:setAnimation("onespin");
end
function HJones:permaPuddle()
    self.text = self.ouchieText;
    self.dialogue = self.sludgeDialogue;
    Game.battle.music:play("studysession_slow");
    self.dialogue_offset = {0,55};
    self.sprite:setAnimation("puddle");
    self:shake(4);
    self.sprite.setAnimation = function(self)
        --do nothing- he's stuck like this
    end
end
function HJones:onTurnStart()
    Game.battle.encounter.someoneActed = false;
    Game.battle.encounter.someoneAttacked = false;
end
return HJones