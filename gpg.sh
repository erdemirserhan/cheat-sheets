# Create gpg-key 
gpg --full-generate-key

# List long form of the gpg-keys
gpg --list-secret-keys --keyid-format=long

# Prints the GPG key ID, in ASCII armor format (4096R/<GPG_KEY_ID)
gpg --armor --export <GPG_KEY_ID>

# Sign a file with gpg-cli
gpg -sign test.txt 

# Close automatically signing-commits feature
git config commit.gpgsign false 

# Always sign commits in git
git config commit.gpgsign true
