local iframe_url = "https://example.com/";
local iframe_open = false;
local iframe_command = "+iframeCmd";

local function open()
  if iframe_open then
    SetNuiFocus(false, false);
    SendNUIMessage({
      type = "close",
    });
    iframe_open = false;
    return;
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
  SetNuiFocus(false, false);
  cb({ ok = true });
end)
