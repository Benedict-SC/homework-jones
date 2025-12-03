local CannonBlast, super = Class(Bullet)

---@param x      number
---@param y      number
function CannonBlast:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/blast")
    self:setSpikyCollider();
    self.destroy_on_hit = false;
end

function CannonBlast:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end
function CannonBlast:setSpikyCollider()
    local points = {
        {-37,-63},
        {-8,-36},
        {4,-58},
        {7,-33},
        {26,-50},
        {21,-25},
        {58,-36},
        {35,-9},
        {48,-1},
        {33,7},
        {62,35},
        {27,27},
        {36,59},
        {6,32},
        {3,48},
        {-14,30},
        {-42,53},
        {-26,21},
        {-51,28},
        {-35,7},
        {-51,1},
        {-39,-9},
        {-51,-14},
        {-35,-20},
        {-66,-38},
        {-22,-30},
        {-37,-63},
        {-8,-36}
    }
    for i=1,#points,1 do
        points[i][1] = points[i][1] + 66;
        points[i][2] = points[i][2] + 63;
    end
    self.collider = PolygonCollider(self,points);
end

return CannonBlast