# KDnD-panel
This is a personal project to simplify inventory and magic for my DnD campaign.
(Which means this site is NOT secure but secure enough that players wont mess things up)
Visually, this site isn't too nice, however the functionality should be good.
Previously, this was supposed to be an android app, however, one of my players uses an Iphone, and I am incapable of creating software for that.

This site uses a lot of icons from [flaticon](https://www.flaticon.com/), but it isnt attributed on the site yet...

## FIXME:
- when editing items, new items are created instead of editing the targeted item (might keep this as a feature)
- Images now show up correctly, but cycling through them is broken for some reason now

## TODO:
- put flaticon attribution somewhere
- remove all TODOs from the code by finishing it (duh)
- make system of equiping items, then displaying them on index.php
- figure out searching in the inventory and magic list for mobile users (also fix searching overall)
- make the enter key switch to the next input field and in the last field send the information (propably fix it by switching from div to form)
- make the "back" key (or function) hide the menu, instead of throwing the user to the previous site
- make ajax requests timeout after a certain time (what did I mean by this??? || throw some error so that at least some response is given when something doesn't work)
- add animation transitions to text fields with css
- give admin characters the ability to create items for other characters
- rewrite css for desktop
- rewrite desktop css, so that it shows magic desc in a similar way to phones (cos on phones it looks nicer)
- Improve item description on desktop
- comment everything
- implement circle blessing into index.php
- change the money system so that it works by transactions and replace the current (basic integer variable) in the database
- add some form of lore wiki
  - should have a "spoiler" function, maybe stored in the database bound to characters (extra database table)
- add transition to mobile navbar (through opacity and timeout, just changing the display property doesnt work)

## DONE:
- EDITING ITEMS
- create character creation for admin users
- finish basic css for phone users
- clicking on the table heading changes the "order by" sql (propably make it server side)
- tidy up the files
- Money system
- create favourite item system, so that specific items show up on the top of the inventory
- create options for the user
  - option to set the frequency of inventory and magic refreshes
  - option to disable (or limit) messages
- add circle blessing to the database