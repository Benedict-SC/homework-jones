local Geography, super = Class(Wave)

Geography.locations = {
    {name="Paris",x=162,y=48},
    {name="Washington D.C",x=72,y=67},
    {name="Tokyo",x=316,y=65},
    {name="Cairo",x=193,y=73},
    {name="London",x=157,y=42},
    {name="Canberra",x=325,y=159},
    {name="Beijing",x=286,y=57},
    {name="Ottawa",x=79,y=52},
    {name="Berlin",x=171,y=43},
    {name="Athens",x=185,y=62},
    {name="Mexico City",x=45,y=86},
    {name="Riyadh",x=214,y=81},
    {name="N'Djamena",x=181,y=99},
    {name="Ouagadougou",x=157,y=96},
    {name="Abidjan",x=155,y=107},
    {name="Kathmandu",x=257,y=78},
    {name="New Delhi",x=249,y=78},
    {name="Tehran",x=217,y=64},
    {name="Moscow",x=196,y=39},
    {name="Jakarta",x=288,y=122},
    {name="Havana",x=64,y=81},
    {name="Lisbon",x=151,y=61},
    {name="Ankara",x=194,y=62},
    {name="Madrid",x=156,y=58},
    {name="Brasilia",x=103,y=133},
    {name="Taipei",x=296,y=82},
    {name="Kyiv",x=188,y=47},
    {name="Singapore",x=283,y=113},
    {name="Abu Dhabi",x=223,y=83},
    {name="Buenos Aires",x=97,y=159},
    {name="Rome",x=173,y=57},
    {name="Ulaanbaatar",x=272,y=49},
    {name="Abuja",x=169,y=102},
    {name="Vienna",x=178,y=49},
    {name="Pyongyang",x=297,y=61},
    {name="Dublin",x=153,y=42},
    {name="Stockholm",x=175,y=34},
    {name="Caracas",x=81,y=99},
    {name="Seoul",x=301,y=64},
    {name="Amsterdam",x=165,y=43}
}

function Geography:getRandomCapitals(amount)
    local list = Geography.locations;
    
    local y = #list
    local result = {}
    local seen = {}
    local count = 0

    while count < amount do
        local r = math.random(1, y)
        if not seen[r] then
            seen[r] = true
            count = count + 1
            table.insert(result, list[r])
        end
    end
    return result
end

function Geography:onStart()
    -- Every 0.33 seconds...
    self.time = 17;
    self.jones = Game.battle.enemies[1];
    self:setArenaSize(336,211);
    self:setArenaOffset(12,13);
    self.jones_save = {self.jones.x,self.jones.y};
    self.jones.sprite:setAnimation("lecture");
    self.jonesOffset = {20,-100};
    self.timer:approach(0.7,0,1,function(num)
        self.jones.x = self.jones_save[1] + self.jonesOffset[1]*num;
        self.jones.y = self.jones_save[2] + self.jonesOffset[2]*num;
    end,"out-cubic");
    
    self.bg = Sprite("bullets/worldmap", 164, 76)
    self.bg:setLayer(BATTLE_LAYERS["below_soul"])
    Game.battle:addChild(self.bg)
    local selectedCapitals = {Geography.locations[1],Geography.locations[2],Geography.locations[3],Geography.locations[4]}
    if self.jones.geographiesSeen ~= 0 then
        selectedCapitals = self:getRandomCapitals(4);
    end
    self.jones.geographiesSeen = self.jones.geographiesSeen + 1;
    self.timer:after(0.5,function()
        Game.battle.soul.speed = 6;
        self:say(selectedCapitals[1].name)
    end)
    self.timer:after(3,function()
        Game.battle.soul.speed = 1;
        self:blast(selectedCapitals[1])
    end)
    self.timer:after(4,function()
        Game.battle.soul.speed = 6;
        self:say(selectedCapitals[2].name)
    end)
    self.timer:after(7,function()
        Game.battle.soul.speed = 1;
        self:blast(selectedCapitals[2])
    end)
    self.timer:after(8,function()
        Game.battle.soul.speed = 6;
        self:say(selectedCapitals[3].name)
    end)
    self.timer:after(11,function()
        Game.battle.soul.speed = 1;
        self:blast(selectedCapitals[3])
    end)
    self.timer:after(12,function()
        Game.battle.soul.speed = 6;
        self:say(selectedCapitals[4].name)
    end)
    if (self.jones.geographiesSeen == 2) then
        self.timer:after(13,function()
            Game.battle.battle_ui.encounter_text:setActor("susie")
            Game.battle.battle_ui.encounter_text:setFace("angry_b")
            Game.battle.battle_ui.encounter_text.text:setText("* ...Are these even real places??");
        end);
    end
    self.timer:after(15,function()
        Game.battle.soul.speed = 1;
        self:blast(selectedCapitals[4])
    end)
end

function Geography:update()
    -- Code here gets called every frame

    super.update(self)
end
function Geography:say(location)

        self.umBubble = SpeechBubble(location .. "!",515, 50, {right=false}, self.jones);
        Game.battle:addChild(self.umBubble);
        self.timer:after(2.5,function()
            self.umBubble:remove();
        end);
end
function Geography:blast(location)
    local x = location.x + 160 + 4;
    local y = location.y + 72 + 3;
    local bullet = self:spawnBullet("mapring", x, y);
end

function Geography:onEnd()
    --Game.battle.enemies[1].x = self.jones_save;
    self.bg:remove();
    Game.battle.soul.speed = 4;
    Game.battle.timer:approach(0.7,0,1,function(num)
        self.jones.x = (self.jones_save[1] + self.jonesOffset[1]) - (num*self.jonesOffset[1]);
        self.jones.y = (self.jones_save[2] + self.jonesOffset[2]) - (num*self.jonesOffset[2]);
    end,"out-cubic");
end

return Geography