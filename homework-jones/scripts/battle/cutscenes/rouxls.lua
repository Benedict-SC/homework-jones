return {
    ---@param cutscene BattleCutscene
    rouxls = function(cutscene,enemy)
        Assets.playSound("rouxls")
        Game.battle.music:stop();
        local originalOffset = enemy.dialogue_offset;
        local hwjy = enemy.y;
        Game.battle.timer:approach(0.7,hwjy,hwjy-70,function(num)
            enemy.y = num;
        end,"linear",function() end);
        local light = Sprite("enemies/rouxls/light",500,-10)
        light:setAnimation({"enemies/rouxls/light",function(sprite, wait)
                sprite:setFrame(1)
                wait(0.04)
                sprite:setFrame(2)
                wait(0.04)
                sprite:setFrame(3)
                wait(0.04)
                sprite:setFrame(4)
                wait(2)
                sprite.alpha = 0.9
                wait(0.04)
                sprite.alpha = 0.8
                wait(0.04)
                sprite.alpha = 0.7
                wait(0.04)
                sprite.alpha = 0.6
                wait(0.04)
                sprite.alpha = 0.5
                wait(0.04)
                sprite.alpha = 0.4
                wait(0.04)
                sprite.alpha = 0.3
                sprite:setFrame(3)
                wait(0.04)
                sprite.alpha = 0.2
                sprite:setFrame(2)
                wait(0.04)
                sprite.alpha = 0.1
                sprite:setFrame(1)
                wait(0.04)
                sprite.alpha = 0.0
                wait(0.04)
        end});
        Game.battle:addChild(light);
        cutscene:wait(0.5);
        local rouxls = Sprite("enemies/rouxls/fade",512,155);
        rouxls:setScale(2,2);
        rouxls:setAnimation({"enemies/rouxls/fade",function(sprite, wait)
                sprite:setFrame(1)
                wait(0.08)
                sprite:setFrame(2)
                wait(0.08)
                sprite:setFrame(3)
                wait(0.08)
                sprite:setFrame(4)
                wait(0.08)
                sprite:setFrame(5)
                wait(0.08)
                sprite:setFrame(6)
                wait(0.08)
                sprite:setFrame(7)
                wait(0.2)
                sprite:setFrame(8)
                wait(0.08)
                sprite:setFrame(9)
        end})
        Game.battle:addChild(rouxls);
        cutscene:wait(3);
        Game.battle.music:play("rouxlskaard");
        local susie = Game.battle.party[2];
        cutscene:setSpeaker("rouxls");
        cutscene:text("* Hi Guyse","neutral");
        Game.battle.timer:after(15/30, function()
            Assets.playSound("rudebuster_swing")
            susie.sprite:setAnimation("battle/rude_buster");
            Game.battle.timer:after(15/30, function()
                local blast = RudeBusterBeam(false, susie.x, susie.y, 800, 200, function()
                end);
                blast.layer = BATTLE_LAYERS["above_ui"];
                Game.battle:addChild(blast);
            end);
        end);
        cutscene:text("[noskip]* Yes, I hath magnanimously decided to[next]","closed");
        Game.battle.music:stop();
        Game.battle.timer:approach(1,512,700,function(num)
            rouxls.x = num;
        end,"linear",function()    
            Game.battle.timer:approach(0.7,hwjy-70,hwjy,function(num)
                enemy.y = num;
            end,"linear",function() end);
        end);
        cutscene:text("* OKAY I'M'ST LEAVINGE,","leavinge");
        if enemy.chewed < 10 then
            Game.battle.music:play("studysession");
        else 
            Game.battle.music:play("studysession_slow");
        end
        enemy.dialogue_override = "Most thanks,[wait:5] Susie!";
        enemy.dialogue_offset = originalOffset;
        return true;
    end
}