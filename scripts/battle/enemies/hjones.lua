local HJones, super = Class(EnemyBattler)

function HJones:init()
    super.init(self)

    -- Enemy name
    self.name = "Homework Jones"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("homework")

    -- Enemy health
    self.max_health = 4000
    self.health = 4000
    -- Enemy attack (determines bullet damage)
    self.attack = 9
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "essay",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Kya ha ha!",
        "I'm Homework Jones!",
        "Solve my puzzles\nand problems!",
        "I before E except in\na lot of situations!"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 9 DF 0\n* Miss Alphys has created a\n* monster. I mean Darkner."

    -- Text randomly displayed at the bottom of the screen each turn
    self.normalText = {
        "* Homework Jones assigns you three to four hours of mandatory fun.",
        "* Homework Jones asks how your college applications are going.",
        "* Homework Jones says, \"Kya ha ha!\"",
        "* Homework Jones spins at random speeds.",
        "* Homework Jones makes economic theory 'Kool.'",
        "* Homework Jones teaches you a mnemonic for... something.",
        "* Looking at Homework Jones, you remembered what a mitochondria was.",
        "* Homework Jones can't decide between puzzles and problems.",
        "* Normal to want.\nPossible to achieve.",
    }
    self.ouchieText = {
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

    self:registerAct("EatHW")
    self:registerAct("EatHWX","",{"susie"})
    self:registerAct("Solve")
    self:registerAct("SolveForX", "", {"ralsei"})
end

function HJones:onAct(battler, name)
    if name == "EatHW" then
        if self.chewed == 0 then
            self.chewed = 2
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

    elseif name == "SolveForX" then
        -- Loop through all enemies
        Game.battle:startActCutscene("favoritefriend", "favoriteFriend",false,self)

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return HJones