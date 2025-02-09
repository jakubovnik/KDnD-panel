# KDnD-panel
This is a personal project to simplify inventory and magic for my DnD campaign.
(Which means this site is NOT secure but secure enough that players wont mess things up)
Visually, this site isn't too nice, however the functionality should be good.
Previously, this was supposed to be an android app, however, one of my players uses an Iphone, and I am incapable of creating software for that.

This site uses a lot of icons from [flaticon](https://www.flaticon.com/), but it isnt attributed on the site yet...

## FIXME:
- when editing items, new items are created instead of editing the targeted item
- something is wrong with images, but not the php or sql size limit, propably need to do something with the php code (also it keeps giving the error "Image corrupt or truncated.")

## TODO:
- put flaticon attribution somewhere
- remove all remove TODOs from the code by finishing it (duh)
- create favourite item system, so that specific items show up on the top of the inventory
- make system of equiping items, then displaying them on index.php
- figure out searching in the inventory and magic list for mobile users (also fix searching overall)
- make the enter key switch to the next input field and in the last field send the information (propably fix it by switching from div to form)
- make the "back" key (or function) hide the menu, instead of throwing the user to the previous site
- make ajax requests timeout after a certain time
- add animation transitions to text fields with css
- create options for the user
- Improve item description
- give admin characters be able to create items for other characters
- rewrite css for desktop
- forgot about money :P
- comment everything
- add circle blessing to the database
- implement circle blessing into index.php

## DONE:
- EDITING ITEMS
- create character creation for admin users
- finish basic css for phone users
- clicking on the table heading changes the "order by" sql (propably make it server side)
- tidy up the files