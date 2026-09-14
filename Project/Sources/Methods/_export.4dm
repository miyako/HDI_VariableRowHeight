//%attributes = {}
ALL RECORDS:C47([LOREM:4])
$json:=Selection to JSON:C1234([LOREM:4])
Folder:C1567(fk resources folder:K87:11).file("LOREM-ja.json").setText($json)

ALL RECORDS:C47([SAMPLES:3])
$json:=Selection to JSON:C1234([SAMPLES:3])
Folder:C1567(fk resources folder:K87:11).file("SAMPLES-ja.json").setText($json)