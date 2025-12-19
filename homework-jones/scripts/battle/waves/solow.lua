local Solow, super = Class(Wave)

function Solow:onStart()
    self.solowState = "START";
    self.time = 10;
    self.jones = self:getAttackers()[1];
    self.input = {""}
    self.questionText = Text("Essay question 2:",200,50,250,nil,{align="center"});
    Game.battle:addChild(self.questionText);
    self.solowText = Text("Consider the Solow model in continuous time with production function y = f (k) satisfying the usual properties, constant savings rate s, depreciation rate d, productivity growth g and employment growth n. Use the implicit function theorem to show how an increase in s affects the steady state values k*, y*, c*. Does this change in s increase or decrease long run output and consumption per worker? Explain.",150,100,350,nil,{align="center",font_size=16});
    Game.battle:addChild(self.solowText);
    self:setArenaSize(30,30);
    self:moveArena();
    --Game.battle:battleText("start");
    --[[self.timer:every(1/3, function()
        self.testprog = self.testprog + 1;
        Game.battle.battle_ui.encounter_text.text:setText("[instant]" .. string.sub(self.testtext,1,self.testprog));
    end)]]
end

function Solow:moveArena()
    self.timer:approach(0.2,Game.battle.arena.y,Game.battle.arena.y + 80,function(num) 
        local dist = num - Game.battle.arena.y;
        Game.battle.arena.y = num;
        Game.battle.soul.y = Game.battle.soul.y + dist;
    end,"linear",function() 
        self.timer:after(4,function() 
            self:initialDialogue();
        end);
    end);
end
function Solow:initialDialogue()
    self.solowState = "DIALOGUE";
   local cutscene = Game.battle:startCutscene("solowstart", "solowstart",self.jones);
   cutscene:after(function() self:afterChoice() end);
end
function Solow:afterChoice()
    if self.jones.tryYourBest then
        self:together();
    else
        self:brainBoy();
    end
end
function Solow:brainBoy()
    self.solowState = "DONE";
end
function Solow:together()
    self:beginTyping();
end
function Solow:beginTyping()
    self.instructionText = Text("Type your answer\n[wave]vv[wave:0]       with the keyboard! [wave]vv[wave:0]",-110,285,nil,nil,{color={0.5,0.5,0.5},align="center",font_size=18});
    Game.battle:addChild(self.instructionText);
    self.solowState = "TYPING";
    TextInput.attachInput(self.input,{
        enter_submits = false,
        multiline = false,
        clear_after_submit = false
    });
    self.timer:after(7,function()
        self.solowState = "DONE";
    end);
end
function Solow:update()
    if self.solowState == "TYPING" then
        Game.battle.battle_ui.encounter_text.text:setText("[instant]" .. self.input[1]);
    end
    super.update(self)
end

function Solow:getFriendDialogue()
    local resp = string.lower(self.input[1]);
end
function Solow:canEnd()
    return self.solowState == "DONE";
end

function Solow:onEnd()
   TextInput.endInput(); 
   --reset flags from last turn- you don't get this wave unless you just solved, but if you mixed it up with some attacks, it should ignore those.
   self.jones.lastTurnHurt = false;
   self.jones.lastTurnChewed = false;
   self.jones.lastTurnSolved = false;
   self.questionText:remove();
   self.solowText:remove();
   if self.jones.tryYourBest then
        self.instructionText:remove();
        Game.battle:startCutscene("solowend", "solowend",self.jones);
   end
end

return Solow