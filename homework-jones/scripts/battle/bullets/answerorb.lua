local AnswerOrb, super = Class(Bullet)

---@param x      number
---@param y      number
---@param dir    number
---@param speed  number
function AnswerOrb:init(x, y, pos, label, correct)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/answerorb")
    local spacing = 55;
    self.isAnswer = true;
    self.correct = correct;
    if correct then 
        self.heal_amount = 8
    end
    self.y = self.y + ((pos-2) * spacing);
    self.timer = Timer();
    self.extraTimer = Timer();
    self:addChild(self.timer);
    self:addChild(self.extraTimer);
    self.label = Text(label,2,5,25,nil,{font_size=18,align="center"});--,nil,nil,{font_size=16,align="center"});
    self:addChild(self.label);

    self.physics.direction = math.pi
    self.physics.speed = 0;
    self.timeoffset = (pos-1) * 0.3;
    self.timer:approach(1,x,550,function(num) 
        self.x = num;
    end,"in-cubic",function()
        self.extraTimer:after(self.timeoffset,function() 
            self.extraTimer:approach(1.8,0,4*math.pi,function(num)
                local greenness = (math.sin(num) + 1)/2; 
                self:setColor({
                    1-greenness,1,1-greenness,1
                });
                self.label:setColor({
                    1-greenness,1,1-greenness,1
                });
            end,"linear",function() 
                self:setColor(COLORS.white);
                self.label:setColor(COLORS.white);
            end);
        end);
        self.timer:after(4,function() 
            self:zoomy();
        end);
    end);

end
function AnswerOrb:zoomy()
    self.timer:approach(0.5,0,30,function(num) 
        self.physics.speed = num;
    end,"out-cubic",function() 
    end);
    self.extraTimer:after(0.3,function()
        if self.correct then
            Assets.playSound("sparkle_gem");
            self:setColor(COLORS.lime);
            self.label:setColor(COLORS.lime);
        else
            self:setColor(COLORS.red);
            self.label:setColor(COLORS.red);
        end
    end)
end
function AnswerOrb:onCollide(soul)
    if self.correct then
        for _, party in ipairs(Game.battle.party) do
            party:heal(self.heal_amount)
        end
        self:remove()
    else
        super.onCollide(self, soul)
    end
end

function AnswerOrb:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return AnswerOrb