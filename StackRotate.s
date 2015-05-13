Image extractedmap
image map

GetOneLabeledImageWithPrompt("Please select the raw datacube.","Rotate Datacube","Datacube",map)

number height, width
getsize(map, width, height)

ImageDisplay imageDisp = map.ImageGetImageDisplay( 0 )

ROI myroi = imageDisp.ImageDisplayGetROI( 0 )

number roiwidth, roiheight
getsize(myroi, roiwidth, roiheight)
extractedmap := RealImage("Extracted Map",4,roiwidth,roiheight)

for(number xpos; xpos <= (width-1); xpos++){
for(number ypos; ypos <= (height-1); ypos++){

if(ROIContainsPoint(myroi, xpos, ypos))
{
setpixel(extractedmap,xpos,ypos,getpixel(map,xpos,ypos))

}
}
}

ImageSetName( extractedmap, "Extracted Datacube" )

showimage(extractedmap)
