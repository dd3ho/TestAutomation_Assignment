# 🧩 Test Automation Assignment

This project demonstrates **automated testing** using multiple tools and frameworks, including:
- **Python** (scripts & algorithms)
- **Robot Framework** (Web & API testing)
- **Jenkins** (CI/CD pipeline with report publishing)

---

## 📁 Project Structure

```
TestAutomation_Assignment/
├── 1_find_duplicate_list/
│   └── find_duplicate.py
├── 2_web_login_automation/
│   ├── login_test.robot
│   └── results/
├── 3_api_testing/
│   ├── tests/users/test_user_api.robot
│   ├── resources/
│   │   ├── keywords.robot
│   │   ├── variables.robot
│   │   └── schemas/user_schema.json
│   └── output/
├── 5_jenkins_pipeline/
│   └── Jenkinsfile
├── 6_simple_cipher/
│   └── simple_cipher.py
├── requirement.txt
└── tempTest/
    └── tests/test_users_api.py
```

---

## ⚙️ Installation Guide

### 1️⃣ Clone Repository
```bash
git clone https://github.com/dd3ho/TestAutomation_Assignment.git
cd TestAutomation_Assignment
```

### 2️⃣ Create Virtual Environment
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3️⃣ Install Dependencies
```bash
pip install --upgrade pip
pip install -r requirement.txt
```

### 4️⃣ (macOS only) Install ChromeDriver
Used for **Selenium** browser automation.

```bash
brew install chromedriver
```

Verify:
```bash
which chromedriver
# /opt/homebrew/bin/chromedriver
```

> 💡 Ensure Chrome and ChromeDriver versions match.

---

## 🧪 Test Execution Guide

### ✅ 1. Find Duplicate List
**File:** `1_find_duplicate_list/find_duplicate.py`

**Run:**
```bash
python3 1_find_duplicate_list/find_duplicate.py
```

**Purpose:**  
Find duplicate numbers in a list.

**Expected Output:**
```
[1, 2, 3, 5, 6]
```

---

### ✅ 2. Web Login Automation (UI Test)
**File:** `2_web_login_automation/login_test.robot`

**Run:**
```bash
robot -d 2_web_login_automation/results 2_web_login_automation/login_test.robot
```

**Purpose:**
- Verify that login functionality works correctly.
- Validate 3 cases:
  1. Login successfully  
  2. Invalid password  
  3. Username not found

**Report Output:**
```
2_web_login_automation/results/report.html
```

---

### ✅ 3. API Testing
**File:** `3_api_testing/tests/users/test_user_api.robot`

**Run:**
```bash
robot -d 3_api_testing/output 3_api_testing/tests/users/test_user_api.robot
```

**Purpose:**
- Test the `https://reqres.in/api/users` endpoint
- Validate:
  - `GET /users/{id}` returns 200 for existing users
  - `GET /users/{id}` returns 404 for non-existing users
  - JSON structure matches `user_schema.json`

**Report Output:**
```
3_api_testing/output/report.html
```

---

### ✅ 4. Jenkins Pipeline (CI/CD)
**File:** `5_jenkins_pipeline/Jenkinsfile`

#### Steps:
1. Open Jenkins → **New Item → Pipeline**
2. Set **Git URL**:
   ```
   https://github.com/dd3ho/TestAutomation_Assignment.git
   ```
3. Set **Pipeline Script Path**:
   ```
   5_jenkins_pipeline/Jenkinsfile
   ```
4. Click **Save → Build Now**

#### Pipeline Stages
| Stage | Description |
|--------|-------------|
| **Checkout Code** | Pull latest source code from Git |
| **Install Dependencies** | Create Python virtualenv & install requirements |
| **Run All Tests** | Execute Python, Web, API, and Cipher tests |
| **Publish Reports** | Generate Robot Framework HTML reports |

#### Reports:
- `2_web_login_automation/results/report.html`
- `3_api_testing/output/report.html`

> ⚠️ Make sure Jenkins has the **HTML Publisher Plugin** installed.

---

### ✅ 5. Simple Cipher
**File:** `6_simple_cipher/simple_cipher.py`

**Run:**
```bash
python3 6_simple_cipher/simple_cipher.py
```

**Purpose:**
Decrypt a string using alphabet rotation.

**Example:**
```python
encrypted = 'VTAOG'
k = 2
# Output: TRYME
```

---

## 🧾 Summary Table

| Module | Type | Tool | Output |
|--------|------|------|---------|
| 1_find_duplicate_list | Python Script | Python | Console |
| 2_web_login_automation | UI Test | Robot + Selenium | `results/report.html` |
| 3_api_testing | API Test | Robot + Requests | `output/report.html` |
| 5_jenkins_pipeline | CI/CD | Jenkins | Web UI Reports |
| 6_simple_cipher | Algorithm | Python | Console |

---

## 🧠 Notes
- Python version: **3.9+**
- Activate the virtual environment before running tests.
- For Jenkins macOS:  
  Add ChromeDriver path manually:
  ```bash
  export PATH=$PATH:/opt/homebrew/bin
  ```

---

## 👩‍💻 Author
**Panisra Wongbubpa. (Parn)**  
Automation Testing Project — integrating **Python, Robot Framework, and Jenkins CI/CD** for test automation and reporting.
