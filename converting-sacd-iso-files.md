# Converting SACD .iso files

## Install `sacd`

1. Clone into the repo by typing: 

   ```
   cd
   git clone https://github.com/tatsuei/sacd
   cd sacd
   make
   ```

2. Then, once everything is installed, type:

   ```
   ./sacd --help
   ```

3. It will display a list of options:

   ```
   Usage: sacd -i infile [-o outdir] [options]
   
     -i, --infile         : Specify the input file (*.iso, *.dsf, *.dff)
     -o, --outdir         : The folder to write the WAVE files to. If you omit
                            this, the files will be placed in the input file's
                            directory
     -c, --stdout         : Stdout output (for pipe), sample:
                            sacd -i file.dsf -c | play -
     -r, --rate           : The output samplerate.
                            Valid rates are: 88200, 96000, 176400 and 192000.
                            If you omit this, 88.2KHz will be used.
     -s, --stereo         : Only extract the 2-channel area if it exists.
                            If you omit this, the multichannel area will have priority.
     -p, --progress       : Display progress to new lines. Use this if you intend
                            to parse the output through a script. This option only
                            lists either one progress percentage per line, or one
                            status/error message.
     -d, --details        : Show detailed information about the input
     -h, --help           : Show this help message
   
   ```

4. Voila! Now you can convert SACD .iso files into .wav files at your desired samplerate! :)