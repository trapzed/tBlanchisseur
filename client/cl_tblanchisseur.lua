ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.Events["esx:getSharedObject"], function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local displayBlanchisseur = false
local washingInProgress = false

RegisterNetEvent("tBlanchisseur:openMenuBlanchisseur")
AddEventHandler('tBlanchisseur:openMenuBlanchisseur', function()
	SetDisplay(not displayBlanchisseur)
end)

RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("1", function(data)
  SetResourceKvp("ChoosedBlanchisseur", "liasse")
  ChoosedBlanchisseur = GetResourceKvpString("ChoosedBlanchisseur")
  SetDisplay(false)
end)

RegisterNUICallback("2", function(data)
  SetResourceKvp("ChoosedBlanchisseur", "malette")
  ChoosedBlanchisseur = GetResourceKvpString("ChoosedBlanchisseur")
  SetDisplay(false)
end)

RegisterNUICallback("3", function(data)
    SetResourceKvp("ChoosedBlanchisseur", "sac")
    ChoosedBlanchisseur = GetResourceKvpString("ChoosedBlanchisseur")
    SetDisplay(false)
  end)

function SetDisplay(bool)
  displayBlanchisseur = bool
  SetNuiFocus(bool, bool)
  SendNUIMessage({
      type = "openBlanchisseur",
      status = bool
  })
end

CreateThread(function()
    while true do

        if ChoosedBlanchisseur == "liasse" then

            if washingInProgress then
                ESX.ShowNotification("" .. Config.NotifTitle .. "\n~r~Action déjà en cours")
            else
                TriggerServerEvent("tBlanchisseur:checkBlackMoney", Config.Price1, Config.Time1)
            end

            ChoosedBlanchisseur = nil

        elseif ChoosedBlanchisseur == "malette" then

            if washingInProgress then
                ESX.ShowNotification("" .. Config.NotifTitle .. "\n~r~Action déjà en cours")
            else
                TriggerServerEvent("tBlanchisseur:checkBlackMoney", Config.Price2, Config.Time2)
            end

            ChoosedBlanchisseur = nil

        elseif ChoosedBlanchisseur == "sac" then

            if washingInProgress then
                ESX.ShowNotification("" .. Config.NotifTitle .. "\n~r~Action déjà en cours")
            else
                TriggerServerEvent("tBlanchisseur:checkBlackMoney", Config.Price3, Config.Time3)
            end

            ChoosedBlanchisseur = nil

        end

        Citizen.Wait(80)

    end
end)

RegisterNetEvent("tBlanchisseur:playerHasMoney")
AddEventHandler('tBlanchisseur:playerHasMoney', function(price, temps)
    washingInProgress = true
	WashMoney(price, temps)
end)

function WashMoney(price, temps)
    if washingInProgress then
        

        local tempsfinal = temps * 1000

        while washingInProgress do

            Citizen.Wait(1)

            if tempsfinal > 0 and washingInProgress then
                ESX.ShowNotification(("" .. Config.NotifTitle .. "\n~b~%s~r~ secondes restantes"):format(ESX.Round(tempsfinal/1000)))
                Citizen.Wait(5000)
                tempsfinal = tempsfinal - 5000
            elseif tempsfinal <= 0 then
                TriggerServerEvent('tBlanchisseur:finishedWashing', price)
                local newPrice = price * Config.Percentage / 100
                ESX.ShowNotification(("" .. Config.NotifTitle .. "\n~r~Argent blanchi, vous avez reçu ~g~%s$"):format(ESX.Round(newPrice)))
                washingInProgress = false
            else
                Citizen.Wait(1000)
            end
            
        end
    else 
        return
    end
end


Citizen.CreateThread(function()
  while true do
        local interval = 750
        
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Position)

        if dist <= 2.0 then
            interval = 1
            draw2dText(("Appuyez sur [~r~E~s~] pour intéragir"), { 0.424, 0.955 } )
            --ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour ~b~intéragir")
            if IsControlJustPressed(1,51) then
                TriggerServerEvent('tBlanchisseur:openMenuBlanchisseurServer')
            end
    
        end

        if dist > 3 and washingInProgress then 
            washingInProgress = false
            ESX.ShowNotification("" .. Config.NotifTitle .. "\n~r~Blanchiment annulé, vous avez quitté la zone")
        end

        Citizen.Wait(interval)

  end

end)

function CheckIfWashingIsInProgress()

end

function WashingInProgress()
    
end


-- Création du ped
Citizen.CreateThread(function()
    LoadModel(Config.Ped)
    ped = CreatePed(2, GetHashKey(Config.Ped), Config.Position, Config.PedHeading, 0, 0)
    DecorSetInt(ped, "Yay", 5431)
    FreezeEntityPosition(ped, 1)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, 1)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_SMOKE", 0, 1) 
end)
  
function LoadModel(model)
  while not HasModelLoaded(model) do
    RequestModel(model)
    Wait(1)
  end
end


function draw2dText(text, pos)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.55, 0.55)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(table.unpack(pos))
end