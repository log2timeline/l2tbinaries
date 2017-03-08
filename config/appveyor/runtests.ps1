# Script to run tests on AppVeyor.

$ExitSuccess = 0
$ExitFailure = 1

Try
{
	If ($env:APPVEYOR_REPO_BRANCH -eq "main")
	{
		# TODO: Clone the latest tagged version of Plaso
		$Output = Invoke-Expression -Command "git clone https://github.com/log2timeline/plaso.git 2>&1"
	}
	Else
	{
		$Output = Invoke-Expression -Command "git clone https://github.com/log2timeline/plaso.git 2>&1"
	}
	If (${LastExitCode} -ne ${ExitSuccess}) {Throw}

	# Out-String is used below to make sure new lines are preserved in the output.
	Write-Host (${Output} | Out-String)
}
Catch
{
	Write-Host (${Output} | Out-String) -foreground Red

        Exit ${ExitFailure}
}

Push-Location "plaso"

Try
{
	If ($env:TARGET -eq "gitsource_plaso")
	{
		$Output = Invoke-Expression -Command "& '${env:PYTHON}\python.exe' run_tests.py 2>&1"
		If (${LastExitCode} -ne ${ExitSuccess}) {Throw}
		Write-Host (${Output} | Out-String)
	}
	ElseIf ($env:TARGET -eq "l2tbinaries")
	{
		$Output = Invoke-Expression -Command "& '${env:PYTHON}\python.exe' ${env:PYTHON}\Scripts\log2timeline.exe --no_dependencies_check --status_view linear --storage_file test.plaso test_data\image.qcow2 2>&1"
		If (${LastExitCode} -ne ${ExitSuccess}) {Throw}
		Write-Host (${Output} | Out-String)

		$Output = Invoke-Expression -Command "& '${env:PYTHON}\python.exe' ${env:PYTHON}\Scripts\psort.exe --status_view linear -w timeline.log test.plaso 2>&1"
		If (${LastExitCode} -ne ${ExitSuccess}) {Throw}
		Write-Host (${Output} | Out-String)
	}
}
Catch
{
	Write-Host (${Output} | Out-String) -foreground Red

	Exit ${ExitFailure}
}
Finally
{
	Pop-Location
}

