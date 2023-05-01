-- There is some improvements to do in this script...
-- Also I implemented the tab for all code for better readability  
function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members

    -- 1st) To avoid possible security issues, it's better to use named parameters instead of string interpolation to build the SQL query, also avoiding the possibility of SQL injection.  
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < @max_members;"
    local resultId = db.storeQuery(selectGuildQuery, { max_members = memberCount })

    -- 2nd) It's important check if that the query result is valid before trying to get the guild name.
    if resultId ~= nil then
        -- 3rd) It's necessary to iterate over the query results before getting the name of each guild. 
        -- I'm going to use a "while" loop that loops through the results.
        local tmpResultId = resultId
        while tmpResultId do
            local guildName = result.getString(row, "name")
            print(guildName)
            tmpResultId = result.next(resultId)
        end
        result.free(resultId)
    end
end