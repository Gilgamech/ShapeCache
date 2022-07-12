# Go dig the drawing assembly out of PowerGIL.

Function ConvertImage-ToASCIIArt {
	Param( 
		[Parameter(Mandatory=$True,Position=1)]
		[String]$path, #= $(throw "Supply an image path"), 
		[int]$maxwidth, # default is width of console 
		[ValidateSet("ascii","shade","bw")]
		[String]$palette = "ascii", # choose a palette, "ascii" or "shade" 
		[float]$ratio = 1.5 # 1.5 means char height is 1.5 x width 
	); #end Param
	[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | out-null
	
	$palettes = @{ 
		"ascii" = " .,:;=|iI+hHOE#`$" 
		"shade" = " " + [char]0x2591 + [char]0x2592 + [char]0x2593 + [char]0x2588 
		"bw"	= " " + [char]0x2588 
	} 

	$c = $palettes[$palette] 

	[char[]]$charpalette = $c.TocharArray() 

	$path = (Resolve-Path $path)

	# load the image
	$image = [Drawing.Image]::FromFile($path)  
	if ($maxwidth -le 0) { [int]$maxwidth = $host.ui.rawui.WindowSize.Width - 1} 
	[int]$imgwidth = $image.Width 
	[int]$maxheight = $image.Height / ($imgwidth / $maxwidth) / $ratio 
	$bitmap = new-object Drawing.Bitmap ($image,$maxwidth,$maxheight) 
	[int]$bwidth = $bitmap.Width; [int]$bheight = $bitmap.Height 
	$cplen = $charpalette.count 
	for ([int]$y=0; $y -lt $bheight; $y++) { 
		$txt="Text"+$y;
		$line = "$txt = `""
		for ([int]$x=0; $x -lt $bwidth; $x++) { 
			$colour = $bitmap.GetPixel($x,$y) 
			$bright = $colour.GetBrightness() 
			[int]$offset = [Math]::Floor($bright*$cplen) 
			$ch = $charpalette[$offset] 
			if (-not $ch) { 
				#overflow 
				$ch = $charpalette[-1] 
			}; #end if not ch 
			$line += $ch 
		}; #end for x
		$line+"`";`n" 
	}; #end for y
	
}; #end ConvertImage-ToASCIIArt

function Get-AsciiImage ($inputPath,$outFile){
$counter=0
Copy-Item C:\Media\Files\SCAD\AsciiTemplate.scad -Destination "C:\Media\Files\SCAD\ASCII-$outFile.scad"
[IO.File]::AppendAllText((Resolve-Path C:\Media\Files\SCAD\Ascii-$outFile.scad),((ConvertImage-ToASCIIArt $inputPath -maxwidth 100)))
for ($i=0;$i -lt $counter;$i++){[IO.File]::AppendAllText((Resolve-Path C:\Media\Files\SCAD\Ascii-$outFile.scad),("translate([0,lineDist*$i,0]) linear_extrude(extrudeHeight) text(Text$i,font=`"Consolas`");`n"))}
}

[IO.File]::AppendAllText((Resolve-Path C:\Media\Files\SCAD\Ascii-$outFile.scad),((ConvertImage-ToASCIIArt $inputPath -maxwidth 100) -replace " "," " -replace "[.]",".." -replace "[,]",",," -replace "[:]","::" -replace "[;]",";;" -replace "[|]","||" -replace "i","ii" -replace "I","II" -replace "[``]","````"))
