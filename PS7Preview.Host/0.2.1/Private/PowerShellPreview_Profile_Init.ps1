<#
    .SYNOPSIS
        Private Module Initialization Script. Initializes two new PowerShell Profile Scripts: Microsoft.PowerShellPreview_profile.ps1 ($Profile.PreviewCurrentUser) and Preview_profile.ps1 ($Profile.PreviewAllUsers) for use strictly with Micrososft PowerShell 7 Preview.
    .DESCRIPTION
        Creates two new $PROFILE locations and scripts: $Profile.PreviewCurrentUser, and $Profile.AllUsers, as well as creating a Shortcut to PowerShell Preview with the '-NoProfile' Argument passed to the executable,

    .PARAMETER Debug
        When specified, Debugs process.

    .NOTES
        Filename: 'PowerShellPreview_Profile_Init.ps1'
        Version: 0.5.1
        Author: NWP
    .LINK
        https://www.github.com/
#>

# Validate PowerShell 7 Preview User Directory
$PowerShellPreviewUserPath = "C:\Users\$Env:USERNAME\Documents\PowerShell\7-preview"

if ((Test-Path $PowerShellPreviewUserPath) -eq $false) {
    New-Item $PowerShellPreviewUserPath -ItemType Directory
} 

# Validate PowerShell 7 Preview Install
$PowerShellPreviewTargetPath = "C:\Program Files\PowerShell.Preview\7-preview\pwsh.exe"

if ((Test-Path $PowerShellPreviewTargetPath) -eq $False) {
    If ((Test-Path "C:\Program Files\PowerShell\7-preview\pwsh.exe") -eq $False) {
        # Download and install PS 7 Preview
    } else {
        $PowerShellPreviewExecutablePath = "C:\Program Files\PowerShell\7-preview\pwsh.exe"
    }
} else {
    $PowerShellPreviewExecutablePath = "C:\Program Files\PowerShell.Preview\7-preview\pwsh.exe"
}

# Create PowerShell 7 Preview Shortcut on Desktop
New-Item -Path "C:\Users\$Env:USERNAME\Desktop\pwsh.exe" -Name 'PowerShell-Preview' -Value $PowerShellPreviewExecutablePath -ItemType SymbolicLink -Force


# Create new PowerShell Preview Profile Objects
$PowerShellPreviewRoot = Split-Path $PowerShellPreviewExecutablePath -Parent
$PROFILE | Add-Member -MemberType NoteProperty PreviewCurrentUser -Value "C:\Users\$Env:USERNAME\Documents\PowerShell\7-preview\Microsoft.PowerShellPreview_profile.ps1"
$PROFILE | Add-Member -MemberType NoteProperty -Name PreviewAllUsers -Value "$PowerShellPreviewRoot\Preview_profile.ps1"


Write-Verbose "Successfully initialized PowerShell 7 Preview for use as an alternative, pseudo-separate PowerShell Host."