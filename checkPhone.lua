local IP='192.168.31.237' -- Phone ip in wifi
local ret = io.popen("ping -c1 " .. IP) 
local a = ret:read("*all")
local onLine = string.find(a, "1 received")
if(onLine) then
	print("手机在线")
	os.exit(1)
else
	print("手机不在线")
	os.exit(0)
end
