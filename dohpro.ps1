Get-ChildItem -Filter GH*.MP4 |
    Rename-Item -NewName { $_.Name -replace 'GH(\d{2})(\d{4})', 'GoProH-$2-$1' }
Get-ChildItem -Filter GX*.MP4 |
    Rename-Item -NewName { $_.Name -replace 'GX(\d{2})(\d{4})', 'GoProX-$2-$1' }
Get-ChildItem -Filter GL*.LRV |
    Rename-Item -NewName { $_.Name -replace 'GX(\d{2})(\d{4})', 'GoProL-$2-$1' }

del *.THM

New-Item -ItemType Directory -Force -Path 'videos'
New-Item -ItemType Directory -Force -Path 'photos'

get-childitem *.MP4,*.LRV,*.THM,*.360 -recurse | foreach-object {move-item $_ -destination videos\}
get-childitem *.JPG,*.GPR -recurse | foreach-object {move-item $_ -destination photos\}
