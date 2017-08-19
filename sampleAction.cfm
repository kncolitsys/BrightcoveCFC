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

<cfset readToken = form.readToken>
<cfset writeToken = form.writeToken>

<cfset videoWriteObj = createObject("component", "videoWrite").init(writeToken)>
<cfset videoReadObj = createObject("component", "videoRead").init(readToken)>

<cfswitch expression="#form.action#">

	<cfcase value="FindVideoByID">
		<cfset apiResult = videoReadObj.findVideoByID(ID=#form.id#,videoFields="#form.fields#")>
		<cfdump var="#apiResult#">
	</cfcase>
	
	<cfcase value="FindVideoByReferenceID">
		<cfset apiResult = videoReadObj.findVideoByReferenceID(referenceID=#form.referenceID#,videoFields="#form.fields#")>
		<cfdump var="#apiResult#">
	</cfcase>
	
	<cfcase value="FindVideoByReferenceIDs">
		<cfset refIDs = arrayNew(1)>
		<cfloop from="1" to="10" index="idx">
			<cfset varname = "form.refID#idx#">
			<cfif evaluate("#varName#") neq "">
				<cfset arrayAppend(refIDs, evaluate("#varName#"))>
			</cfif>
		</cfloop>
		<cfset apiResult = videoReadObj.findVideoByReferenceIDs(referenceIDs=refIDs,videoFields="#form.fields#")>
		<cfdump var="#apiResult#">
	</cfcase>
	
	<cfcase value="FindVideosByText">
		<cfset apiResult = videoReadObj.findVideosByText(text="#form.text#", videoFields="#form.fields#")>
		<cfdump var="#apiResult#">
	</cfcase>

	<cfcase value="FindVideosByTags">
		<cfset tags = {andTags = listToArray(form.andTags), orTags = listToArray(form.orTags)}> 	
		<cfset apiResult = videoReadObj.findVideosByTags(tags=tags, videoFields="#form.fields#")>
		<cfdump var="#apiResult#">
	</cfcase>
	
	<cfcase value="getProgressiveVideoByID">
		<cfset apiResult = videoReadObj.getProgressiveVideoByID(id="#form.id#")>
		<cfdump var="#apiResult#">
	</cfcase>
	
	

	<!-------------------------------------------------------------------------------------->
	<!-----------------------	WRITE API METHODS 	---------------------------------------->
	<!-------------------------------------------------------------------------------------->
	
	<cfcase value="createVideo">
		
		<cfscript>
			args = {};
			
			args.name = form.name;
			args.filename = form.filename;
			if (form.referenceID != "")
				args.referenceID = form.referenceID;
			if (form.shortDescription != "")
				args.shortDescription = form.shortDescription;
			if (form.longDescription != "")
				args.longDescription = form.longDescription;
			
			if (form.startMonth != "")
				args.startDate = createDateTime(form.startYear, form.startMonth, form.startDay, form.startHour, form.startMinute, form.startSecond);
			
			if (form.endMonth != "")
				args.endDate = createDateTime(form.endYear, form.endMonth, form.endDay, form.endHour, form.endMinute, form.endSecond);
				
			if (form.tags != "")
				args.tags = listToArray(form.tags);
			
			apiResult = videoWriteObj.createVideo(argumentcollection = args);
		</cfscript>
		<cfdump var="#apiResult#">
		
	</cfcase>
	
	<cfcase value="updateVideo">
		<cfscript>
			args = {};
			
			args.id = form.id;
			
			if (form.referenceID != "")
				args.referenceID = form.referenceID;
			if (form.shortDescription != "")
				args.shortDescription = form.shortDescription;
			if (form.longDescription != "")
				args.longDescription = form.longDescription;
			
			if (form.startMonth != "")
				args.startDate = createDateTime(form.startYear, form.startMonth, form.startDay, form.startHour, form.startMinute, form.startSecond);
			
			if (form.endMonth != "")
				args.endDate = createDateTime(form.endYear, form.endMonth, form.endDay, form.endHour, form.endMinute, form.endSecond);
				
			if (form.tags != "")
				args.tags = listToArray(form.tags);
			
			apiResult = videoWriteObj.updateVideo(argumentcollection = args);
		</cfscript>
		<cfdump var="#apiResult#">
	</cfcase>
	
	<cfcase value="deleteVideo">
		<cfscript>
			args = {};
			
			if (form.ID != "")
				args.ID = form.ID;
			if (form.referenceID != "")
				args.referenceID = form.referenceID;
			if (structKeyExists(form, "cascade"))
				args.cascade = true;
			if (structKeyExists(form, "deleteShares"))
				args.deleteShares = true;
			
			apiResult = videoWriteObj.deleteVideo(argumentcollection = args);
		</cfscript>
		<cfdump var="#apiResult#">
		
	</cfcase>
	
	
	
	<cfcase value="getUploadStatus">
		<cfif form.id neq "">
			<cfset apiResult = videoWriteObj.getUploadStatus(id = form.id)>
		<cfelse>
			<cfset apiResult = videoWriteObj.getUploadStatus(referenceId = form.referenceID)>
		</cfif>
		<cfdump var="#apiResult#">
	</cfcase>
</cfswitch>