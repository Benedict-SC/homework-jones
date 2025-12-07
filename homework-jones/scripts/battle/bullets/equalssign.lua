local EqualsSign, super = Class(Bullet)

---@param x      number
---@param y      number
---@param dir    number
---@param speed  number
function EqualsSign:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/math_equals");
    self.destroy_on_hit = false;
    self.top = Sprite("bullets/math_equalsbar",0,-26);
    self.bottom = Sprite("bullets/math_equalsbar",0,0);
    self:addChild(self.top);
    self:addChild(self.bottom);
    self.topcoll = Hitbox(nil,0,0,48,5);
    self.bottomcoll = Hitbox(nil,0,26,48,5);
    self.collider = ColliderGroup(self,{self.topcoll,self.bottomcoll});



    self.physics.direction = dir
    self.physics.speed = speed
end
function EqualsSign:wiggle()
    self.wiggling = true;
    self.parent.timer:after(0.8,function() 
        self:snap();
    end);
end
function EqualsSign:snap()
    self.wiggling = false;
        self.top.x = 0;
        self.topcoll.x = 0;
        self.bottom.x = 0;
        self.bottomcoll.x = 0;
    self.parent.timer:approach(0.3,0,11,function(num)
        self.top.y = -26 + num;
        self.topcoll.y = 0 + num;
        self.bottom.y = 0 - num;
        self.bottomcoll.y = 26 - num;
    end,"in-cubic",function() 
        Assets.playSound("grab");
        self.parent.timer:approach(2,11,0,function(num)
            self.top.y = -26 + num;
            self.topcoll.y = 0 + num;
            self.bottom.y = 0 - num;
            self.bottomcoll.y = 26 - num;
        end,"linear");
    end)
end

function EqualsSign:update()
    if not self.triggered then
        if Game.battle.soul.x + 40 > self.x then
            Assets.playSound("alert");
            self.triggered = true;
            self:wiggle();
        end
    end
    if self.wiggling then
        local dx1 = math.random(-1,1);
        local dx2 = math.random(-1,1);
        local dy1 = math.random(-1,1);
        local dy2 = math.random(-1,1);
        self.top.x = 0 + dx1;
        self.top.y = -26 + dy1;
        self.topcoll.x = 0 + dx1;
        self.topcoll.y = 0 + dy1;
        self.bottom.x = 0 + dx2;
        self.bottom.y = 0 + dy2;
        self.bottomcoll.x = 0 + dx2;
        self.bottomcoll.y = 26 + dy2;
    end

    super.update(self)
end

return EqualsSign