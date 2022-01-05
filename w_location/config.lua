    -- G_Corporation -- wiizz -- 
  -- https://github.com/wiizzdev --
 -- https://discord.gg/VpYP58ZjmD --

config = {}

-- PRIX LABEL (pour rajouter des vehicules => client.lua / server.lua)
config.prixvoiture1 = "~g~800$" -- label du prix de la blista
config.prixvoiture2 = "~g~600$" -- label du prix de la panto
config.prixmoto1 = "~g~500$" -- label du prix de la faggio
config.prixvelo1 = "~g~250$" -- label du prix du cruiser
config.prixvelo2 = "~g~150$" -- label du prix du bmx
-- pour changer le prix réel des vehicules => server.lua

-- BLIPS / SHOPS (https://docs.fivem.net/docs/game-references/blips/)
config.blipname = "Location" -- nom des blips
config.blipscale = 0.8 -- taille des blips
config.blipcolour = 28 -- couleur des blips
config.blipsprite = 524 -- logo des blips
config.blipdisplay = 4 -- 4 = visible sur la grande map et la mininimap 5 = uniquement visible sur la minimap / 7 = uniquement visible sur la grande map

-- PED (pour changer les coordonnées du ped => client.lua)
config.peurped = true -- le ped doit-il fuire quand vous avez une arme ?
config.freezeped = true -- freeze la position du ped ?
config.invincibleped = true -- faire en sortes que le ped soit invinsible ?
config.texteped = "~o~LOCATION" -- texte affiché au dessus du ped

-- LOCATION/BLIPS
Config = { position = { {x = -1037.45, 	y = -2737.25, 	z = 19.17} } } -- coordonées du blip et du point d'intéraction