$files = @("index.html", "About.html", "form.html", "library.html", "events.html", "community.html", "temp.html", "login.html", "Admin_1.html")
$replacements = @{
    'href="index.html"' = 'href="/"'
    'href="About.html"' = 'href="/about"'
    'href="About.html?tab=tab3"' = 'href="/about?tab=tab3"'
    'href="library.html"' = 'href="/library"'
    'href="events.html"' = 'href="/events"'
    'href="community.html"' = 'href="/community"'
    'href="form.html"' = 'href="/form"'
    'href="temp.html"' = 'href="/temp"'
    'href="login.html"' = 'href="/login"'
    'href="Admin_1.html"' = 'href="/admin"'
    "href='index.html'" = "href='/'"
    "href='About.html'" = "href='/about'"
    "href='About.html?tab=tab3'" = "href='/about?tab=tab3'"
    "href='library.html'" = "href='/library'"
    "href='events.html'" = "href='/events'"
    "href='community.html'" = "href='/community'"
    "href='form.html'" = "href='/form'"
    "href='temp.html'" = "href='/temp'"
    "href='login.html'" = "href='/login'"
    "href='Admin_1.html'" = "href='/admin'"
}

foreach ($file in $files) {
    $filePath = Join-Path "c:\Users\gmdoh\Desktop\grandP" $file
    if (Test-Path $filePath) {
        # Read content trying UTF8 first
        $content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
        $modified = $false
        foreach ($key in $replacements.Keys) {
            if ($content.Contains($key)) {
                $content = $content.Replace($key, $replacements[$key])
                $modified = $true
            }
        }
        if ($modified) {
            [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
            Write-Output "Updated: $file"
        } else {
            Write-Output "No changes: $file"
        }
    } else {
        Write-Output "File not found: $file"
    }
}
