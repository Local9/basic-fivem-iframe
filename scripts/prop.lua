Prop = {};

local propModel = "prop_cs_tablet";
local propBone = 28422;
local propHandle = nil;

function Prop.DeleteProp()
  SetEntityAsMissionEntity(propHandle, true, true);
  DeleteObject(propHandle);
end

function Prop.CreateProp()
  if propHandle ~= nil then
    Prop.DeleteProp();
  end

  local model = propModel;

  if not IsModelValid(model) then
    print("Invalid model: " .. model);
    return;
  end

  local modelHash = GetHashKey(model)

  RequestModel(model);

  local loadCounter = 0;

  while not HasModelLoaded(model) do
    Citizen.Wait(10);
    loadCounter = loadCounter + 1;

    if loadCounter > 100 then
      print("Failed to load model: " .. model);
      return;
    end
  end
  local playerCoords = GetEntityCoords(PlayerPedId());
  local prop = CreateObject(model, playerCoords.x, playerCoords.y, playerCoords.z - 1, true, true, true);
  AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), propBone),
    0.0, -.03, 0.0, 20.0, -90.0, 0.0, true, true, false, true, 1, true);
  SetEntityCollision(prop, false, true);
  SetModelAsNoLongerNeeded(modelHash);
  propHandle = prop;
end
