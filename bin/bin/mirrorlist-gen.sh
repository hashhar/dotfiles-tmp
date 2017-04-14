TEMP_FILE='/tmp/mirrors.json'
# Non-null score, completion>90%, sorted by score
curl https://www.archlinux.org/mirrors/status/json/ | jq '.urls | sort_by(.score) | .[] | select(.score != null) | select(.completion_pct >= 0.9) | { protocol: .protocol, url: .url, country: .country, score: .score }' > "$TEMP_FILE"

urls=( $(jq -r '.url' "$TEMP_FILE") )
scores=( $(jq '.score' "$TEMP_FILE") )
# Bash >= 4.0
if (( BASH_VERSINFO >= 4 )); then
    readarray -t countries <<<"$(jq '.country' "$TEMP_FILE")"
else
    IFS=$'\n' read -rd '' -a countries <<<"$(jq '.country' "$TEMP_FILE")"
fi
count=${#urls[@]}

for (( i=0; i < count; ++i )); do
    printf '## %s, Score = %s\nServer = %s$repo/os/$arch\n' "${countries[$i]}" "${scores[$i]}" "${urls[$i]}"
done

# vim: et sw=4
