Config = {}

Config.MinSwing = 1 -- Min Swings on a Rock
Config.MaxSwing = 2 -- Max Swings on a Rock

Config.Pickaxe = "fishhook" -- Item from your database that you want to use for a pickaxe
Config.MinePromptKey = 0xD9D0E1C0 -- Key used to start Mining (Spacebar)
Config.StopMiningKey = 0x3B24C470 -- Key to stop Mining (F)
Config.MineRockKey = 0x07B8BEAF -- Key to Mine Rock (Left Click)

----- lower number is harder
Config.minDifficulty = 3000
Config.maxDifficulty = 1000
---------------------------
Config.Items = {
    {name = "crab_c", label = "Crab", chance = 2, amount = math.random(3)},
    {name = "crawfish_c", label = "Crawfish", chance = 3, amount = math.random(5)},
    
}

Config.Rocks = {
    'p_trap05x',
}