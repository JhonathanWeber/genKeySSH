#!/bin/bash

email="";
mailCorrect="";
key="";

read -p 'Enter your e-mail: ' email;
echo "";

read -p "$email is your e-mail correct?(y or N): " mailCorrect;

if [[ $mailCorrect == 'y' || $mailCorrect == 'Y' ]]
then
	ssh-keygen -t ed25519 -C "$email"
	eval "$(ssh-agent -s)";
	read -p 'Enter PATH your key SSH: ' key;
	ssh-add "$key";
	echo "--------------------------------------------------------------------------------------------------------"
	echo "";
	cat "$key.pub";
	echo "";
	echo "		copy and past to your github >> configurations >> deploy key >> new key";
	echo "";
	echo "--------------------------------------------------------------------------------------------------------"
else
	 echo "Restart the process!";
fi;

