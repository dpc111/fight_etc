del /f /s /a json\*.json

lua ..\tools\csvToJson.lua

cd json
for /f "delims=" %%i in ('dir /b /a-d /o-d "*.json"') do (
	ren %%i %%i_t
	..\..\tools\iconv.exe -f GBK -t UTF-8 %%i_t > %%i
	del %%i_t
)
cd ..