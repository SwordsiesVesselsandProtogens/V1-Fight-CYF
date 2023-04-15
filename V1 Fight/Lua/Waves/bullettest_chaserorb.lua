-- The chasing attack from the documentation example.

bullets = {}

function CreateSaw(x,y)
	chasingbullet = CreateProjectile('Sawblade', x, y)
	chasingbullet.SetVar('xspeed', 0)
	chasingbullet.SetVar('yspeed', 0)
	
	chasingbullet.sprite.xscale = 0.5
	chasingbullet.sprite.yscale = 0.5
	
	chasingbullet.ppcollision = true
	
	table.insert(bullets, chasingbullet)
end

wavetimer = 10.0
spawntimer = 1


function Update()
    if spawntimer % 60 == 0 then
    for i = -50, 100, 50
    do
     CreateSaw(i, Arena.height / 2)
     end
     end
     for i = 1, #bullets
     do
	local bullet = bullets[i]
	local xdifference = Player.x - bullet.x
    	local ydifference = Player.y - bullet.y
    	local xspeed = bullet.GetVar('xspeed') + xdifference / 2000
   	 local yspeed = bullet.GetVar('yspeed')  + ydifference / 2000
   	 bullet.Move(xspeed, yspeed)
    	bullet.sprite.rotation = xspeed * yspeed * 90
    	bullet.SetVar('xspeed', xspeed)
    	bullet.SetVar('yspeed', yspeed)
     end

     spawntimer = spawntimer + 1
    
end