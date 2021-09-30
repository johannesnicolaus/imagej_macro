// get directory
dir = getDirectory("Choose the folder ");
list = getFileList(dir);
out_folder = getDirectory("Choose the output folder ");
//print(dir);

for (i = 0; i < list.length; i++) {
	// replace appended slash
	fullname = dir+replace(list[i], "/", "\\");
	basename = replace(list[i], "/", "");
	print(fullname);
	print(basename);
	
	// open image
	run("Image Sequence...", "open="+fullname+" sort");

	// subtract background
	run("Subtract Background...", "rolling=35");

	// save as tiff
	saveAs("tiff",out_folder+basename);

	// close
	close(basename+".tif");
};
