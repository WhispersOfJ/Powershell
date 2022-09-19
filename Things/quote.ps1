# Gets a random quote and prints it to the terminal.
$ENDPOINT = "https://zenquotes.io/api/random"
$ENDPOINT2 = "https://api.quotable.io/random"

$Response = Invoke-WebRequest $ENDPOINT -TimeoutSec 1 | ConvertFrom-Json

if (!$Response) {
	$Response = Invoke-WebRequest $ENDPOINT2 -TimeoutSec 1 | ConvertFrom-Json
	if (!$Response) {
		Exit-PSHostProcess
	}
}

$Author = $Response.a
$Quote = $Response.q

Write-Host $Author -NoNewline -BackgroundColor DarkGreen
Write-Host ": ${Quote}`n"