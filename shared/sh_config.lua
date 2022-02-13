--[[                                                                                                                                                                       
                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                
         tttt          BBBBBBBBBBBBBBBBB   lllllll                                                       hhhhhhh               iiii                                                                                             
      ttt:::t          B::::::::::::::::B  l:::::l                                                       h:::::h              i::::i                                                                                            
      t:::::t          B::::::BBBBBB:::::B l:::::l                                                       h:::::h               iiii                                                                                             
      t:::::t          BB:::::B     B:::::Bl:::::l                                                       h:::::h                                                                                                                
ttttttt:::::ttttttt      B::::B     B:::::B l::::l   aaaaaaaaaaaaa  nnnn  nnnnnnnn        cccccccccccccccch::::h hhhhh       iiiiiii     ssssssssss       ssssssssss       eeeeeeeeeeee    uuuuuu    uuuuuu rrrrr   rrrrrrrrr   
t:::::::::::::::::t      B::::B     B:::::B l::::l   a::::::::::::a n:::nn::::::::nn    cc:::::::::::::::ch::::hh:::::hhh    i:::::i   ss::::::::::s    ss::::::::::s    ee::::::::::::ee  u::::u    u::::u r::::rrr:::::::::r  
t:::::::::::::::::t      B::::BBBBBB:::::B  l::::l   aaaaaaaaa:::::an::::::::::::::nn  c:::::::::::::::::ch::::::::::::::hh   i::::i ss:::::::::::::s ss:::::::::::::s  e::::::eeeee:::::eeu::::u    u::::u r:::::::::::::::::r 
tttttt:::::::tttttt      B:::::::::::::BB   l::::l            a::::ann:::::::::::::::nc:::::::cccccc:::::ch:::::::hhh::::::h  i::::i s::::::ssss:::::ss::::::ssss:::::se::::::e     e:::::eu::::u    u::::u rr::::::rrrrr::::::r
      t:::::t            B::::BBBBBB:::::B  l::::l     aaaaaaa:::::a  n:::::nnnn:::::nc::::::c     ccccccch::::::h   h::::::h i::::i  s:::::s  ssssss  s:::::s  ssssss e:::::::eeeee::::::eu::::u    u::::u  r:::::r     r:::::r
      t:::::t            B::::B     B:::::B l::::l   aa::::::::::::a  n::::n    n::::nc:::::c             h:::::h     h:::::h i::::i    s::::::s         s::::::s      e:::::::::::::::::e u::::u    u::::u  r:::::r     rrrrrrr
      t:::::t            B::::B     B:::::B l::::l  a::::aaaa::::::a  n::::n    n::::nc:::::c             h:::::h     h:::::h i::::i       s::::::s         s::::::s   e::::::eeeeeeeeeee  u::::u    u::::u  r:::::r            
      t:::::t    tttttt  B::::B     B:::::B l::::l a::::a    a:::::a  n::::n    n::::nc::::::c     ccccccch:::::h     h:::::h i::::i ssssss   s:::::s ssssss   s:::::s e:::::::e           u:::::uuuu:::::u  r:::::r            
      t::::::tttt:::::tBB:::::BBBBBB::::::Bl::::::la::::a    a:::::a  n::::n    n::::nc:::::::cccccc:::::ch:::::h     h:::::hi::::::is:::::ssss::::::ss:::::ssss::::::se::::::::e          u:::::::::::::::uur:::::r            
      tt::::::::::::::tB:::::::::::::::::B l::::::la:::::aaaa::::::a  n::::n    n::::n c:::::::::::::::::ch:::::h     h:::::hi::::::is::::::::::::::s s::::::::::::::s  e::::::::eeeeeeee   u:::::::::::::::ur:::::r            
        tt:::::::::::ttB::::::::::::::::B  l::::::l a::::::::::aa:::a n::::n    n::::n  cc:::::::::::::::ch:::::h     h:::::hi::::::i s:::::::::::ss   s:::::::::::ss    ee:::::::::::::e    uu::::::::uu:::ur:::::r            
          ttttttttttt  BBBBBBBBBBBBBBBBB   llllllll  aaaaaaaaaa  aaaa nnnnnn    nnnnnn    cccccccccccccccchhhhhhh     hhhhhhhiiiiiiii  sssssssssss      sssssssssss        eeeeeeeeeeeeee      uuuuuuuu  uuuurrrrrrr            
                                                                                                                                                                                                                                
   tBlanchisseur made by TrapZed#1725
]]--

Config = {}

-- Pour les bases California, mettez la valeur : ::{korioz#0110}:: devant les triggers exemple : 
--Config.events = {
--    ["esx:getSharedObject"] = "::{korioz#0110}::esx:getSharedObject",
--}

Config.Events = {
    ["esx:getSharedObject"] = "esx:getSharedObject",
    ["esx:showNotification"] = "esx:showNotification"
}

-- Position de la zone d'intéraction
Config.Position = vector3(-939.4513, -1413.714, 6.69)

-- Nombre d'argent à blanchir pour l'option 1
Config.Price1 = 1000

-- Nombre d'argent à blanchir pour l'option 2
Config.Price2 = 5000

-- Nombre d'argent à blanchir pour l'option 3
Config.Price3 = 10000

-- Temps de blanchiment pour l'option 1
Config.Time1 = 10 -- secondes

-- Temps de blanchiment pour l'option 2
Config.Time2 = 45 -- secondes

-- Temps de blanchiment pour l'option 3
Config.Time3 = 85 -- secondes

-- Pourcentage restant à la suite du blanchiment
Config.Percentage = 70 -- %

-- Titre des notifications
Config.NotifTitle = "~r~tBlanchisseur"