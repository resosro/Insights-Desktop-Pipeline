#  Checks to see if Installers is found or App Data

# | Pipeline character allows for chaining in which previous commands will be the input for forture commands
# recurse allows you to recursively call throughout the folder, can be used in combination with other things
$appData = "C:\Users\agrelease\AppData\Roaming\esri"
$Installers = "C:\Installers\Insights_Build"
$Installers = "C:\Users\$env:username\Documents\Installers"
$AppDataFolder = "C:\Users\$env:username\AppData\Roaming\Esri"



function Remove-AppData{
    if(Test-Path -Path $AppDataFolder){
        Remove-Item $AppDataFolder -Recurse
    }
}

function Remove-Installers{
    if(Test-Path -Path $Installers){
        Remove-Item $Installers -Recurse
    }
}

function Run {
    Remove-AppData
    Remove-Installers
    Write-Output "Clean Up Completed"
}