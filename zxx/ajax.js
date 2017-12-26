/*
*
*  date:2017/12/26
*
*  Content-Type:application/json
*
*  param:
*      url: url
*      method: get/post/delete/put
*      data: {a:"bb",c:"dd"}
*  return: 
*      json str
*/
function doAjax(url, method, data, callback){
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");	
	fetch(url,{
		body:JSON.stringify(data),
		method:method,
		headers:myHeaders
	})
	.then(function(response){
		return response.json()
	})
	.then(function(datajson){
		callback(datajson)
	})
}
