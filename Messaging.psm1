<#.Synopsis
  Displays a visual representation of a calendar.

 .Description
  Displays a visual representation of a calendar. This function supports multiple months
  and lets you highlight specific date ranges or days. .Example # Send message to Slack $text = "Hello" $channel = "#general" $username = "Monkey-Bot" $emoji = ":monkey_face:" $uri = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX" Send-SlackMessage -Text $text -Channel $channel -UserName $username -Emoji $emoji -Uri $uri#> function Send-SlackMessage {    param(        $Text,        $Channel,        $UserName,        $Emoji,        $Uri    )        $data = 'payload={"text": "'+$Text+'" , "channel": "'+$Channel+'" , "username":"'+$Username+'", "icon_emoji": "'+$Emoji+'"}'
        Invoke-WebRequest -Method Post -Body $data -Uri $Uri}Export-ModuleMember -Function Send-SlackMessage