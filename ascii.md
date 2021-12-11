# Terminálból játszható játékok

ASCII grafika, konzol, ncurses, ssh

## Akció

* `asciijump` - síelős, de nem sikerült rájönni
* `bombardier` - Commodore 16/Plus 4 Blitz16
* `matanza` - űrhajós, AI-val nem sikerült rájönni hogy kell játszani, pedig szép lenne
* `ninvaders` - invaders
* `moon-buggy` - lukakat kell átugrani oldalnézetben
* `nsnake` - csigavonal
* `pacman4console` - Pacman

### Tetris

* `bastet`
* `netris`
* `petris`
* `tint`

## Stratégia

* `dopewars -t` - gazdasági szimuláció
* `empire` - sztochasztikus [stratégiai](https://en.wikipedia.org/wiki/Empire_(1977_video_game)

### Valós idejű stratégia

* `curseofwar` - akció-stratégia

### Táblás

* `gnushogi -C` - Japán sakk
* `gnuminishogi -C` - 5x5 Japán sakk
* `nettoe` - tic tac toe
* `pente -curses` - ötödölő
* `sjaakii` - sakk

## Rejtvény

* `animals` - betanítható barkóba
* `atom4 -mt`
* `cavezofphear` - szórakoztató [Boulder Dash](https://en.wikipedia.org/wiki/Boulder_dash) ([Supaplex](https://en.wikipedia.org/wiki/Supaplex)) klón
* `freesweep` - aknakereső
* `greed` - meg kell enni a színes számokat
* `sudoku`

## Játékszer

* `bb -driver curses` - animáció
* `bsdgames`: arithmetic, bcd, caesar, countmail, morse, number, pig, pom, ppt, primes, random, rain, rot13, wargames, worms, wtf
* `robotfindskitten`
* `xaos -driver aa -aadriver list` - fraktálok
* `zivot` - Convey's game of life

## Roguelike

* `angband -mgcu` - nethack/Moria/Rogue
* `slashem` - Dungeons & Dragons labirintus (Rogue, ADOM, Nethack)
* `tome -mgcu`
* `nethack-console`
* `omega-rpg` - roguelike
* `zangband`

## Gépelős

* `typespeed`

## Vegyes

* `bsdgames`: adventure, atc, backgammon, battlestar, boggle, canfield, cribbage, dab, go-fish, gomoku, hack, hangman, hunt, mille, monop, phantasia, quiz, robots, sail, snake, tetris-bsd, trek, worm, wump

## Lekérdezés

```
apt-cache search "`apt-cache rdepends \
 libaa1 libncurses5 libncurses6 |\
sort -u |\
sed 's/^[ |]*/^/; s/$/$/' |\
sed ':l; N; s/\n/|/; t l'`" |\
sort
```

## Hivatkozások

* Pitman (Tristar, 2004) - ennek nem jutott eszembe a neve, <3kB 22 pályával, Sokoban és Bouldar Dash kombinációja https://www.pouet.net/prod.php?which=12206
* https://en.wikipedia.org/wiki/Dwarf_fortress
* https://github.com/ravener/0verkill - oldalnézet lövöldözős
* https://blends.debian.org/junior/tasks/games-text
