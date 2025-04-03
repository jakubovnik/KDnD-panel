# KDnD-panel
This is a personal project to simplify inventory and magic for my DnD campaign.
(Which means this site is NOT secure but secure enough that players wont mess things up)
Visually, this site isn't too nice, however the functionality should be good.
Previously, this was supposed to be an android app, however, one of my players uses an Iphone, and I am incapable of creating software for that.

This site uses a lot of icons from [flaticon](https://www.flaticon.com/), but it isnt attributed on the site yet...

## FIXME:
- the "+" symbol dissapears when saving it into the database (example: in the lore wiki, it dissapears (or more accurately changes into an empty symbol) upon save)
- I have no idea how, and I have no idea why, but one time, i was stuck at the login page and couldnt login (it would just refresh when I logged in correctly). It would fix itself when i manually went to index.php, then I logged out and then in without problems (im guessing that the SESSION was somehow in a state of existing and not existing at the same time???)
- Items get their "favourite" and "is_equipped" values reset when they are edited

## TODO:
- put flaticon attribution somewhere
- remove all TODOs from the code by finishing it (duh)
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
- add transition to mobile navbar (through opacity and timeout, just changing the display property doesnt work)
- improve the functionality and css for equiped items in index.php
- make css z-index somewhat standardized (its a mess rn)
- rewrite create-character (change it to like a character dashboard)
- improve the functionality of the inventory (and fix editing items)

## DONE:
- EDITING ITEMS
- create character creation for admin users
- finish basic css for phone users
- clicking on the table heading changes the "order by" sql (propably make it server side)
- tidy up the files
- basic money system
- create favourite item system, so that specific items show up on the top of the inventory
- create options for the user
  - option to set the frequency of inventory and magic refreshes
  - option to disable (or limit) messages
- add circle blessing to the database
- make system of equiping items, then displaying them on index.php
- lore wiki
  - wiki "spoiler" function, maybe stored in the database bound to characters (extra database table)
  - shortcuts (more like a macro i guess) for an internal wiki link with "ctrl+K" and other stuff (ctrl+,) (mainly done by chatgpt)
  - editing lore now works correctly + creating new lore now has a button
  - editing lore now prompts admin if they trully want to overwrite existing lore (also has a shortcut "ctrl+ENTER")
- when editing wiki, display message to the admin to be carful not to overwrite existing lore
- FIXED (except for "+", that one still disappears): some symbols break the saving process in wiki (propably because im doing something incorrectly when sending through post)
- FIXED: editing items now works almost perfectly (items now get their "favourite" and "is_equipped" values reset)