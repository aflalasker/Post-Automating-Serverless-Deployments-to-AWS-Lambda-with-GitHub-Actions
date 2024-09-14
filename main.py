def handler(event, context):
    try:
        return {"statusCode": 200, "body": "hello world"}

    except Exception as e:
        return {"statusCode": 400, "body": e}
