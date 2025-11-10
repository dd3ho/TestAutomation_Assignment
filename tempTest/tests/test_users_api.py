import requests

HEADERS = {
    "User-Agent": "Mozilla/5.0",
    "x-api-key": "reqres-free-v1"
}

BASE_URL = "https://reqres.in/api/users"

# def test_get():
#     """Verify get existing user"""
#     response = requests.get(f"{BASE_URL}/12", headers=HEADERS)
#     print(response)
#     assert response.status_code == 200

# def test_get_user_not_found():
#     """Verify user not found"""
#     response = requests.get(f"{BASE_URL}/1234", headers=HEADERS)
#     print(response)
#     assert response.status_code == 404


def test_get_user_not_found():
    """Verify user not found"""
    headers = {
        "x-api-key": "reqres-free-v1"
    }
    response = requests.get(f"{BASE_URL}/1234", headers=headers)
    print(response)
    assert response.status_code == 404
    assert response.text.strip() == "{}"

