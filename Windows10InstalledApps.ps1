# Windows 10 Apps
# 2021/06/11

$excludedApps = @(
    "Microsoft.NET.Native"
    "Microsoft.Services.Store"
    "Microsoft.UI.Xaml"
    "Microsoft.VCLibs"
    "AppUp"                         # Intel Graphics 
    "AD2F1837"                      # HP 
    "NVIDIACorp"                    # Nvidia
    "RealtekSemiconductorCorp"      # RealTek
    "AppleInc"                      # Apple (iTunes)
    "Microsoft.Language"
    "Microsoft.WindowsStore"    
    "Microsoft.SkypeApp"
    "Microsoft.Windows.Photos"	
    "Microsoft.WindowsCalculator"
    "Microsoft.MicrosoftStickyNotes"    
    "Microsoft.Office.Desktop"
    "Microsoft.ScreenSketch"
    "Microsoft.Todos"
    
)

$matchNames = "^(" + ($excludedApps -join "|") + ")"

 Get-AppxPackage –AllUsers | ? { $_.Name -notmatch $matchNames } | Sort Name | Select-Object -Property Name, PackageFullName, @{
    label = "Publisher" 
    expression = {
    ($_.Publisher.Split(",")[0].Trim().Split("=")[1])
    }
    }, SignatureKind
