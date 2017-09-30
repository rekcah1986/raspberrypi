-- 加上sudo结果才能稳定
local ESSID='DIRECT-JU-BRAVIA' -- TV wifi
--tmp=$(sudo iwlist wlan1 scanning |grep $ESSID)
local ret = io.popen("sudo iwlist wlan1 scanning | grep " .. ESSID)
local a = ret:read("*all")
print(#a)
if(#a == 0) then
	os.exit(0)
else
	os.exit(1)
end
