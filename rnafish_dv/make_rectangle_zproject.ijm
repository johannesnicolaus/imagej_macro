makeRectangle(106, 450, 100, 100);
waitForUser("select cell")
run("Duplicate...", "duplicate");
run("Z Project...", "projection=[Max Intensity]");
run("Scale Bar...", "width=5 height=4 font=0 color=White background=None location=[Lower Right] bold overlay");