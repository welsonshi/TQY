function sendToBigiot(cu,ledof,humi,temp)

    print(ledof)
    print(humi)
    print(temp)
    
    --ledof = gpio.read(config.WETPin)--read wet data
    if ledof==nil then 
        ledof=0
    end
    

    if humi==nil then 
        humi=0
    end
    
    if temp==nil then
        temp=0
    end


    
    --上报湿度
    local v = {[config.LEDID]=string.format("%d", math.floor(ledof)),[config.TempID]=string.format("%d", math.floor(temp)),[config.HumiID]=string.format("%d",math.floor(humi))}              
    ok3, s3 = pcall(cjson.encode, {M="update",ID=config.DEVICEID,V=v})
    print("send data:"..s3)
    cu:send( s3.."\n")
end
