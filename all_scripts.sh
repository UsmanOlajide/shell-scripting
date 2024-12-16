#!/bin/bash

copyFile() {
    echo Where do you want to copy your file from?

    read prompt

    if [ -d $prompt ]; then
        echo "Which file do you want to delete in $prompt"
        read file_path
        echo "Where do you want to copy your file $file_path to"
        read parentdir

        echo "Name your new directory"
        read newdir_path
        newdir=./$parentdir/$newdir_path
        mkdir $newdir
        echo $newdir_path created successfully in $parentdir
        echo $file_path successfully copied to $newdir_path

        file=./$prompt/$file_path
        cp "$file" "$newdir"
        exit
    else
        echo "$prompt is not a directory"
    fi
}

deleteFunction() {
    echo What do you want to delete ?

    read prompt

    if [ -f $prompt ]; then
        rm $prompt
        echo "$prompt deleted successfully"
        exit
    else
        if [ -d $prompt ]; then
            cd $prompt
            echo "Which file do you want to delete in $prompt"
            read file
            if [ -f $file ]; then
                rm $file
                echo "$file in $prompt deleted successfully"
            else
                echo "$file does not exist in $prompt"
            fi
            exit
        fi
        echo "$prompt does not exist"
    fi
}

fetchAppVersion() {
    url="https://raw.githubusercontent.com/UsmanOlajide/shell-scripting/refs/heads/main/Env_gr.yml"

    if [ -f output.txt ]; then
        echo content already exists locally
    else
        content=$(curl -o output.txt "$url")
    fi

    echo "Which app version do you want to fetch ?"

    read prompt

    if [ "${prompt}" == "public-api" ]; then
        version=$(grep "wow_public_api_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "legacy-api" ]; then
        # APP_NAME="^\\s*api:"
        version=$(grep "^\\s*api:" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "refund" ]; then
        version=$(grep "refund_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "wps" ]; then
        version=$(grep "wps" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "marketplace-aws" ]; then
        version=$(grep "wow_marketplace_aws_version" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "content-services" ]; then
        version=$(grep "wow_content_services_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "dac" ]; then
        version=$(grep "dac" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "loyalty" ]; then
        # APP_NAME="loyalty_build_version"
        version=$(grep "loyalty_build_version" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "marketplace-catalog" ]; then
        version=$(grep "wow_marketplace_cat_version" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "marketplace-merchant" ]; then
        version=$(grep "wow_marketplace_mer_version" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "marketplace-notification" ]; then
        version=$(grep "wow_marketplace_not_version" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "marketplace-security" ]; then
        version=$(grep "wow_marketplace_sec_version" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "marketplace-submission" ]; then
        version=$(grep "wow_marketplace_sub_version" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "promo-codes" ]; then
        # APP_NAME="promo_codes_package_ensure"
        version=$(grep "promo_codes_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "payment-batch" ]; then
        # APP_NAME="payment_batch_package_ensure"
        version=$(grep "payment_batch_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "payment" ]; then
        # APP_NAME="payment_package_ensure"
        version=$(grep "payment_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "dealcreator" ]; then
        # APP_NAME="deal_creator_package_ensure"
        version=$(grep "deal_creator_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "salesforce-rest" ]; then
        version=$(grep "salesforce_api_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "user-service" ]; then
        # APP_NAME="user_service_package_ensure"
        version=$(grep "user_service_package_ensure" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "batch" ]; then
        # APP_NAME="^\\s*batch:"
        version=$(grep "^\\s*batch:" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "payment-consumer" ]; then
        # APP_NAME="payment-consumer"
        version=$(grep "payment-consumer" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    elif [ "${prompt}" == "legacy-front-end" ]; then
        # APP_NAME="frontend"
        version=$(grep "frontend" output.txt | grep -E -o "[0-9]+([._-][0-9]+)*")
        echo "Version is $version"
    else
        echo "You have entered a wrong prompt"
    fi
}

cloudFunction() {
    echo "Name your new file:"
    read newfile

    echo "Name your new directory:"
    read newdir

    echo "Enter your ip_address:"
    read ip_address

    echo "Logging in to the instance..."

    ssh -T -i ~/Downloads/olajide-key.pem ec2-user@$ip_address <<EOF
    if [ -f "$newfile" ]; then
        echo "$newfile already a file"
    else
        touch "$newfile"
        echo "$newfile created successfully"

        if [ -d "$newdir" ]; then 
         echo "$newdir already a directory"
        else
         mkdir "$newdir"
         echo "$newdir created successfully"
         cp "$newfile" "$newdir"
         echo "$newfile successfully copied to $newdir"
        fi
    fi
EOF
}

case $1 in
"copy")
    copyFile "$2" "$3"
    ;;

"delete")
    deleteFunction
    ;;

"fetch")
    fetchAppVersion
    ;;

"cloud")
    cloudFunction
    ;;

*)
    echo "Usage $0 {copy|delete|fetch|cloud}"
    ;;

esac
