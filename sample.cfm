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


<p>
	<h2>Video Read API tests</h2>
</p>

FindVideoByID:<br>
<form action="sampleAction.cfm" method="post">

	Token: <input type="text" name="readToken" size="65"><br>
	Video ID: <input type="text" name="ID"><br>
	
	Video fields:<br>
	<SELECT NAME="fields" MULTIPLE SIZE=10>
		<OPTION VALUE="ID">ID</OPTION>
		<OPTION VALUE="NAME" selected="selected">NAME</OPTION>
		<OPTION VALUE="SHORTDESCRIPTION">SHORTDESCRIPTION</OPTION>
		<OPTION VALUE="LONGDESCRIPTION">LONGDESCRIPTION</OPTION>
		<OPTION VALUE="CREATIONDATE">CREATIONDATE</OPTION>
		<OPTION VALUE="PUBLISHEDDATE">PUBLISHEDDATE</OPTION>
		<OPTION VALUE="LASTMODIFIEDDATE">LASTMODIFIEDDATE</OPTION>
		<OPTION VALUE="STARTDATE">STARTDATE</OPTION>
		<OPTION VALUE="ENDDATE">ENDDATE</OPTION>
		<OPTION VALUE="LINKURL">LINKURL</OPTION>
		<OPTION VALUE="LINKTEXT">LINKTEXT</OPTION>
		<OPTION VALUE="TAGS">TAGS</OPTION>
		<OPTION VALUE="VIDEOSTILLURL">VIDEOSTILLURL</OPTION>
		<OPTION VALUE="THUMBNAILURL">THUMBNAILURL</OPTION>
		<OPTION VALUE="REFERENCEID">REFERENCEID</OPTION>
		<OPTION VALUE="LENGTH">LENGTH</OPTION>
		<OPTION VALUE="ECONOMICS">ECONOMICS</OPTION>
		<OPTION VALUE="ITEMSTATE">ITEMSTATE</OPTION>
		<OPTION VALUE="PLAYSTOTAL">PLAYSTOTAL</OPTION>
		<OPTION VALUE="PLAYSTRAILINGWEEK">PLAYSTRAILINGWEEK</OPTION>
		<OPTION VALUE="VERSION">VERSION</OPTION>
		<OPTION VALUE="CUEPOINTS">CUEPOINTS</OPTION>
		<OPTION VALUE="SUBMISSIONINFO">SUBMISSIONINFO</OPTION>
		<OPTION VALUE="CUSTOMFIELDS">CUSTOMFIELDS</OPTION>
		<OPTION VALUE="RELEASEDATE">RELEASEDATE</OPTION>
		<OPTION VALUE="FLVURL">FLVURL</OPTION>
		<OPTION VALUE="RENDITIONS">RENDITIONS</OPTION>
		<OPTION VALUE="GEOFILTERED">GEOFILTERED</OPTION>
		<OPTION VALUE="GEORESTRICTED">GEORESTRICTED</OPTION>
		<OPTION VALUE="GEOFILTEREXCLUDE">GEOFILTEREXCLUDE</OPTION>
		<OPTION VALUE="EXCLUDELISTEDCOUNTRIES">EXCLUDELISTEDCOUNTRIES</OPTION>
		<OPTION VALUE="GEOFILTEREDCOUNTRIES">GEOFILTEREDCOUNTRIES</OPTION>
		<OPTION VALUE="ALLOWEDCOUNTRIES">ALLOWEDCOUNTRIES</OPTION>
		<OPTION VALUE="ACCOUNTID">ACCOUNTID</OPTION>
		<OPTION VALUE="FLVFULLLENGTH">FLVFULLLENGTH</OPTION>
		<OPTION VALUE="VIDEOFULLLENGTH">VIDEOFULLLENGTH</OPTION>
	</SELECT>
	<br>
	<input type="submit" name="action" value="FindVideoByID">
