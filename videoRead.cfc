<cfcomponent displayname="cfBCove SDK videoRead" hint="wraps the Brightcove Media API methods" output="false">
<!--- License:

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 
 --->

<!----------------------------------------------   CONSTRUCTOR  ---------------------------------------------------------------------------------->
<cffunction name="init" access="public" output="false" hint="constructor">
	<cfargument name="apiToken" required="true">
	
	<cfscript>
		variables.APIbaseURL = "http://api.brightcove.com/services/library";
		variables.apiToken = arguments.apiToken;
		
		// return the gateway object
		return this;
	</cfscript>

</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="APIcall" access="private" returntype="any" output="no"
			hint="Make the call to the API and returns the data." >
	
	<cfargument name="callParams" type="struct" required="yes">
	
	<cfscript>
		var apiURL = "";
		var returnData = "";
		
		// base URL is API endpoint, then add the API method first
		apiURL = "#variables.APIbaseURL#?command=#arguments.callParams.APImethod#";
		
		// add all the arguements for the call besides the method & token
		for (key in callParams.args)
          apiURL = apiURL & '&' & (key & '=' & callParams.args[key]);
		
		// finish with the token 
		apiURL = apiURL & "&token=" & variables.apiToken;
	
	</cfscript>
	
	<!--- Make the API call --->
	<cfhttp url="#apiURL#" method="get" timeout="60" result="returnData" throwonerror="true">
	
	<!--- return the data in the format of APIreturnFormat --->
	<cfif isJSON(returnData.fileContent)>
		<cfreturn deserializeJSON(returnData.fileContent)>
	<cfelse>		
		<cfreturn returnData.fileContent>
	</cfif>

</cffunction>

<!------------------------------------------------------------------------------------------------------------------------------------------------>


<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="findAllVideos"  access="public" returntype="Any" >

	<cfargument name="videoFields" type="String" default="">
	
	<cfscript>
		var callParams = {};
		
		callParams.APImethod = 'find_all_videos';
		callParams.args = {}; 
		if (arguments.videoFields != "")
			callParams.args["video_fields"] = arguments.videoFields;
		
		// get the data from the API
		return APIcall(callParams);
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="findVideoByID"  access="public" returntype="Any" >

	<cfargument name="ID" type="Numeric" required="true">
	<cfargument name="videoFields" type="String" default="">
	
	<cfscript>
		var callParams = {};
		
		callParams.APImethod = 'find_video_by_id';
		callParams.args = {}; 
		callParams.args["video_id"] = arguments.ID;
		if (arguments.videoFields != "")
			callParams.args["video_fields"] = arguments.videoFields;
		
		// get the data from the API
		return APIcall(callParams);
	</cfscript>
		
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="findVideosByIDs"  access="public" returntype="Any" >


	<cfargument name="IDs" type="any" required="true">
	<cfargument name="videoFields" type="String" default="">
	
	<cfscript>
		var callParams = {};
		var idx = 1;
		var cleanList = "";
		
		callParams.APImethod = 'find_videos_by_ids';
		if (isArray(arguments.IDs))		
			callParams.args["video_ids"] = arrayToList(arguments.IDs);
		else {
			// clean up the list
			arguments.IDs = stripCR(arguments.IDs);
			
			for (local.idx=1; local.idx <= listLen(arguments.IDs); local.idx++) {
            	cleanList = listAppend(cleanList, rtrim(ltrim(listGetAt(arguments.IDs, local.idx))));					
            }
			callParams.args["video_ids"] = cleanList;
		}
        	
				
		if (arguments.videoFields != "")
			callParams.args["video_fields"] = arguments.videoFields;
		
		// get the data from the API
		return APIcall(callParams);
	</cfscript>

	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>


<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="findVideoByReferenceID"  access="public" returntype="Any" >

	<cfargument name="referenceID" type="String" required="true">
	<cfargument name="videoFields" type="String" default="">
	
	<cfscript>
		var callParams = {};
		
		callParams.APImethod = 'find_video_by_reference_id';
		callParams.args = {}; 
		callParams.args["reference_id"] = arguments.referenceID;
		if (arguments.videoFields != "")
			callParams.args["video_fields"] = arguments.videoFields;
		
		// get the data from the API
		return APIcall(callParams);
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="findVideosByReferenceIDs"  access="public" returntype="Any" >

	<cfargument name="referenceIDs" type="Array" required="true">
	<cfargument name="videoFields" type="String" default="">
	
	<cfscript>
		var callParams = {};
		var idx = 1;
		
		callParams.APImethod = 'find_videos_by_reference_ids';
				
		callParams.args["reference_ids"] = arrayToList(arguments.referenceIDs);				
        		
		if (arguments.videoFields != "")
			callParams.args["video_fields"] = arguments.videoFields;
		
		// get the data from the API
		return APIcall(callParams);
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="findVideosByText"  access="public" returntype="Any" >

	<cfargument name="text" type="string" required="true">
	<cfargument name="videoFields" type="String" default="">
	
	<cfscript>
		var callParams = {};
		
		callParams.APImethod = 'find_videos_by_text';
		callParams.args = {}; 
		callParams.args["text"] = arguments.text;
		if (arguments.videoFields != "")
			callParams.args["video_fields"] = arguments.videoFields;
		
		// get the data from the API
		return APIcall(callParams);
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="findVideosByTags"  access="public" returntype="Any" >

	<cfargument name="tags" type="struct" required="true">
	<cfargument name="videoFields" type="String" default="">
	
	<cfscript>
		var callParams = {};
		var idx = 1;
		var andTags = arguments.tags["andTags"];
		var orTags = arguments.tags["orTags"];
		
		callParams.APImethod = 'find_videos_by_tags';
		callParams.args = {};

		// Handle the "AND" tags - the ones the MUST be there
		if (arrayLen(andTags)) {
		   	callParams.args["and_tags"] = arrayToList(andTags);				
	    } 
		// Handle the "OR" tags - the ones that MAY be there
		if (arrayLen(orTags)) {
			callParams.args["or_Tags"] = arrayToList(orTags);
		}
		
		if (arguments.videoFields != "")
			callParams.args["video_fields"] = arguments.videoFields;
				
		// get the data from the API
		return APIcall(callParams);
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="getProgressiveVideoByID" access="remote" returntype="string" >

	<cfargument name="ID" type="Numeric" required="true">
	
	<cfscript>
		var callParams = {};
		var returnData = "";
		
		callParams.APImethod = 'find_video_by_id';
		callParams.args = {}; 
		callParams.args["video_id"] = arguments.ID;
		callParams.args["media_delivery"] = "http";
		callParams.args["video_fields"] = "FLVFullLength";	

		// get the data from the API
		try {
			returnData = APIcall(callParams).FLVFullLength.URL;
		} catch(Any e) {
			returnData = "";
		}
		
		return returnData;
	</cfscript>
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------>


<!------------------------------------------------------------------------------------------------------------------------------------------>
</cfcomponent>