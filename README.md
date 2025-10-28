REST API Test Suite (Robot Framework)

This project automates API testing for the `PATCH /objects/{id}` endpoint of [restful-api.dev](https://restful-api.dev/).

Tech Stack
- **Python 3.12+**
- **Robot Framework**
- **RequestsLibrary**
- **GitHub Actions / Jenkins CI**

Running Tests Locally

Install Dependencies
```bash

git clone https://github.com/lnmahapatra/SAMPLEAUTO.git
cd BRITDEMO
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt

robot tests/
ROBOT tests/patch_object_test.robot

*** Test Cases ***
Patch Existing Object Successfully (should fail)
Patch With Invalid ID Should Fail (should fail)
Patch With Invalid Data Should Fail (should fail)
Patch Without Auth (If Required) (should fail)
Verify Partial Update Persists (should fail)

view Reports
After execution, open report.html and log.html generated in the project root.

CI/CD Setup

GitHub Actions
Runs tests automatically on every push or pull request.
See .github/workflows/ci.yml.

Jenkins
Use Jenkinsfile provided to configure pipeline