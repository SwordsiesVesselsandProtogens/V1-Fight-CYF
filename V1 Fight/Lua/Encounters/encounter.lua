-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Either OGG or WAV. Extension is added automatically. Uncomment for custom music.
encountertext = "A machine revealed itself\nin the darkness." --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"bullettest_chaserorb"}
wavetimer = 4.0
arenasize = {155, 130}

enemies = {
"v1"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"bullettest_chaserorb", "revolver_shots"}

function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
    Player.lv = 15
    Player.hp = 76
	Inventory.AddCustomItems({"L. Hero", "Unknown Drink", "S. Piece", "Face Steak"}, {0, 0, 0, 0})
	Inventory.SetInventory({"L. Hero", "L. Hero", "L. Hero", "Unknown Drink", "Unknown Drink", "S. Piece", "Face Steak"})
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
    State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    if ItemID == "L. HERO" then
		Player.Heal(40)
		BattleDialogue({"You ate the Legendary Hero."})
	elseif ItemID == "UNKNOWN DRINK" then
		Player.Heal(25)
		BattleDialogue({"You drank the Unknown Drink.\n It tastes weird."})
	elseif ItemID == "S. PIECE"
		Player.Heal(30)
		BattleDialogue({"You ate the Snow Piece."})
	elseif ItemID == "FACE STEAK"
		Player.Heal(60)
		BattleDialogue({"You ate the Face Steak."})
	end
end