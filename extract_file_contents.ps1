param(
    [string]$folderPath,
    [string]$outputFile
)

if (-not ($folderPath)) {
    Write-Host "Usage: .\extract_file_contents.ps1 -folderPath <folder_path>"
    exit 1
}

function Get-FilesRecursive {
    param (
        [string]$folderPath
    )

    $files = Get-ChildItem -Path $folderPath -File
    $folders = Get-ChildItem -Path $folderPath -Directory

    foreach ($file in $files) {
        if ($file.FullName) {
            $file.FullName
        }
    }

    foreach ($folder in $folders) {
        Get-FilesRecursive -folderPath $folder.FullName
    }
}


function Extract-Contents {
    param (
        [string]$folderPath
    )

    $files = Get-FilesRecursive -folderPath $folderPath

    foreach ($file in $files) {
        $fileObj = Get-Item -Path $file
        $relPath = $fileObj.FullName.Substring((Get-Item -Path $folderPath).FullName.Length).TrimStart('\')

        Write-Output "`n`n=== $relPath ===`n"
        Get-Content -Path $fileObj.FullName | Write-Output
    }
}



Extract-Contents -folder $folderPath 
