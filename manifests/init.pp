# == Class ruby
#
# A wrapper around rbenv to set various defaults.
class ruby (
  $version,
) {
  class { 'rbenv': }
  rbenv::plugin { ['sstephenson/ruby-build']: }
  rbenv::build { $version:
    global => true
  }
}
