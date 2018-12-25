del /f /s /a lua\*.lua
del /f /s /a csharp\*.cs
del /f /s /a cpp\*.h

lua ..\tools\csvToCppLuaConst.lua

cd cpp
for /f "delims=" %%i in ('dir /b /a-d /o-d "*.h"') do (
	ren %%i %%i_t
	..\..\tools\iconv.exe -f GBK -t UTF-8 %%i_t > %%i
	del %%i_t
)
cd ..

cd csharp
for /f "delims=" %%i in ('dir /b /a-d /o-d "*.cs"') do (
	ren %%i %%i_t
	..\..\tools\iconv.exe -f GBK -t UTF-8 %%i_t > %%i
	del %%i_t
)
cd ..

cd js
for /f "delims=" %%i in ('dir /b /a-d /o-d "*.js"') do (
	ren %%i %%i_t
	..\..\tools\iconv.exe -f GBK -t UTF-8 %%i_t > %%i
	del %%i_t
)
cd ..

cd lua
for /f "delims=" %%i in ('dir /b /a-d /o-d "*.lua"') do (
	ren %%i %%i_t
	..\..\tools\iconv.exe -f GBK -t UTF-8 %%i_t > %%i
	del %%i_t
)
cd ..
