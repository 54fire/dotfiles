# ��Ҫͼ�ν���ĶԻ���֧��
Add-Type -AssemblyName System.Windows.Forms

# Write-Output "Shutdown WSL2"
# wsl -e sudo fstrim /
# wsl --shutdown

# ���ļ�ѡ��Ի���Ĭ�Ϲ��� ext4.vhdx
$dialog           = New-Object System.Windows.Forms.OpenFileDialog
$dialog.Title     = "��ѡ����Ҫѹ���� ext4.vhdx �ļ�"
$dialog.Filter    = "VHDX �ļ� (*.vhdx)|*.vhdx"
$dialog.Multiselect = $false

if ($dialog.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) {
    Write-Output "��ȡ��������δѡ���ļ�"
    exit
}

$vhdx = $dialog.FileName

# ��׺��У�飨�����ִ�Сд��
if (-not $vhdx.ToLower().EndsWith(".vhdx")) {
    Write-Error "��ѡ�ļ����� .vhdx���ű���ֹ��"
    exit 1
}

Write-Output "Compact $vhdx"

# �� DiskPart ����ƴ�� Here-String ���� diskpart
$diskPartScript = @"
select vdisk file="$vhdx"
attach vdisk readonly
compact vdisk
detach vdisk
exit
"@

# ִ�� diskpart
$diskPartScript | diskpart
Write-Output "ѹ�����"
