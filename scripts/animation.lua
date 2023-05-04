Animation = {};

function Animation.Play()
  local ped = PlayerPedId();

  local animationDuration = -1;
  local animationFlag = 1;

  local animationDictionary = "amb@world_human_tourist_map@male@base";
  local animation = "base";

  RequestAnimDict(animationDictionary);

  while not HasAnimDictLoaded(animationDictionary) do
    Citizen.Wait(0);
  end

  TaskPlayAnim(ped, animationDictionary, animation, 8.0, -8.0, animationDuration, animationFlag, 0, false, false, false);
end
