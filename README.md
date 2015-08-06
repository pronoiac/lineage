family tree
============
This is something I'm building to noodle around with family trees - 
data structures and the like. 

It's a command-line Ruby program. 
Run `ruby lib/lineage.rb`. 


What's here
----------
* lineage.rb - the main app
* family.txt - the raw data of the family tree
* family.rb - the Ruby class for families
* person.rb - the Ruby class for people


About
-----
This was done as part of a coding challenge. As such, there are some
odd characteristics - each member only has one parent, for example,
and there's no checking for loops, so someone could be entered into
the system as his own grandfather (I'm looking at *you,* Fry). It's
more of a toy than a serious and useful tool.
