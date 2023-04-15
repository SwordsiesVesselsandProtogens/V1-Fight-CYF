-- The chasing attack from the documentation example.

bullets = {}

function CreateBullet(x,y)
	bullet = CreateProjectile('bullet_revolver', x, y)
	xDifference = Player.x - bullet.x
	yDifference = Player.y - bullet.y
	bullet["velx"] = xDifference / 50
	bullet["vely"] = yDifference / 50
	bullet.sprite.rotation = bullet["vely"] * bullet["velx"] * 65
	table.insert(bullets, bullet)
end

Encounter.SetVar("wavetimer", 12.0)
spawntimer = 30


function Update()
    if spawntimer % 30 == 0 then
    	CreateBullet(math.random(0, 150), Arena.height/2)
     end
     for i = 1, #bullets
     do
	currentBullet = bullets[i]
	
	currentBullet.Move(currentBullet["velx"],currentBullet["vely"])

     end

     spawntimer = spawntimer + 1
    
end