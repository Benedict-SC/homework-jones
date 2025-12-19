return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    favoriteFriend = function(cutscene, enemy,dialogue)
        cutscene:text("")
        for i=1,#dialogue do
            local line = dialogue[i];
            if type(line) == "string" then
                cutscene:battlerText(enemy,line);
            elseif type(line) == "table" then
                if line.who then
                    cutscene:setSpeaker(line.who);
                    cutscene:text(line.what,line.face);
                elseif line.react then
                    cutscene:battlerText(enemy,line.what,{wait=false});
                    cutscene:text("[react:1]",nil,{reactions= { {
                        line.react,line.rx,line.ry,line.reactface,line.reactwho
                    }}});
                elseif line.what then
                    cutscene:text(line.what);
                end
            end
        end
    end
}