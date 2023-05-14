#This PowerShell script allows you to set the mouse pointer speed through the PowerShell command line.
#MSV = Mouse Speed Value, where 1 is the slowest and 20 is the fastest (maximum).
#You can set your mouse pointer speed by changing the MSV value below (default is 20, but it can be any value between 1 and 20).
$MSV = 20
Function Set-MouseSpeed {
    [CmdletBinding()]
    param (
        [validateRange(1, 20)]
        [int]$Value
    )

    $winApi = Add-Type -Name user32 -Namespace tq84 -PassThru -MemberDefinition '
        [DllImport("user32.dll")]
        public static extern bool SystemParametersInfo(
            uint uiAction,
            uint uiParam,
            uint pvParam,
            uint fWinIni
        );
    '

    $SPI_SETMOUSESPEED = 0x0071
    $MouseSpeedRegPath = 'HKCU:\Control Panel\Mouse'

    $null = $winApi::SystemParametersInfo($SPI_SETMOUSESPEED, 0, $Value, 0)

    # Calling SystemParametersInfo() does not permanently store the modification
    # of the mouse speed. It needs to be changed in the registry as well
    Set-ItemProperty $MouseSpeedRegPath -Name MouseSensitivity -Value $Value
}

Set-MouseSpeed -Value @MSV

# After you clone or save the PowerShell script as a file, for example "mousespeed.ps1," 
# you can run it at the same path by typing "> .\mousespeed.ps1" in the PowerShell command line. 
#
# However, if you encounter an error stating that "the file cannot be loaded because # running
# scripts is disabled on this machine", it is because by default, scripts outside the system will
# not be run due to safety and security reasons. 
#
# You can temporarily enable script execution for the current PowerShell session by typing the
# following command: 
# "> Set-Executionpolicy -ExecutionPolicy Unrestricted -scope Process".
#
# You can verify your Script Execution Policy by typing 
# "> Set-Executionpolicy -executionpolicy unrestricted -scope Process". 
# For more information about the safety of running a script, 
# please refer to https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies
