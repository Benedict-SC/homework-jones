local HJones, super = Class(EnemyBattler)

function HJones:init()
    super.init(self)
    self.name = "Homework Jones"

    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("homework")

    self.max_health = 4000
    self.health = 4000
    self.attack = 11
    self.defense = 0
    self.money = 100

    self.TOTAL_CHEW_DIALOGUES = 0;
    self.TOTAL_SLUDGE_DIALOGUES = 0;
    self.TOTAL_SOLVE_DIALOGUES = 3;

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        --"favorite",
        "mathblaster",
        "multiplechoice",
        --"solow",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Kya ha ha!",
        "I'm Homework Jones!",
        "Solve my puzzles\nand problems!",
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

    self:registerAct("EatHW")
    self:registerAct("EatHWX","",{"susie"})
    self:registerAct("Solve")
    self:registerAct("SolveForX", "", {"ralsei"})
end

function HJones:onAct(battler, name)
    if name == "EatHW" then
        self.lastTurnChewed = true;
        if self.solveDialoguesSeen == 3 then
            self.kindnessInterrupted = true;
        end
        if self.chewed == 0 then
            Game.battle:startActCutscene("firstchew", "firstChew",false,self)
            return
        else
            self.chewed = self.chewed + 2;
            Assets.playSound("impact")
            self:shake(4);

            return {
            "* You devoured more of the Fruits of Knowledge.",
            "* Homework Jones got even less readable."
            }
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
            self.chewed = self.chewed + 4;
            Assets.playSound("impact")
            self:shake(4);

            return {
            "* You and Susie devoured more of the Fruits of Knowledge.",
            "* Homework Jones got even less readable."
            }
        end
    elseif name == "Solve" then
        self.lastTurnSolved = true;
        Game.battle:startActCutscene("solve","solve",false,self);
    elseif name == "SolveForX" then
        self.lastTurnSolved = true;
        Game.battle:startActCutscene("solveforx","solveforx",false,self);
    elseif name == "Standard" then --X-Action
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* WHOOPS WE FORGOT TO\n* PUT IN THE R-ACTION!!"
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            return "* WHOOPS WE FORGOT TO\n* PUT IN THE S-ACTION!!"
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

    if self.chewed >= 10 then
        self.sludgeDialoguesSeen = self.sludgeDialoguesSeen + 1;
        if self.sludgeDialoguesSeen > self.TOTAL_SLUDGE_DIALOGUES then
            return
        end
        --do sludge puddle dialogue
    elseif chewed then
        self.chewDialoguesSeen = self.chewDialoguesSeen + 1;
        if self.chewDialoguesSeen > self.TOTAL_CHEW_DIALOGUES then
            return
        end
        --do chew warning dialogue
    elseif solved then
        self.solveDialoguesSeen = self.solveDialoguesSeen + 1;
        if self.solveDialoguesSeen > self.TOTAL_SOLVE_DIALOGUES then
            return
        end
        --do happy solving dialogue
        cutscene:gotoCutscene("presolve" .. self.solveDialoguesSeen, "presolve" .. self.solveDialoguesSeen,false,self);
    end
end
function HJones:hurt(amount, battler, on_defeat, color, show_status, attacked)
    self.lastTurnHurt = true;
    self.kindnessInterrupted = true;
    super.hurt(self,amount, battler, on_defeat, color, show_status, attacked)
end
return HJones