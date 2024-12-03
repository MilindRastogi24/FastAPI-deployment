from fastapi import FastAPI
from mangum import Mangum

app = FastAPI()
handler = Mangum(app)
@app.get("/")
def read_root():
    print("hello")
    return {"message": "Hello, FastAPI on AWS Lambda! Some new code"}



