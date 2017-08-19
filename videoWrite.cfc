<cfcomponent displayname="cfBrightcove SDK videoWrite" hint="wraps the Brightcove Media API write methods" output="false">

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
<!--- 12/14/09 - v1.0 - Initial Release. --->
<!----------------------------------------------   CONSTRUCTOR  ---------------------------------------------------------------------------------->
<cffunction name="init" access="public" output="false" hint="constructor">
	<cfargument name="apiToken" required="true">

	<cfscript>
		variables.APIbaseURL = "http://api.brightcove.com/services/post";
		variables.apiToken = arguments.apiToken;
		variables.timeout = 600;
		return this;
	</cfscript>

</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="epochToDate" access="private" returnType="date" output="false">
    <cfargument name="epoch" type="string" required="true">
    
    <cfreturn dateAdd("s", arguments.epoch/1000, "january 1 1970 00:00:00")>
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="dateToEpoch" access="private" returnType="date" output="false">
    <cfargument name="date" type="string" required="true">    

    <cfset var epoch  = (DateDiff("s", "January 1 1970 00:00", arguments.date) * 1000)> 
	<!--- return an int, not in scientific notation --->
	
    <cfreturn numberformat(epoch, "_")>
    
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="videoMetadataToJSONArgs" access="private" returntype="string" >
	<cfargument name="argData" type="any" required="true" >
	
	<cfscript>
		var args = arguments.argData;
		var returnArgs = {};
		
		if (structKeyExists(args, "referenceID"))
			returnArgs["referenceId"] = args.referenceID;
			
		if (structKeyExists(args, "shortDescription"))
			returnArgs["shortDescription"] = args.shortDescription;
		
		if (structKeyExists(args, "longDescription"))
			returnArgs["longDescription"] = args.longDescription;
				
		if (structKeyExists(args, "startDate"))
			returnArgs["startDate"] = "__iAmNotForScientificNotation__#dateToEpoch(dateConvert("local2Utc", args.startDate))#";
		
		if (structKeyExists(args, "endDate")) 
			returnArgs["endDate"] = "__iAmNotForScientificNotation__#dateToEpoch(dateConvert("local2Utc", args.endDate))#";
			
		if (structKeyExists(args, "tags")) 
			returnArgs["tags"] = args.tags;
		
		// these are for update
		if (structKeyExists(args, "ID")) 
			returnArgs["id"] = "__iAmNotForScientificNotation__#args.id#";
		
		if (structKeyExists(args, "name"))
			returnArgs["name"] = args.name;
	
		return serializeJSON(returnArgs);
	</cfscript>	
		
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>
 
