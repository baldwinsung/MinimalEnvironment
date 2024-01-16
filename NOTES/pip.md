Notes for pip

### Upgrade packages
# list
pip list --outdated

# upgrade
for i in `pip list --outdated | egrep -v "^Package|\-" | awk '{print $1}'`
do
pip install ${i} --upgrade
done

