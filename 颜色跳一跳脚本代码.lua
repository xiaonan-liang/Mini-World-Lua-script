local startTimerRet, gameStartTimerId = MiniTimer:createTimer("gameStartTimer", nil, false)
-- local createAreaRet, areaid = Area:createAreaRectByRange({x=-19, y=2, z=-19}, {x=20, y=2, z=20})
-- print('areaid '..areaid)
-- 每局开始倒计时，
local startTime = 11 -------------------------------------------------测试点------------------------------------------------------------
local roundTime = 9
local replayTime = 11

local resetRet, areaResetId = Area:getAreaByPos({x=0, y=2, z=0})
local topRet, areaTopId = Area:getAreaByPos({x=17, y=14, z=25})
local snowRet, areaSnowId = Area:getAreaByPos({x=-8, y=13, z=-20})

--[[
local topBlockColor = 2025
local sideBlockColor = 2024
local bottomBlockColor = 2024

local railingType = 927
local lampType = 1103
--]]

-- 游戏创建时、游戏运行时，这两个事件，在云服都会失效的，触发器的不行，脚本的待确认
-- 请问云服房间的房间名称变颜色和闪烁是如何办到的？
-- #c+颜色代码
-- #b+文字就是闪烁效果
-- ”#R#b你好“→得到一个红色闪烁效果的“你好”



--进入游戏
-- 1、挖空40*40*log10
-- 2、建透明墙
-- 3、建中间色块（是否在倒计时中建造？）
-- 4、开启倒计时
function gameStart() 
    print("gameStart")
    -- 启动倒计时
    if (startTimerRet == ErrorCode.OK) then
        MiniTimer:startBackwardTimer(gameStartTimerId  ,startTime , false)
    end
    print("areaResetId="..areaResetId)
    print("areaTopId="..areaTopId)
    print("areaSnowId="..areaSnowId)
    
-- Player:setAttr(0, 14, 100)

-- 需要生成后，不重置，再添加鞍，就可以骑乘
-- local ret,objids=World:spawnCreature(-1,7,-25,3448,1)
-- local ret,objids=World:spawnCreature(-3,7,-25,3450,1)
-- local ret,objids=World:spawnCreature(-20,7,-25,3452,1)
-- local ret,objids=World:spawnCreature(-10,7,-25,3454,1)
-- local ret,objids=World:spawnCreature(-15,7,-25,3463,1)
-- local ret,objids=World:spawnCreature(-25,7,-25,3465,1)
-- local ret,objids=World:spawnCreature(1,7,-25,3467,1)
-- local ret,objids=World:spawnCreature(4,7,-25,3469,1)
-- local ret,objids=World:spawnCreature(13,7,-25,3472,1)
-- local ret,objids=World:spawnCreature(7,7,-25,3474,1)
-- local ret,objids=World:spawnCreature(9,7,-25,3476,1)
-- local ret,objids=World:spawnCreature(11,7,-25,3478,1)


