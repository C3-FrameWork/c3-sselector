local spawnLocations = {
    { x = 123.456, y = 789.012, z = 345.678 }, 
    { x = 987.654, y = 321.098, z = 765.432 }, 
    -- Dodaj več lokacij če hočeš / Add more spawns if you want :P
  }
  
  function createSpawnSelectMenu()
    local menu = NativeUI.CreateMenu("Odaberite Spawn", "Odaberite svog spawn (kdje da se spawnaš)", 0, 0)
  
    for _, location in ipairs(spawnLocations) do
      local spawnItem = NativeUI.CreateItem("Spawn Lokacija", "Odaberite da se spawnate na ovom plazu")
      menu:AddItem(spawnItem)
  
      menu.OnItemSelect = function(sender, item, index)
        if item == spawnItem then
          TriggerServerEvent("teleportPlayer", location.x, location.y, location.z)
        end
      end
    end
  
    NativeUI.SetMenuWidth(menu, 200)
    NativeUI.DrawMenuAdvanced(menu)
  end
  
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if IsControlJustPressed(0, 51) then  -- Spremeni "51" zaradi preferenc kakor vam se bo prilagajalo! / Change number "51" for your preferense
        createSpawnSelectMenu()
      end
    end
  end)
  