</form>
<hr>
FindVideoByReferenceID:<br>
<form action="sampleAction.cfm" method="post">

	Token: <input type="text" name="readToken" size="65"><br>
	Reference ID: <input type="text" name="referenceID"><br>
	<br>
	Video fields:<br>
	<SELECT NAME="fields" MULTIPLE SIZE=10>
	<OPTION VALUE="ID" selected="selected">ID</OPTION>
		<OPTION VALUE="NAME">NAME</OPTION>
		<OPTION VALUE="SHORTDESCRIPTION">SHORTDESCRIPTION</OPTION>
		<OPTION VALUE="LONGDESCRIPTION">LONGDESCRIPTION</OPTION>
		<OPTION VALUE="CREATIONDATE">CREATIONDATE</OPTION>
		<OPTION VALUE="PUBLISHEDDATE">PUBLISHEDDATE</OPTION>
		<OPTION VALUE="LASTMODIFIEDDATE">LASTMODIFIEDDATE</OPTION>
		<OPTION VALUE="STARTDATE">STARTDATE</OPTION>
		<OPTION VALUE="ENDDATE">ENDDATE</OPTION>
		<OPTION VALUE="LINKURL">LINKURL</OPTION>
		<OPTION VALUE="LINKTEXT">LINKTEXT</OPTION>
		<OPTION VALUE="TAGS">TAGS</OPTION>
		<OPTION VALUE="VIDEOSTILLURL">VIDEOSTILLURL</OPTION>
		<OPTION VALUE="THUMBNAILURL">THUMBNAILURL</OPTION>
		<OPTION VALUE="REFERENCEID">REFERENCEID</OPTION>
		<OPTION VALUE="LENGTH">LENGTH</OPTION>
		<OPTION VALUE="ECONOMICS">ECONOMICS</OPTION>
		<OPTION VALUE="ITEMSTATE">ITEMSTATE</OPTION>
		<OPTION VALUE="PLAYSTOTAL">PLAYSTOTAL</OPTION>
		<OPTION VALUE="PLAYSTRAILINGWEEK">PLAYSTRAILINGWEEK</OPTION>
		<OPTION VALUE="VERSION">VERSION</OPTION>
		<OPTION VALUE="CUEPOINTS">CUEPOINTS</OPTION>
		<OPTION VALUE="SUBMISSIONINFO">SUBMISSIONINFO</OPTION>
		<OPTION VALUE="CUSTOMFIELDS">CUSTOMFIELDS</OPTION>
		<OPTION VALUE="RELEASEDATE">RELEASEDATE</OPTION>
		<OPTION VALUE="FLVURL">FLVURL</OPTION>
		<OPTION VALUE="RENDITIONS">RENDITIONS</OPTION>
		<OPTION VALUE="GEOFILTERED">GEOFILTERED</OPTION>
		<OPTION VALUE="GEORESTRICTED">GEORESTRICTED</OPTION>
		<OPTION VALUE="GEOFILTEREXCLUDE">GEOFILTEREXCLUDE</OPTION>
		<OPTION VALUE="EXCLUDELISTEDCOUNTRIES">EXCLUDELISTEDCOUNTRIES</OPTION>
		<OPTION VALUE="GEOFILTEREDCOUNTRIES">GEOFILTEREDCOUNTRIES</OPTION>
		<OPTION VALUE="ALLOWEDCOUNTRIES">ALLOWEDCOUNTRIES</OPTION>
		<OPTION VALUE="ACCOUNTID">ACCOUNTID</OPTION>
		<OPTION VALUE="FLVFULLLENGTH">FLVFULLLENGTH</OPTION>
		<OPTION VALUE="VIDEOFULLLENGTH">VIDEOFULLLENGTH</OPTION>
	</SELECT>
	<br>
	<input type="submit" name="action" value="FindVideoByReferenceID">
</form>
	