--[[
-- 生成围栏与灯
-- z=-20
for x = -18, 19 do
        Block:replaceBlock(927,x,7,-20,FACE_DIRECTION.DIR_POS_Y)
end
Block:replaceBlock(927,-18,8,-20,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(927,19,8,-20,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,-18,9,-20,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,19,9,-20,FACE_DIRECTION.DIR_POS_Y)

for x = -18, 19 do
        Block:replaceBlock(927,x,7,21,FACE_DIRECTION.DIR_POS_Y)
end
Block:replaceBlock(927,-18,8,21,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(927,19,8,21,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,-18,9,21,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,19,9,21,FACE_DIRECTION.DIR_POS_Y)

for z = -18, 19 do
        Block:replaceBlock(927,-20,7,z,FACE_DIRECTION.DIR_POS_Y)
end
Block:replaceBlock(927,-20,8,-18,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(927,-20,8,19,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,-20,9,-18,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,-20,9,19,FACE_DIRECTION.DIR_POS_Y)

for z = -18, 19 do
        Block:replaceBlock(927,21,7,z,FACE_DIRECTION.DIR_POS_Y)
end
Block:replaceBlock(927,21,8,-18,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(927,21,8,19,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,21,9,-18,FACE_DIRECTION.DIR_POS_Y)
Block:replaceBlock(1103,21,9,19,FACE_DIRECTION.DIR_POS_Y)
--]]

-- 替换草块，上方
--[[
for x = -32, 31 do 
    for z =-32, -20 do
        Block:replaceBlock(topBlockColor,x,6,z,FACE_DIRECTION.DIR_POS_Y)
    end
end

for x = -32, 31 do 
    for z =21, 31 do
        Block:replaceBlock(topBlockColor,x,6,z,FACE_DIRECTION.DIR_POS_Y)
    end
end

for x = -32, -20 do 
    for z =-19, 20 do
        Block:replaceBlock(topBlockColor,x,6,z,FACE_DIRECTION.DIR_POS_Y)
    end
end

for x = 21, 31 do 
    for z =-19, 20 do
        Block:replaceBlock(topBlockColor,x,6,z,FACE_DIRECTION.DIR_POS_Y)
    end
end

-- z=-20
for x = -20, 20 do
    for y = 2, 5 do 
        Block:replaceBlock(sideBlockColor,x,y,-20,FACE_DIRECTION.DIR_POS_Y)
    end
end

-- z=21
for x = -20, 21 do
    for y = 2, 5 do 
        Block:replaceBlock(sideBlockColor,x,y,21,FACE_DIRECTION.DIR_POS_Y)
    end
end

-- x=-20
for z = -19, 20 do
    for y = 2, 5 do 
        Block:replaceBlock(sideBlockColor,-20,y,z,FACE_DIRECTION.DIR_POS_Y)
    end
end

-- x=21
for z = -19, 21 do
    for y = 2, 5 do 
        Block:replaceBlock(sideBlockColor,21,y,z,FACE_DIRECTION.DIR_POS_Y)
    end
end


-- 底面
for x = -19, 20 do 
    for z =-19, 20 do
        Block:replaceBlock(bottomBlockColor,x,1,z,FACE_DIRECTION.DIR_POS_Y)
    end
end
--]]

end
ScriptSupportEvent:registerEvent([=[Game.Start]=], gameStart)




local colorBaseId = 666 --对应白色
local colorNameArr = {"白色", "橙色", "紫红", "淡蓝", "黄色", "淡绿", "粉色", "灰色", "淡灰", "青色", "紫色", "蓝色", "褐色", "绿色", "红色", "黑色"}
-- 实际对应颜色 ==== {"白色", "橙色", "粉色", "灰色", "青色", "紫色", "蓝色", "绿色", "红色", "黑色"}

local colorSelectIdArr = {118, 668, 671, 673, 676, 677, 678, 680, 681, 682}
-- local colorChangeNameArr = {"橙色", "黄色", "粉色", "灰色", "青色", "紫色", "蓝色", "绿色", "红色", "黑色"}
-- local colorChangeId = {2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011} --118
local colorIdArr = {}
local sColorId = 0
-- 生成颜色区块 ，电脑端测试会卡顿1s
function generatAreaColor() 
    local index = 0
    for x = -15, 16, 4 do 
        for z = -15, 16, 4 do
            local colorId = colorSelectIdArr[math.random(2, 10)]
            -- local colorId = colorChangeId[math.random(1, 10)]
            -- local colorId = math.random(2012, 2021)
            index = index + 1
            colorIdArr[index] = colorId
            generatLayerBlock(x, z, x+3, z+3, 5, colorId)
            -- generatAreaBlock(x, z, x+3, z+3, 5, colorId)
        end
    end
    sColorId = colorIdArr[math.random(1, 32)]
    -- local blockret, blockdata = Block:getBlockData(-14,5,-14)
    -- Chat:sendChat('blockret>'..blockret)
    -- Chat:sendChat(blockdata)
    -- print('blockdata: '..blockdata)
    print('保留颜色id '..sColorId)
end



-- 生成带星云团颜色区块 ，电脑端测试会卡顿1s
-- attention
function generatAreaColorTwo(percent) 
    local index = 0
    for x = -15, 16, 4 do 
        for z = -15, 16, 4 do
            local colorOffset = math.random(2, (10+percent))
            if (colorOffset > 10) then
                colorOffset = 1
            end
            local colorId = colorSelectIdArr[colorOffset]
            index = index + 1
            colorIdArr[index] = colorId
            generatLayerBlock(x, z, x+3, z+3, 5, colorId)
            -- generatAreaBlock(x, z, x+3, z+3, 5, colorId)
        end
    end
    repeat 
        sColorId = colorIdArr[math.random(1, 56)]
    until(sColorId ~=118)
    print('保留颜色id '..sColorId)
    -- Chat:sendChat('保留颜色id '..sColorId)
end


-------------------------------------------------发光方块------------------------------------------------------------
local lightColorBaseId = 2
-- local lightColorNameArr = {"云团", "橙色", "黄色", "青色", "紫色", "蓝色", "绿色", "红色", "黑色"}
-- local lightColorIdArr = {118, 863, 866, 871, 872, 873, 875, 876, 877}

local lightColorNameArr = {"云团", "橙色", "黄色", "青色", "紫色", "蓝色", "绿色", "红色", "黑色"}
local lightColorIdArr = {118, 271, 410, 676, 450, 408, 409, 681, 682}

local function generatAreaColorLight(percent) 
    local index = 0
    for x = -15, 16, 4 do 
        for z = -15, 16, 4 do
            local colorOffset = math.random(2, (9+percent))
            if (colorOffset > 9) then   --只有8个色+云团
                colorOffset = 1
            end
            local colorId = lightColorIdArr[colorOffset]
            index = index + 1
            colorIdArr[index] = colorId
            generatLayerBlock(x, z, x+3, z+3, 5, colorId)
            -- generatAreaBlock(x, z, x+3, z+3, 5, colorId)
        end
    end
    repeat 
        sColorId = colorIdArr[math.random(1, 48)]
    until(sColorId ~=118)
    print('保留颜色id '..sColorId)
    --找出保留颜色在数组中位置
    for i = 2, 9 do
        if (sColorId == lightColorIdArr[i]) then
            lightColorBaseId = i
            break
        end
    end
    -- Chat:sendChat('保留颜色id '..sColorId)
end


-- 提示颜色墙
function displayColorTips(colorId) 
    generatBlock(-1, 7, -18, 2, 10, -18, colorId)
    generatBlock(-1, 7, 19, 2, 10, 19, colorId)
    generatBlock(-18, 7, -1, -18, 10, 2, colorId)
    generatBlock(19, 7, -1, 19, 10, 2, colorId)

end


-- 创建掉落区域 -- 实测会出现多个区域id？
-- function dropArea() 
--   local ret, areaid = Area:createAreaRectByRange({x=-19, y=3, z=-19}, {x=20, y=3, z=20})
--   return areaid
-- end

local test = false
-- 最小要跳次数
local limitTimes = 8
local roundPlayerNum = 0
-- 每过一段时间缩少提示时长
local changeTime = 0
-- local playerAction = 1
local jumpPower = 1
local currentPlayerNum = 1
-- 当前局数
local currentRound = 0
-- 扣除数量
local dropHp = 10
-- 烟花位置
local firePosDir = true

-- local worldTime = 8


-- 优化第一局时间提示
function timeChangeNew(event_args) 
    local res, currentTime = MiniTimer:getTimerTime(gameStartTimerId)
    -- print('timer '..currentTime)
    
    --如果开始了游戏，倒计时结束，开始变换色块
    if (isStartBlock) then 
        if (currentTime < (10-changeTime) and currentTime >4 and lastTime ~= currentTime ) then
            lastTime = currentTime
            --显示飘窗
            notifyAllPlayer(colorNameArr[sColorId - colorBaseId]..(currentTime-5))
        end   
        if (currentTime == (9-changeTime)) then
            displayColorTips(sColorId)
        elseif (currentTime == 4) then
            destroyColor()
        elseif (currentTime == 2) then
            
            local rPlayers, rPlayerId = checkPlayers()    
            if (rPlayers == 0) then 
                -- 如果没有玩家，结束当局，没有胜利者
                notifyAllPlayer("本局没有胜利者")
                notifyRound(' ')
                -- 重启倒计时
                MiniTimer:changeTimerTime(gameStartTimerId, 12)
                displayColorTips(1081)  -- 1081,airWall
                isStartBlock = false
            -- elseif (rPlayers == 1 and currentRound > limitTimes and currentPlayerNum > 1) then
            elseif (rPlayers == 1 and currentRound > limitTimes) then  
 
                displayColorTips(1081)  -- 1081,airWall
                local getNicknameRet, nickName = Player:getNickname(rPlayerId)
                notifyRound(' ')
                notifyAllPlayer('本局胜利者是 '..nickName)
                Chat:sendSystemMsg('本局胜利者是 '..nickName)
                replaceWinnerOut(rPlayerId)

                Player:playAct(rPlayerId, 6)    --做动作
                Actor:playBodyEffectById(rPlayerId,1339,1)  --添加特效
                
                MiniTimer:changeTimerTime(gameStartTimerId, 12) 
                isStartBlock = false
            else 
                -- 如果多于一个玩家，重新生成方块
                generatAreaColorTwo(currentRound/3)
                
            end

        elseif (currentTime == 1) then
            
            currentRound = currentRound + 1
            if (currentRound == 5) then
                changeTime = 1
                dropHp = 8
            elseif (currentRound == 10) then
                changeTime = 2
                dropHp = 5
            end
            if (roundPlayerNum > 1) then
                notifyRound('第 '..currentRound..' 关')
            end
            MiniTimer:changeTimerTime(gameStartTimerId, roundTime - changeTime)
        end
            
    elseif (res == ErrorCode.OK) then 
        --计时器有时会返回两次相同时间
        
        if (currentTime < 7 and currentTime >2 and lastTime ~= currentTime ) then
            lastTime = currentTime
            --显示飘窗
            notifyAllPlayer('准备开始'..(currentTime-2))
        end
    
        if (currentTime == 3) then 
            
            mountPlayerDown()
            
            currentRound = 1
            dropHp = 10
            generatAreaColor()
            
        elseif (currentTime == 2) then 
            roundPlayerNum = replacePlayerIn() 
            if (roundPlayerNum > 1) then 
                limitTimes = 6 --如果多个玩家，减少胜利最少局数
            else 
                limitTimes = 10 
            end
            changeTime = 0
            if (roundPlayerNum >1) then
                notifyRound('第 '..currentRound..' 关')
            else 
                notifyRound(' ')
            end
            MiniTimer:changeTimerTime(gameStartTimerId, 11)
            -- notifyAllPlayer(' ')
            Chat:sendSystemMsg("准备开始")
            isStartBlock = true; 
            
        end
    end 
end


-- 夜场------------------------------------------------------------------------------
function timeChangeLight(event_args) 
    local res, currentTime = MiniTimer:getTimerTime(gameStartTimerId)
    -- print('timer '..currentTime)
    
    --如果开始了游戏，倒计时结束，开始变换色块
    if (isStartBlock) then 
        if (currentTime < (10-changeTime) and currentTime >4 and lastTime ~= currentTime ) then
            lastTime = currentTime
            --显示飘窗
            notifyAllPlayer(colorNameArr[sColorId - colorBaseId]..(currentTime-5))
            -- notifyAllPlayer(lightColorNameArr[lightColorBaseId]..(currentTime-5)) --------------------------------
        end   
        if (currentTime == 4) then
           
            destroyColor()
            
        elseif (currentTime == (9-changeTime)) then
            
            displayColorTips(sColorId)
        elseif (currentTime == 2) then
            
            
            local rPlayers, rPlayerId = checkPlayers()    
            if (rPlayers == 0) then 
                -- 如果没有玩家，结束当局，没有胜利者
                notifyAllPlayer("本局没有胜利者")
                notifyRound(' ')
                -- 重启倒计时
                MiniTimer:changeTimerTime(gameStartTimerId, 12)
                displayColorTips(1081)  -- 1081,airWall
                isStartBlock = false
            -- elseif (rPlayers == 1 and currentRound > limitTimes and currentPlayerNum > 1) then
            elseif (rPlayers == 1 and currentRound > limitTimes) then  
 
                displayColorTips(1081)  -- 1081,airWall
                local getNicknameRet, nickName = Player:getNickname(rPlayerId)
                notifyRound(' ')
                notifyAllPlayer('本局胜利者是 '..nickName)
                Chat:sendSystemMsg('本局胜利者是 '..nickName)
                replaceWinnerOut(rPlayerId)

                Player:playAct(rPlayerId, 6)    --做动作
                -- Actor:playBodyEffectById(rPlayerId, 1300, 2)  --添加特效
                Actor:playBodyEffectById(rPlayerId,1339,1)  --添加特效
                
                MiniTimer:changeTimerTime(gameStartTimerId, 22) --------------------------------
                isStartBlock = false
            else 
                -- 如果多于一个玩家，重新生成方块
                generatAreaColorTwo(currentRound/3) --------------------------------
                -- generatAreaColorLight(currentRound/3)   --------------------------------
                
            end

        elseif (currentTime == 1) then
            
            currentRound = currentRound + 1
            if (currentRound == 5) then
                changeTime = 1
                dropHp = 8
            elseif (currentRound == 10) then
                changeTime = 2
                dropHp = 5
            end
            notifyRound('第 '..currentRound..' 关')
            MiniTimer:changeTimerTime(gameStartTimerId, roundTime - changeTime/2)
        end
            
    elseif (res == ErrorCode.OK) then 
        --计时器有时会返回两次相同时间
        
        if (currentTime < 7 and currentTime >2 and lastTime ~= currentTime ) then
            lastTime = currentTime
            --显示飘窗
            notifyAllPlayer('准备开始'..(currentTime-2))
            -- worldTime = worldTime + 1
            -- GameRule.CurTime = worldTime
        end
    
        if (currentTime == 3) then 
            currentRound = 1
            dropHp = 10
            
            World:setBlockLightEx(20, 7, -24, 10)
            
            
            -- GameRule.CurTime = 12-------------------------
            
            generatAreaColor() -- 生成color  -------------------------------------------------------------------------------------------------------------
            -- generatAreaColorLight(0)  ---------------------------------------
        elseif (currentTime == 2) then 
            GameRule.TimeLocked = true
            roundPlayerNum = replacePlayerIn() 
            -- roundPlayerNum = 0
            if (roundPlayerNum > 1) then 
                limitTimes = 6 --如果多个玩家，减少胜利最少局数
            else 
                limitTimes = 4 -------------------------------------
            end
            changeTime = 0
            notifyRound('第 '..currentRound..' 关')
            MiniTimer:changeTimerTime(gameStartTimerId, 11) 
            -- notifyAllPlayer(' ')
            Chat:sendSystemMsg("准备开始")
            isStartBlock = true; 
            
        end
        
        if (currentTime == 22) then
            GameRule.TimeLocked = false
            return res
        end
        if (currentTime == 21) then
            -- worldTime = 8
            GameRule.CurTime = 22  -----------------------------------
            if (firePosDir) then
                firePosDir = false
            else
                firePosDir = true
            end
            return res
        end
        if (currentTime == 19 or currentTime == 18) then
            -- get roomer id

            local ret1, localPlayerId = Player:getMainPlayerUin()
            -- local actorRet, actorX, actorY, actorZ = Actor:getPosition(localPlayerId)
            -- playFireworks(localPlayerId)

        end
    end 
end
--事件系统->游戏逻辑minitimer.change，返回计时器id与name，{timeid, timename}
ScriptSupportEvent:registerEvent([=[minitimer.change]=], timeChangeNew)


function setPlayerJumpPower()
    jumpPower = jumpPower +1
    -- Player:setAttr(0, 14, 20)
end


-- 检查还有多少玩家在场中间
function checkPlayers() 
    local tempPlayer = 0
    local tempPlayerId = 0
    local playerRet,playerNum,playerIdArray=World:getAllPlayers(-1)
    for i, playerId in ipairs(playerIdArray) do
        local actorRet, actorX, actorY, actorZ = Actor:getPosition(playerId)
        if (actorX > -17 and actorX < 18 and actorZ >-17 and actorZ <18 and actorY < 10 ) then
            tempPlayer = tempPlayer +1
            tempPlayerId = playerId
        end
    end
    return tempPlayer, tempPlayerId
        
end

-- 记录使用复活牛奶id
local milkPlayerArr = {}
local milkPlayerIndex = 1

--倒计时结束后把玩家传送到主场景某一位置
replacePlayerIn = function() 
    -- local ret1, localPlayerId = Player:getMainPlayerUin()
    -- 清空复活记录
    for i=1, milkPlayerIndex, 1 do 
        milkPlayerArr[i] = -1
    end
    milkPlayerIndex = 1
    local playerNum1 = 0
    local playerRet,playerNum3,playerIdArray=World:getAllPlayers(-1)
    for i, objid in ipairs(playerIdArray) do 
        local hpRet, hpValue = Player:getAttr(objid, 2)
        if (hpValue < 40) then 
            Player:notifyGameInfo2Self(objid, '#R生命值过低无法比赛')
        else 
            local x = math.random(-13, 14)   
            local z = math.random(-13, 14)   
            local y = 10
            
            -- Actor:mountActor(objid, 3478, 0) -----------------------------------
            Player:mountActor(objid)
            
            Player:setPosition(objid, x, y, z)
            playerNum1 = playerNum1 +1
        end
    end
    return playerNum1
end  

-- 把玩家脱离坐骑
function mountPlayerDown()
    local playerRet,playerNum3,playerIdArray=World:getAllPlayers(-1)
    for i, playerId in ipairs(playerIdArray) do
        Player:mountActor(playerId)
    end
end


-- 玩家失败时随机变成一种生物
-- local buffArr = {1003, 1004, 1005, 1007}
function changeBuff(playerId) 
    -- local buff = buffArr[math.random(1,4)]
    -- 最后一个参数是时长，应该是50ms为单位
    -- Actor:addBuff(playerId, buff, 2, 40)
    Player:playAct(playerId, 9)
end


--把winner传送到外围某一位置
local winnerPlaceX = {19, 16, 10}
replaceWinnerOut = function(objid) 

    local x = winnerPlaceX[math.random(1, 3)]
    -- local z = math.random(-29, -22)
    Player:setPosition(objid, 19, 12, -24)
    
--[[
    local hpRet, hpValue = Player:getAttr(objid,2)
    local foodRet, foodValue = Player:getFoodLevel(objid)
   
    -- 恢复15点
    if (hpValue > 85) then
        Player:setAttr(objid, 2, 100)
    else 
        Player:setAttr(objid, 2, hpValue + 15)
    end
    -- resume 5
    if (foodValue < 95) then
        Player:setFoodLevel(objid, foodValue + 5)
    else
        Player:setFoodLevel(objid, 100)
    end
--]]
    Actor:removeBuff(objid, 8)
end 


--把玩家传送到外围某一位置
replacePlayerOut = function(objid) 
    local x = math.random(10, 24)
    local z = math.random(-27, -22)
    Player:setPosition(objid, x, 10, z)
    -- Player:setPosition(objid, 19, 10, -24)
end


--复活玩家位置，考虑掉下去的时候，是否已消失了？
local function replacePlayerResume(objid) 
    for x = -15, 16, 4 do 
        for z = -15, 16, 4 do
            local getBlockIdRet, blockId = Block:getBlockID(x,5,z)
            if (blockId == sColorId) then
                Player:setPosition(objid, x+2, 7, z+2)
                milkPlayerArr[milkPlayerIndex] = objid
                milkPlayerIndex = milkPlayerIndex + 1
            end
        end
    end
end


local itemArr = {12573, 12054, 12057}
--当玩家进入区域时会执行此函数--------------------------------------------------------------------
local function Player_AreaIn(event)
	--数据超出chat的显示范围，改用print，可在右上感叹号里查脚本log
	print("玩家进入区域")
	print(event.areaid)
	print(event.eventobjid)
	if (event.areaid == areaResetId) then
	    
	    -- 判断复活，
	    -- 1、先判断是否有使用过（数组保存玩家id）
	    local isUseMilk = false
	    for i=1, milkPlayerIndex, 1 do
	        if (event.eventobjid == milkPlayerArr[i]) then
                isUseMilk = true
                break
	        end
        end
	    -- 2、如果没有使用，再判断是否拥有
	    if (not(isUseMilk)) then 
    	    
    	    local glassRet, glassNum = Backpack:removeGridItemByItemID(event.eventobjid, 11320, 1)
    	    if (glassRet == ErrorCode.OK and glassNum == 1) then
    	        replacePlayerResume(event.eventobjid)
    	        return event.areaid
    	    end
	    end

	    
	    replacePlayerOut(event.eventobjid)
        Actor:stopBodyEffectById(event.eventobjid, 1339)
        changeBuff(event.eventobjid)
        
        -- 每次扣dropHp，低于60时迟缓buff
        local hpRet, hpValue = Player:getAttr(event.eventobjid, 2)
        -- local foodRet, foodValue = Player:getFoodLevel(event.eventobjid)
        if (hpValue > 59) then
            -- Player:setAttr(event.eventobjid, 2, hpValue - dropHp)
            -- if (foodValue >10) then
            --     Player:setFoodLevel(event.eventobjid, foodValue - 1)
            -- end
            return event.areaid
        end
        
        if (hpValue > 39) then
            -- Player:setAttr(event.eventobjid, 2, hpValue - dropHp)
            -- Actor:addBuff(event.eventobjid, 8, 2, 3000)
        else 
            -- Player:setAttr(event.eventobjid, 2, 1)  -- 最小hp
            -- Actor:addBuff(event.eventobjid, 8, 2, 3000)
        end
        return event.areaid
	end
	
	if (event.areaid == areaSnowId) then
        print("snow")
        -- local result,num=Backpack:removeGridItemByItemID(event.eventobjid,12054,2)
        -- Player:gainItems(event.eventobjid, 12054, 2, 1)
        return event.areaid
	end

    if (event.areaid == areaTopId) then
        print("toptop")
        -- local result,num=Backpack:removeGridItemByItemID(event.eventobjid,12057,1)
        -- Player:gainItems(event.eventobjid, 12057, 1, 1)
        
        setLightArea()
        return event.areaid
    end
end
--注册监听器，玩家进入区域时执行Player_AreaIn函数
ScriptSupportEvent:registerEvent([=[Player.AreaIn]=],Player_AreaIn)


-- 玩家属性值改变
local function playerAttrChange(event)
    print('playerAttrChange: '..event.playerattr)
    
    if (event.playerattr == 2 ) then
        local hpRet, hpValue = Player:getAttr(event.eventobjid, 2)
        if (hpValue > 59) then -- 当hp为60+时，去掉迟缓
            Actor:removeBuff(event.eventobjid, 8)
        end
    end
        
end
ScriptSupportEvent:registerEvent([=[Player.ChangeAttr]=], playerAttrChange)



--玩家使用道具 ，玩家只要一使用就回调
local function playerUseItem(event)
    print('playerUseItem itemid'..event.itemid)
    print('playerUseItem itemnum'..event.itemnum)
end
-- ScriptSupportEvent:registerEvent([=[Player.UseItem]=], playerUseItem)

-- 玩家消耗道具，要玩家没了这个道具，比如吃掉
local function playerConsumeItem(event)
    print('playerConsumeItem itemid'..event.itemid)
    Actor:removeBuff(event.eventobjid, 8) -- 只要使用了就会去掉不好的
end
ScriptSupportEvent:registerEvent([=[Player.ConsumeItem]=], playerConsumeItem)


-- 玩家看广告，新增道具
local function Player_AddItem(event)
-- 	Chat:sendSystemMsg("参数itemid为:"..event.itemid)

	-- 如果看广告时进场了，看完后送回场外
	if (event.itemid == 11320 or event.itemid == 12517 or event.itemid == 12540 or event.itemid == 12543) then
        local actorRet, actorX, actorY, actorZ = Actor:getPosition(event.eventobjid)
        if (actorX > -16 and actorX < 17 and actorZ >-16 and actorZ <17 ) then
            replacePlayerOut(event.eventobjid)
        end
    end
end
--注册监听器，新增道具时执行Player_AddItem函数
--第一个参数是监听的事件，第二个参数Player_AddItem即事件发生时执行的函数
ScriptSupportEvent:registerEvent([=[Player.AddItem]=],Player_AddItem)



---------------------------------放烟花--------------------------------------
-- local fireworksEndPointArr = {{-10, 40, 5}, {-15, 42, 11},{-2, 39, 8}, {-7, 46, 23}, {5, 50, 11}, {11, 38, 16}, {20, 51, 17}, {16, 44, 22}}
--[[
local function playFireworks(objid)
    
    -- local endPoint = fireworksEndPointArr[math.random(1,8)]
    local fireNum = math.random(3, 6)
    local epX = math.random(-15, 18)
    local epY = math.random(39, 45)
    local epZ = math.random(5, 15)
    Chat:sendSystemMsg('play  Fireworks'..epZ)
    -- local result = World:spawnProjectile(objid, 12836, 0, 10, 0, 0, 50, 0, 200) 
    -- local result = World:spawnProjectileByDir(objid, 12836, 0, 8, 25, endPoint[1], endPoint[2], endPoint[3], 100) 
    -- for i = 1, fireNum do
    if (firePosDir) then
        World:spawnProjectileByDir(objid, 12836, 0, 9, -20+fireNum, epX, epY, epZ, 100)
        World:spawnProjectileByDir(objid, 12837, fireNum, 9, -25-fireNum, epX+fireNum, epY-fireNum, epZ, 100)
        World:spawnProjectileByDir(objid, 12838, epZ, 9, -25, epX-fireNum, epY+fireNum, epZ, 100)
    else
        World:spawnProjectileByDir(objid, 12836, 0, 9, 20+fireNum, epX, epY, epZ, 100)
        World:spawnProjectileByDir(objid, 12837, fireNum, 9, 25-fireNum, epX+fireNum, epY-fireNum, epZ, 100)
        World:spawnProjectileByDir(objid, 12838, epZ, 9, 25, epX-fireNum, epY+fireNum, epZ, 100)
    end
    -- World:spawnProjectileByDir(objid, 12836, 0, 9, 20+fireNum, epX, epY, epZ, 100)
    -- World:spawnProjectileByDir(objid, 12837, fireNum, 9, 25-fireNum, epX+fireNum, epY-fireNum, epZ, 100)
    -- World:spawnProjectileByDir(objid, 12838, -2, 9, 25, epX-fireNum, epY+fireNum, epZ, 100)
    -- World:spawnProjectileByDir(objid, 12837, 0, 8, 25, endPoint[1], endPoint[2], endPoint[3], 100)
    -- World:spawnProjectileByDir(objid, 12838, 0, 8, 25, endPoint[1], endPoint[2], endPoint[3], 100)
    -- World:spawnProjectileByDir(objid, 12836, 0, 8, 25, endPoint[1], endPoint[2], endPoint[3], 100)
end


--生成烟花终点方块，烟花碰撞会自动爆
local function FireworksEndPoint()
    -- for i =1, 5 do
    --     Block:placeBlock(104, fireworksEndPointArr[i][1], fireworksEndPointArr[i][2], fireworksEndPointArr[i][3],FACE_DIRECTION.DIR_POS_Y)
    -- end
    
end

--]]

--------------------------------------------设置场内亮度---------------------------
function setLightArea()
    for x = -16, 17, 1 do 
        for z = -16, 17, 1 do
            World:setBlockLightEx(x, 6, z, 15)
        end
    end
    
    World:setBlockLightEx(1, 8, -17, 15)  
    World:setBlockLightEx(1, 8, 18, 15) 
    World:setBlockLightEx(-17, 8, 1, 15) 
    World:setBlockLightEx(18, 8, 1, 15) 
end





-------------------------------------------------------------------------------------------------------------
-- 玩家进入游戏
local function playerEnter(event)
    local playerRet,playerNum4,playerIdArray=World:getAllPlayers(-1)
    -- Chat:sendSystemMsg('enter:'..playerNum4)
    -- Player:setAtt(event.eventobjid, 16, 1)
    -- print('enter:'..playerNum4)
    currentPlayerNum = playerNum4
end
ScriptSupportEvent:registerEvent([=[Game.AnyPlayer.EnterGame]=], playerEnter)



-- 玩家退出游戏
local function playerLeave(event)
    local playerRet,playerNum5,playerIdArray=World:getAllPlayers(-1)
    -- Chat:sendSystemMsg('playerLeave:'..playerNum5)
    currentPlayerNum = playerNum5
    -- print('playerLeave:'..playerNum5)
end
ScriptSupportEvent:registerEvent([=[Game.AnyPlayer.LeaveGame]=], playerLeave)





-- 保留其中一种颜色 -- 是否可以使用区域接口，https://developers.mini1.cn/wiki/area.html#clearallblockarearange
function destroyColor() 
    for x = -15, 16, 4 do 
        for z = -15, 16, 4 do
            local getBlockIdRet, blockId = Block:getBlockID(x,5,z)
            if (blockId ~= sColorId) then
                destroyLayer(x, z, x+3, z+3, 5)
                -- generatLayerBlock(x, z, x+3, z+3, 5, 2001) -- 通过自定义玻璃块，不能实现相应效果
            end
        end
    end
end

-- -------------------------------------------------------------
-- 对所有玩家显示飘窗文字
local ss="\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"  -- 用于最后的时间换行到屏幕外？
function notifyAllPlayer(info)
    local playerRet2,playerNum2,playerIdArray2 = World:getAllPlayers(-1)
    for i, playerId in ipairs(playerIdArray2) do
        Player:notifyGameInfo2Self(playerId, info)
    end
    -- 使用时间的倒数要及时清除
    -- MiniTimer:showTimerTips(playerIdArray2, gameStartTimerId, "\n"..info..ss, true)
end


-- 显示提示第几局 --v14
function notifyRound(info)------------------------------20210205上线------------------------------
    local playerRet2,playerNum2,playerIdArray2 = World:getAllPlayers(-1)
    MiniTimer:showTimerTips(playerIdArray2, gameStartTimerId, info..ss, true)
end





--清除区域block
function destroy_area(xbegin, ybegin, zbegin, xend, yend, zend) 
    for x = xbegin, xend do
        for z = zbegin, zend do
            for y = ybegin, yend do 
                Block:destroyBlock(x, y, z, false)
            end
        end
    end
end

--清除一层block
function destroyLayer(xbegin, zbegin, xend, zend, y) 
    for x = xbegin, xend do
        for z = zbegin, zend do
            Block:destroyBlock(x, y, z, false)
        end
    end
end  

-- 生成block
generatBlock = function(xbegin, ybegin, zbegin, xend, yend, zend,blockId)
    for x = xbegin, xend, 1 do 
        for z = zbegin, zend, 1 do
            for y = ybegin, yend, 1 do
                Block:replaceBlock(blockId, x, y, z, FACE_DIRECTION.DIR_POS_Y)
            end
        end
    end
end 

-- 生成一层block
generatLayerBlock = function(xbegin, zbegin, xend, zend, y, blockId)
    for x = xbegin, xend, 1 do 
        for z = zbegin, zend, 1 do
            Block:replaceBlock(blockId, x, y, z, FACE_DIRECTION.DIR_POS_Y)
        end
    end
end 


-- 通过区域接口控制block，不会替换原来的block
function generatAreaBlock(xbegin, zbegin, xend, zend, yh, blockId)
    Area:fillBlockAreaRange({x=xbegin, y=yh, z=zbegin}, {x=xend, y=yh, z=zend}, blockId, FACE_DIRECTION.DIR_POS_Y)    
end