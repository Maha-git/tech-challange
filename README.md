![alt text](Valtech.png)
# Welcome to the Valtech WebOps Technical Challenge


We'd like to take this opportunity to thank you for trying out this challenge.

We're totally happy for you to use google and online docs as much as you want. We believe these kind of challenges should be as realistic and as such why wouldn't we want you using your everyday resources. The challenge should take about one hour to 90 minutes, but don't worry if it takes a longer we're not timing.



We've tried not to assume technology specific knowledge in this challenge... but obviously we have had to use some specific tools - we've chosen what we think are the most immediately readable tools and kept the configuration to a minimum.  We're looking for general familiarity with debugging config management and web systems rather than tool specific knowledge, or even experience of a particular Cloud.

There are two parts to the challenge firstly a practical exercise, followed by a quick fire mutiple choice quiz.

Some information has been deliberately left out as this is exactly the kind of information you may need to go searching for in your daily work. 

## The practical exercise breaks down as follows:

* First we would like you to clone this repo and debug the faulty terraform deployment script in the `./terraform` directory, to create a single AWS Ubuntu instance within our AWS environment.

* Next we would like you to ssh on to this instance, using the supplied pem key, and clone the repo a second time, installing any required packages along the way.

* Finally we would like you to debug a faulty ansible playbook that contains a number of typos, such as missing words or extra characters that shouldn't be there. These errors may be in the playbook itself or in the configs it generates.  Please fix the bugs - you don't need to make any other changes to the playbook. 

Once the playbook runs successfully, you will have deployed Tomcat, Nginx and a custom webapp which prints out a message. It's not part of the challenge, but do let us know if you get the reference! :)

You don't need to make any manual changes to the system, and in fact, if you do they will be wiped when we run the playbooks.

Once you have cloned the repo you will find the following files in the techchallenge directory:

* run_ansible.sh - execute the ansible playbook - start here!

* check_result.sh - this script will tell you how you're doing!

* ansible/ - contains ansible config for deploying a website.`


Once you are satisfied you have completed the challenge to the best of your ability please poweroff the instance and email and zip up a copy of your local git clone ready to be uploaded to us at the start of the quiz.


After the challenge has been completed we will check your solution and provide feedback through the recruitment process.

Just so we're being totally transparent - We are recording all input and output on the session for us to review later, so don't paste any passwords or anything in.

## The quiz

This challenge is a quick fire multiple choice Q&A which can be found at [https://goo.gl/forms/wr0TRiqV5MexLI682](https://goo.gl/forms/wr0TRiqV5MexLI682), it's only short so just try your best. 

Remember, this is where you upload your hard work from the first part of the practical exercise.
