cat sprite.json | jq '. | keys'


cat sprite.json | jq '. | keys' for i do
    echo $i
done