#! bin/pwsh
# Clear-Host

$p1 = $args[0]
$filepath = $args[1]

$minLength = 10
If ($p1) {
    $len = $p1.tostring().Length
}
If ($p1 -eq '-f') {
    If ($filepath.Length -lt 1 ) {
        write-host "Please specify a filepath along the -f <'./filepath>" -ForegroundColor Red
        Exit 1
    }
    Else {
        $p1 = Get-Item -Path $filepath | Get-Content -Tail 1
        $len = $p1.tostring().Length
    }
}

If ($len -lt $minLength ) {
    write-host $p1
    write-host "Password on file is too short, at least $minLength characters" -ForegroundColor Red
    Exit 1
}
# (?-i) turns off case-insensitive mode 
$regex1 = "(?-i)[a-z]+"
If ($p1 -notmatch $regex1) {
    write-host "Password must contain at least one small letter" -ForegroundColor Red
    Exit 1
}

$regex2 = '(?-i)[A-Z]+'
# not sure why normal nomatch didn't work - might have something to do with ASCII actual value
# needed to change regex, this helped -https://stackoverflow.com/questions/15145659/what-do-i-and-i-in-regex-mean
If ( $p1 -notmatch $regex2 ) {
    write-host "Password must contain at least one capital letter"  -ForegroundColor Red
    Exit 1
}

$regex3 = "[0-9]"
If ($p1 -notmatch $regex3) {
    write-host "Password must contain at least one number"  -ForegroundColor Red
    Exit 1
}

Write-host "Password is GOOD"  -ForegroundColor Green
Exit 0