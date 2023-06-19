# Open a git-bash terminal in windows and execute following to activate pre-commit

mkdir precommittest
cd precommittest
<path to installed python exe> -m venv venv
. ./venv/Scripts/activate
python -m pip install pip --upgrade
python -m pip install pre-commit
pre-commit sample-config > .pre-commit-config.yaml
pre-commit install
pre-commit run --all-files


# In Linux

virtualenv --python python3.<python_version_here> venv
source venv/bin/activate
