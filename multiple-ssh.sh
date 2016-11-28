#!/bin/bash

#split the instances passed
servers=$(echo $1 | tr ',' "\n")

#lop for command prompt contuation
while true; do
    # read prompt from user to continue..
    read -p "Do you want to enter the command:(y/n) `echo $'\n> '`" yn	
    #case to response on prompt
    case $yn in
        [Yy]* ) echo yes
		#read command from user
                read -p "Enter the Command you want run on all the instances: `echo $'\n> '`" cmd
		# loop for connecting to 
                for i in $servers;
                        do
                                echo "Connecting to " $i
				#ssh to instance, run the command and store it to a variabe.
                                output=$(ssh -oStrictHostKeyChecking=no -i <PEM Key Path> ubuntu@$i "$cmd")
                                echo $output                            

                        done
;;
        [Nn]* )
                echo "Thank You"
                exit;;
        * ) echo "Please answer yes or no.";;
    esac
done