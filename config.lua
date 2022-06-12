Config = {
    Menu = {
        Voiture = {
            {label = "Blista", name = 'blista', price = 800},
            {label = "Panto", name = 'panto', price = 600},
        },
        Moto = {
            {label = "Faggio", name = 'faggio', price = 500},
        },
        Velo = {
            {label = "Cruiser", name = 'cruiser', price = 250},
            {label = "BMX", name = 'bmx', price = 150},
        },
        Activer = {
            PaiementBanque = true, -- mettre 'false' pour payer uniquement en liquide
            Voiture = true,
            Moto = true,
            Velo = true,
        },
    },
    Vehicule = {
        Plaque = "LOCATION",
        Position = vector4(-1032.35, -2729.17, 20.15, 237.01),
        Camera = {
            Pos = {x = -1034.71, y = -2733.83, z = 20.16},
            Angle = {x = 0.0, y = 0.0, z = -26.0},
            Fov = 50.0,
        },
    },
    Position = {
        {x = -1037.61, y = -2737.54, z = 20.16},
    },
    Peds = {
        Name = 'ig_drfriedlander',
        Position = {
            {x = -1037.61, y = -2737.54, z = 19.16, h = 147.83},
        },
    },
    Blips = {
        Activer = true,
        Sprite = 162,
        Color = 2,
        Scale = 0.6,
        Name = "Location",
    },
}