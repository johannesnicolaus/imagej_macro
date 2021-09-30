// get directory
red = getDirectory("Choose the red folder ");
green_dir = File.getParent(red) + "\\";
green_name = File.getName(red);
green_substr = substring(green_name, 0, 8);
green = green_dir+green_substr+"wv475-Green1\\";

//green = getDirectory("Choose the green folder ");
//out_folder = getDirectory("Choose the output folder ");
out_folder = "G:/cell_cycle_project/imaging/processed_video/20210925_SKBR3_cdk4v_dosetest/"
// open folders as image sequence
run("Image Sequence...", "open="+red+" sort");
red = getTitle()
print(red)
red_substr = substring(red, 0, 8);
run("Image Sequence...", "open="+green+" sort");
green = getTitle()
print(green)

// combine images
run("Merge Channels...", "c1="+red+" c2="+green+" create");

// subtract background for green only
Stack.setChannel(2)
run("Subtract Background...", "rolling=35");

// enhance contrast
Stack.setChannel(1)
run("Enhance Contrast", "saturated=0.35");
Stack.setChannel(2)
run("Enhance Contrast", "saturated=0.35");

//rename
rename(green);

//save as avi and add timestamp
run("Remove Overlay");
getDimensions(width, height, channels, slices, frames); 
run("Label...", "format=00:00:00 starting=0 interval=1200 x=5 y=20 font=100 text=[] range=1-"+slices+" use");
run("AVI... ", "compression=JPEG frame=20 save="+out_folder+red_substr+".avi");

// close once done
close(green)