<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="doVideoUpload" access="private" returntype="any" output="false">
	<cfargument name="filename" type="string" required="true">
	<cfargument name="jsonArgs" type="string" required="true">
	
	<cfset var resultVar = ""> 
	
 	<!--- Make the call, sending the file --->
	<cfhttp url="#variables.apiBaseUrl#" method="post"	timeout="#variables.timeout#" result="resultVar" multipart="true">
		<cfhttpparam type="formfield" name="json" VALUE = "#arguments.jsonArgs#">
		<cfhttpparam type="file" name="#getFileFromPath(arguments.filename)#" file="#arguments.filename#"/>
	</cfhttp>
	
	<cfreturn resultVar>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="doAPIcallNoFile" access="private" returntype="struct" output="false">
	<cfargument name="jsonArgs" type="string" required="true">
	
	<cfset var resultVar = {}> 
	
 	<!--- Make the call, sending the file --->
	<cfhttp url="#variables.apiBaseUrl#" method="post"	timeout="#variables.timeout#" result="resultVar" multipart="true">
		<cfhttpparam type="formfield" name="json" VALUE = "#arguments.jsonArgs#">
	</cfhttp>
	
	<cfreturn resultVar>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="createVideo" access="public" returntype="struct" output="false">
	<cfargument name="name" type="string" required="true">
	<cfargument name="filename" type="String" required="true">
	<cfargument name="referenceID" type="string" required="false">
	<cfargument name="shortDescription" type="string" required="false">
	<cfargument name="longDescription" type="string" required="false">
	<cfargument name="startDate" type="numeric" required="false">
	<cfargument name="endDate" type="numeric" required="false">
	<cfargument name="tags" type="Array" required="false">
	<cfargument name="economics" type="string" required="false">
	
	<cfscript>
		var filenameFromPath = "";
		var maxsize = 0;
		var json = ""; // json construct from the various arguments that brightcove expects serialized in JSON format.
		var resultVar = ""; // this the raw CFHTTP result from the upload method
		var response = ""; // this is the deserialized version of the result that we care about
		var returnData = {error = "", ID = -1}; // return a struct with any error data and the id, if the upload was successful.
		
		// make sure the file exists
		if (!fileExists("#arguments.filename#")) {
			returnData.error = "File does not exist on the local file system.";
			return returnData;
			break;
		}
		
		// create all the arguments for the call	
		filenameFromPath = getFileFromPath(arguments.filename);
		maxsize = getFileInfo(filename).size;
	
		// manually construct the main JSON to send since they are particular about the order.
		json = '{"method": "create_video", "params": {"video": #videoMetadataToJSONArgs(arguments)#,"token": "#variables.apiToken#"},"filename": "#filenameFromPath#","maxsize":#maxsize#}';
	
		// deal with the CF bug of converting integer strings to scientific notation.
		json = replace(json, "__iAmNotForScientificNotation__", "", "all");
		
		// upload the video	
		resultVar = doVideoUpload(arguments.filename, json);
	
		// extract and deserialize the response to get any errors and/or the BC video ID
		response = deserializeJSON(resultVar.filecontent);
		
		if(isStruct(response.error)) {
			returnData.error = response.error.message;
		} else {
			returnData.ID = response.result; 
		}
		
		return returnData;	
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="updateVideo" access="public" returntype="struct" output="false">
	<cfargument name="ID" type="Numeric" required="true">
	<cfargument name="name" type="string" required="false">
	<cfargument name="referenceID" type="string" required="false">
	<cfargument name="shortDescription" type="string" required="false">
	<cfargument name="longDescription" type="string" required="false">
	<cfargument name="startDate" type="numeric" required="false">
	<cfargument name="endDate" type="numeric" required="false">
	<cfargument name="tags" type="Array" required="false">
	<cfargument name="economics" type="string" required="false">
	
	<cfscript>
		var json = ""; // json construct from the various arguments that brightcove expects serialized in JSON format.
		var returnData = {error = ""}; 
		var resultVar = ""; // this the raw CFHTTP result from the update method
		
		// update the video
		json = '{"method": "update_video", "params": {"video": #videoMetadataToJSONArgs(arguments)#,"token": "#variables.apiToken#"}}';	
		
		// deal with the CF bug of converting integer strings to scientific notation.
		json = replace(json, "__iAmNotForScientificNotation__", "", "all");
		
		// DO the update
		resultVar = doAPIcallNoFile(json);
		
		// extract and deserialize the response to get any errors and/or the BC video ID
		response = deserializeJSON(resultVar.filecontent);
		
		if(isStruct(response.error)) {
			returnData["error"] = response.error.message;
		} else {
			returnData["videoData"] = response.result; 
			returnData["videoData"]["lastModifiedDate"] = epochToDate(returnData["videoData"]["lastModifiedDate"]);
			returnData["videoData"]["creationDate"] = dateConvert("local2Utc", epochToDate(returnData["videoData"]["creationDate"]));
			returnData["videoData"]["publishedDate"] = dateConvert("local2Utc", epochToDate(returnData["videoData"]["publishedDate"]));
		}
		
		return returnData;
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="deleteVideo" access="public" returntype="struct" output="false">
	<cfargument name="ID" type="Numeric" required="false">
	<cfargument name="referenceID" type="string" required="false">
	<cfargument name="cascade" type="Boolean" default="false">
	<cfargument name="deleteShares" type="Boolean" default="false">

	<cfscript>
		var json = ""; // json construct from the various arguments that brightcove expects serialized in JSON format.
		var returnData = {error = ""};
		var args = {}; // this will be used to get the names in the format brightcove wants them.
		
		// validate the parameters
		if 	(structKeyExists(arguments, "ID") && structKeyExists(arguments, "referenceID") || (!structKeyExists(arguments, "ID") && !structKeyExists(arguments, "referenceID"))) {
				returnData.error = "Please specify either a video ID OR a reference ID";	
				return returnData;		
		
		} else {
			// Build out the JSON
			json = '{"method": "delete_video", "params":{';
			if (structKeyExists(arguments, "ID"))
				json = json & '"video_id": #arguments.id#';
			
			if (structKeyExists(arguments, "referenceID"))
				json = json & '"reference_id": #arguments.referenceID#';
			 
			json = json & ',"token": "#variables.apiToken#"}}';
		
			// DO the deletion
			resultVar = doAPIcallNoFile(json);
			
			// extract and deserialize the response to get any errors and/or the BC video ID
			response = deserializeJSON(resultVar.filecontent);
			
			if(isStruct(response.error)) {
				returnData["error"] = response.error.message;
			}
		}		
		return returnData;
	</cfscript>
	
</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
<cffunction name="getUploadStatus" access="public" returntype="struct" output="false">
	<cfargument name="ID" type="Numeric" required="false">
	<cfargument name="referenceID" type="string" required="false">

	<cfscript>
		var json = ""; // json construct from the various arguments that brightcove expects serialized in JSON format.
		var returnData = {status="", error = ""};
		var args = {}; // this will be used to get the names in the format brightcove wants them.
		
		// validate the parameters
		if 	(structKeyExists(arguments, "ID") && structKeyExists(arguments, "referenceID") || (!structKeyExists(arguments, "ID") && !structKeyExists(arguments, "referenceID"))) {
				returnData.error = "Please specify either a video ID OR a reference ID";	
				return returnData;		
		
		} else {
			// Build out the JSON
			json = '{"method": "get_upload_status", "params":{';
			if (structKeyExists(arguments, "ID"))
				json = json & '"video_id": #arguments.id#';
			
			if (structKeyExists(arguments, "referenceID"))
				json = json & '"reference_id": #arguments.referenceID#';
			 
			json = json & ',"token": "#variables.apiToken#"}}';
		
			// DO the status check
			resultVar = doAPIcallNoFile(json);

			// extract and deserialize the response to get any errors and/or the BC video ID
			response = deserializeJSON(resultVar.filecontent);
			
			if(isStruct(response.error)) {
				returnData["error"] = response.error.message;
			} else {
				returnData["status"] = response.result; 
			}
		}		
		return returnData;
	</cfscript>

</cffunction>
<!------------------------------------------------------------------------------------------------------------------------------------------------>

<!------------------------------------------------------------------------------------------------------------------------------------------------>
</cfcomponent>
