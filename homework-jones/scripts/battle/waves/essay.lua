local Essay, super = Class(Wave)

function Essay:onStart()
    self.time = 10;
    self.testtext = "this is a bunch of text that we're going to attempt to write out into the textbox"
    self.testprog = 1;
    self.input = {""}
    TextInput.attachInput(self.input,{
        enter_submits = false,
        multiline = false,
        clear_after_submit = false
    });
    --Game.battle:battleText("start");
    --[[self.timer:every(1/3, function()
        self.testprog = self.testprog + 1;
        Game.battle.battle_ui.encounter_text.text:setText("[instant]" .. string.sub(self.testtext,1,self.testprog));
    end)]]
end

function Essay:update()
    -- Code here gets called every frame
    Game.battle.battle_ui.encounter_text.text:setText("[instant]" .. self.input[1]);
    super.update(self)
end

function Essay:getFriendDialogue()
    local resp = string.lower(self.input[1]);
    local indexmap = {};
    indexmap[1] = {string.find(resp,"noel"),"noelle"};
    indexmap[2] = {string.find(resp,"susie"),"susie"};
    indexmap[3] = {string.find(resp,"ralsei"),"ralsei"};
    indexmap[4] = {string.find(resp,"dess"),"dess"};
    indexmap[5] = {string.find(resp,"december"),"december"};
    indexmap[6] = {string.find(resp,"berdly"),"berdly"};
    indexmap[6] = {string.find(resp,"jockington"),"jockington"};
    indexmap[6] = {string.find(resp,"berdly"),"berdly"};
    indexmap[6] = {string.find(resp,"berdly"),"berdly"};
    table.sort(indexmap, function(a,b) 
        if a[1] and b[1] then 
            return a[1] < b[1];
        elseif a[1] then
            return true;
        elseif b[1] then
            return false;
        else
            return false;
        end
    end);
    local firstFriend = indexmap[1][2];
    local firstFriendNotFound = not indexmap[1][1];
    if firstFriendNotFound then firstFriend = "default"; end
    if firstFriend == "noelle" then
        return {
            "No L?",
            "Kyaha-korrect! There's\nno \"L\" in \"FRIENDLY\"!",
            "Say... Kris, where's Noelle?",
            "She helps you with \nhomework all the time.",
            "She's even your\n\"favorite friend\"!",
            "So...",
            "(B-brr... what's this\nchill down my back...?)"
        }
    elseif firstFriend == "susie" then
        return {
            "You've been helping\nher out, huh?",
            "Normally, Susie \n\"forgets\" her work.",
            "But since you became friends...",
            "She actually forgets her work!",
            "Which, is still\na failing grade.",
            "But you're doing\nyour best, Kris.",
            "Maybe she'll pick up\non your positive attitude.",
            "Then you can\nBe Plus together!"
        }
    elseif firstFriend == "ralsei" then
        return {
            "What a best choice, Kris!",
            "Prince Ralsei's so\ndiligent, after all.",
            "Chores, practice,\nfountain sealing...",
            "His entire life is homework!",
            "But be sure to take\nplenty of study breaks.",
            "(That means, breaks,\nto study in.)"
        }
    elseif firstFriend == "dess" then
        return{
            "Kya-huh?",
            "What a strange scribble...",
            "It almost looks like \na person's name!"
        }
    elseif firstFriend == "december" then
        return{
            "Favorite friend,\nnot favorite month!",
            "(Mine's September.)"
        }
    elseif firstFriend == "berdly" then
        return{
            "You wrote fifteen question\nmarks after his name.",
            "Kris...",
            "Asking questions is\nmy favorite thing too!",
            "Berdly brings up\na lot of problems\nand questions.",
            "...completely unrelated\nto the lesson plan.",
            "...What a curious little bluebird!",
            "Let's all appreciate Berdly\nfor raising Ps and Q's!",
        }
    elseif firstFriend == "jockington" then
        return{
            "...",
            "A+."
        }
    else
        return {"Default response!","Yep, default response!"}
    end
end

function Essay:onEnd()
   TextInput.endInput(); 
   local dialogue = self:getFriendDialogue();
   Game.battle:startCutscene("favoritefriend", "favoriteFriend",self:getAttackers()[1],dialogue);
end

return Essay