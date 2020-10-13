dofile("config.lua")
dofile("Dht.lua")
dofile("SendData.lua")
----dofile("sayCommand.lua")

bLive=0
bOnLine=0

gpio.mode(config.WETPin,gpio.INPUT)
gpio.mode(config.LEDG,gpio.OUTPUT)
gpio.mode(config.LEDR,gpio.OUTPUT)
gpio.mode(config.LEDB,gpio.OUTPUT)

--gpio.write(config.WETPin,gpio.LOW)
gpio.write(config.LEDG,gpio.LOW) 
gpio.write(config.LEDR,gpio.LOW) 
gpio.write(config.LEDG,gpio.LOW) 

cu = net.createConnection(net.TCP)
cu:connect(config.port, config.host)

cu:on("receive", function(cu, c) 
    print(c)
    r = cjson.decode(c)
    --如果存活标记为1,置为0
    if r.M=="isOL" then
        bLive=0 
    end
    tmr.alarm(1, 10000, 1, function()
        --checkin和心跳
        dofile("checkIn.lua")
        --在线后再读取数据,发送年,接收命令
        if bOnLine==1 then
            print("start send data")
            --读取湿度      
            Humi,Temp=ReadDHT(config.DHTPin)         
            --发送数据
            wet = gpio.read(config.WETPin)--read wet data
            sendToBigiot(cu,wet,Humi,Temp)        
            
            
        end
    end)
    --执行命令
    dofile("sayCommand.lua")
end)
