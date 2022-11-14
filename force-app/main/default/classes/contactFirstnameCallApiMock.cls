public class contactFirstnameCallApiMock implements HttpCalloutMock {
    public Boolean isError = false;
    public HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        if(isError){
            res.setStatus('Fail');
            res.setStatusCode(400);
            res.setBody('error something is wrong');
        }
        else{
            res.setStatus('Pass');
            res.setStatusCode(200);
            res.setBody('{"count": 88102,"gender": "male","name": "ram","probability": 1}');
        }
        return res;
    }
}