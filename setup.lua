local util = require("data-util")

NIHILISTZSCHE_CE_Recipes = {}
function nihilistzsche_ce_add_recipe(name, extra_data)
    if not util.contains(NIHILISTZSCHE_CE_Recipes, name) then
        if not extra_data then
            table.insert(NIHILISTZSCHE_CE_Recipes, name)
        else
            table.insert(NIHILISTZSCHE_CE_Recipes, {name, extra_data})
        end
    end
end

