local MathBlaster, super = Class(Wave)

function MathBlaster:onStart()
    self.time = 12;
    self.bulletspeed = 5;
    local equations = {
        {{"sqrt",5},4,"times",6,"plus",1,{"equals"},answer=5},
        {{"sqrt",5},7,"minus",3,"div",2,{"equals"},answer=2}
    }
    local eq = equations[math.random(1,#equations)];
    local symbolIndex = 1;
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
                    local bullet = self:spawnBullet("equalssign",680,198,math.pi,self.bulletspeed);
                    bullet.originalY = bullet.y;
                    self:bulletWiggleAdjust(bullet);
                    self.timer:after(1,function() self:slowdown() end);
                end
            else
                local bullet = self:spawnBullet("numberbullet",670,180,math.pi,self.bulletspeed,numcode);
                bullet.originalY = bullet.y;
                self:bulletWiggleAdjust(bullet);
            end
            symbolIndex = symbolIndex + 1;
        end
    end);
end
function MathBlaster:bulletWiggleAdjust(bullet)
    bullet.y = bullet.originalY + (math.sin(Game.battle.wave_timer * 1.2) * 15);
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
        self:bulletWiggleAdjust(self.bullets[i]);
    end
    super.update(self)
end

return MathBlaster