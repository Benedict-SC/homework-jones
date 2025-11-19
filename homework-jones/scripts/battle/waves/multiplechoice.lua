local MultipleChoice, super = Class(Wave)

MultipleChoice.questions = {
    {
        question="Test question is testing you",
        a="Right answer",
        b="Wrong but very long answer with words",
        c="Wronger answer",
        d="Wrongest answer",
        wrongs={"b","c","d"}
    },{
        question="Test question 2\n    is here!",
        a="Wronger answer",
        b="Wrong answer",
        c="Right answer",
        d="Wrongest answer",
        wrongs={"a","b","d"}
    }
}
function MultipleChoice:init()
    super.init(self);
    self:setArenaOffset(0, 40);
end
function MultipleChoice:onStart()
    self.time = 10;
    self.readtime = 6;
    self.UI_DISPLACE = 110;
    local attacker = self:getAttackers()[1];
    self.q = MultipleChoice.questions[attacker.multIndex];
    self.shotCount = #self.q.wrongs;

    self.bg = Sprite("bullets/scantron", 212, 71)
    self.boat = Sprite("enemies/jones/hwjboat", SCREEN_WIDTH + 50, 20);
    self.bg:setLayer(BATTLE_LAYERS["below_soul"])
    self.boat:setLayer(BATTLE_LAYERS["below_battlers"])
    Game.battle:addChild(self.bg)
    Game.battle:addChild(self.boat)

    self.instructionText = Text("Bubble in the\ncorrect answer!",420,180,nil,nil,{color={0.5,0.5,0.5}});
    Game.battle:addChild(self.instructionText);

    self.questionText = Text(self.q.question,210,330,220,nil,{color={1,1,1},align="center"});
    self.aLabel = Text("A. " .. self.q.a,20,300,180,nil,{font_size=24,align="center"});
    self.bLabel = Text("B. " .. self.q.b,440,300,180,nil,{font_size=24,align="center"});
    self.cLabel = Text("C. " .. self.q.c,20,380,180,nil,{font_size=24,align="center"});
    self.dLabel = Text("D. " .. self.q.d,440,380,180,nil,{font_size=24,align="center"});
    Game.battle:addChild(self.questionText)
    Game.battle:addChild(self.aLabel)
    Game.battle:addChild(self.bLabel)
    Game.battle:addChild(self.cLabel)
    Game.battle:addChild(self.dLabel)

    self.ui_save = Game.battle.battle_ui.y;
    self.jones_save = attacker.x;
    self.timer:approach(0.7,0,self.UI_DISPLACE,function(num)
        Game.battle.battle_ui.y = self.ui_save + num;
        attacker.x = self.jones_save + 2*num;
    end,"out-cubic");
    self.moving = true;
    self.boatHere = true;
    self.timer:after(0.5,function()
        self:arrive();
    end);
end

function MultipleChoice:update()
    if (Game.battle.wave_timer > self.readtime) and not self.fired and self.shotCount > 0 then
        self:fire();
        self.fired = true;
    end

    if (Game.battle.wave_timer > (self.time - 1.5)) and (self.boatHere) then
        self.boatHere = false;
        self:sailAway();
    end

    if (Game.battle.wave_timer > self.time) and (not self.endedYet) then
        self.endedYet = true;
        self:cleanupStep();
    end
    super.update(self)
end
function MultipleChoice:arrive()
        self.timer:approach(0.7,SCREEN_WIDTH + 50,SCREEN_WIDTH/2 - 50,function(num)
            self.boat.x = num;
            self.boatHere = true;
        end,"out-cubic");
        self.boatbg = Sprite("bullets/hwjripples", 191, 0);
        self.boatbg:setLayer(-201);
        self.boatbg.alpha = 0;
        Game.battle:addChild(self.boatbg);
        self.timer:approach(0.6,0,1,function(num) 
            self.boatbg.alpha = num;
        end,"in-cubic",function() 
            self.boatbg.alpha = 1; 
            self.timerFrame = Rectangle(236,294,167,10);
            self.timerFrame:setColor(1,1,1);
            self.timerExpended = Rectangle(401,295,1,8);
            self.timerExpended:setColor(0,0,0)
            Game.battle:addChild(self.timerFrame);
            Game.battle:addChild(self.timerExpended);
            local startedAt = 1.1;
            self.timer:during(self.readtime-startedAt,function() 
                local expendedPercent = (Game.battle.wave_timer - startedAt) / (self.readtime - startedAt);
                local prog = math.floor(expendedPercent * 165);
                self.timerExpended.width = prog;
                self.timerExpended.x = 402 - prog;
            end)
            self.timer:after(3.3,function()
                self.instructionText:setText("[shake:1]Bubble in the\ncorrect answer!");
            end);
        end);
