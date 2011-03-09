Array = {}
function Array.new()
  local self = {}
  local data = {}
  
  function self.include(value)
    for i,val in pairs(data) do
      if val == value then
        return true
      end
    end
    return false
  end
  
  function self.insert(value)
    table.insert(data, value)
  end
  
  return self
end