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
                sh "${PWD}\\build.ps1"
            }
        }
        stage("Test"){
            steps{
                git branch: 'main', credentialsId: 'd28f4340-67ba-48ac-a47d-810f37cf684c', url: 'https://devtopia.esri.com/Release/Insights-DesktopAutomation'
                sh "${PWD}\\test.ps1"
            }

        }

        stage("Clean"){
            steps{
                sh "${PWD}\\clean.ps1"

            }
        }
    }
}