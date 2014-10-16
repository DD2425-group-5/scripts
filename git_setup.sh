#!/bin/bash
echo "Enter the name to use for commits."
read NAME
git config --global user.name "$NAME"
echo "Enter the email address used for GitHub."
read EMAIL
git config --global user.email $EMAIL

echo "Will now generate the rsa keys for GitHub access. You do not need to modify the save location. Choose a passphrase to use when you are communicating with GitHub."
ssh-keygen -t rsa -C $EMAIL
echo "Copy the following output, and then add it to SSH keys on your GitHub account (settings>ssh keys)."
cat ~/.ssh/id_rsa.pub
echo "When the key has been added, press return."
read
echo "Checking that things are correctly set up. Enter the passphrase chosen above."
ssh -T git@github.com
