$ErrorActionPreference = "Stop"

Clear

Get-ChildItem ".\nuspec" -Filter *.nuspec | `

Foreach-Object{
    Write-Host $_.Name

    & "..\nuget.exe" pack $_.FullName -BasePath "." -OutputDirectory ".\nupkg"

    if ($LASTEXITCODE -ne 0)
    {
        Write-Error "Error generating nupkg for '$($_.Name)'"
        break
    }
}
