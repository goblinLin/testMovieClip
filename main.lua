-----------------------------------------------------------------------------------------
--
-- main.lua
-- 本範例示範如何使用movieclip.lua的function，用以產生連續動畫
-- Author: Zack Lin
-- Time: 2015/4/9
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
display.setStatusBar( display.HiddenStatusBar )

--需放入movieclip.lua，並用require匯入
local movieClip = require( "movieclip" )
local widget = require( "widget" )
--=======================================================================================
--宣告各種變數
--=======================================================================================
_SCREEN = {
	WIDTH = display.viewableContentWidth,
	HEIGHT = display.viewableContentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}
local mc
local btn_play
local btn_stop

local initial
local handleButtonEvent
--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
local main = function (  )
	initial()

end

--=======================================================================================
--定義其他函式
--=======================================================================================
initial = function (  )
	--建立一個新的movieClip，Table元素為圖片組
	mc = movieClip.newAnim({"images/horse-0.gif","images/horse-1.gif","images/horse-2.gif","images/horse-3.gif","images/horse-4.gif","images/horse-5.gif","images/horse-6.gif","images/horse-7.gif"})
    --movieClip停在第一幀
    mc:stopAtFrame(1)
    mc.x = _SCREEN.CENTER.X
    mc.y = _SCREEN.CENTER.Y - 200
    mc.width = 400
    mc.height = 360
    --設定movieClip的速度，越小越慢
    mc:setSpeed(0.3)
  

    btn_play = widget.newButton{
    	id = "play",
    	width = 600,
	    height = 150,
	    defaultFile = "images/btn_normal.png",
	    overFile = "images/btn_over.png",
	    label = "播放",
	    fontSize = 80,
	    onEvent = handleButtonEvent
	}
	btn_play.x = _SCREEN.CENTER.X
	btn_play.y = _SCREEN.CENTER.Y + 100

	btn_stop = widget.newButton{
    	id = "stop",
    	width = 600,
	    height = 150,
	    defaultFile = "images/btn_normal.png",
	    overFile = "images/btn_over.png",
	    label = "停止",
	    fontSize = 80,
	    onEvent = handleButtonEvent
	}
	btn_stop.x = _SCREEN.CENTER.X
	btn_stop.y = _SCREEN.CENTER.Y + 300
end

handleButtonEvent = function ( event )
	if ("play" == event.target.id) then
		--播放movieClip，startFrame為起始的幀數，endFrame為結束幀數，loop為播放次數，0或小於0為無限，remove為播放後是否移除
		mc:play( {startFrame = 1 , endFrame = 8 , loop = 0 , remove = false})
	elseif ( "stop" == event.target.id) then
		mc:stopAtFrame(1)
	end
end
--=======================================================================================
--呼叫主函式
--=======================================================================================
main()