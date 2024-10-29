# Baseline Model Selection Project

## Project Overview
This project focuses on identifying and selecting the best baseline machine learning model from multiple data versions. Originally developed in a Jupyter notebook, this project has now been restructured for deployment in production or cloud services. The repository follows an organized structure, with dedicated directories for reports and automation scripts to streamline the baseline model evaluation process.

## Directory Structure
- **report/**: Contains model performance metrics and outputs, including:
  - `baseline_model_results.csv`: CSV file with performance metrics for all models.
  - `confusion_matrix_<model_version>.png`: Confusion matrix images for models.
- **result_comparison.sh**: A Bash script that automates the process of selecting and reporting the best baseline model.

## result_comparison.sh Script
The `result_comparison.sh` script, located in the root directory, automates the following tasks:

1. **Identifies the Best Baseline Model**:
   - Iterates through `baseline_model_results.csv` in the `report` directory.
   - Filters for the best model based on the highest F1-score metric.

2. **Generates Summary Report in Markdown**:
   - Creates `baseline_model_report.md` summarizing:
     - Data version and model name.
     - Key performance metrics (F1-score, accuracy, etc.).
     - Confusion matrix image file associated with the best model.
   - Uses tools like `awk`, `sed`, and `sort` to format results in a readable Markdown format.

3. **Version Control and Merging**:
   - Commits `baseline_model_report.md` to the `compare-result` branch.
   - Submits a pull request to merge `compare-result` into the `main` branch.
   - Ensures only the best model report is included in `baseline_model_report.md` in the main branch.

## Usage

1. **Run result_comparison.sh**:
   - Execute the script to identify the best baseline model based on F1-score and generate `baseline_model_report.md`.
   ```bash
   bash result_comparison.sh

