#https://github.com/frgnca/AudioDeviceCmdlets
$var1 = 1

while($var1 = 1)
{
    $time = Get-Date -Format "HH:mm:ss"
    Start-Sleep -Milliseconds 500
    #Remove % symbol from variable
    $currentMicVolume = ((Get-AudioDevice -RecordingVolume) -replace ‘[{%}]’)
    #Convert to integer so it can be evaluated in conditional
    $currentMicVolumeInt = $currentMicVolume.ToInt32($Null)
    #If the volume is less than 100, set it to 100
    if ($currentMicVolumeInt -lt 100)
    {
        Set-AudioDevice -RecordingVolume 100
        $time + " adjusting volume to 100, was previously " + $currentMicVolumeInt
    }
}
