--Ezague lol

local Radio = false
local Time = 10 * 1000

local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
local anim = "machinic_loop_mechandplayer"
local flags = 49

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

local vehicle = ""
function disableEngine()
	Citizen.CreateThread(function()
		while hotwiring do
			SetVehicleEngineOn(vehicle, false, true, false)
			if not hotwiring then
				break
			end
			Citizen.Wait(0)
		end
	end)
end

function enableEngine()
	local player_entity = PlayerPedId()
	hotwiring = false
	StopAnimTask(player_entity, animDict, anim, 1.0)
	Citizen.Wait(1000)
	SetVehicleEngineOn(vehicle, true, true, false)
	RemoveAnimDict(animDict)
		SetVehicleRadioEnabled(vehicle, false)
end

Citizen.CreateThread(function()
	local player_entity = PlayerPedId()
	while true do
		Citizen.Wait(0)
		
		if GetSeatPedIsTryingToEnter(player_entity) == -1 then
            Citizen.Wait(10)
			vehicle = GetVehiclePedIsTryingToEnter(player_entity)
			if IsVehicleNeedsToBeHotwired(vehicle) then
				disableEngine()
				hotwiring = true
				loadAnimDict(animDict)
				Citizen.Wait(7000)
				ClearPedTasks(player_entity)
				TaskPlayAnim(player_entity, animDict, anim, 3.0, 1.0, -1, flags, 1, 0, 0, 0)
				if hotwiring then
					if GetVehicleClass(vehicle) == 0 then
						exports['progressBars']:startUI(7000, "Kortslutter ledninger")
						Citizen.Wait(7500)
						enableEngine()
						else if GetVehicleClass(vehicle) == 1 then
							exports['progressBars']:startUI(8000, "Kortslutter ledninger")
							Citizen.Wait(8500)
							enableEngine()
							else if GetVehicleClass(vehicle) == 2 then
								exports['progressBars']:startUI(9000, "Kortslutter ledninger")
								Citizen.Wait(9500)
								enableEngine()
								else if GetVehicleClass(vehicle) == 3 then
									exports['progressBars']:startUI(10000, "Kortslutter ledninger")
									Citizen.Wait(10500)
									enableEngine()
									else if GetVehicleClass(vehicle) == 4 then
										exports['progressBars']:startUI(11000, "Kortslutter ledninger")
										Citizen.Wait(11500)
										enableEngine()
										else if GetVehicleClass(vehicle) == 5 then
											exports['progressBars']:startUI(12000, "Kortslutter ledninger")
											Citizen.Wait(12500)
											enableEngine()
											else if GetVehicleClass(vehicle) == 6 then
												exports['progressBars']:startUI(13000, "Kortslutter ledninger")
												Citizen.Wait(13500)
												enableEngine()
												else if GetVehicleClass(vehicle) == 7 then
													exports['progressBars']:startUI(14000, "Kortslutter ledninger")
													Citizen.Wait(14500)
													enableEngine()
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)