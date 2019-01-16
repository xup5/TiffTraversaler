  tifdir = getDirectory("Select a Directory");
  macrodir = File.openDialog("Select a Macro file (.ijm)");
  
  listFiles(tifdir); 

  function listFiles(dir) {
     list = getFileList(dir);
     for (i=0; i<list.length; i++) {
        if (File.isDirectory(list[i])){
           listFiles(""+dir+list[i]);
        }else {
           if (endsWith(list[i], ".tif")){
           	amacro(dir, list[i]);
           }
        }
     }
  }

  function amacro(tifpath, tiffile) {
  	fullpath = ""+tifpath + tiffile;
  	open(fullpath);
  	runMacro(macrodir);
  	close();
  }