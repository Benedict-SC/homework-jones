local Essay, super = Class(Wave)

function Essay:onStart()
    self.time = 10;
    self.testtext = "this is a bunch of text that we're going to attempt to write out into the textbox"
    self.testprog = 1;
    self.input = {""}
    self:setArenaSize(30,30);
    --self:setSoulPosition(SCREEN_WIDTH / 2,250);
    --self:setArenaOffset(0,80);
    self:moveArena();
    self.questionText = Text("Essay question 1:\nWho is your favorite friend?",200,100,250,nil,{align="center"});
    Game.battle:addChild(self.questionText);
    self.instructionText = Text("Type your answer\n[wave]vv[wave:0]   with the keyboard!   [wave]vv[wave:0]",-100,285,nil,nil,{color={0.5,0.5,0.5},align="center",font_size=18});
    Game.battle:addChild(self.instructionText);
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

function Essay:moveArena()
    self.timer:approach(0.2,Game.battle.arena.y,Game.battle.arena.y + 80,function(num) 
        local dist = num - Game.battle.arena.y;
        Game.battle.arena.y = num;
        Game.battle.soul.y = Game.battle.soul.y + dist;
    end);
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
    indexmap[4] = {string.find(resp,"kris"),"kris"};
    indexmap[5] = {string.find(resp,"lancer"),"lancer"};
    indexmap[6] = {string.find(resp,"alphys"),"alphys"};
    indexmap[7] = {string.find(resp,"asriel"),"asriel"};
    indexmap[8] = {string.find(resp,"dess"),"dess"};
    indexmap[9] = {string.find(resp,"december"),"december"};
    indexmap[10] = {string.find(resp,"berdly"),"berdly"};
    indexmap[11] = {string.find(resp,"jockington"),"jockington"};
    indexmap[12] = {string.find(resp,"temmie"),"temmie"};
    indexmap[13] = {string.find(resp,"catt"),"catti"};
    indexmap[14] = {string.find(resp,"monster kid"),"mk"};
    indexmap[15] = {string.find(resp,"snowy"),"snowy"};
    indexmap[16] = {string.find(resp,"tem"),"temmie"};
    indexmap[17] = {string.find(resp,"mk"),"mk"};
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
    if firstFriendNotFound then 
        if string.find(resp,string.lower(Game.save_name)) then
            firstFriend = "playername";
        else
            firstFriend = "default";
        end
    end
    if firstFriend == "noelle" then
        return {
            "There's no L in\n\"FAVORITE FRIEND\"!",
            "Great choice,[wait:5] Kris!",
            "Say...[wait:15] Kris,[wait:5]\nwhere's Noelle?",
            "Usually she'd be helping\nwith your work.",
            "And you know what\nthey say,[wait:5] Kris:",
            "The friend that studies\ntogether,[wait:5] buddies together!",
            "So why did you\nstop hanging...[wait:30] out...",
            "([shake:1]B-brr...[shake:0][wait:15] what's this\nchill down my back[wait:5].[wait:5].[wait:5].[wait:5]?)"
        }
    elseif firstFriend == "susie" then
        return {
            {who="susie",face="surprise_frown",what="Wait,[wait:5] huh?"},
            "You've been helping\nher out,[wait:5] huh?",
            "Normally,[wait:5] Susie[wait:5] \n\"forgets\"[wait:5] her work.",
            "And glares when Miss\nAlphys collects it.",
            "But since you became friends...",
            "She ACTUALLY forgets her work!",
            "Which,[wait:5] is still\na failing grade.",
            "But you're doing\nyour best,[wait:5] Kris.",
            "Maybe she'll learn\nyour positive attitude.",
            "Then you can\nBe Plus together!",
            {who="susie",face="nervous_side",what="...[wait:20]"},
            {who="susie",face="smile",what="You and Ralsei really are total nerds."},
            {who="susie",face="teeth_smile",what="If you turn me into one too,[wait:5] I'm confiscating your face."},
            {who="susie",face="teeth_b",what="Got it!?"}
        }
    elseif firstFriend == "ralsei" then
        return {
            {who="ralsei",face="blush_surprise",what="O-[wait:3]oh!"},
            "Full marks,[wait:5] Kris!",
            "Prince Ralsei's so\ndiligent,[wait:5] after all.",
            "Chores,[wait:5] practice,[wait:5]\nFountain sealing...",
            "His entire life is homework!",
            "But be sure to take\nplenty of study breaks.",
            "(That means,[wait:5] breaks,[wait:5]\nto study in.)",
            {who="ralsei",face="blush",what="(Kris,[wait:5] I'm happy you care about me.)"},
            {who="ralsei",face="pensive",what="(But are you sure I'm your favorite?)"},
            {who="ralsei",face="small_smile_side",what="(Susie is here,[wait:5] after all.)"},
            {who="ralsei",face="smile_b",what="(Between the two of us...)"},
            {who="ralsei",face="roaring",what="(I'm not sure I'm the best choice.)"}
        }
    elseif firstFriend == "kris" then
        return {
            "Wow![wait:5] What\nhealthy self-esteem!",
            "Everyone![wait:5] Let's\nall take a second...",
            "And be our favorite\nfriends to ourselves!",
            {who="ralsei",face="blush_pleased",what="O-[wait:3]okay,[wait:5] I'll try!"},
            {who="susie",face="smile",what="Can't lend myself five bucks for lunch,[wait:5] dumbass."},
            {who="susie",face="surprise",what="Unless I left it in my pockets and forgot."},
            {who="susie",face="annoyed_down",what=".[wait:5].[wait:5].[wait:5]"},
            {who="susie",face="teeth",what="...dammit, nothing."},
            {who="ralsei",face="blush_pleased",what="(Kris,[wait:5] can I,[wait:5] um...[wait:10] copy your answers?)"},
        }
    elseif firstFriend == "dess" then
        return{
            "Kya-huh?[wait:5] That strange scribble...",
            "It almost looks like \na person's name!",
            "Kris,[wait:5] were you\nembarrassed to say?",
            "Maybe you should pick\nsomeone else,[wait:5] then.",
            "Good influences are\nimportant,[wait:5] Kris.",
            "Don't give in to the slippery\nslope of peer pressure.",
            "Or you might end up in a place...",
            "...you can't think your way out of.",
            ".[wait:10].[wait:10].[wait:10]",
            "Wh-[wait:5] K-[wait:3]kris![wait:5]\nDon't snarl at your homework!"
        }
    elseif firstFriend == "december" then
        return{
            "Your favorite month\nis also okay.",
            "(Mine's September![wait:5]\nBack to school!)"
        }
    elseif firstFriend == "berdly" then
        return{
            "...",
            "You wrote fifteen question\nmarks after his name.",
            "Well,[wait:5] it's true that...",
            "Berdly's good at\nraising new questions.",
            "...completely unrelated\nto the lesson plan.",
            "That we spend the\nnext several hours on.",
            "...What a curious\nlittle bluebird!",
            "A pleasure to have\nin class,[wait:5] probably!",
            "Let's all appreciate\nBerdly,[wait:5] okay?",
            {what="* You took a second\nto appreciate Berdly.[react:No.,420,20,annoyed,susie]"}
        }
    elseif firstFriend == "jockington" then
        return{
            "...",
            "A+.",
            "No notes."
        }
    elseif firstFriend == "lancer" then
        return{
            "Oh,[wait:5] um...",
            {who="susie",face="neutral",what="What?"},
            "I-[wait:5]it's just that,[wait:5] well...",
            "Isn't Prince Lancer much\nyounger than you?",
            "And homeschooled?\n[wait:10]By a laptop?",
            "I'm not sure this is\nage-appropriate,[wait:5] is all--",
            {who="susie",face="bangs_neutral",what="Hey."},
            {who="susie",face="bangs_teeth",what="Wanna hear MY answer?"},
            "[shake:1]Full score!\n[wait:5]Gold starwalker!!\n[wait:5]Don't smear my ink!!!",
            {who="susie",face="sincere_smile",what="(Hey,[wait:5] Kris,[wait:5] let's play basketball with Lancer later.)"},

        }
    elseif firstFriend == "asriel" then
        return{
            "It's okay if you miss your brother.\nEveryone else does, too.",
            "Is what I inferred,[wait:5] from\nMiss Alphys's texts.[wait:5] It's\nnot like she ever met him.",
            "Or, asked follow-up\nquestions about him.",
            "It makes me wonder...[wait:5] is he\nreally just like everyone says?",
            "Or is he...",
            "[wave]...even cooler? "
        }
    elseif firstFriend == "alphys" then
        return{
            "Hwuh?[wait:5] Miss Alphys?",
            "Kris,[wait:5] the teacher can't\nreally be your friend.",
            "Especially not YOUR teacher.",
            "I know she does her best.",
            "But even though she made me\n[wave]\"kool\"[wave:0] so I could connect to you,",
            "I can tell she has no\nclue how teenagers feel.",
            "So you don't have\nto be nice to her.",
            "Let's find friends closer\nto your age,[wait:5] okay?"
        }
    elseif firstFriend == "mk" then
        return{
            "Of all the people in class...",
            "MK,[wait:5] more than anyone else...",
            "...sits next to you.",
            "I'm glad you appreciate some-\n-one who sits next to you.",
        }
    elseif firstFriend == "snowy" then
        return{
            "Snowy tries hard,[wait:5] bless him.",
            "If Jokes were a core subject...",
            "He would be pulling\na solid C-plus!",
            "Instead of his normal B-minuses."
        }
    elseif firstFriend == "catti" then
        return{
            "Catti,[wait:5] Catti,[wait:5] Catti.[wait:5]\n(With three Is.)",
            {what="She's smart,[wait:5] but\nwasting her potential.",react="(Catti has three eyes???)",rx=300,ry=20,reactface="surprise_frown",reactwho="susie"},
            "You can't get a\njob in witchcraft!",
            "The market's way\ntoo competitive!",
            "Is that who you're always\ntexting in class,[wait:5] Kris?",
            "Someday Miss Alphys will\nconfiscate your phone!",
            "She just needs\ntwo or three months\nto work up the courage."
        }
    elseif firstFriend == "temmie" then
        return{
            "Always talking about\ncollege,[wait:5] that one.",
            "She'd be a great choice!",
            "Too bad you're\nlosing to an egg."
        }
    elseif firstFriend == "playername" then
        return{
            {who="susie",face="nervous",what="Dunno who that is."},
            {who="susie",face="neutral",what="Do they go to our school?"},
            {who="ralsei",face="angry_surprise",what=".[wait:5].[wait:5].[wait:5]"},
            "Kris...",
            "Imaginary friends are\nokay in kindergarten.",
            "But we all have to\ngrow up sometime.",
            "You're just you,[wait:5] after all.",
            "So that's why...",
            "I can't give you more\nthan partial credit!"
        }
    else
        return {"That person isn't on\nmy class roster.","But I'm sure you're\ngreat friends,[wait:5] probably!","Partial credit!"}
    end
end

function Essay:onEnd()
   TextInput.endInput(); 
   local dialogue = self:getFriendDialogue();
   self.questionText:remove();
   self.instructionText:remove();
   Game.battle:startCutscene("favoritefriend", "favoriteFriend",self:getAttackers()[1],dialogue);
end

return Essay