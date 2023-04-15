-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"V1 is trying its best to survive.", "V1 is desperately\nsliding all around\n to kill you.", "V1 is struggling to get fuel.", "The smell of nails fill the room."}
commands = {"Reason", "Pray", "Binary"}
randomdialogue = {"'May Thy\nWoes\nBe Many.'", "MANKIND\nIS\nDEAD.", "BLOOD\nIS\nFUEL.", "HELL\nIS\nFULL."}

sprite = "v1_normal" --Always PNG. Extension is added automatically.
name = "V1"
hp = 500
atk = 5
def = 10
check = "A machine looking for fuel."
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

healsleft = 1
-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "REASON" then
	BattleDialog({"You tried to reason with him,\nbut it didn't work."})
    elseif command == "PRAY" then
	BattleDialog({"You tried to pray...\nBut nobody came."})
    elseif command == "BINARY" then
        currentdialogue = {"?"}
    BattleDialog({"You tried to speak binary.\nHe did not understand."})
    end

end