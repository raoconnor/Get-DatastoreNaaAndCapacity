$AllDS = Get-Datastore
$results = @()
foreach ($ds in $AllDS) {
$dsview = $ds | Get-View
$resultsarray = "" | Select "DatastoreName","CanonicalName","CapacityGB","FreeSpaceGB"
$resultsarray."DatastoreName" = $ds.Name
$resultsarray."CanonicalName" = $dsview.info.vmfs.extent
$resultsarray."CapacityGB" = $ds.CapacityGB
$resultsarray."FreeSpaceGB" = $ds.FreeSpaceGB

$results += $resultsarray
}
$results | Sort-Object DatastoreName  | ft -a