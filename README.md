#Concept:
The concept of this site is to create a simple online calculator tool using the Volt Ruby framework.  Also view what others are calculating in real-time!

#Technologies:
The site is a Volt app that interacts with a MongoDB database to save information.  It is hosted on an AWS linux instance.  All valid JavaScript math statements are accepted, and the equation is evaluated in the client browser inside a JavaScript rescue clause.

#Todos:
 - Only grab recent calculations as opposed to displaying all calculations in reverse. (Also real-time calculation are not always in order for all users, need an index/date value to sort by)
 - When click calculator buttons want to focus input if not already.