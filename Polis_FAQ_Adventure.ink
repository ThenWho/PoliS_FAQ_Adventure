VAR categoryData = 0
VAR categoryPartners = 0
VAR categoryParticipatory = 0
VAR categoryStakeholders = 0
VAR categoryVotingRights = 0
VAR categoryWrappingApp = 0
VAR categoryHaveTime = 0
VAR categoryWhoCanVote = 0

VAR externalProcess = false



// DEBUG mode adds a few shortcuts - remember to set to false in release!
VAR DEBUG = false
{DEBUG:
	IN DEBUG MODE!
	*	[Beginning...]	-> start
- else:
	// First diversion: where do we begin?
 -> start
}

 /*--------------------------------------------------------------------------------
	Wrap up character movement using functions, in case we want to develop this logic in future
--------------------------------------------------------------------------------*/


 === function lower(ref x)
 	~ x = x - 1

 === function raise(ref x)
 	~ x = x + 1

/*--------------------------------------------------------------------------------

	Start the story!

--------------------------------------------------------------------------------*/

=== start === 

// Intro
    -   We are going to ask you a few questions, to help you understand both your own intentions as well as the external gotchas of using a Polis conversation effectively.
        
        Are you ready to start?

        *   [No, give me more time!]
            Too late! :)
        *   [Sure, let's go!]

// Standalone or not?
    -   Polis conversations are sometimes part of a greater interaction with an audience or a community. 

        *   ["Indeed, this is a follow-up or part of another process."]
                ~ externalProcess = true
                ~ raise(categoryData) 
        *   ["Not really, it's rather standalone."]
	            ~ externalProcess = false
	            
// Who can vote?
	-   Next follow some questions about who can vote in your conversation. Remember that the main intention behind these questions is for you to reflect on your practices. 
	    
         -   Do you need to authenticate users with a platform other than Facebook/Twitter?
	        *   ["Not really, Facebook/Twitter/no authentication is all I need."]
            *   ["Yes, I have my own authentication mechanism."]
                ~ raise(categoryVotingRights) 
                ~ raise(categoryWrappingApp) 
            
        -   Do you need to restrict participation to a specific set of people (e.g. geographically, org/domain, etc)?
            *   ["Yes, only a specific group of people can vote."]
                ~ raise(categoryVotingRights) 
                ~ raise(categoryWhoCanVote) 
            *   ["No, anyone with a link to the Polis conversation can vote."]

        -   Do you need to correlate voting with other kinds of data (eg demographic data)?
            *   ["No, I only need the voting data."]
            *   ["Yes, voting data need to be matched with other data."]
                ~ raise(categoryData)

        -   Do you have access to a technologist?
        -   (technologist)
            *   ["Yes, I have technical people who help me."]
                ~ raise(categoryPartners) 
            *   ["Yes, I *am* a technologist."]
                ~ raise(categoryPartners) 
            *   ["No, I am not a technologist nor I have access to one."]
            *   ["What is a technologist?"] Technologist is someone with computer programming skills or someone with is familiar with web technologies (e.g. HTML, CSS). -> technologist
        
    -   -> END
