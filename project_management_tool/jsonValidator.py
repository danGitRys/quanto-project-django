import json
import jsonschema
from jsonschema import validate

class validator:

    def login(jsonData):
        loginSchema = {
            "type": "object",
            "properties": {
                "mail": {"type": "string"},
                "password": {"type": "string"},
               
            },
            # Specify required keys
            "required": ["mail", "password"],
        }
        try:
            validate(instance=jsonData, schema=loginSchema)
        except jsonschema.exceptions.ValidationError as err:
            return False
        return True