
function ReadDHT(pin)
	dhstatus, temp, humi, temp_dec, humi_dec = dht.read11(pin)
	print("dhstatus:"..dhstatus)
	if dhstatus == dht.OK then		 
		print(string.format("DHT Temperature:%d.%03d;Humidity:%d.%03d\r\n",
		math.floor(temp),
		temp_dec,
		math.floor(humi),
		humi_dec
		))
		--转换实际温度
		realTemp=math.floor(temp)
		--转换实际湿度
		realhumi=math.floor(humi)

        print("temp:"..temp)
        print("humi:"..humi)
        
		return realhumi,realTemp
		
	elseif status == dht.ERROR_CHECKSUM then
		print( "DHT Checksum error." )
	elseif status == dht.ERROR_TIMEOUT then
		print( "DHT timed out." )
	end
end
