# Bos Wars

## Introduction

https://en.wikipedia.org/wiki/Bos_Wars

## Install

```
H=$HOME/.boswars
mkdir -p $H/data/maps/towdef.map
ln -st $H/data/ /usr/share/games/boswars/{campaigns,graphics,intro,languages,patches,scripts,sounds,units}
ln -st $H/data/maps/ /usr/share/games/boswars/maps/*
wget -P $H/data/maps/towdef.map \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/setup.sms \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/presentation.smp \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/terrain.lua \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/patch.lua \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/moon-d00.png \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/moon-d08.png \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/moon-d17.png \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/moon-d20.png \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/moon-d21.png \
  https://raw.githubusercontent.com/bkil/open-gaming/refs/heads/master/bos-wars/towdef.map/moon-d22.png \
  -nc

boswars -d $H/data
```

## Map key

* space: (free space)
* `.`: magma hot spot
* `#`: wall
* B: Big gun turret
* C: training Camp
* E: Engineer
* F: vehicle Factory
* G: Gun turret
* N: Nuclear power plant
* P: Power plant
* R: Radar
* V: Vault

## towdef

* [./towdef.map/presentation.smp](./towdef.map/presentation.smp)
* [./towdef.map/setup.sms](./towdef.map/setup.sms)
* [./towdef.map/terrain.lua](./towdef.map/terrain.lua)


```
#                                           nnnnn#
# ################### ####################  nnnnn#
# #                 # #                  #  nnnnn#
# # # # # # # # # # # # # # # # # # # # ##  nnnnn#
# #                 # #                  #  nnnnn#
# # # # # # # # # # # # # # # # # # # # ##  nnnnn#
# #                 # #                  #  nnnnn#
# ### # ####### # # # ### # ######## # # ..  pppp#
#   #   #ccccc#     #   #   #vvvvvv#     ..  pppp#
# ### # #ccccc# # # # ### # #vvvvvv# # # #   pppp#
# #     #ccccc#     # #     #vvvvvv#     ..  pppp#
# # # # #ccccc# # # # # # # #vvvvvv# # # .. nnnnn#
# #     #ccccc#     # #     #vvvvvv#     #  nnnnn#
# # # # #ccccc# # # # # # # #vvvvvv# # # #  nnnnn#
# #     #ccccc#     # #     ########     #  nnnnn#
# # # # ####### # # # # # # ######## # # #  nnnnn#
# #     #######     # #     e e e        #  nnnnn#
### # #         # # ### # # # # # # # # ##  nnnnn#
#       # # # #                          #   pppp#
# # # #         # # # # # # # # # # # # ##   pppp#
#       # # # #                          #   pppp#
# # # #         # # ######################   pppp#
# # #################                       fffff#
#   #                                fffff  fffff#
# # #                                fffff  fffff#
# # #                                fffff  fffff#
#   #                                fffff  fffff#
# # #                                fffff  fffff#
# # #                                fffff  fffff#
#   #                                fffff       #
# # #                                            #
# # #                                            #
#   #                                            #
# # #                                            #
# # #                                            #
#   #                                            #
# # #                                            #
# # #                                            #
#   #                                            #
# # #                                            #
# # #                                            #
#   #                                            #
# # #                                            #
# # #  ###########################################
#   #                                            #
# # #                                            #
# # ###########################################  #
#                                             #  #
# # ## ## ## ## ## ## ## ## ## ## ## ## ## ## #  #
# #  ..                                     bb#  #
#    ..                                     bb#  #
# #  ##########################################  #
# #  #                                           #
#    #                                           #
# #  #  ##########################################
# #  #  ##########################################
#    #  ##########################################
# #  #  ###GG R                                ..#
# #  #  ###GG                                  ..#
#    #  ###.. ## ## ## ## ## ## ## ## # ## ## ## #
# #  #  ###..                         #          #
# #  #  ############################.. ###### ## #
#    #  ############################.. #    #    #
# #  #  #                            ### ## #  # #
# #  # ## ###                            #  #  # #
#    #    # ..############################  #    #
# ## ###### ..############################  #  # #
#          #                         ..###  #  # #
# ## ## ## # ## ## ## ## ## ## ## ## ..###  #    #
#..                                  gg###  #  # #
#..                                r gg###  #  # #
##########################################  #    #
##########################################  #  # #
##########################################  #  # #
#                                           #    #
#                                           #  # #
#  ##########################################  # #
#  #BB                                     ..    #
#  #BB                                     ..  # #
#  # ## ## ## ## ## ## ## ## ## ## ## ## ## ## # #
#  #                                             #
#  ########################################### # #
#                                            # # #
#                                            #   #
###########################################  # # #
#                                            # # #
#                                            #   #
#                                            # # #
#                                            # # #
#                                            #   #
#                                            # # #
#                                            # # #
#                                            #   #
#                                            # # #
#                                            # # #
#                                            #   #
#                                            # # #
#                                            # # #
#       FFFFF                                #   #
#FFFFF  FFFFF                                # # #
#FFFFF  FFFFF                                # # #
#FFFFF  FFFFF                                #   #
#FFFFF  FFFFF                                # # #
#FFFFF  FFFFF                                # # #
#FFFFF  FFFFF                                #   #
#FFFFF                       ################# # #
#PPPP   ###################### # #         # # # #
#PPPP   #                          # # # #       #
#PPPP   ## # # # # # # # # # # # #         # # # #
#PPPP   #                          # # # #       #
#NNNNN  ## # # # # # # # # ### # #         # # ###
#NNNNN  #        E E E     # #     #######     # #
#NNNNN  # # # ######## # # # # # # ####### # # # #
#NNNNN  #     ########     # #     #CCCCC#     # #
#NNNNN  # # # #VVVVVV# # # # # # # #CCCCC# # # # #
#NNNNN  #     #VVVVVV#     # #     #CCCCC#     # #
#NNNNN .. # # #VVVVVV# # # # # # # #CCCCC# # # # #
#PPPP  ..     #VVVVVV#     # #     #CCCCC#     # #
#PPPP   # # # #VVVVVV# # ### # # # #CCCCC# # ### #
#PPPP  ..     #VVVVVV#   #   #     #CCCCC#   #   #
#PPPP  .. # # ######## # ### # # # ####### # ### #
#NNNNN  #                  # #                 # #
#NNNNN  ## # # # # # # # # # # # # # # # # # # # #
#NNNNN  #                  # #                 # #
#NNNNN  ## # # # # # # # # # # # # # # # # # # # #
#NNNNN  #                  # #                 # #
#NNNNN  #################### ################### #
#NNNNN                                           #
```
