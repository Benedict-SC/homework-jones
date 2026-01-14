local MewMew, super = Class(Wave)

function MewMew:onStart()
    if self.didthisalready then error("???? how") end
    self.didthisalready = true;
    self.time = 5;
    self.jones = self:getAttackers()[1];
    self.testprog = 1;
    self.input = {""}
    self:setArenaSize(30,30);
    self.timer:every(0.15, function()
        if self.jones.mewmewing then
            local x = 550
            local y = 230
            local bullettype = (math.random() < 0.7) and "catbullet" or "heartbullet";
            local bullet = self:spawnBullet(bullettype, x, y, math.rad(170 + (55*math.random())), 10)
        end
    end)
    --self:setSoulPosition(SCREEN_WIDTH / 2,250);
    --self:setArenaOffset(0,80);
    self:moveArena();
    self.questionText = Text("Essay question 3:\nWhich Mew Mew Kissy Cutie is the best? (MMKC3: Gaiden is noncanonical and does not count as a main series entry.)",160,50,340,nil,{align="center"});
    Game.battle:addChild(self.questionText);
    
end

function MewMew:moveArena()
    self.timer:approach(0.2,Game.battle.arena.y,Game.battle.arena.y + 100,function(num) 
        local dist = num - Game.battle.arena.y;
        Game.battle.arena.y = num;
        Game.battle.soul.y = Game.battle.soul.y + dist;
    end,"linear",function() 
        self.timer:after(0.5,function() 
            self:initialDialogue();
        end);
    end);
end
function MewMew:initialDialogue()
    self.mewState = "DIALOGUE";
    local cutscene = Game.battle:startCutscene("mewmewstart", "mewmewstart",self.jones);
    cutscene:after(function() self:startTyping() end);
end
function MewMew:startTyping()
    self.instructionText = Text("Type your answer\n[wave]vv[wave:0]       with the keyboard! [wave]vv[wave:0]",-110,285,nil,nil,{color={0.5,0.5,0.5},align="center",font_size=18});
    Game.battle:addChild(self.instructionText);
    self.mewState = "TYPING";
    TextInput.attachInput(self.input,{
        enter_submits = false,
        multiline = false,
        clear_after_submit = false
    });
    self.timer:after(9,function()
        TextInput.endInput(); 
        self:restoreArena();
    end);
end
function MewMew:restoreArena()
    self.questionText:remove();
    self.timer:approach(0.29,Game.battle.arena.y,Game.battle.arena.y - 100,function(num) 
        local dist = num - Game.battle.arena.y;
        Game.battle.arena.y = num;
        Game.battle.soul.y = Game.battle.soul.y + dist;
    end);
    self.timer:approach(0.3,30,142,function(num) 
        Game.battle.arena.width = num;
        Game.battle.arena.height = num;
    end,"linear",function()
        self.timer:after(0.5,function() 
            self:processAnswer();
        end);
    end);
end
function MewMew:processAnswer()
    self.instructionText:remove();
    local resp = Utils.trim(string.lower(self.input[1]));
    if resp == "mew mew kissy cutie" or resp == "mew mew kissy cutie 1" or resp == "mew mew kissy cutie i" or resp == "mmkc1" or resp == "mmkc" or resp == "mmkci" then
        self.answer = "one"
        local cutscene = Game.battle:startCutscene("mewmewfreakout", "mewmewfreakout",self.jones);
        cutscene:after(function()
            self.mewState = "DONE";
        end)
    elseif resp == "mew mew kissy cutie 2" or resp == "mew mew kissy cutie ii" or resp == "mmkc2" or resp == "mmkcii" then
        self.answer = "correct";
        self.mewState = "DONE";
    elseif resp == "mew mew kissy cutie 3" or resp == "mew mew kissy cutie 3 gaiden" or resp == "mew mew kissy cutie 3: gaiden" or resp == "mew mew kissy cutie iii" or resp == "mew mew kissy cutie iii gaiden" or resp == "mew mew kissy cutie iii: gaiden" or resp == "mmkc3" or resp == "mmkc3 gaiden" or resp == "mmkc3: gaiden" or resp == "mmkciii" or resp == "mmkciii gaiden" or resp == "mmkciii: gaiden" or resp == "gaiden" then 
        self.answer = "gaiden"
        self:gaiden();
    else
        self.answer = "other"
        self.mewState = "DONE";
    end
