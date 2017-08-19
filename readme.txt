----------------------------------------------------------------------------
cfBCove SDK
Wraps the Brightcove API
Released: December 14, 2009
----------------------------------------------------------------------------
LICENSE: 

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
----------------------------------------------------------------------------

Purpose
-------
Considering Brightcove was founded by Mr. Alaire himself, it was only fitting that there would be a CF SDK.  And I needed one for tagtrigger.com and other client's sites, so here's the initial version.

I have not implemented all the methods or all the various arguments on included methods, but this is a good subset of the Media API functionality and should cover most of what you would want to do with the Media API, besides playlists.

Plans
-----
I will probably tackle the Playlist portion of the Media API next.

What's Included
---------------
- There are two classes, videoWrite.cfc and videoRead.cfc.  These are organized based on how Brightcove organizes them.  
- There is a sample test app - sample.cfm, sampleAction.cfm.  This allows you to quickly test calls to the BC API.  The action file should show you how to invoke methods on the read/write classes.

Usage
-----
- Instantiate the desired API class, initializing with the appropriate read or write token.


Methods
-------
videoWrite class:
	- public any init(any apiToken)
	 
	- private date dateToEpoch(string date) 
	- private string videoMetadataToJSONArgs(any argData)
	- private struct doAPIcallNoFile(string jsonArgs) 
	- private any doVideoUpload(string filename, string jsonArgs) 
	- private date epochToDate(string epoch) 

	- public struct createVideo(string name, String filename, [string referenceID], [string shortDescription], [string longDescription], [numeric startDate], [numeric endDate], [Array tags], [string economics])
	- public struct deleteVideo([Numeric ID], [string referenceID], [Boolean cascade], [Boolean deleteShares]) 
	- public any getUploadStatus([Numeric ID], [string referenceID]) 
	- public struct updateVideo(Numeric ID, [string name], [string referenceID], [string shortDescription], [string longDescription], [numeric startDate], [numeric endDate], [Array tags], [string economics]) 

All methods, except getProgressiveVideoByID return a struct.  If there is an error, it is in the "error" key.  Any other data is returned as a separate key.
One thing to note is Brightcove's deleteVideo method doesn't return anything except for malformed request errors, so there is little to expect back from that call.

videoRead class: 	
	- public any init(any apiToken) 	
		
	- private any APIcall(struct callParams)
	
	- public Any findVideoByID(Numeric ID, [String videoFields]) 
	- public Any findVideoByReferenceID(String referenceID, [String videoFields]) 
	- public Any findVideoByReferenceIDs(Array referenceIDs, [String videoFields]) 
	- public Any findVideosByTags(struct tags, [String videoFields]) 
	- public Any findVideosByText(string text, [String videoFields]) 
	- public Any findAllVideos([String videoFields])
	- public Any findVideosByIDs(Array IDs, [String videoFields])
	- public String getProgressiveVideoByID(Numeric ID)
	- public Any init(any apiToken) 
	

Support
-------
Let me know if you have issues and I'll help if I can.  But please read the license for this, it is provided as-is and no support is guaranteed. 

Release History
---------------
 12/14/09 - v1.0 
 	Initial Release.
 	
 01/20/09 - v1.1 
	Added: findAllVideos, findVideosByIDs (added support for a list to be passed, not just an array)
	Fixed: a typo in a method name
	
 01/03/10 - v1.2  
	Added: getProgressiveVideoByID (gets the URL of the video if you have universal delivery enabled)
  

Thanks
------
Thanks to Ray Camden (coldfusionjedi.com) for his initial help debugging the format of write API calls.