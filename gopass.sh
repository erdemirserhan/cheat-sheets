gpg --import <your_private_key>.key
gopass setup

gopass clone ssh://git@<your_git_repo>:<your_git_repo_port>/path/to/your/repo/password_files.git password_list

gopass list

gopass show password_list/another_path/<your_key>.gpg
