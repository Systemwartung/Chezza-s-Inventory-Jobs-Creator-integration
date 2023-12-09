local config = {}
config.maxstashweight = 100000 -- weight of stashes.
config.maxsafeweight = 100000 -- weight of safes.
config.maxarmoryweight = 100000 -- weight of armories.

RegisterNetEvent("jobs_creator:stash:openStash", function(markerId)
    TriggerEvent('inventory:openInventory', {
        id = "marker_" .. markerId,
        type = "esx_job_creator_safe",
        title = 'Stash - ' .. markerId,
        weight = config.maxstashweight,
        save = true,
        timeout = 1000
    })
end)

RegisterNetEvent("jobs_creator:safe:openSafe", function(markerId)
    TriggerEvent('inventory:openInventory', {
        id = "marker_" .. markerId,
        type = "esx_job_creator_safe",
        title = 'Safe - ' .. markerId,
        weight = config.maxsafeweight,
        save = true,
        timeout = 1000
    })
end)

RegisterNetEvent("jobs_creator:armory:openArmory", function(markerId)
    TriggerEvent('inventory:openInventory', {
        id = "marker_" .. markerId,
        type = "esx_job_creator_armory",
        title = 'Armory - ' .. markerId,
        weight = config.maxarmoryweight,
        save = true,
        timeout = 1000
    })
end)

RegisterNetEvent("jobs_creator:framework:ready", function() 
    exports["jobs_creator"]:disableScriptEvent("jobs_creator:actions:search:searchPlayer")
    exports["jobs_creator"]:disableScriptEvent("jobs_creator:stash:openStash")
    exports["jobs_creator"]:disableScriptEvent("jobs_creator:armory:openArmory")
    exports["jobs_creator"]:disableScriptEvent("jobs_creator:safe:openSafe")
end)

RegisterNetEvent("jobs_creator:actions:search:searchPlayer", function(targetServerId)
    TriggerEvent('inventory:openPlayerInventory', targetServerId, true)
end)