# Gitless manual install documentation for MacOS 10.11 (El Capitan)
#   Scott R. Sideleau (@scottsideleau)
#   02-Oct-2010
##############################################################################

#1. Install and link Python2 (optional, but recommended).

brew install python
brew link python

#2. Install and link Python3.

brew install python3
brew link python3

#3. Install and link Git.

brew install git
brew link git

#4. Prepend PATH in ~/.bash_profile with /usr/local.

vim ~/.bash_profile
export PATH=/usr/local/bin:$PATH
source ~/.bash_profile

#5. Install libgit2, a dependency of PyGit2 that pip doesn't install.

brew install libgit2

#6. Install PyGit2.

pip3.5 install pygit2

#7. Download gitless tarball and manually install (via easy_install).

wget -c https://github.com/scottsideleau/gitless/archive/master.tar.gz
tar xzvf master.tar.gz
python3.5 setup.py install
