local MathBlaster, super = Class(Wave)

function MathBlaster:onStart()
    self.time = 10;
    local equations = {
        {4,"times",6,"plus",1,5},
        {7,"minus",3,"div",2,2}
    }
    local eq = equations[math.random(1,#equations)];
    local symbolIndex = 1;
    self.timer:every(0.8,function() 
        if symbolIndex <= #eq then
            local yDisplace = math.random(30,60);
            local sign = (math.random(1,2) == 1) and -1 or 1;
            yDisplace = yDisplace * sign;
            local numcode = eq[symbolIndex];
            self:spawnBullet("numberbullet",650,180 + yDisplace,math.pi,4,numcode);
            symbolIndex = symbolIndex + 1;
        end
    end);
end

function MathBlaster:update()

    super.update(self)
end

return MathBlaster