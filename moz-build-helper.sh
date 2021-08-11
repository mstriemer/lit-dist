#!/bin/bash

comment_leadout=' */
'
{ IFS= read -rd '' comment_block <moz-header.txt;} 2>/dev/null

bad_create='static createElement(t,e){const s=E.createElement("template");return s.innerHTML=t,s}'
{ IFS= read -rd '' replaced_create <moz-create-element.js;} 2>/dev/null

npm run build
mkdir -p mozdist
in="$bad_create" out="$replaced_create" perl -p -e 's/\Q$ENV{"in"}/$ENV{"out"}/g' dist/lit.all.js > mozdist/noheader-lit.all.js
in="$comment_leadout" out="$comment_leadout$comment_block" perl -p -e 's/\Q$ENV{"in"}/$ENV{"out"}/' mozdist/noheader-lit.all.js > mozdist/lit.all.js

