local util = {}

-- check if a table contains a sought value
function util.contains(table, sought)
  for i, value in pairs(table) do
    if value == sought then
      return true
    end
  end
  return false
end

-- Get the count of results
function util.get_result_count(recipe_name, product)
  if not product then product = recipe_name end
  local recipe = data.raw.recipe[recipe_name]
  if recipe then
    if recipe.normal and recipe.normal.results then
      return #(recipe.normal.results)
    elseif recipe.results then
      return #(recipe.results)
    end
    return 1
  end
  return 0
end

function util.get_first_result(recipe_name)
    local recipe = data.raw.recipe[recipe_name]
    if recipe then
        if recipe.normal and recipe.normal.results then
            return recipe.normal.results[1][1] or recipe.normal.results[1].name
        elseif recipe.normal and recipe.normal.result then
            return recipe.normal.result
        elseif recipe.results then
            return recipe.results[1][1] or result.results[1].name
        else
            return recipe.result
        end
    end
end

return util
