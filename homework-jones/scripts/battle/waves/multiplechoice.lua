local MultipleChoice, super = Class(Wave)

MultipleChoice.questions = {
    {
        question="How much for a Rhapsotea from the Old Man?",
        a="D$99",
        b="D$199",
        c="D$100",
        d="$99",
        wrongs={"b","c","d"},
        answerSize=28,
        rowOffsets={20,0}
    },{
        question="Complete the lyric: \"When your hope is slowly dying / ?\"",
        a="And your future's lost in night",
        b="And your future's cost your rights",
        c="And your future's lost its rights",
        d="And its fur is soft and white",
        wrongs={"a","b","d"},
        answerSize=20,
        rowOffsets={10,0}
    },{
        question="Which one has Elnina never dated?",
        a="Rouxls",
        b="Miss Mizzle",
        c="Lanino",
        d="Star walker",
        wrongs={"a","c","d"},
        answerSize=28,
        rowOffsets={20,0}
    },{
        question="What subject does Clover NOT like talking about?",
        a="Boys",
        b="Sports",
        c="Trees",
        d="GunControl",
        wrongs={"a","b","c"},
        answerSize=28,
        rowOffsets={20,0}
    },{
        question="What is your group project about?",
        a="",
        b="",
        c="",
        d="",
        wrongs={},
        answerSize=20,
        rowOffsets={20,0}
    },{
        question="Who does Miss Alphys leave milk out for?",
        a="Cat",
        b="Susie",
        c="Catty",
        d="\"The Milk Freak\"",
        wrongs={"b","c","d"},
        answerSize=28,
        rowOffsets={20,0}
    },{
        question="Which Hometown schoolteacher is best at their job?",
        a="Gerson Boom",
        b="Toriel",
        c="Alphys",
        d="Literally anyone else",
        wrongs={"c"},
        answerSize=24,
        rowOffsets={20,0}
    },{
        question="Does Undyne like Miss Alphys?",
        a="Yes, they're dating",
        b="No, she doesn't really care",
        c="No, she doesn't know her name",
        d="Yes, they're friends",
        wrongs={"a","c","d"},
        answerSize=22,
        rowOffsets={20,0}
    },{
        question="What feature is Susie proudest of?",
        a="Her teeth",
        b="Her hair",
        c="Her muscles",
        d="Her eyes",
        wrongs={"a","c","d"},
        answerSize=28,
        rowOffsets={20,0}
    }
}
function MultipleChoice:init()
    super.init(self);
    self:setArenaOffset(0, 40);
end
function MultipleChoice:illegibilize(text)
    local percent = 0;
    local chewed = self:getAttackers()[1].chewed;
    local shake = 0;
    if chewed <= 2 then
        percent = 0;
        shake = 0;
    elseif chewed > 2 and chewed < 10 then
        percent = 10 + ((chewed - 4)*5);
        shake = 1;
    else
        percent = 50;
        shake = 2;
    end
    local mashed = "";
    for i=1,#text do
        local char = text:sub(i,i);
        local rn = math.random(1,100);
        if rn < percent then
            char = " ";
        end
        rn = math.random(1,100);
        if rn < percent then
            char = "[shake:" .. shake .. "]" .. char .. "[shake:0]";
        end
        mashed = mashed .. char;
    end
    return mashed;
