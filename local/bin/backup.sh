#/bin/bash

# --- Mirror ---
# Data that is is only stored for persistance, not so it can be deleted from the
# device. So all files that are deleted on the drive will also be deleted from 
# the 'mirror' backup.

rsync -av --delete --progress ~/brz ~/mnt1/mirror/
rsync -av --delete --progress ~/Documents ~/mnt1/mirror/
rsync -av --delete --progress ~/Pictures ~/mnt1/mirror/
rsync -av --delete --progress ~/.gitconfig ~/mnt1/mirror/


# --- Archive ---
# Data that will only be stored on the hard drive.
# Data that is deleted on the computer will not be deleted on the hard drive.
# rsync -av --delete --progress /some_data_for_arcive ~/mnt1/archive/
