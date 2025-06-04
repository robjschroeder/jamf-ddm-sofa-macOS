#!/bin/zsh

###############################################################
# A script to determine a DDM-generated Enforced Install Date #
# within the last numberOfDays.                               #
# If the no matches are found, "None" will be returned.       #
###############################################################

scriptVersion="0.0.2"

numberOfDays=7

ddmEnforcedInstallDate=$( awk -v date=$(date -v-"$numberOfDays"d +%Y-%m-%d) '$1 >= date' /var/log/install.log | grep EnforcedInstallDate | sed -n 's/.*EnforcedInstallDate:\([^|]*\)|VersionString:\([^|]*\)|BuildVersionString:\([^|]*\).*/\1 macOS \2 (\3)/p' | sort -u| tr '\n' ';' | sed 's/;/; /g' | sed 's/; $//' )

if [[ -z "${ddmEnforcedInstallDate}" ]]; then
    RESULT="None"
else
    RESULT="${ddmEnforcedInstallDate}"
fi

/bin/echo "<result>${RESULT}</result>"

exit 0