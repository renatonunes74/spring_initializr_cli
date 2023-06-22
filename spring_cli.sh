#$METADATA = $(curl -s -H 'Accept: application/json' https://start.spring.io)
METADATA=$(cat metadata.txt)
BUILD=$(echo $METADATA | jq -r '.type.default')
LANGUAGE=$(echo $METADATA | jq -r '.language.default')
SPRING_BOOT_VERSION=$(echo $METADATA | jq -r '.bootVersion.default')
GROUP_ID=$(echo $METADATA | jq -r '.groupId.default')
ARTIFACT_ID=$(echo $METADATA | jq -r '.artifactId.default')
NAME=""
DESCRIPTION=$(echo $METADATA | jq -r '.description.default')
PACKAGE_NAME=""
PACKING=""
JAVA_VERSION=$(echo $METADATA | jq -r '.javaVersion.default')
DEPENDENCIES=""

while true; do

	DEPENDENCIES_FORMAT=$(echo $DEPENDENCIES | sed 's/[^ID: ".*"')
	op=$(echo -e "
	[1] Project:             $BUILD
	[2] Language:            $LANGUAGE
	[3] Spring Boot Version: $SPRING_BOOT_VERSION
	[4] Group:               $GROUP_ID
	[5] Artifact:            $ARTIFACT_ID
	[6] Name:                $NAME
	[7] Description:         $DESCRIPTION
	[8] Package name:        $PACKAGE_NAME
	[9] Packing:             $PACKING
	[10] Java:               $JAVA_VERSION
	[11] Dependencies:       $DEPENDENCIES
	[12] Create
	[13] Exit" | fzf --preview='echo {}' --preview-window=down:40%)
	case $op in

		(*"[1]"*) BUILD=$(echo $METADATA | jq -r '.type' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf);;

		(*"[2]"*) LANGUAGE=$(echo $METADATA | jq -r '.language' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf) && echo $LANGUAGE;;

		(*"[3]"*) SPRING_BOOT_VERSION=$(echo $METADATA | jq -r '.bootVersion' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf) && echo $SPRING_BOOT_VERSION;;

		(*"[4]"*) echo "Group: " && read GROUP_ID;;

		(*"[5]"*) echo "Artifact: " && read ARTIFACT_ID;;

		(*"[6]"*) echo "Name: " && read NAME;;

		(*"[7]"*) echo "Description: " && read DESCRIPTION;;

		(*"[8]"*) echo "Package name: " && read PACKAGE_NAME;;

		(*"[9]"*) echo "Packing: " && read PACKING;;

		(*"[10]"*) JAVA_VERSION=$(echo $METADATA | jq -r '.javaVersion' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf);;

		(*"[11]"*) DEPENDENCIES=$(echo $METADATA | jq '.dependencies.values | map(.values[]) | map(.id, .name, .description)[]' | sed '{N;N;s/\n/#/g;}' | sed -E 's/(".+")#(".+")#(".+")/ID: \1 T: \2 D: \3/' | fzf;;
 #--bind start:select-all+clear-query
		(*"[12]"*) exit && break;; 

	esac

done
