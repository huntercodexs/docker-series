
def response_generator(status, message, response_name="", response_content="", request_name="", request_content=""):
    response = {"status": status, "message": message}

    if response_name != "" and response_content != "":
        response[response_name] = response_content

    if request_name != "" and request_content != "":
        response[request_name] = request_content

    return response

