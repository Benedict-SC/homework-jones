local MapRing, super = Class(Bullet)

---@param x      number
---@param y      number
---@param dir    number
---@param speed  number
function MapRing:init(x, y, dir, speed)
    super.init(self, x, y, "bullets/bigring-a")
    self.timer = Timer();
    self:addChild(self.timer);
    self:setColor({0,1,0,1});
    self:setScale(0.01,0.01);
    self.demonstrateSize = 0.25;
    self.hurtsNow = false;
    self.hitYet = false;
    self.timer:approach(0.4,0.01,self.demonstrateSize,function(num) 
        self:setScale(num,num);
    end,"in-cubic",function() 
        self.timer:after(0.2,function()
            self:setColor(COLORS.red);
            self.sprite:set("bullets/bigring-b");
            self.hurtsNow = true;
            self.timer:approach(1,1,0,function(num)
                self.alpha = num;
            end,"linear",function()
                self:remove();
            end);
            self.timer:approach(0.7,self.demonstrateSize,3,function(num) 
                self:setScale(num,num);
            end);
        end);
    end);
    self.timer:after(0.7,function() 
        self.sprite:set("bullets/bigring-c");
    end);
    self.destroy_on_hit = false;
end

function MapRing:onCollide(soul)
    if self.hitYet then 
        return;
    end
    self.hitYet = true;
    if not self.hurtsNow then
        Assets.playSound("bell");
        for _, party in ipairs(Game.battle.party) do
            party:heal(5);
        end
    else
        Assets.playSound("error");
        super.onCollide(self, soul)
    end
end

function MapRing:update()
    -- For more complicated bullet behaviours, code here gets called every update
    super.update(self)
end

return MapRing