end
function MewMew:gaiden()
    local bom1 = Sprite("bullets/cannonball", SCREEN_WIDTH/2 - 45, -20);
    local bom2 = Sprite("bullets/cannonball", SCREEN_WIDTH/2 + 20, -20);
    local bom3 = Sprite("bullets/cannonball", SCREEN_WIDTH/2 - 45, -80);
    local bom4 = Sprite("bullets/cannonball", SCREEN_WIDTH/2 + 20, -80);
    bom1.origy = bom1.y;
    bom2.origy = bom2.y;
    bom3.origy = bom3.y;
    bom4.origy = bom4.y;
    bom1:setLayer(BATTLE_LAYERS["bullets"])
    bom2:setLayer(BATTLE_LAYERS["bullets"])
    bom3:setLayer(BATTLE_LAYERS["bullets"])
    bom4:setLayer(BATTLE_LAYERS["bullets"])
    Game.battle:addChild(bom1);
    Game.battle:addChild(bom2);
    Game.battle:addChild(bom3);
    Game.battle:addChild(bom4);
    self.timer:approach(0.5,0,210,function(num) 
        bom1.y = bom1.origy + num;
        bom2.y = bom2.origy + num;
        bom3.y = bom3.origy + num;
        bom4.y = bom4.origy + num;
    end,"linear",function()
        bom1:remove();
        bom2:remove();
        bom3:remove();
        bom4:remove();
        Assets.playSound("badexplosion");
        local bullet1 = self:spawnBullet("cannonblast",bom1.x,bom1.y);
        bullet1:setScale(0.1,0.1);
        local bullet2 = self:spawnBullet("cannonblast",bom2.x,bom2.y);
        bullet2:setScale(0.1,0.1);
        local bullet3 = self:spawnBullet("cannonblast",bom3.x,bom3.y);
        bullet3:setScale(0.1,0.1);
        local bullet4 = self:spawnBullet("cannonblast",bom4.x,bom4.y);
        bullet4:setScale(0.1,0.1);
        self.timer:approach(0.2,0.1,1,function(num)
            bullet1:setScale(num);
            bullet2:setScale(num);
            bullet3:setScale(num);
            bullet4:setScale(num);
        end,"out-quint",function()
            self.timer:after(0.3,function()
                self.timer:approach(1,1,0,function(num) 
                    bullet1.alpha = num;
                    bullet2.alpha = num;
                    bullet3.alpha = num;
                    bullet4.alpha = num;
                end);
                bullet1.collider = nil;
                bullet2.collider = nil;
                bullet3.collider = nil;
                bullet4.collider = nil;
            end)
        end)
    end)
    local cutscene = Game.battle:startCutscene("mewmewgaiden", "mewmewgaiden",self.jones);
    cutscene:after(function()
        self.mewState = "DONE";
    end)
    
end

function MewMew:update()
    -- Code here gets called every frame
    Game.battle.battle_ui.encounter_text.text:setText("[instant]" .. self.input[1]);
    super.update(self)
end

function MewMew:canEnd()
    return self.mewState == "DONE";
end
function MewMew:onEnd()
    --reset flags from last turn- you don't get this wave unless you just solved, but if you mixed it up with some attacks, it should ignore those.
    self.jones.lastTurnHurt = false;
    self.jones.lastTurnChewed = false;
    self.jones.lastTurnSolved = false;
    if self.answer == "correct" then
        Game.battle:startCutscene("mewmewcorrect", "mewmewcorrect",self.jones);
    elseif self.answer == "one" then
        return;
    elseif self.answer == "gaiden" then
        --blammo
    else --"other"
        Game.battle:startCutscene("mewmewokay", "mewmewokay",self.jones);
    end
end

return MewMew