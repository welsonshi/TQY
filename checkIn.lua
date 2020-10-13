--收到连接正常,发送checkin
if r.M == "WELCOME TO BIGIOT" then
    ok, s = pcall(cjson.encode, {M="checkin",ID=config.DEVICEID,K=config.APIKEY})
    if ok then
      print(s)
    else
      print("failed to encode!")
    end
    cu:send( s.."\n" )
    bLive=0
    --定时心跳,防止掉线
    tmr.alarm(2, 40000, 1, function()
        --如果标记为1,表示未收到上次的心跳返回,重启
        if bLive==3 then
            node.restart()
        end
        ok, ticket = pcall(cjson.encode, {M="isOL",ID="D"..config.DEVICEID})
        print(ticket)
        cu:send(ticket.."\n" )
        --发送后将标记置为1
        bLive=bLive+1        
    end)
end
if r.M=="checkinok" then
    bOnLine=1
end