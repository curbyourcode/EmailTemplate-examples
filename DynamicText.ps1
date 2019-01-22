$template = 'layout.html'
$final_email = 'final_email.html'

$ReportServices =@(

"Angular",
"React",
"Ember",
"Vue",
"Asp. Net",
"Java",
"Orcale",
"VS Code",
"Slack")  

$ReportServices =
@([pscustomobject]@{name="Angular"; color="#b52e31"; footer="b52e31"; code ='2+'; message=''},
[pscustomobject]@{name="React"; color="#00d8ff"; code='React.Js'; footer="#00d8ff"},
[pscustomobject]@{name="Ember"; color="#f05e1b"; code='Ember.js'; footer="#f05e1b"},
[pscustomobject]@{name="Vue"; color=" #41B883"; code='Vue.js'; footer="# #41B883"},
[pscustomobject]@{name="Asp.Net"; color="#00008B";code='Asp.Net Core'; footer="#00008B"},
[pscustomobject]@{name="Java";color="#2b4649 H"; code='Java lanague'; footer="#2b4649 H"},
[pscustomobject]@{name="Orcale";color="#f80000"; code='Orcale database'; footer="#f80000"},
[pscustomobject]@{name="VS Code"; color="#0272c6"; code='VS code editor'; footer="#0272c6"},
[pscustomobject]@{name="Slack";color="#3eb991"; code='Slack'; footer="3eb991"}
)

foreach ($service in $ReportServices)
{

  (Get-Content $template) |


    Foreach-Object {
      $_ -replace '\[HEADER_COLOR\]',$service.color`
        -replace '\[REPORT_NAME\]',$service.name`
        -replace '\[CODE\]', $service.code`
        -replace '\[FOOTER_COLOR\]', $service.footer`
        -replace '\[STATUS_MESSAGE\]','Investigating'
      
    }  |
    Set-Content ($service.name + ".html")

}