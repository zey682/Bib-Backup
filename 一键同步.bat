@echo off
chcp 65001
echo ==========================================
echo       JabRef 文献库 Git 自动同步工具
echo ==========================================

echo [1/3] 正在从云端拉取最新修改 (git pull)...
git pull
if %errorlevel% neq 0 (
    echo.
    echo [!!! 严重警告 !!!]
    echo 发现冲突！Git 无法自动合并。
    echo 请不要关闭窗口，截图发给导师或手动修复。
    pause
    exit /b
)

echo.
echo [2/3] 正在添加本地修改 (git add)...
git add .

echo.
echo [3/3] 正在提交并推送 (commit & push)...
set timestamp=%date% %time%
git commit -m "Auto Update: %timestamp%"
git push

echo.
echo ==========================================
echo            同步成功！(Success)
echo ==========================================
timeout /t 5
