# batch-music-convert
This bash script will convert all music (MP3) in the current folder using the LAME encoder.
It is useful if you want to save some space on your drive or if you want to stream your music over a slow internet connection.

The script is tested with version 3.99 of the encoder. 

## What it does
It collects all music using the find utility. It then gives each file to LAME for encoding and append '_converted' to the new file. 
hello.mp3 becomes hello_converted.mp3.
After that it deleted hello.mp3. 

## Usage
Place the script at the folder you want to batch convert.
You can give an argument with the quality like this:
    
    batchconvert.sh 5

Default quality is 5 which is about 128 kbit VBR MP3 quality. 
0 is highest quality and 9 is lowest quality. 

See http://wiki.hydrogenaud.io/index.php?title=LAME#VBR_.28variable_bitrate.29_settings for more information.

You write the output to a log:

    batchconvert.sh > batchconvert.log

## To Do
* Make deletion of files optional
* Custom output folder
* Custom input folder instead of just the current folder

## Why did i make this?
I was playing around with my Raspberry Pi when i noticed the musicserver couldn't keep up with the musicquality. The upload was too slow for the high quality music and i didn't feel like converting them all by hand. And so this script was born. 
I figured it could be a handy script. 
