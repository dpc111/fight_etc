del /f /s /a lua\*.lua

lua ..\tools\csvToLuaTable.lua

cd lua
for /f "delims=" %%i in ('dir /b /a-d /o-d "*.lua"') do (
	ren %%i %%i_t
	..\..\tools\iconv.exe -f GBK -t UTF-8 %%i_t > %%i
	del %%i_t
)
cd ..