<hr>
FindVideoByReferenceIDs:<br>
<form action="sampleAction.cfm" method="post">

	Token: <input type="text" name="readToken" size="65"><br>
	<cfoutput>
		<cfloop from="1" to="10" index="idx">
		Reference ID #idx#: <input type="text" name="refID#idx#"><br>
		</cfloop>
	</cfoutput>
	<br>
	Video fields:<br>
	<SELECT NAME="fields" MULTIPLE SIZE=10>
	<OPTION VALUE="ID" selected="selected">ID</OPTION>
		<OPTION VALUE="NAME">NAME</OPTION>
		<OPTION VALUE="SHORTDESCRIPTION">SHORTDESCRIPTION</OPTION>
		<OPTION VALUE="LONGDESCRIPTION">LONGDESCRIPTION</OPTION>
		<OPTION VALUE="CREATIONDATE">CREATIONDATE</OPTION>
		<OPTION VALUE="PUBLISHEDDATE">PUBLISHEDDATE</OPTION>
		<OPTION VALUE="LASTMODIFIEDDATE">LASTMODIFIEDDATE</OPTION>
		<OPTION VALUE="STARTDATE">STARTDATE</OPTION>
		<OPTION VALUE="ENDDATE">ENDDATE</OPTION>
		<OPTION VALUE="LINKURL">LINKURL</OPTION>
		<OPTION VALUE="LINKTEXT">LINKTEXT</OPTION>
		<OPTION VALUE="TAGS">TAGS</OPTION>
		<OPTION VALUE="VIDEOSTILLURL">VIDEOSTILLURL</OPTION>
		<OPTION VALUE="THUMBNAILURL">THUMBNAILURL</OPTION>
		<OPTION VALUE="REFERENCEID">REFERENCEID</OPTION>
		<OPTION VALUE="LENGTH">LENGTH</OPTION>
		<OPTION VALUE="ECONOMICS">ECONOMICS</OPTION>
		<OPTION VALUE="ITEMSTATE">ITEMSTATE</OPTION>
		<OPTION VALUE="PLAYSTOTAL">PLAYSTOTAL</OPTION>
		<OPTION VALUE="PLAYSTRAILINGWEEK">PLAYSTRAILINGWEEK</OPTION>
		<OPTION VALUE="VERSION">VERSION</OPTION>
		<OPTION VALUE="CUEPOINTS">CUEPOINTS</OPTION>
		<OPTION VALUE="SUBMISSIONINFO">SUBMISSIONINFO</OPTION>
		<OPTION VALUE="CUSTOMFIELDS">CUSTOMFIELDS</OPTION>
		<OPTION VALUE="RELEASEDATE">RELEASEDATE</OPTION>
		<OPTION VALUE="FLVURL">FLVURL</OPTION>
		<OPTION VALUE="RENDITIONS">RENDITIONS</OPTION>
		<OPTION VALUE="GEOFILTERED">GEOFILTERED</OPTION>
		<OPTION VALUE="GEORESTRICTED">GEORESTRICTED</OPTION>
		<OPTION VALUE="GEOFILTEREXCLUDE">GEOFILTEREXCLUDE</OPTION>
		<OPTION VALUE="EXCLUDELISTEDCOUNTRIES">EXCLUDELISTEDCOUNTRIES</OPTION>
		<OPTION VALUE="GEOFILTEREDCOUNTRIES">GEOFILTEREDCOUNTRIES</OPTION>
		<OPTION VALUE="ALLOWEDCOUNTRIES">ALLOWEDCOUNTRIES</OPTION>
		<OPTION VALUE="ACCOUNTID">ACCOUNTID</OPTION>
		<OPTION VALUE="FLVFULLLENGTH">FLVFULLLENGTH</OPTION>
		<OPTION VALUE="VIDEOFULLLENGTH">VIDEOFULLLENGTH</OPTION>
	</SELECT>
	<br>
	<input type="submit" name="action" value="FindVideoByReferenceIDs">
</form>

