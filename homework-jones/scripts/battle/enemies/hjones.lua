local HJones, super = Class(EnemyBattler)

function HJones:init()
    super.init(self)
    self.name = "Homework Jones"

    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("homework")

    self.max_health = 4000
    self.health = 4000
    self.attack = 9
    self.defense = 0
    self.money = 100

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "essay",
        "aiming",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Kya ha ha!",
        "I'm Homework Jones!",
        "Solve my puzzles and problems!",
        "I before E except in a lot of situations!"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 9 DF 0\n"..
        "* Miss Alphys has created a\n"..
        "* monster. I mean Darkner."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Homework Jones assigns you three to four hours of mandatory fun.",
        "* Homework Jones wants to know how your college applications are going.",
        "* Homework Jones is attempting to make economics 'Kool.'",
        "* Homework Jones is teaching you a mnemonic that doesn't stand for anything.",
        "* Looking at Homework Jones, you remembered what a mitochondria was.",
        "* Normal to want. Possible to achieve.",
    }

    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Homework Jones tries to prove there's an afterlife with basic algebra."

    -- Register act called "Smile"
    self:registerAct("EatHW")

    self:registerAct("EatHWX", "", {"susie"})
    self:registerAct("SolveForX", "", {"ralsei"})
end

function HJones:onAct(battler, name)
    if name == "EatHW" then
        self:hurt(100, Game.battle:getPartyBattler("kris"))
        -- Change this enemy's dialogue for 1 turn
        -- self.dialogue_override = "... ^^"

        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You smile.[wait:5]\n* The dummy smiles back.",
            "* It seems the dummy just wanted\nto see you happy."
        }

    elseif name == "SolveForX" then
        -- Loop through all enemies
        Game.battle:startActCutscene("favoritefriend", "favoriteFriend")

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