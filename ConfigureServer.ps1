# Enable .NET Framework & Core
Install-WindowsFeature -Name NET-Framework-Core -IncludeAllSubFeature
Install-WindowsFeature -Name NET-Framework-45-Core

# Install Failover Clustering
Install-WindowsFeature -Name Failover-Clustering -IncludeManagementTools

# Install MySQL Server (assuming MSI package is available)
Start-Process msiexec.exe -ArgumentList "/i C:\Software\mysql-installer.msi /quiet" -Wait

# Configure MySQL service to start automatically
Set-Service -Name MySQL80 -StartupType Automatic

# Set Cluster Name
New-Cluster -Name "SQLCluster" -Node "Server1","Server2" -StaticAddress 192.168.1.200

# Restart server to apply changes
Restart-Computer -Force