end
function MultipleChoice:fire()
        self.timerFrame:remove();
        self.timerExpended:remove();
        self.timer:approach(1.4,1,0,function(num)
            self.instructionText.alpha = num;
        end,"linear");
        Assets.playSound("bomb");
        self:bombUp(self.q.wrongs[1],302,88);
        if self.shotCount > 1 then
            self.timer:after(0.1,function() 
                Assets.playSound("bomb"); 
                self:bombUp(self.q.wrongs[2],320,90);
                if(self.shotCount > 2) then
                    self.timer:after(0.1,function() 
                    Assets.playSound("bomb"); 
                    self:bombUp(self.q.wrongs[3],337,92);
                    end);
                end
            end);
        end
        self.timer:approach(0.3,20,25,function(num)
            self.boat.y = num;
        end,"out-cubic",function()
            self.timer:approach(0.3,25,20,function(num)
                self.boat.y = num;
            end,"out-cubic");
        end);
        self.timer:after(1.5,function()
            if #self.q.wrongs > 0 then
                for i=1,#self.q.wrongs,1 do
                    self:bombDown(self.q.wrongs[i]);
                end
            else --TODO: this is the one with no wrong answers and there's special stuff.

            end
        end);
end
function MultipleChoice:bombUp(letter,x,y)
    if not self.bombs then self.bombs = {}; end
    local bom = Sprite("bullets/cannonball", x, y);
    self.bombs[letter] = bom;
    bom.letter = letter;
    bom:setScale(0.1,0.1);
    Game.battle:addChild(bom);
    self.timer:approach(0.4,0.1,0.6,function(num)
        bom:setScale(num,num);
    end,"linear");
    self.timer:approach(0.5,y,y-120,function(num)
        local round = math.floor(num);
        bom.y = round;
    end,"linear");
end
function MultipleChoice:sailAway()
        self.timer:approach(0.7,SCREEN_WIDTH/2 - 50,-150,function(num)
            self.boat.x = num;
        end,"out-cubic");
        self.timer:approach(0.6,1,0,function(num) 
            self.boatbg.alpha = num;
        end,"linear",function() 
            self.boatbg:remove();
        end);
end
function MultipleChoice:bombDown(letter)
    local bomb = self.bombs[letter];
    --error(Utils.dump(self.bombs));
    bomb:setScale(1,1);
    bomb:setLayer(BATTLE_LAYERS["bullets"])
    local startX = 0;
    local startY = 0;
    local fall = 266;
    if letter == "a" then
        startX = 71;
        startY = -106;
    elseif letter == "b" then
        startX = 342;
        startY = -106;
    elseif letter == "c" then
        startX = 271;
        startY = -31;
    else -- letter == "d" then
        startX = 342;
        startY = -31;
    end
    bomb.x = startX;
    bomb.y = startY;
    self.timer:approach(0.5,startY,startY + fall,function(num)
        bomb.y = num;
    end,"linear",function()
        bomb:remove();
    end);
end
function MultipleChoice:cleanupStep()
        self.instructionText:remove();
        self.aLabel:remove();
        self.bLabel:remove();
        self.cLabel:remove();
        self.dLabel:remove();
        self.questionText:remove();
        self.timer:approach(0.7,self.UI_DISPLACE,0,function(num)
            Game.battle.battle_ui.y = self.ui_save + num;
            self:getAttackers()[1].x = self.jones_save + (2*num);
        end,"out-cubic");
        self.timer:after(0.705,function() 
            self.moving = false;
        end)
end


function MultipleChoice:canEnd()
    return not self.moving;
end

function MultipleChoice:onEnd()
    Game.battle.battle_ui.y = self.ui_save;
    self:getAttackers()[1].x = self.jones_save;
    self.bg:remove();
    self.boat:remove();
end

return MultipleChoice