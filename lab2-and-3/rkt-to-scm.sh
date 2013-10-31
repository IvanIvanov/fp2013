for files in $1/*.rkt; do
mv "$files" "${files%.rkt}.scm"
done

echo "Renamed all .rkt files in $1 to .scm"
