-- There is some improvements to do in this script...
-- Also I implemented the tab for all code for better readability  

-- 1st) Changed the name of the function to be in the standard using the snakeCase naming convention
function doSthWithPlayerParty(playerId, membername)
    -- 2nd) Add a type check for playerId and membername to ensure they are passed as integers and strings respectively.
    if type(playerId) ~= "number" or type(membername) ~= "string" then
        return
    end

    -- 3rd) Added the 'local' to player variable
    local player = Player(playerId)
    local party = player:getParty()
    
    -- 4th) Add a check to ensure that the player performing the action (removeMember) is the leader of the party.
    local partyLeader = party:getLeader()
    if partyLeader ~= player then
        return
    end

    -- 5th) We don't need a for loop to performe this action (removeMember)
    -- Instead I'm going to create a new 'playerToRemove' get it's party and check if is the same, then remove it from the party
    local playerToRemove = Player(membername)    
    local partyToRemove = playerToRemove:getParty()

    -- the playerId's party is not the same as the membername's party
    if party ~= partyToRemove then
        return
    end

    party:removeMember(playerToRemove)
    return

    -- 6th) Made some improvemtns in the for loop as well...
    -- Stored the party:getMembers() to a variable
    -- Changed the value variable 'v' to 'member' and 'k' to 'key' for better descriptive. 
	-- local partyMembers = party:getMembers()
    -- for key,member in pairs(partyMembers) do 
    --     if member == Player(membername) then 
    --         party:removeMember(Player(membername))
    --         -- 6th) Added the return after removeMember  so we don't have to go through the all members checking
    --         return
    --     end
    -- end
end