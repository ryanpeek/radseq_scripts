## USEFUL BASH COMMANDS/TRICKS

# COPY FILES FROM A LIST 

## OPTION 1: Copy Files

### print test, run in folder the bamlist lives
cat bamlist_mrg_RASI_all_50k | xargs -I % echo cp % ~/dat_share/

### actual copy line, run in screen or with srun:
cat bamlist_mrg_RASI_all_50k | xargs -I % cp % ~/dat_share # use -J if in OSX

## Add something to the beginning of each line in vim:
%s!^!/home/rapeek/projects/rana_rapture/MERGED/

## OPTION 2: Symbolic Links

### run this in directory you want symlinks to be
while read line; do ln -s "$line" "${line##*/}" ; done < ~/projects/rana_rapture/MERGED/bamlists/POPS/bamlist_mrg_RASI_all_50k
# weird stuff happens when running above...

# MAKING SOFT (SYMBOLIC LINKS):
ln -s ~/projects/rana_rapture/MERGED/*50000.bam .

## OPTION 3: Other alternatives

#while read -r line; do cp $line new_folder; done < list.txt
# for file in $(cat list.txt); do cp "$file" new_folder; done
# cp $(<bamlist_mrg_RASI_all_50k_thresh) dat_share

# CALC TOTAL FILE SIZES FROM A LIST
cat filelist | xargs -d \\n du -hc | tail -1

# COUNT SYMBOLIC LINK FILES IN A DIR
find *mrg.bam -type l -ls | wc -l

# CHECK SYMBOLIC LINK DEPTH:
find -L ./ -mindepth 15

# Sort to Most Recent File and pass to less
ls -tr slurm* | tail -n1 | xargs less

# to rename all files in a folder in one line
for file in *.obs; do mv "$file" "${file/_JointMAF1_0.obs/_jointMAF1_obs}"; done

# to move all files in multiple folders to an existing folder (must all have same extension/ending
find /path/to/parent -name '*.txt' -exec cp --backup=numbered -t /path/to/newdir {} +

# GREP
## to find list of files matching from another file
## use -v to reverse this (or -L to print only non-matching files
ls *.bam | grep -f ../bamseqs_rasi_rabo

## word count fastqs that match a bamlist or from a files
ls *RA*.fastq | grep -f ~/projects/rasi_hybrid/bamseqs_rasi_rabo | xargs wc -l > newfile


## find files in a list of directories:
find . -print | grep -i filename | wc -l

## move files that match list or pattern in a list
while read pattern; do
  mv "${pattern}"* ../folder_b/"$pattern"
done < list.txt

# VIM:
## COLUMN-WISE EDITING:
## to replace or append to a single column (across all rows):
ctrl + v to block edit (highlight column of interest, then shift + G to go to the last line,
then either shift + i to insert at the beginning of the column, or shift + a to append. Type or paste text, then hit escape and wait a second.Make sure to save.

## Loop through folders and run a script:
for f in ~/directory/*;
  do 
     [ -d $f ] && cd "$f" && echo Entering into $f and running fsc_pv
     sbatch ../../run_fsc26_pv.sh yuba_
  done;


## copy first line and specific line or lines to a file from multiple files

head -1 yuba_rabo_n80_yuba_rasi_n80_ancDivGro_boot.bestlhoods > yuba_rabo_n80_yuba_rasi_n80_ancDivGro_boot_bestlhoods.txt
## this copies header of file (first line) to a new file

tail -n +2 -q yuba_rabo_n80_yuba_rasi_n80_ancDivGro_boot.bestlhoods* >> yuba_rabo_n80_yuba_rasi_n80_ancDivGro_boot_bestlhoods.txt
# this copies everything starting at line 2 to the end, and doesn't include the filename (-q)

# copy a file to every directory in current location in terminal
for dir in *; do [ -d "$dir" ] && cp /path/file.txt "$dir" ; done

for dir in *; do [ -d "$dir" ] && cp ../run_fsc26.sh ../yuba_rabo_n80_yuba_rasi_n80_ancDivMigGro_jointMAFpop1_0.obs ../yuba_rabo_n80_yuba_rasi_n80_ancDivMigGro.est ../yuba_rabo_n80_yuba_rasi_n80_ancDivMigGro.tpl "$dir" ; done

# make many folders in a place:
mkdir $(seq --format 'yuba%02.0f' 2 25)

# rename and add padded zeros:
rename 's/AncDivGro.([0-9]).bestlhoods/AncDivGro.0$1.bestlhood/' *
rename 's/_AncDivGro/yuba_AncDivGro/' *
# rename test (run but don't do)
rename -n 's/^pattern$/replacement/g' *
# rename verbose (same but now do)
rename -v 's/pattern/replace/g' *

# count lines that match an awk
smap -c | grep rapeek | awk '($2=="med")' | wc -l

# count files per dir/subdir
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

# ignore certain files when listing
ls --ignore='*.bam' 
