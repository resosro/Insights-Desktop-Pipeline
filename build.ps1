$Insights_Version = "2023.3"
$LinOK = Get-Content "\\archive2\10NonDevSetups_Unix\ArcGISInsightsDesktop\$Insights_Version\InsightsDesktopOK.txt"
$WinOK = Get-Content "\\archive2\10NonDevSetups\ArcGISInsightsDesktop\$Insights_Version\InsightsDesktopOK.txt"
# Takes the string, splits it into array, grabs the last item
$Build = $WinOK.split(".")[-1]
$BuildLocation = "\\archive2\10NonDevSetups\ArcGISInsightsDesktop\$Insights_Version\$Build"
$Installers = "C:\Users\$env:username\Documents\Installers"


function Create-Installers-Folder{
    if!(Test-Path -Path $Installers){
        New-Item -Path "C:\Users\$env:username\Documents" -Name "Installers" 
    }
}


function Check-Linux-Windows-Release{
    return ($LinOK -eq $WinOK) 
}

function Transfer-Files-To-Agent{
    if(Check-Linux-Windows-Release){
        Move-Item -Path "${env:PWD}" -Destination $Installers
        Unblock-File -Path -Installers\Setup.exe
        
    }
}

function Install-Insights{
    C:\Installers\Insights_Build\Setup.exe /qn ACCEPTEULA=yes
    
}

function Run{
    Write-Output "build.ps1 running"
    Create-Installers-Folder
    Check-Linux-Windows-Release
    Transfer-Files-To-Agent
    Install-Insights
    Write-Output "build.ps1, completed"
}

Run






