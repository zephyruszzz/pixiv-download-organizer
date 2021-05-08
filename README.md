# pixiv-download-organizer
 Local File Organizer
 
 ----
 
## What Does This Script Do
 
This script will organize filenames in the current directory with "$$$" in the filename.
It will create a subfolder with the folder name what the first half before "$$$" and move the files into subfolder without prefix.

e.g. Below file structure
```
folder 
    |__ subfoldername$$$filename1.jpg
    |__ subfoldername$$$filename2.jpg
    |__ subfoldername$$$filename3.jpg
    |__ ...
```

will be organized as

```
folder 
    |__ subfoldername
        |__ filename1.jpg
        |__ filename2.jpg
        |__ filename2.jpg
        |__ ...
```
 
## To Use This Script

1. Prepare files with naming pattern.
2. Download and move to the folder.
3. Double click.
