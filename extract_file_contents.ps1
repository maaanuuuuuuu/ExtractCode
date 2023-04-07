param(
    [string]$folderPath,
    [string]$outputFile
)

if (-not ($folderPath)) {
    Write-Host "Usage: .\extract_file_contents.ps1 -folderPath <folder_path>"
    exit 1
}

function Get-FilesRecursive {
    param(
        [string]$folder
    )

    Get-ChildItem -Path $folder -Recurse -File
}

function Extract-Contents {
    param(
        [string]$folder
    )

    $files = Get-FilesRecursive -folder $folder
    $folderPath = (Get-Item -Path $folder).FullName

    foreach ($file in $files) {
        $relPath = $file.FullName.Substring($folderPath.Length).TrimStart("\")
        Write-Output "=== $relPath ==="

        try {
            $content = Get-Content -Path $file.FullName -Encoding UTF8
            Write-Output $content
        }
        catch {
            Write-Output "<Unable to read file contents due to encoding issues>"
        }

        Write-Output ""
    }
}


Extract-Contents -folder $folderPath 