end 
function MultipleChoice:onStart()
    self.time = 10;
    self.readtime = 6;
    self.UI_DISPLACE = 110;
    local attacker = self:getAttackers()[1];
    attacker.current_target = "ALL";
    if attacker.multIndex > #MultipleChoice.questions then
        self.q = {
            question="Have I run out of new multiple choice questions?",
            a="Yes",
            b="Not yet",
            c="No",
            d="Never",
            wrongs={"b","c","d"},
            answerSize=28,
            rowOffsets={20,0}
        }
    else
        self.q = MultipleChoice.questions[attacker.multIndex];
        attacker.multIndex = attacker.multIndex + 1;
    end
    self.shotCount = #self.q.wrongs;

    self.bg = Sprite("bullets/scantron", 212, 71)
    self.boat = Sprite("enemies/jones/hwjboat", SCREEN_WIDTH + 50, 20);
    self.bg:setLayer(BATTLE_LAYERS["below_soul"])
    self.boat:setLayer(BATTLE_LAYERS["below_battlers"])
    Game.battle:addChild(self.bg)
    Game.battle:addChild(self.boat)

    self.instructionText = Text("Bubble in the\ncorrect answer!",420,180,nil,nil,{color={0.5,0.5,0.5}});
    Game.battle:addChild(self.instructionText);

    self.questionText = Text(self:illegibilize(self.q.question),210,300,220,nil,{color={1,1,1},align="center"});
    self.aLabel = Text("A. " .. self:illegibilize(self.q.a),20,300 + self.q.rowOffsets[1],180,nil,{font_size=self.q.answerSize,align="center"});
    self.bLabel = Text("B. " .. self:illegibilize(self.q.b),440,300 + self.q.rowOffsets[1],180,nil,{font_size=self.q.answerSize,align="center"});
    self.cLabel = Text("C. " .. self:illegibilize(self.q.c),20,380 + self.q.rowOffsets[2],180,nil,{font_size=self.q.answerSize,align="center"});
    self.dLabel = Text("D. " .. self:illegibilize(self.q.d),440,380 + self.q.rowOffsets[2],180,nil,{font_size=self.q.answerSize,align="center"});
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
    if (Game.battle.wave_timer > self.readtime) and not self.fired then
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
            self.timerFrame = Rectangle(236,293,167,10);
            self.timerFrame:setColor(1,1,1);
            self.timerExpended = Rectangle(401,294,1,8);
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
            if self.shotCount == 0 then
                self.timer:after(1.5,function() 
                    self.umBubble = SpeechBubble("Umm[wait:10].[wait:10].[wait:10].[wait:10].",350, 70, {right=true}, self.boat);
                    Game.battle:addChild(self.umBubble);
                    self.timer:after(2.5,function()
                        self.umBubble:remove();
                        self.timer:after(1,function() 
                            self.nevermind = SpeechBubble("Actually,[wait:5]\nnever mind.",350, 68, {right=true}, self.boat);
                            Game.battle:addChild(self.nevermind);
                            self.timer:after(2.5,function()
                                self.nevermind:remove();
                            end);
                        end);
                    end);
                end);
            end
        end);
end
function MultipleChoice:fire()
        self.timerFrame:remove();
        self.timerExpended:remove();
        self.timer:approach(1.4,1,0,function(num)
            self.instructionText.alpha = num;
        end,"linear");
        if self.shotCount > 0 then
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
                self.timer:after(0.5,function()
                    Assets.playSound("badexplosion");
                end);
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
    bomb:setScale(1,1);
    bomb:setLayer(BATTLE_LAYERS["bullets"])
    local startX = 0;
    local startY = 0;
    local fall = 266;
    if letter == "a" then
        startX = 271;
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
        self:explode(letter);
    end);
end
function MultipleChoice:explode(letter)
    local ex = 0;
    local ey = 0;
    if letter == "a" then
        ex = 284;
        ey = 175;
    elseif letter == "b" then
        ex = 356;
        ey = 175;
    elseif letter == "c" then
        ex = 284;
        ey = 247;
    else -- letter == "d" then
        ex = 356;
        ey = 247;
    end
    local bullet = self:spawnBullet("cannonblast",ex,ey);
    bullet:setScale(0.1,0.1);
    self.timer:approach(0.2,0.1,1,function(num)
        bullet:setScale(num);
    end,"out-quint",function()
        self.timer:after(0.3,function()
            self.timer:approach(1,1,0,function(num) 
                bullet.alpha = num;
            end);
            bullet.collider = nil;
        end)
    end)
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