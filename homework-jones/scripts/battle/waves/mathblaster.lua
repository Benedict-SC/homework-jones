local MathBlaster, super = Class(Wave)

function MathBlaster:onStart()
    self.jones = self:getAttackers()[1];
    self.time = 14;
    self.bulletspeed = 5;
    local equations = {
        {2,"plus",2,"plus","zero",{"equals"},answers={"4","22","0"},size=1.7,wobbleOffset=0.1},
        {{"sqrt",5},4,"times",6,"plus",1,{"equals"},answers={"5","13","6"},size=1.4,wobbleOffset=0},
        {7,"minus",8,"div",2,{"equals"},answers={"3","-.5","9"},size=1.7,wobbleOffset=0.1}
    }
    local eq = equations[self.jones.mathIndex];
    self.jones.mathIndex = self.jones.mathIndex + 1;
    if self.jones.mathIndex > #equations then
        self.jones.mathIndex = 1;
    end
    self.eq = eq;
    local symbolIndex = 1;
    self.answersSpawned = false;
    self.chewRatio = (self.jones.chewed - 2) * 0.08;
    if self.chewRatio > 0.8 then self.chewRatio = 0.8 end
    if self.chewRatio < 0 then self.chewRatio = 0 end
    self.timer:every(0.65,function() 
        if symbolIndex <= #eq then
            --local yDisplace = math.random(30,60);
            --local sign = (math.random(1,2) == 1) and -1 or 1;
            --yDisplace = yDisplace * sign;
            local numcode = eq[symbolIndex];
            if type(numcode) == "table" then
                if numcode[1] == "sqrt" then
                    local bullet = self:spawnBullet("squareroot",690,158,math.pi,self.bulletspeed,numcode[2]);
                    bullet.originalY = bullet.y;
                    self:bulletWiggleAdjust(bullet);
                elseif numcode[1] == "equals" then
                    local bullet = self:spawnBullet("equalssign",680,206,math.pi,self.bulletspeed);
                    bullet.originalY = bullet.y;
                    self:bulletWiggleAdjust(bullet);
                    self.timer:after(1,function() self:slowdown() end);
                end
            else
                local bullet = self:spawnBullet("numberbullet",670,180,math.pi,self.bulletspeed,numcode,eq.size,self.chewRatio);
                bullet.originalY = bullet.y;
                self:bulletWiggleAdjust(bullet);
            end
            symbolIndex = symbolIndex + 1;
        elseif not self.answersSpawned then
            self.answersSpawned = true;
            self.timer:after(1.4,function() 
                local t = {1,2,3};
                for i = #t, 2, -1 do
                    local j = math.random(i)
                    t[i], t[j] = t[j], t[i]
                end
                for i=1,#t,1 do
                    self:spawnBullet("answerorb",700,172,t[i],eq.answers[i],i==1);
                end
            end);
        end
    end);
end
function MathBlaster:bulletWiggleAdjust(bullet)
    bullet.y = bullet.originalY + (math.sin(Game.battle.wave_timer * 1.2 + self.eq.wobbleOffset) * 15);
end
function MathBlaster:slowdown()
    self.timer:approach(0.8,self.bulletspeed,2,function(num)
        for i=1,#self.bullets,1 do
            self.bullets[i].physics.speed = num;
        end
    end);
end

function MathBlaster:update()
    for i=1,#self.bullets,1 do
        if not self.bullets[i].isAnswer then
            self:bulletWiggleAdjust(self.bullets[i]);
        end
    end
    super.update(self)
end

return MathBlaster