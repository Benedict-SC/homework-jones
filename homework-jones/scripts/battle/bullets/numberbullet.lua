local NumberBullet, super = Class(Bullet)

---@param x      number
---@param y      number
NumberBullet.numCodes = {
        {"one"},
        {"top","tr","mid","bl","bot"},
        {"top","tr","mid","br","bot"},
        {"tl","tr","mid","br"},
        {"top","tl","mid","br","bot"},
        {"top","tl","mid","br","bl","bot"},
        {"top","slash"},
        {"top","tl","tr","mid","br","bl","bot"},
        {"top","tl","tr","mid","br","bot"},
        zero={"top","tl","tr","br","bl","bot","slash"},
        plus={"mid","plusbar"},
        minus={"mid"},
        times={"times"},
        div={"mid","divtop","divbot"}
}
function NumberBullet:init(x, y, dir, speed, numCode,scale,chewRatio)
    -- Last argument = sprite path
    if (type(numCode) == "number") or numCode == "zero" then
        super.init(self, x, y, "bullets/math_equals");
        local code = NumberBullet.numCodes[numCode];
        self.fragments = {};
        self.chewParts = {};
        for i=1,#code,1 do
            local rand = math.random();
            if rand > chewRatio then
                self.fragments[i] = Sprite("bullets/math_" .. code[i],0,0);
                self.chewParts[i] = 0;
            else
                self.fragments[i] = Sprite("bullets/math_" .. code[i] .. "_chewed",0,0);
                self.chewParts[i] = 1;
            end
            self:addChild(self.fragments[i]);
        end
    else
        super.init(self, x, y, "bullets/math_" .. numCode);   
    end
    self:assignColliders(numCode);
    self.destroy_on_hit = false;    
    self.physics.direction = dir;
    self.physics.speed = speed;
    self.chewRatio = chewRatio;
    self:setScale(scale);
end

function NumberBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end
function NumberBullet:assignColliders(numCode)
    local colCodes = {
        top=Hitbox(nil,0,0,31,5),
        mid=Hitbox(nil,0,26,31,5),
        bot=Hitbox(nil,0,52,31,5),
        tl=Hitbox(nil,0,0,5,31),
        tr=Hitbox(nil,26,0,5,31),
        bl=Hitbox(nil,0,26,5,31),
        br=Hitbox(nil,26,26,5,31),
        one=Hitbox(nil,13,0,5,57),
        slash=PolygonCollider(nil,{{27,0},{31,0},{31,5},{5,57},{0,57},{0,54},{27,0}}),
        plusbar=Hitbox(nil,13,13,5,31),
        divtop=Hitbox(nil,13,13,5,5),
        divbot=Hitbox(nil,13,39,5,5),
        times=PolygonCollider(nil,{{4,13},{15,24},{26,13},{31,18},{20,28},{31,39},{26,44},{15,33},{4,44},{0,39},{11,28},{0,17},{4,13}})
    }
    
    self.collider = ColliderGroup(self,{});
    local codeset = NumberBullet.numCodes[numCode];
    for i=1,#codeset,1 do
        local coll = colCodes[codeset[i]];
        if ((type(numCode) == "number") or numCode == "zero") and self.chewParts[i] == 1 then
            --skip
        else
            self.collider:addCollider(coll);
        end
    end
end

return NumberBullet