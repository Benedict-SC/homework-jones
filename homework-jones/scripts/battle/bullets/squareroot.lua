local SquareRoot, super = Class(Bullet)

---@param x      number
---@param y      number
---@param dir    number
---@param speed  number
function SquareRoot:init(x, y, dir, speed, length)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/math_sqrt");
    self.destroy_on_hit = false; 
    self.remove_offscreen = false;
    self.physics.direction = dir;
    self.physics.speed = speed;
    for i=1,length,1 do
        local extra = Sprite("bullets/math_topbar", 99 + (41 * (i-1)),0);
        self:addChild(extra);
    end
    self:assignColliders(length);
end

function SquareRoot:update()

    super.update(self)
end
function SquareRoot:assignColliders(length)
    self.collider = PolygonCollider(self,{{9,34},{26,34},{32,50},{48,0},
                {99 + (41*length),0},{99 + (41*length),5},
                {52,5},{32,64},{22,39},{9,39},{9,34}});
end

return SquareRoot