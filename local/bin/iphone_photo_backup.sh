#!/bin/bash

SRC_DIR="$1"
DEST_DIR="$2"

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_dir> <destination_dir>"
    echo "Example: $0 /mnt/iphone/DCIM /media/external_drive/photos"
    exit 1
fi

mkdir -p "$DEST_DIR"

total_files=$(find "$SRC_DIR" -type f \( -iname "*.heic" -o -iname "*.mov" -o -iname "*.jpg" \) | wc -l)
current_file=0

echo "Found $total_files files to process"

# find files with .heic, .mov, or .jpg, print them with \0 as delimiter and then set IFS to '' (no delimiter) and read each filename as file and do: for each file
find "$SRC_DIR" -type f \( -iname "*.heic" -o -iname "*.mov" -o -iname "*.jpg" \) -print0 | while IFS= read -r -d $'\0' filepath; do
    # Progress bar computations
    ((current_file++))
    filename=$(basename "$filepath")
    percentage=$((current_file * 100 / total_files))

     # Create progress bar
    printf "\rProgress: [%-50s] %d%% (%d/%d) Current: %s" \
    $(printf "#%.0s" $(seq 1 $((percentage / 2)))) \
    $percentage $current_file $total_files "$filename"

    # Determine creation year of picture 
    year=$(exiftool -d '%Y' -CreateDate -S -s "$filepath" | head -n 1 )

    if [ -z "$year" ]; then
        year=$(exiftool -d '%Y' -DateTimeOriginal -S -s "$filepath" | head -n 1 )
    fi

    if [ -z "$year" ]; then
        year=$(stat -c %y "$filepath" | cut -d- -f1)
        echo -e "\nWarning: No EXIF data found for $filepath, using file system date"
    fi

    # Create dir and copy picture
    mkdir -p "$DEST_DIR/$year"

    if ! rsync --ignore-existing "$filepath" "$DEST_DIR/$year/"; then
        echo -e "\nError copying $filename"
        continue
    fi

done

echo -e "\nOrganization complete!"

