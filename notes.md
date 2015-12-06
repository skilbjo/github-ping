# Linux Nodes
## `grep`
````
grep -E "\d{4}-[01]\d-[0-3]\d" README.md
````

## `sed`
### Testing
echo 'Increment: 1' | sed 's/(\Increment: )([0-9]+)/50/ge'
echo 'Increment: 1' | perl -p -e 's/(Increment: )([0-9]+)/Increment: $2+3/e'


### Works
````
echo '2015' | sed 's/[0-9]\{4\}/2014/g'
echo '2014-12' | sed 's/[0-9]\{4\}-[0-9]\{2\}/2015-03/g'
echo '2014-12-01' | sed 's/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/2015-03-01/g'
echo '2014-12-01' | sed 's/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/'$(date +%Y-%m-%d)'/g'
````

### Testing
````
echo '2014-12-01' | sed 's/[0-9]\{4\}-[01]\d-[0-3]\d/'$(date +%Y-%m-%d)'/g'
echo '2014-12-01' | sed 's/[0-9]\{4\}-[01]\d-[0-3]\d/'$(date +%Y-%m-%d)'/g'
````


### Does Work
````
sed -i '' 's/\d{4}-[01]\d-[0-3]\d/"$(date +%Y-%m-%d)"/g' README.md
sed -i '' 's/\d\{4\}-[01]\d-[0-3]\d/"$(date +%Y-%m-%d)"/g' README.md
sed -i '' 's/\d\{4\}-[01]\d-[0-3]\d/"$(date +%Y-%m-%d)"/g' README.md
sed 's/[0-9]{4}-[01]\d-[0-3]\d/'$(date +%Y-%m-%d)'/g' README.md
sed 's/[0-9][0-[01]\d-[0-3]\d/'$(date +%Y-%m-%d)'/g'
sed -i '' 's:"\d{4}-[01]\d-[0-3]\d":"'$(date +%Y-%m-%d)'":g' README.md
sed -i '' 's/\d{4}-[01]\d-[0-3]\d/'$(date +%Y-%m-%d)'/g' README.md
sed -i '' 's/[[:digit:]]{4}-[01][[:digit:]]-[0-3][[:digit:]]/'$(date +%Y-%m-%d)'/g' README.md
sed -i '' 's@\d\{4\}-[01]\d-[0-3]\d@"$(date +%Y-%m-%d)"@g' README.md
````