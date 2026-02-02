local speedAPI
function speedAPI (tab, key)
    local t = tab
    local f = t[key]
    return function (...)
        return f(t, ...)
    end
end

local ipairs = ipairs
local PLAYERATTR = PLAYERATTR
local PLAYERMOTION = PLAYERMOTION


local getpos = speedAPI(Actor, 'getPosition')
local getAllPlayers = speedAPI(World, 'getAllPlayers')
local setAttr = speedAPI(Player, 'setAttr')

local tick = 0

local _LastPosY_ = {}
local _isFalling_ = {}
local _CanJumpTwice_ = {} --是否可以二段跳


local setIsCanJumpTwice

local RunTime, MotionStateChange

function RunTime ()
    local _, num, array = getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        local _, x, y, z = getpos(playerid)
        if y then
            if _LastPosY_[playerid] and _LastPosY_[playerid] > y then --下落中
                if not _isFalling_[playerid] then
                    --Chat:sendSystemMsg('下落！', playerid)
                end
                _isFalling_[playerid] = true
                if not _CanJumpTwice_[playerid] then
                    setAttr(playerid, PLAYERATTR.JUMP_POWER, 0)
                end
            else
                _isFalling_[playerid] = false
                if not _CanJumpTwice_[playerid] then
                    setAttr(playerid, PLAYERATTR.JUMP_POWER, -1)
                end
            end
            _LastPosY_[playerid] = y
        end
    end
    tick = tick + 1
end


function setIsCanJumpTwice(playerid, v) 
    if v then 
        _CanJumpTwice_[playerid] = true
        setAttr(playerid, PLAYERATTR.JUMP_POWER, -1)
    else
        _CanJumpTwice_[playerid] = false
    end
end

--setIsCanJumpTwice(1878069232, false) 

ScriptSupportEvent:registerEvent('Game.RunTime', RunTime)
