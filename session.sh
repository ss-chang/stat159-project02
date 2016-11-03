# output file
info=session-info.txt

# Record Session Information
echo "Session Info" > $info
echo >> $info

# Version of Make
echo "Make Version" >> $info
echo "------------" >> $info
make --version >> $info
echo >> $info
echo >> $info

# Version of Git
echo "Git Version" >> $info
echo "-----------" >> $info
git --version >> $info
echo >> $info
echo >> $info

# Version of pandoc
echo "pandoc Version" >> $info
echo "--------------" >> $info
pandoc --version >> $info
echo >> $info
echo >> $info

# Version of R
echo "R Version" >> $info
echo "---------" >> $info
cd code/scripts; Rscript session-info.R
