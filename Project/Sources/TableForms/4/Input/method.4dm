C_LONGINT:C283($width; $height; $p)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		OBJECT GET BEST SIZE:C717(*; "ipsum"; $width; $height; 200)
		
		$height:=$height+4
		
		OBJECT GET COORDINATES:C663(*; "ipsum"; $x1; $y1; $x2; $y2)
		OBJECT SET COORDINATES:C1248(*; "ipsum"; $x1; $y1; $x1+$width; $y1+$height)
		
		[LOREM:4]Height:4:=$height  ///$lineHeight
		
		$p:=Position:C15(" "; [LOREM:4]Ipsum:3)
		[LOREM:4]Name:2:=Substring:C12([LOREM:4]Ipsum:3; 1; $p-1)
		
End case 

