--init.lua
print("set up wifi mode")
wifi.setmode(wifi.STATION)
wifi.sta.config("MYSSID","pwd")--ssid and password
--here SSID and PassWord should be modified according your wireless router
wifi.sta.connect()

local cnt = 0
tmr.alarm(3, 1000, 1, function() 
if (wifi.sta.getip() == nil) and (cnt < 20) then 
       print("Trying Connect to Router, Waiting...")
         cnt = cnt + 1 
    else 
       tmr.stop(3)
       if (cnt < 20) then print("Config done, IP is "..wifi.sta.getip())
        else print("Wifi setup time more than 20s, Please verify wifi.sta.config() function. Then re-download the file.")
      end
        cnt = nil;
          collectgarbage();
        dofile("runtime.lua");
      end 
       end)
       
