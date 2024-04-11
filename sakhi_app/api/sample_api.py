from flask import Flask,request
import joblib,re
from sklearn.preprocessing import LabelEncoder,StandardScaler

app=Flask(__name__)
@app.route('/',methods=["GET"])
def hello():
    return "Hello world"

@app.route('/api',methods=['GET'])
def toUpperCase():
    d={}
    fname=request.args.get("fname")
    print(type(fname))
    confname=str.upper(fname)
    d['name']=confname
    print(confname)
    return(d)
@app.route('/add',methods=['POST','GET'])
def adding():
    data=request.json
    print(data)
    sum=int(data["key1"])+int(data["key2"])
    print(sum)
    data["result"]=sum
    return data 
@app.route('/predict',methods=["POST","GET"])
def predicting_model():
    data=request.json
    print(data)
    numbers=["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]
    pred1={}
    # keys=[]
    values=data['answers']
    decision=""
    # for i in data:
    #     keys.append(i)
    print(" is csdd",values)
    for i in range (len(values)):
        if(values[i] in numbers):
            values[i]=int(values[i])
    print("Values are",values)
    label_encoder = LabelEncoder()
    scaler=StandardScaler()
    values = label_encoder.fit_transform(values)
    print("After label encoding",values)
    # values=scaler.fit_transform([values])
    # print("After Scale fit transform",values)
    # values=scaler.transform(values)
    # print("After Scale transform values are",values)
    # print("The length of the list is ",len(keys))
    print("The values are ",values)
    clf=joblib.load('xgbclf.joblib')
    # # input_data=[[36,52,150,23.111111,15,80,20,10,4,2,4,0,0,1.99,2.8,1.51,
    # #                       1.854306,40,38,0.95,6.65,11.74,27.7,0.25,125,0,0,0,0,0,0,0,
    # #                       110,80,1,1,14,17,2.5]]
    input_data=[values]
    predictions=clf.predict(input_data)
    predictions=predictions.tolist()
    print("Hii hello",predictions)
    pred=predictions[0]
    if(pred==1):
        decision="Yes"
    else:
        decision="No"
    pred1["Prediction"]=pred
    pred1["decision"]=decision
    return pred1


#main
if __name__=="__main__":
    app.run(host='0.0.0.0', port=5000,debug=True)


