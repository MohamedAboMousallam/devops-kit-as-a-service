$podCounts = @{}

Write-Host "Testing load balancing with 50 requests..."
Write-Host "=========================================="

for ($i = 1; $i -le 50; $i++) {
    try {
        $response = irm http://localhost:8080 -Headers @{"Connection" = "close"}
        $podName = $response.pod_name
        if ($podCounts.ContainsKey($podName)) {
            $podCounts[$podName]++
        } else {
            $podCounts[$podName] = 1
        }
        Write-Host "Request ${i}: $podName (Total: $($podCounts[$podName]))"
    } catch {
        Write-Host "Request ${i}: Error - $($_.Exception.Message)"
    }
    Start-Sleep -Milliseconds 200
}

Write-Host "`nLoad Balancing Results:"
Write-Host "======================"
$podCounts.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object {
    $percentage = [math]::Round(($_.Value / 50) * 100, 1)
    Write-Host "$($_.Key): $($_.Value) requests ($percentage%)"
}
