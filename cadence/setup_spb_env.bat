@echo off
setlocal enabledelayedexpansion

echo ============================================
echo Setting up Cadence SPB environment...
echo ============================================

REM 当前脚本所在目录
set SCRIPT_DIR=%~dp0

REM 目标配置目录
set CONFIG_DIR=%USERPROFILE%\.config\cadence
set TARGET_LINK=%CONFIG_DIR%\SPB_data
set SOURCE_DIR=%SCRIPT_DIR%SPB_data

REM 如果目标目录不存在则创建
if not exist "%CONFIG_DIR%" (
    echo Creating directory: %CONFIG_DIR%
    mkdir "%CONFIG_DIR%"
)

REM 如果符号链接已存在则删除
if exist "%TARGET_LINK%" (
    echo Removing existing link: %TARGET_LINK%
    rmdir "%TARGET_LINK%"
)

REM 创建符号链接（需要管理员权限）
echo Creating symbolic link...
mklink /D "%TARGET_LINK%" "%SOURCE_DIR%"
if %errorlevel% neq 0 (
    echo Failed to create symbolic link. Please run this script as Administrator.
    pause
    exit /b 1
)

REM 设置环境变量
setx HOME "%TARGET_LINK%"
echo Environment variable HOME set to %TARGET_LINK%

echo ============================================
echo Installing FanySkill software...
echo ============================================

REM 默认软件名，可修改
set INSTALLER=FanySkill_V2.1.0.exe

REM 如果有其他名字的安装包可以修改此变量
if not exist "%SCRIPT_DIR%%INSTALLER%" (
    echo Installer "%INSTALLER%" not found in %SCRIPT_DIR%.
    echo Please place the installer in the same folder as this script.
    pause
    exit /b 1
)

REM 运行安装程序
echo Running installer...
start "" "%SCRIPT_DIR%%INSTALLER%"

echo ============================================
echo Setup complete.
echo ============================================
pause
