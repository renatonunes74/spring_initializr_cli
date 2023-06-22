METADATA=$(curl -s -H 'Accept: application/json' https://start.spring.io)
FZF_DEFAULT_OPTS="--reverse --border sharp --cycle --multi --prompt='' --bind=tab:down,btab:up,ctrl-a:select-all,ctrl-space:toggle+down --color=bw --preview='echo {}' --preview-window=down:40%"
BUILD=$(echo $METADATA | jq -r '.type.default')
LANGUAGE=$(echo $METADATA | jq -r '.language.default')
SPRING_BOOT_VERSION=$(echo $METADATA | jq -r '.bootVersion.default')
GROUP_ID=$(echo $METADATA | jq -r '.groupId.default')
ARTIFACT_ID=$(echo $METADATA | jq -r '.artifactId.default')
NAME=$(echo $METADATA | jq -r '.name.default')
DESCRIPTION=$(echo $METADATA | jq -r '.description.default')
PACKAGE_NAME=$(echo $METADATA | jq -r '.packageName.default')
PACKING=$(echo $METADATA | jq -r '.packaging.default')
JAVA_VERSION=$(echo $METADATA | jq -r '.javaVersion.default')
DEPENDENCIES=""
DEPENDENCIES_FORMAT=$(echo "9999")

while true; do

	op=$(echo -e "\
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
	[13] Exit" | fzf)
	case $op in

		(*"[1]"*) BUILD=$(echo $METADATA | jq -r '.type' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf);;

		(*"[2]"*) LANGUAGE=$(echo $METADATA | jq -r '.language' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf) && echo $LANGUAGE;;

		(*"[3]"*) SPRING_BOOT_VERSION=$(echo $METADATA | jq -r '.bootVersion' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf) && echo $SPRING_BOOT_VERSION;;

		(*"[4]"*) read GROUP_ID;;

		(*"[5]"*) read ARTIFACT_ID;;

		(*"[6]"*) read NAME;;

		(*"[7]"*) read DESCRIPTION;;

		(*"[8]"*) read PACKAGE_NAME;;

		(*"[9]"*) read PACKING;;

		(*"[10]"*) JAVA_VERSION=$(echo $METADATA | jq -r '.javaVersion' | grep "id" | sed -s 's/"id": "//;s/",//;s/  .* //'|fzf);;

		(*"[11]"*) 
			DEPENDENCIES=$(echo $METADATA | jq '.dependencies.values | map(.values[]) | map(.id, .name, .description)[]' | sed '{N;N;s/\n/ /g;}' | fzf --exact --multi --sync --query "$DEPENDENCIES_FORMAT" --bind start:select-all+clear-query | awk '{print $1}' | sed -z 's/\n/,/g')
			DEPENDENCIES_FORMAT=$(echo $DEPENDENCIES | sed -s 's/,/ | /g;s/"//g');;

		(*"[12]"*)
			mkdir $ARTIFACT_ID 
			curl -s https://start.spring.io/starter.tgz -d language=$LANGUAGE \
				-d javaVersion=$JAVA_VERSION \
				-d type=$BUILD \
				-d bootVersion=$SPRING_BOOT_VERSION \
				-d groupId=$GROUP_ID \
				-d artifactId=$ARTIFACT_ID \
				-d description=$DESCRIPTION \
				-d dependencies=$DEPENDENCIES \
				| tar --directory $ARTIFACT_ID -zxf - && \
				echo "Spring Boot project now in $ARTIFACT_ID directory... Happy Hacking! :)"
							exit 0;;

						(*"[13]"*) exit && break;;

					esac

				done