<hr>
<form action="sampleAction.cfm" method="post">
	FindVideosByText:<br>
	Token: <input type="text" name="readToken" size="65"><br>
	Text: <input type="text" name="text"><br>
	Video fields:<br>
	<SELECT NAME="fields" MULTIPLE SIZE=10>
	<OPTION VALUE="ID" selected="selected">ID</OPTION>
	<OPTION VALUE="NAME">NAME</OPTION>
	<OPTION VALUE="SHORTDESCRIPTION">SHORTDESCRIPTION</OPTION>
	<OPTION VALUE="LONGDESCRIPTION">LONGDESCRIPTION</OPTION>
	<OPTION VALUE="CREATIONDATE">CREATIONDATE</OPTION>
	<OPTION VALUE="PUBLISHEDDATE">PUBLISHEDDATE</OPTION>
	<OPTION VALUE="LASTMODIFIEDDATE">LASTMODIFIEDDATE</OPTION>
	<OPTION VALUE="STARTDATE">STARTDATE</OPTION>
	<OPTION VALUE="ENDDATE">ENDDATE</OPTION>
	<OPTION VALUE="LINKURL">LINKURL</OPTION>
	<OPTION VALUE="LINKTEXT">LINKTEXT</OPTION>
	<OPTION VALUE="TAGS">TAGS</OPTION>
	<OPTION VALUE="VIDEOSTILLURL">VIDEOSTILLURL</OPTION>
	<OPTION VALUE="THUMBNAILURL">THUMBNAILURL</OPTION>
	<OPTION VALUE="REFERENCEID">REFERENCEID</OPTION>
	<OPTION VALUE="LENGTH">LENGTH</OPTION>
	<OPTION VALUE="ECONOMICS">ECONOMICS</OPTION>
	<OPTION VALUE="ITEMSTATE">ITEMSTATE</OPTION>
	<OPTION VALUE="PLAYSTOTAL">PLAYSTOTAL</OPTION>
	<OPTION VALUE="PLAYSTRAILINGWEEK">PLAYSTRAILINGWEEK</OPTION>
	<OPTION VALUE="VERSION">VERSION</OPTION>
	<OPTION VALUE="CUEPOINTS">CUEPOINTS</OPTION>
	<OPTION VALUE="SUBMISSIONINFO">SUBMISSIONINFO</OPTION>
	<OPTION VALUE="CUSTOMFIELDS">CUSTOMFIELDS</OPTION>
	<OPTION VALUE="RELEASEDATE">RELEASEDATE</OPTION>
	<OPTION VALUE="FLVURL">FLVURL</OPTION>
	<OPTION VALUE="RENDITIONS">RENDITIONS</OPTION>
	<OPTION VALUE="GEOFILTERED">GEOFILTERED</OPTION>
	<OPTION VALUE="GEORESTRICTED">GEORESTRICTED</OPTION>
	<OPTION VALUE="GEOFILTEREXCLUDE">GEOFILTEREXCLUDE</OPTION>
	<OPTION VALUE="EXCLUDELISTEDCOUNTRIES">EXCLUDELISTEDCOUNTRIES</OPTION>
	<OPTION VALUE="GEOFILTEREDCOUNTRIES">GEOFILTEREDCOUNTRIES</OPTION>
	<OPTION VALUE="ALLOWEDCOUNTRIES">ALLOWEDCOUNTRIES</OPTION>
	<OPTION VALUE="ACCOUNTID">ACCOUNTID</OPTION>
	<OPTION VALUE="FLVFULLLENGTH">FLVFULLLENGTH</OPTION>
	<OPTION VALUE="VIDEOFULLLENGTH">VIDEOFULLLENGTH</OPTION>
	</SELECT>
	<br>
	<input type="submit" name="action" value="FindVideosByText">
</form>

