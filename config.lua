local opt = {}
local M = {}

M.setup = function() then
    for _, plugin in ipairs(data) then
        -- TODO: get plugins opts
        i.setup(opt)
    end
end

return M