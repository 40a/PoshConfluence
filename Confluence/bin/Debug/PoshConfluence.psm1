#######################################################################################################################
# File:             PoshConfluence.psm1                                                                               #
# Author:           Thomy Kay                                                                                         #
# Publisher:                                                                                                          #
# Copyright:        © 2011 . All rights reserved.                                                                     #
# Usage:            To load this module in your Script Editor:                                                        #
#                   1. Open the Script Editor.                                                                        #
#                   2. Select "PowerShell Libraries" from the File menu.                                              #
#                   3. Check the PoshConfluence module.                                                               #
#                   4. Click on OK to close the "PowerShell Libraries" dialog.                                        #
#                   Alternatively you can load the module from the embedded console by invoking this:                 #
#                       Import-Module -Name PoshConfluence                                                            #
#                   Please provide feedback on the PowerGUI Forums.                                                   #
#######################################################################################################################

Set-StrictMode -Version 2

# TODO: Define your module here.
Add-Type -Path "$psScriptRoot\CflSession.cs", "$psScriptRoot\CflSessionManager.cs"

$CflSessionManager = New-Object ThomyKay.Confluence.CflSessionManager

# Common cmdlets
. $psScriptRoot\Enter-CflSession.ps1
. $psScriptRoot\Exit-CflSession.ps1
. $psScriptRoot\Get-CflSession.ps1
. $psScriptRoot\New-CflSession.ps1
. $psScriptRoot\Remove-CflSession.ps1
. $psScriptRoot\Invoke-CflItem.ps1

$exportedCmdlets = @(	"Enter-CflSession", `
						"Exit-CflSession", `
						"Get-CflSession", `
						"New-CflSession", `
						"Remove-CflSession", `
						"Invoke-CflItem")

#space management
. $psScriptRoot\Get-CflSpace.ps1
. $psScriptRoot\New-CflSpace.ps1
. $psScriptRoot\Remove-CflSpace.ps1


$exportedCmdlets += @( "Get-CflSpace", `
						"New-CflSpace", `
						"Remove-CflSpace")
						
#user management
. $PSScriptRoot\UserManagement\Get-CflUser.ps1
. $PSScriptRoot\UserManagement\New-CflUser.ps1
. $PSScriptRoot\UserManagement\Remove-CflUser.ps1
. $PSScriptRoot\UserManagement\Disable-CflUser.ps1
. $PSScriptRoot\UserManagement\Enable-CflUser.ps1
. $PSScriptRoot\UserManagement\Get-CflGroup.ps1
. $PSScriptRoot\UserManagement\New-CflGroup.ps1
. $PSScriptRoot\UserManagement\Remove-CflGroup.ps1

$exportedCmdlets += @( "Get-CflUser", `
						"New-CflUser", `
						"Remove-CflUser", `
						"Disable-CflUser", `
						"Enable-CflUser", `
						"Get-CflGroup", `
						"New-CflGroup", `
						"Remove-CflGroup")

#content
. $PSScriptRoot\Content\Get-CflBlogEntry.ps1
. $PSScriptRoot\Content\New-CflBlogEntry.ps1
. $PSScriptRoot\Content\Get-CflPage.ps1
. $PSScriptRoot\Content\New-CflPage.ps1
. $PSScriptRoot\Content\Remove-CflPage.ps1

$exportedCmdlets += @( "Get-CflBlogEntry", `
						"New-CflBlogEntry", `
						"Get-CflPage", `
						"New-CflPage", `
						"Remove-CflPage")
						
Export-ModuleMember -Cmdlet $exportedCmdlets -Function $exportedCmdlets -Variable $CflSessionManager



