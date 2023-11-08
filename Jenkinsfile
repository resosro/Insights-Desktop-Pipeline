pipeline{
    agent {label 'RAppsDesktop11'}
    parameters {
        choice(name: "Portal", choices: ['RappsLnx1100Pt'])
    }

    environment {
        PWD = pwd()
    }
    stages{
        stage("Build"){
            steps{
                powershell ".build.ps1"

            }
        }
        stage("Test"){
            step{
                git branch: 'main', credentialsId: 'd28f4340-67ba-48ac-a47d-810f37cf684c', url: 'https://devtopia.esri.com/Release/Insights-DesktopAutomation'
                powershell ".test.ps1"
            }

        }

        stage("Clean"){
            step{
                powershell ".clean.ps1"

            }
        }
    }
}