local rusty_locale = require '__rusty-locale__.locale'
local rusty_icons = require '__rusty-locale__.icons'

local eff_data = {}

for i, recipe in pairs(NIHILISTZSCHE_CE_Recipes) do
    -- add remaining recipes with direct items to find the icons
    if
        data.raw.recipe[recipe]
        and not eff_data[recipe]
    then
        local research_level = 1
        for tech, tbl in pairs(data.raw.technology) do
            for _, effect in pairs(tbl.effects or {}) do
                if effect.type == "unlock-recipe" and effect.recipe == recipe then
                    research_level = math.min(#tbl.unit.ingredients, 6)
                end
            end
        end
			local locale = rusty_locale.of_recipe(data.raw.recipe[recipe])
			local icons = rusty_icons.of_recipe(data.raw.recipe[recipe])
            eff_data[recipe] = {
                name = {"", locale.name, " Efficiency"},
                max = 15,
                icon = icons[1].icon,
                crafting = { efficiency = 10 },
                research = { level = research_level },
            }
            if recipe:starts_with("dmr18-") then
                eff_data[recipe].icon = "__k2_se_crafting_efficiency__/graphics/icons/"..recipe:sub(7)..".png"
                eff_data[recipe].icon_size = 32
            end
    end
end

for recipe, d in pairs(eff_data) do
    log("Adding " .. recipe .. " crafting efficiency")
    CE_Add_Recipe(d, recipe)
end
