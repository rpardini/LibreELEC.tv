#!/bin/bash

declare source="cm3588-nas.fritz.box"
declare source_ssh_user="root"

declare -A source_to_target_files=(
)

# stuff coming from /storage/.kodi/userdata at the source to local path mediacenter/kodi/config/
declare -a kodi_userdata_files=(
	"guisettings.xml"
	"sources.xml"
	"advancedsettings.xml"
)

# add from kodi_userdata_files to source_to_target_files
for file in "${kodi_userdata_files[@]}"; do
	source_to_target_files["/storage/.kodi/userdata/$file"]="packages/mediacenter/kodi/config/$file"
done

# copy using scp
for source_file in "${!source_to_target_files[@]}"; do
	target_file="${source_to_target_files[$source_file]}"
	target_dir=$(dirname "$target_file")
	mkdir -p "$target_dir"
	echo "Copying $source_file from $source to $target_file"
	scp "${source_ssh_user}@${source}:${source_file}" "$target_file" || echo "Failed to copy $source_file"
done
