local iframe_url = "https://www.youtube.com/embed/QkkoHAzjnUs";
local iframe_open = false;
local iframe_command = "+iframeCmd";

local function close()
  Prop.DeleteProp();
  ClearPedTasksImmediately(PlayerPedId());
  SetNuiFocus(false, false);
  SendNUIMessage({
    type = "close",
  });
  iframe_open = false;
end

local function open()
  if iframe_open then
    close();
    Citizen.Wait(1000);
    return;
  end

  iframe_open = true;

  if not IsPedInAnyVehicle(PlayerPedId(), false) then
    Animation.Play();
    Prop.CreateProp();
  end

  SetNuiFocus(true, true);
  SendNUIMessage({
    type = "open",
    url = iframe_url,
  });
end

RegisterCommand(iframe_command, open, false);
RegisterKeyMapping(iframe_command, "Open iFrame", "keyboard", "f10");

RegisterNUICallback("close", function(data, cb)
  close();
  cb({ ok = true });
end)
