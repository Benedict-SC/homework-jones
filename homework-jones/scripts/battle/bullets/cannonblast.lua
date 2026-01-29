local CannonBlast, super = Class(Bullet)

---@param x      number
---@param y      number
function CannonBlast:init(x, y, question)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/blast")
    self:setSpikyCollider();
    self.destroy_on_hit = false;
    if question then
        self.wrongQuads = question.wrongs;
    end
end

function CannonBlast:update()
    -- For more complicated bullet behaviours, code here gets called every update
    super.update(self)
end
function CannonBlast:onCollide(soul)
    if self.wrongQuads then
        local midpoint = {212 + 108, 71 + 141};
        local playerLow = soul.y > midpoint[2];
        local playerRight = soul.x > midpoint[1];
        local playerQuad = "a";
        if playerLow and playerRight then
            playerQuad = "d";
        elseif playerLow and not playerRight then
            playerQuad = "c";
        elseif (not playerLow) and playerRight then
            playerQuad = "b";
        end
        if not TableUtils.contains(self.wrongQuads,playerQuad) then
            --hey they got hit even though they did the right answer!!!
            if not Game.battle.enemies[1].scantronWarned then
                Game.battle.enemies[1].scantronWarned = true;
                Game.battle.enemies[1].one_turn_text_override = "Homework Jones reminds you to neatly fill in your scantron bubble. Or else!"
            end
        end
    end

    super.onCollide(self,soul);
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