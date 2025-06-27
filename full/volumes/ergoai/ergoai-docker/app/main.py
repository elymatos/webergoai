import sys
import os
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

class Param(BaseModel):
    param: str

app = FastAPI()
app.add_middleware(CORSMiddleware, allow_origins=["*"])

XSBARCHDIR =  os.environ.get('XSBARCHDIR')
ERGOROOT = os.environ.get('ERGOROOT')

# Add path to pyergo in case this example program is elsewhere
sys.path.append(ERGOROOT.replace('\\','/') + '/python')

print("XSBARCHDIR = " + XSBARCHDIR)
print("ERGOROOT = " + ERGOROOT)
print(ERGOROOT.replace('\\','/') + '/python')

from pyergo import \
pyergo_start_session, pyergo_end_session, \
pyergo_command, pyergo_query, \
HILOGFunctor, PROLOGFunctor, \
ERGOVariable, ERGOString, ERGOIRI, ERGOSymbol, \
ERGOIRI, ERGOCharlist, ERGODatetime, ERGODuration, ERGOUserDatatype, \
pyxsb_query, pyxsb_command, \
XSBFunctor, XSBVariable, XSBAtom, XSBString, \
PYERGOException, PYXSBException

pyergo_start_session(XSBARCHDIR,ERGOROOT)

@app.post("/command/", summary="Command")
def command(command:Param):
    pyergo_command(command.param)
    return {"result": "success"}

@app.post("/query/", summary="Query")
def query(query:Param):
    result = pyergo_query(query.param)
    return {"result": result}
