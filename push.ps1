param (
  [string]$key,
  [string]$event,
  [string]$value1="",
  [string]$value2="",
  [string]$value3=""
)

# https://ifttt.com/services/maker_webhooks/settings
$BaseURL = ("https://maker.ifttt.com/trigger/{0}/with/key/{1}" -f $event, $key)
$body = @{ value1=$value1; value2=$value2; value3=$value3 }

Invoke-RestMethod -URI $BaseURL -Body (ConvertTo-Json $body) -Method Post -ContentType application/json
