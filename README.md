# setmousespeed
Set Mouse Pointer Speed through Power Shell Command Line

This PowerShell script allows you to set the mouse pointer speed through the PowerShell command line.
It will prompt you for speed input ( 1 - 20 )
Enter your desire speed

## How to Run a PowerShell Script

**To run a PowerShell script, you can follow these steps:**

1. Clone or Save the script as a file with the .ps1 extension.
2. Open a PowerShell window.
3. Navigate to the folder where the script is located.
4. Type the following command:

```
.\mousespeed.ps1
```

**If you receive an error message that says "The file cannot be loaded because running scripts is disabled on this machine," you can temporarily enable script execution for the current PowerShell session by typing the following command:**

```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -scope Process
```

**You can verify your script execution policy by typing the following command:**

```
Get-ExecutionPolicy -list 
```

**For more information about the safety of running scripts, please refer to the following link:**


https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies
