 --sayCommand.lua
gpio.mode(config.LEDG,gpio.OUTPUT)
gpio.mode(config.LEDR,gpio.OUTPUT)
gpio.mode(config.LEDB,gpio.OUTPUT)

if r.M == "say" then	 
	local commander=r.C	
	if commander == "play" then  
        print("play:LEDG turn on!")	
		gpio.write(config.LEDG,gpio.LOW) 
		ok, played = pcall(cjson.encode, {M="say",ID=r.ID,C="play:LEDG turn on!"})
		cu:send( played.."\n" )
	elseif commander == "stop" then 
        print("stop:LEDG turn off!")     	
		gpio.write(config.LEDG,gpio.HIGH)
		ok, stoped = pcall(cjson.encode, {M="say",ID=r.ID,C="stop:LEDG turn off!"})
		cu:send( stoped.."\n" )	 
   elseif commander == "up" then 
        print("up:LEDR turn on!") 
        gpio.write(config.LEDR,gpio.LOW)
        ok, uped = pcall(cjson.encode, {M="say",ID=r.ID,C="up:LEDR turn on!"})
        cu:send( uped.."\n" )  
   elseif commander == "plus" then  
        print("plus:LEDR turn off!")       
        gpio.write(config.LEDR,gpio.HIGH)
        ok, plused = pcall(cjson.encode, {M="say",ID=r.ID,C="plus:LEDR turn off!"})
        cu:send( plused.."\n" )  
   elseif commander == "pause" then  
        print("pause:LEDB turn on!") 
        gpio.write(config.LEDB,gpio.LOW)
        ok, paused = pcall(cjson.encode, {M="say",ID=r.ID,C="pause:LEDB turn on!"})
        cu:send( paused.."\n" )  
   elseif commander == "right" then 
        print("right:LEDB turn off!")        
        gpio.write(config.LEDB,gpio.HIGH)
        ok, righted = pcall(cjson.encode, {M="say",ID=r.ID,C="right:LEDB turn off!"})
        cu:send( righted.."\n" )  
   elseif commander == "offOn" then 
        print("offOn:LED ALL off!")        
        gpio.write(config.LEDG,gpio.HIGH)
        gpio.write(config.LEDR,gpio.HIGH)
        gpio.write(config.LEDB,gpio.HIGH)
        ok, offOned = pcall(cjson.encode, {M="say",ID=r.ID,C="offOn:LED ALL off!"})
        cu:send( offOned.."\n" ) 
   elseif commander == "minus" then 
        print("minus!!!!!^~^")        
       
        ok, minused = pcall(cjson.encode, {M="say",ID=r.ID,C="minus!!!!!^~^"})
        cu:send( minused.."\n" ) 
   elseif commander == "left" then 
        print("^~^left^~^")        
       
        ok, lefted = pcall(cjson.encode, {M="say",ID=r.ID,C="^~^left^~^"})
        cu:send( lefted.."\n" ) 
   elseif commander == "backward" then 
        print("^~^backward^~^")        
       
        ok, backwarded = pcall(cjson.encode, {M="say",ID=r.ID,C="^~^backward^~^"})
        cu:send( backwarded.."\n" )  
   elseif commander == "down" then 
        print("^~^down^~^")        
       
        ok, downed = pcall(cjson.encode, {M="say",ID=r.ID,C="^~^down^~^"})
        cu:send( downed.."\n" ) 
   elseif commander == "forward" then 
        print("^~^forward^~^")        
       
        ok, forwarded = pcall(cjson.encode, {M="say",ID=r.ID,C="^~^forward^~^"})
        cu:send( forwarded.."\n" )     
	end  
end
