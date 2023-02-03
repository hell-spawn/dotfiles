@echo off
powershell -nologo "& "Get-Content -HEAD 50 (\"%1\").Split(\":\")[0]"