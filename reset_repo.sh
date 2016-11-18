#! /bin/bash
IFS=''
# Accepts the field name, the current value, and the replacement
substitutePackageFieldVal() {
  sed -i -e "/\"$1\"/s/$2/$3/" package.json;
  echo "Field \"$1\" set to $3";
}


echo "
------------------------------------------------------------------
Hi $USER. You have cloned a generic JS module boilerplate.
To make this repo yours, I will replace the generic parts
of package.json with project-specific info you provide here.

I will also remove the current .git folder and re-initialise.
------------------------------------------------------------------
"

# Prompt for and edit the "name" field:
name_prompt="
Can I take a name for your project? Note that I'm not going to
validate this: check https://docs.npmjs.com/files/package.json#name
if you're not sure of valid formatting.
> "

read -e -p $name_prompt name
substitutePackageFieldVal "name" "es6-module-starter" $name
mv ../es6-module-starter ../$name

# Prompt for and edit the "description" field:
description_prompt="
Can I take a description of your project? Again, I'm not validating,
so please escape any double quotes.
> "

read -e -p $description_prompt description
substitutePackageFieldVal "description" "Boilerplate starter kit for ES2015\+\/Babel modules\." $description

# Prompt for and edit the "author" field:
author_prompt="
Can I take the name you would use in the 'author' section? You can add
a contact email directly in the form: 'My Name <myname@example.com>'
> "

read -e -p $author_prompt author
substitutePackageFieldVal "author" "Daniel Couper \<danielcouper81\@googlemail\.com\>" $author

# Remove keywords
sed -i -e '21,28d' package.json
echo "
I've removed the keywords; add your own in at your leisure.
"

rm -rf .git
git init

exit
