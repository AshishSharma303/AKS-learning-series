Param(
    [parameter(Mandatory = $false)]
    [string]$NamespaceName = "ag1"
)

# source common variables
. .\var.ps1


Write-Host "Starting deletion of TechTalks application and services" -ForegroundColor Yellow

Write-Host "Deleting Tech Talks web frontend" -ForegroundColor Yellow
# Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksWeb
Set-Location $techTalksWebRootDirectory
kubectl delete --recursive --filename . `
    --namespace $NamespaceName


Write-Host "Tech talks web frontend deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting Tech Talks API service" -ForegroundColor Yellow
# Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksAPI
Set-Location $techTalksAPIRootDirectory
kubectl delete --recursive --filename . `
    --namespace $NamespaceName

Write-Host "Tech talks API service deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting Tech Talks DB service" -ForegroundColor Yellow
# Set-Location ~/projects/AKS-learning-series/k8s/AKS/TechTalksDB2019
Set-Location $techTalksDB2019RootDirectory
kubectl delete --recursive --filename . `
    --namespace $NamespaceName

Write-Host "Tech talks DB service deleted successfully" -ForegroundColor Cyan

# Set-Location ~/projects/AKS-learning-series/k8s/AKS/
Set-Location $aksRootDirectory

Write-Host "Deleting namespace"  -ForegroundColor Yellow
kubectl delete --filename 00_AKS_Namespace.yml `
    --namespace $NamespaceName
Write-Host "Namespace deleted successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application have been successfully deleted" -ForegroundColor Cyan

Set-Location ~/projects/AKS-learning-series/Powershell/