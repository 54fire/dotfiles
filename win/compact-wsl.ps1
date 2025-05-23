# 需要图形界面的对话框支持
Add-Type -AssemblyName System.Windows.Forms

# Write-Output "Shutdown WSL2"
# wsl -e sudo fstrim /
# wsl --shutdown

# 打开文件选择对话框，默认过滤 ext4.vhdx
$dialog           = New-Object System.Windows.Forms.OpenFileDialog
$dialog.Title     = "请选择需要压缩的 ext4.vhdx 文件"
$dialog.Filter    = "VHDX 文件 (*.vhdx)|*.vhdx"
$dialog.Multiselect = $false

if ($dialog.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) {
    Write-Output "已取消操作，未选择文件"
    exit
}

$vhdx = $dialog.FileName

# 后缀名校验（不区分大小写）
if (-not $vhdx.ToLower().EndsWith(".vhdx")) {
    Write-Error "所选文件并非 .vhdx，脚本终止。"
    exit 1
}

Write-Output "Compact $vhdx"

# 将 DiskPart 命令拼成 Here-String 串给 diskpart
$diskPartScript = @"
select vdisk file="$vhdx"
attach vdisk readonly
compact vdisk
detach vdisk
exit
"@

# 执行 diskpart
$diskPartScript | diskpart
Write-Output "压缩完成"
