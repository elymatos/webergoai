import sys
import os
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel


class Param(BaseModel):
    param: str


app = FastAPI()
app.add_middleware(CORSMiddleware, allow_origins=["*"])

XSBARCHDIR = os.environ.get('XSBARCHDIR')
ERGOROOT = os.environ.get('ERGOROOT')

print("XSBARCHDIR = " + XSBARCHDIR)
print("ERGOROOT = " + ERGOROOT)

# Add path to pyergo
sys.path.append(ERGOROOT.replace('\\', '/') + '/python')

try:
    from pyergo import \
        pyergo_start_session, pyergo_end_session, \
        pyergo_command, pyergo_query, \
        HILOGFunctor, PROLOGFunctor, \
        ERGOVariable, ERGOString, ERGOIRI, ERGOSymbol, \
        ERGOIRI, ERGOCharlist, ERGODatetime, ERGODuration, ERGOUserDatatype, \
        pyxsb_query, pyxsb_command, \
        XSBFunctor, XSBVariable, XSBAtom, XSBString, \
        PYERGOException, PYXSBException

    # Start ErgoAI session
    pyergo_start_session(XSBARCHDIR, ERGOROOT)
    print("✅ PyErgo session started successfully")

except Exception as e:
    print(f"❌ PyErgo initialization failed: {e}")


def convert_ergo_result(result):
    """Convert ErgoAI objects to Python objects"""
    try:
        if result is None:
            return "No results"

        # If it's a simple value, return as string
        if isinstance(result, (str, int, float)):
            print("Symple value")
            return str(result)

        # If it's an ErgoAI variable or object, convert to string
        # if hasattr(result, '__str__'):
        #     print("ErgoAI variable or object")
        #     return str(result)

        # If it's a list or iterable
        if hasattr(result, '__iter__') and not isinstance(result, str):
            print("ErgoAI list or itearable")
            try:
                converted_items = []
                for item in result:
                    for var in item[0]:
                        (varName, varValue) = var
                        if isinstance(varValue, HILOGFunctor):
                            # Xresult= XVarname+'='+str(XVarVal.name)+'('+str(XVarVal.args[0])+')'
                            converted_items.append(varName + '=' + str(varValue) + " (HiLog case)")
                        elif isinstance(varValue, PROLOGFunctor):
                            # Xresult= XVarname+'='+str(XVarVal.name)+'('+str(XVarVal.args[0])+')@\\plg'
                            converted_items.append(varName + '=' + str(varValue) + " (Prolog case)")
                        elif isinstance(varValue, ERGOSymbol):
                            # Xresult= XVarname+'='+str(XVarVal.name)+'('+str(XVarVal.args[0])+')@\\plg'
                            converted_items.append('{"' + varName + '":"' + varValue.value + '"}')
                        else:
                            converted_items.append(varName + '=' + str(varValue) + " (Catchall case)")
                        # print("result: ", Xresult + " and " + Yresult, row[1], row[2], row[3].value)
                    # if hasattr(item, '__str__'):
                    #     converted_items.append(str(item))
                    # else:
                    #     converted_items.append(repr(item))
                return converted_items
            except:
                print("ErgoAI list or itearable except")
                return str(result)

        # Fallback
        return str(result)

    except Exception as e:
        return f"Result conversion error: {str(e)}"


@app.get("/")
def root():
    return {"message": "ErgoAI Service Running", "status": "healthy"}


@app.post("/command/", summary="Command")
def command(command: Param):
    try:
        pyergo_command(command.param)
        return {"result": "success"}
    except Exception as e:
        print(f"Command error: {e}")
        return {"result": "error", "message": str(e)}


@app.post("/query/", summary="Query")
def query(query: Param):
    try:
        print(f"🔍 Executing query: {query.param}")

        query_param = query.param
        # Clean the query
        # query_param = query.param.strip()
        # if query_param.startswith("?-"):
        #     query_param = query_param[2:].strip()
        # if query_param.endswith("."):
        #     query_param = query_param[:-1].strip()

        print(f"🔧 Cleaned query: {query_param}")

        # Execute the query
        raw_result = pyergo_query(query_param)
        # print(f"📤 Raw result type: {type(raw_result)}")
        # print(f"📤 Raw result: {repr(raw_result)}")

        # Convert the result
        converted_result = convert_ergo_result(raw_result)
        print(f"✅ Converted result: {converted_result}")

        return {"result": converted_result}

    except Exception as e:
        error_msg = str(e)
        print(e)
        print(f"❌ Query error: {error_msg}")

        return {
            "result": "error",
            "message": error_msg,
            "original_query": query.param,
        }


@app.get("/test")
def test():
    """Test endpoint with simple math"""
    try:
        print("🧪 Testing simple math query...")

        # Try the simplest possible query
        raw_result = pyergo_query("X = 1+1")
        print(f"📤 Test raw result: {repr(raw_result)}")

        converted_result = convert_ergo_result(raw_result)
        print(f"✅ Test converted result: {converted_result}")

        return {
            "status": "success",
            "raw_result_type": str(type(raw_result)),
            "converted_result": converted_result
        }
    except Exception as e:
        print(f"❌ Test error: {e}")
        return {"status": "error", "error": str(e)}


@app.get("/test2")
def test2():
    """Test with different query format"""
    try:
        print("🧪 Testing alternative query format...")

        # Try arithmetic without variable
        raw_result = pyergo_query("1+1")
        converted_result = convert_ergo_result(raw_result)

        return {
            "status": "success",
            "result": converted_result
        }
    except Exception as e:
        return {"status": "error", "error": str(e)}
