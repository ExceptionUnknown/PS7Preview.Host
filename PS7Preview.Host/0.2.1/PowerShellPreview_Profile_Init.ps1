# Microsoft PowerShell 7 Preview
# Microsoft.PowerShellPreview.Core
# Preview Profile Initialization Script


# Initialize PowerShell 7 Preview Unique Host with Profile
$PowerShellPreviewRoot = "C:\Program Files\PowerShell\7-preview"

if ((Test-Path $PowerShellPreviewRoot) -eq $false) {
    Write-Warning "Failed to locate PowerShell Preview install directory. If you have configured PowerShell 7 Preview to install to a custom location, please enter it now, otherwise press [ENTER] and ensure that PowerShell 7 Preview is installed on this system."
    $PowerShellPreviewRoot = Read-Host "Please enter the path to PowerShell 7 Preview's Custom install directory, or press [ENTER] to skip.."
}
$Profile | Add-Member -MemberType NoteProperty -Name PreviewCurrentUser -Value "C:\Users\$Env:USERNAME\Documents\PowerShell\7-preview\Microsoft.PowerShellPreview_profile.ps1"
$Profile | Add-Member -MemberType NoteProperty -Name PreviewAllUsers -Value "$PowerShellPreviewRoot\Preview_profile.ps1" 

# Build PowerShell 7 Preview Paths

$PreviewUserHome = "C:\Users\$Env:USERNAME\Documents\PowerShell\7-preview"

New-Item $PreviewUserHome\Modules -ItemType Directory -ErrorAction SilentlyContinue

New-Item $PowerShellPreviewRoot\Scripts -ItemType Directory -ErrorAction SilentlyContinue

New-Item $PowerShellPreviewRoot\.config -ItemType Directory -ErrorAction SilentlyContinue

#TODO:
# Configure PowerShell 7 Preview PSModulePath
# Configure PowerShell 7 Preview Init Custom Shortcut to avoid auto-loading $Profile