<hr>
<form action="sampleAction.cfm" method="post">
	
	FindVideosByTags:<br>
	Token: <input type="text" name="readToken" size="65"><br>
	Required Tags: <input type="text" name="andTags"><br>
	Optional Tags: <input type="text" name="orTags"><br>
	
	Video fields:<br>
	<SELECT NAME="fields" MULTIPLE SIZE=10>
	<OPTION VALUE="ID" selected="selected">ID</OPTION>
		<OPTION VALUE="NAME">NAME</OPTION>
		<OPTION VALUE="SHORTDESCRIPTION">SHORTDESCRIPTION</OPTION>
		<OPTION VALUE="LONGDESCRIPTION">LONGDESCRIPTION</OPTION>
		<OPTION VALUE="CREATIONDATE">CREATIONDATE</OPTION>
		<OPTION VALUE="PUBLISHEDDATE">PUBLISHEDDATE</OPTION>
		<OPTION VALUE="LASTMODIFIEDDATE">LASTMODIFIEDDATE</OPTION>
		<OPTION VALUE="STARTDATE">STARTDATE</OPTION>
		<OPTION VALUE="ENDDATE">ENDDATE</OPTION>
		<OPTION VALUE="LINKURL">LINKURL</OPTION>
		<OPTION VALUE="LINKTEXT">LINKTEXT</OPTION>
		<OPTION VALUE="TAGS">TAGS</OPTION>
		<OPTION VALUE="VIDEOSTILLURL">VIDEOSTILLURL</OPTION>
		<OPTION VALUE="THUMBNAILURL">THUMBNAILURL</OPTION>
		<OPTION VALUE="REFERENCEID">REFERENCEID</OPTION>
		<OPTION VALUE="LENGTH">LENGTH</OPTION>
		<OPTION VALUE="ECONOMICS">ECONOMICS</OPTION>
		<OPTION VALUE="ITEMSTATE">ITEMSTATE</OPTION>
		<OPTION VALUE="PLAYSTOTAL">PLAYSTOTAL</OPTION>
		<OPTION VALUE="PLAYSTRAILINGWEEK">PLAYSTRAILINGWEEK</OPTION>
		<OPTION VALUE="VERSION">VERSION</OPTION>
		<OPTION VALUE="CUEPOINTS">CUEPOINTS</OPTION>
		<OPTION VALUE="SUBMISSIONINFO">SUBMISSIONINFO</OPTION>
		<OPTION VALUE="CUSTOMFIELDS">CUSTOMFIELDS</OPTION>
		<OPTION VALUE="RELEASEDATE">RELEASEDATE</OPTION>
		<OPTION VALUE="FLVURL">FLVURL</OPTION>
		<OPTION VALUE="RENDITIONS">RENDITIONS</OPTION>
		<OPTION VALUE="GEOFILTERED">GEOFILTERED</OPTION>
		<OPTION VALUE="GEORESTRICTED">GEORESTRICTED</OPTION>
		<OPTION VALUE="GEOFILTEREXCLUDE">GEOFILTEREXCLUDE</OPTION>
		<OPTION VALUE="EXCLUDELISTEDCOUNTRIES">EXCLUDELISTEDCOUNTRIES</OPTION>
		<OPTION VALUE="GEOFILTEREDCOUNTRIES">GEOFILTEREDCOUNTRIES</OPTION>
		<OPTION VALUE="ALLOWEDCOUNTRIES">ALLOWEDCOUNTRIES</OPTION>
	<OPTION VALUE="ACCOUNTID">ACCOUNTID</OPTION>
		<OPTION VALUE="FLVFULLLENGTH">FLVFULLLENGTH</OPTION>
		<OPTION VALUE="VIDEOFULLLENGTH">VIDEOFULLLENGTH</OPTION>
	</SELECT>
	<br>
	<input type="submit" name="action" value="FindVideosByTags">
</form>

	<!-------------------------------------------------------------------------------------->
	<!-----------------------	WRITE API METHODS 	---------------------------------------->
	<!-------------------------------------------------------------------------------------->
	

<hr>
<p>
	<h2>Video Write API tests</h2>
</p>

