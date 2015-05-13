<#.Synopsis
  Displays a visual representation of a calendar.

 .Description
  Displays a visual representation of a calendar. This function supports multiple months
  and lets you highlight specific date ranges or days. .Example # Send message to Slack $text = "Hello" $channel = "#general" $username = "Monkey-Bot" $emoji = ":monkey_face:" $uri = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX" Send-SlackMessage -Text $text -Channel $channel -UserName $username -Emoji $emoji -Uri $uri#> function Send-SlackMessage {    param(        [string]$Text = "The Monkey-Bot says hi!",        [string]$Channel = "#general",        $UserName = "Monkey-Bot",        $Emoji = ":monkey_face:",        [Parameter(Mandatory=$true)]        $Uri    )
    
    # 'payload={"text": "The Monkey-Bot says hi!" , "channel": "#general" , "username":"Monkey-Bot", "icon_emoji": ":monkey_face:"}'
    $data = New-Object PSObject -Property @{
                text = $Text                channel = $Channel                username = $UserName                icon_emoji = $Emoji                uri = $Uri
    }        $json = 'payload='+($data | ConvertTo-Json)    try {        Invoke-WebRequest -Method Post -Body $json -Uri $Uri | Out-Null    } catch {        "An error occured."        "Did you use a correct Uri?"        "Example: https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"    }}Export-ModuleMember -Function Send-SlackMessage