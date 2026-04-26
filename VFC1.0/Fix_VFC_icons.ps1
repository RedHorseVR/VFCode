# Fix_VFC_icons.ps1
# Nukes all VFC / conflicting file association registry entries
# then re-imports clean HKLM reg. Auto-elevates to admin.

# --- Auto-elevate ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Write-Host "Relaunching as Administrator..." -ForegroundColor Yellow
    Start-Process powershell "-NoExit -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$RegFile = Join-Path $PSScriptRoot "VFC_Install_Reg_Keys_Admin.reg"

if (-not (Test-Path $RegFile)) {
    Write-Host "ERROR: VFC_Install_Reg_Keys_Admin.reg not found next to this script." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "=== VFC2000 Association Fix ===" -ForegroundColor Cyan
Write-Host ""

# --- Nuke HKCU entries ---
Write-Host "Nuking HKCU VFC entries..." -ForegroundColor Yellow
@(
    "HKCU:\Software\Classes\.vfc",
    "HKCU:\Software\Classes\VFC_Code_File",
    "HKCU:\Software\Classesfc-Document_auto_file",
    "HKCU:\Software\Classes\.vfc_auto_file",
    "HKCU:\Software\Classes\Applications\VFC2000.exe",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.vfc"
) | ForEach-Object {
    if (Test-Path $_) {
        Remove-Item $_ -Force -Recurse
        Write-Host "  Deleted: $_" -ForegroundColor Gray
    }
}

# --- Nuke HKLM entries ---
Write-Host "Nuking HKLM VFC entries..." -ForegroundColor Yellow
@(
    "HKLM:\SOFTWARE\Classes\.vfc",
    "HKLM:\SOFTWARE\Classes\VFC_Code_File",
    "HKLM:\SOFTWARE\Classesfc-Document_auto_file",
    "HKLM:\SOFTWARE\Classes\.vfc_auto_file"
) | ForEach-Object {
    if (Test-Path $_) {
        Remove-Item $_ -Force -Recurse
        Write-Host "  Deleted: $_" -ForegroundColor Gray
    }
}

# --- Nuke icon cache ---
Write-Host "Killing Explorer and nuking icon cache..." -ForegroundColor Yellow
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

$cachePaths = @(
    "$env:LOCALAPPDATA\IconCache.db",
    "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\iconcache*",
    "$env:LOCALAPPDATA\Microsoft\Windows\Explorer	humbcache*"
)
$cachePaths | ForEach-Object {
    Remove-Item $_ -Force -ErrorAction SilentlyContinue
    Write-Host "  Cleared: $_" -ForegroundColor Gray
}

# --- Import clean reg ---
Write-Host "Importing VFC_Install_Reg_Keys_Admin.reg..." -ForegroundColor Yellow
$result = Start-Process "reg.exe" -ArgumentList "import `"$RegFile`"" -Wait -PassThru -WindowStyle Hidden
if ($result.ExitCode -eq 0) {
    Write-Host "  Registry imported OK." -ForegroundColor Green
} else {
    Write-Host "  reg import FAILED (exit $($result.ExitCode))" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# --- Restart Explorer ---
Write-Host "Restarting Explorer..." -ForegroundColor Yellow
Start-Process explorer
Start-Sleep -Seconds 2
Start-Process "ie4uinit.exe" "-show" -Wait

Write-Host ""
Write-Host "=== Done. .vfc files are now associated with VFC2000. ===" -ForegroundColor Green
Write-Host ""
Read-Host "Press Enter to exit"