<hr>
<form action="sampleAction.cfm" method="post">
	
	<b>createVideo:</b><br>
	<p>
	Token: <input type="text" name="writeToken" size="65">
	</p>
	Filename (on the server): <input type="text" name="filename" size="150"><br>
	Name: <input type="text" name="name"><br>

	<hr width="50" align="left">
	Optional:<br>
	Short Description<br>
	<input type="text" name="shortDescription"><br>
	Long Description<br>
	<textarea name="longDescription" rows="15" cols="60"></textarea>
	<p>
	<p>
		Reference ID: <input type="text" name="referenceID"><br>
	</p>
	<b>Start Date</b> (example 09 30 1975 05 30 00):<br>
	Month: <input type="text" name="startMonth" size="3"> Day: <input type="text" name="startDay" size="3"> Year: <input type="text" name="startYear" size="3"> Hour: <input type="text" name="startHour" size="3"> Minute: <input type="text" name="startMinute" size="3"> Second: <input type="text" name="startSecond" size="3">
	</p>
	<p>
	<b>End Date</b> (example 09 30 1975 05 30 00):<br>
	Month: <input type="text" name="endMonth" size="3"> Day: <input type="text" name="endDay" size="3"> Year: <input type="text" name="endYear" size="3"> Hour: <input type="text" name="endHour" size="3"> Minute: <input type="text" name="endMinute" size="3"> Second: <input type="text" name="endSecond" size="3">
	</p>
	<p>
	Tags<br>
	<input type="text" name="Tags"><br>
	</p>
	Economics:<br>
	<input type="radio" name="economics" value="FREE"> Free<br>
	<input type="radio" name="economics" value="AD_SUPPORTED"> Ad Supported<br>
	<br>
	<input type="submit" name="action" value="createVideo">
</form>
<hr>
<form action="sampleAction.cfm" method="post">
	
	<b>updateVideo:</b><br>
	<p>
	Token: <input type="text" name="writeToken" size="65">
	</p>
	ID: <input type="text" name="ID"><br>
	<hr width="50" align="left">
	Optional:<br>
	Name: <input type="text" name="name"><br>
	Short Description<br>
	<input type="text" name="shortDescription"><br>
	Long Description<br>
	<textarea name="longDescription" rows="15" cols="60"></textarea><br>
	<p>
		Reference ID: <input type="text" name="referenceID"><br>
	</p>
	<p>
	<b>Start Date</b> (example 09 30 1975 05 30 00):<br>
	Month: <input type="text" name="startMonth" size="3"> Day: <input type="text" name="startDay" size="3"> Year: <input type="text" name="startYear" size="3"> Hour: <input type="text" name="startHour" size="3"> Minute: <input type="text" name="startMinute" size="3"> Second: <input type="text" name="startSecond" size="3">
	</p>
	<p>
	<b>End Date</b> (example 09 30 1975 05 30 00):<br>
	Month: <input type="text" name="endMonth" size="3"> Day: <input type="text" name="endDay" size="3"> Year: <input type="text" name="endYear" size="3"> Hour: <input type="text" name="endHour" size="3"> Minute: <input type="text" name="endMinute" size="3"> Second: <input type="text" name="endSecond" size="3">
	</p>
	<p>
	Tags<br>
	<input type="text" name="Tags"><br>
	</p>
	Economics:<br>
	<input type="radio" name="economics" value="FREE"> Free<br>
	<input type="radio" name="economics" value="AD_SUPPORTED"> Ad Supported<br>
	<br>
	<input type="submit" name="action" value="updateVideo">
</form>

<hr>

<b>deleteVideo:</b><br>
<form action="sampleAction.cfm" method="post">
	<p>
	Token: <input type="text" name="writeToken" size="65">
	</p>
	ID: <input type="text" name="ID"><br>
	<b>OR</b><br>
	Reference ID: <input type="text" name="referenceID"><br>
	<hr width="50" align="left">
	Optional:<br>
	Cascade: <input type="checkbox" name="cascade"><br>
		
	Delete Shares: <input type="checkbox" name="deleteShares"><br>
	
	<input type="submit" name="action" value="deleteVideo">
</form>

<hr>
<b>getUploadStatus:</b><br>
<form action="sampleAction.cfm" method="post">
	<p>
	Token: <input type="text" name="writeToken" size="65">
	</p>
	ID: <input type="text" name="ID"><br>
	<b>OR</b><br>
	Reference ID: <input type="text" name="referenceID"><br>

	<input type="submit" name="action" value="getUploadStatus">
</form>

<hr>
<b>getProgressiveVideoByID:</b><br>
<form action="sampleAction.cfm" method="post">
	<p>
	Token: <input type="text" name="writeToken" size="65">
	</p>
	ID: <input type="text" name="ID"><br>
	
	<input type="submit" name="action" value="getProgressiveVideoByID">
</form>
<hr>