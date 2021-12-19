#!/bin/bash

main() {
  TMP1="games-name.tmp.txt"
  TMP2="games-regex.tmp.txt"

  get_games |
  tee "$TMP1" |
  sed 's~.*~(^| )&$~' > "$TMP2"

  get_terminal_apps |
  join - "$TMP1" |
  find_roots "$TMP2" |
  show_package_details

  rm "$TMP1" "$TMP2"
}

get_games() {
  grep --no-filename -E "^(Package: |Section: ([^/]+/)?games$)" /var/lib/apt/lists/* 2>/dev/null |
  grep --before-context 1 "^Section: " |
  grep "^Package: " |
  cut -d " " -f 2 |
  grep -ve "-dbg$" |
  sort -u
}

get_terminal_apps() {
  {
    get_libtinfo_rdeps
    get_nongraphic_apps
  } |
  sort -u
}

get_nongraphic_apps() {
  # this is an underestimate - some apps include multiple interfaces

  {
    get_graphic_apps

    apt-cache pkgnames |
    sort -u
  } |
  keep_unique_lines
}

keep_unique_lines() {
  sort |
  uniq -c |
  grep -v "^ *2" |
  sed "s~^ *1 *~~"
}

get_graphic_apps() {
  # This is an underestimate because an app may rarely rely on sysctl as well or
  # be compiled with static linking.

  apt-cache \
    --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances \
    --recurse rdepends \
    libxau6 libxdmcp6 \
    libwayland-client0 libwayland-egl1 libwayland-egl1-mesa \
    libdrm-common libglvnd0 libglapi-mesa \
    libglide3 \
    libecore-fb1 \
    libdirectfb-1.2-9 libdirectfb-1.7-7 \
    libomxil-bellagio0 \
    |
  sed "s/^[ |]*//" |
  grep -v ":" |
  sort -u
}

get_libtinfo_rdeps() {
  # This is an underestimate because other libraries may exist and
  # an app may also control a terminal with direct I/O or
  # be compiled with static linking.
  # This is an overestimate because some apps or libraries may have loose
  # dependency linking and may not provide a TUI interface per se to the user.

  # TODO: we could find more candidates if we filtered out SDL & Python from recursion:
  #       apt-cache --recurse rdepends libtinfo5 libtinfo6 |

  apt-cache rdepends \
   libtinfo5 libtinfo6 libreadline6 libreadline7 libreadline8 \
    libaa1 libcaca0 \
    libncurses5 libncurses6 libncursesw5 libncursesw6 libcdk5 libcdk5nc6 \
    libcwidget3v5 libglktermw-dev libgnt0 \
   libyascreen0 \
   libslang2 libslang2-modules libnewt0.52 \
   golang-github-muesli-termenv-dev golang-pault-go-technicolor-dev \
   libncursesada5 libncursesada6.2.3 libncursesada6.2.20180127.1 \
   python-aalib python-colorama python-couleur python-urwid pypy-wcwidth python-wcwidth \
    python3-aalib python3-ansimarkup python3-colorama python3-colorclass python3-colors \
    python3-crayons python3-pastel python3-termcolor python3-urwid python3-wcwidth \
   node-ansi node-ansi-styles node-ansi-color-table node-ansi-colors \
    node-ansi-escapes node-chalk node-charm node-kuler node-has-ansi \
    node-supports-color node-tinycolor node-term-size window-size \
   libcdk-perl \
    libcurses-perl libcurses-ui-perl libcurses-widgets-perl \
    libtext-ansi-util-perl libterm-size-perl \
    libterm-size-any-perl libterm-size-perl-perl libterm-slang-perl \
   r-cran-crayon \
   libjansi-java libjansi-native-java \
   lua-curses \
   yorick-curses \
   ruby-ansi ruby-colorator ruby-colored ruby-colored2 ruby-curses ruby-ncurses \
    ruby-rainbow ruby-term-ansicolor \
   librust-ansi-term-dev librust-ascii-canvas-dev librust-colored-dev librust-fwdansi-dev \
    librust-termcolor-dev librust-terminal-size-dev librust-wincolor-dev \
   |
  sed "s/^[ |]*//" |
  grep -v ":" |
  sort -u
}

find_roots() {
  xargs apt-cache \
   --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances \
    rdepends |
  grep -Ef "$1" |
  prune_if_has_children
}

prune_if_has_children() {
  grep -A 1 "^[^ ]" |
  grep -v "^--$" |
  tac |
  skip_line_after_indented_line |
  tac
}

skip_line_after_indented_line() {
  sed -n "
    s~^ ~~
    T print
      n
      b exit
    :print
      p
    :exit
  "
}

show_package_details() {
  xargs apt-cache show |
  grep -v "^Description-md5: " |
  grep --color -E "^((Package|Depends|Recommends|Suggests): |Description| )"
}

main "$@"
