import requests
from behave import given, when, then
@given("A website")
def _(context): pass
@when("we send a request to the website")
def req(context):
    context.response = requests.get(context.url, **context.opts)
    assert context.response
@then("the website responds.")
def resp(context):
    assert context.response.status_code == 200
