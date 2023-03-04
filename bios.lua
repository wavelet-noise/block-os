local fucntion init(self, cache)
  local function boot_invoke(file)
    local result = self.run_file(file)
    if not result[1] then
      return nil, result[2]
    else
      return table.unpack(result)
    end
  end

  local function load_from_default()
    local handle, reason = boot_invoke("init.lua")
    if not handle then
      return nil, reason
    end
  end
  
  local reason
  init, reason = load_from_default()
  if not init then
    error("no bootable medium found" .. (reason and (": " .. tostring(reason)) or ""), 0)
  end
  
  self.beep(1000, 0.2)
end
return init()
