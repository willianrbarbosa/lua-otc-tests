// To correct the memory leak problem in the presented code snippet, 
// it's necessary to free the memory allocated for the 'player' object, 
// in case it was dynamically created with the 'new' operator.
// Also I implemented the tab for all code for better readability  

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // free the memory allocated to player's object
            delete player; 
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        // free the memory allocated to player's object
        delete player; 
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
        // free the memory allocated to player's object if player is offline
        delete player; 
    }
}