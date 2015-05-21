function swup {
  DIFF_DIRECTORY="$HOME/Daily Diffs/payments/master"
  START_DIRECTORY=$PWD

  cd "$DIFF_DIRECTORY"
  mv old tmp
  mv new old
  mv tmp new

  cd new
  git pull

  cd $START_DIRECTORY
  open $HOME/swup-payments.foldercomparison
}
