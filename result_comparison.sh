#!/bin/bash

# Define the path to the CSV file
csv_file="/Users/tosin/Desktop/TDI_Week5/TDI_Week5/reports/baseline_model_results.csv"

# Step 1: Find the best model based on the highest F1-score (assumed to be in column 5)
best_model=$(sort -t, -k5 -rg "$csv_file" | head -n 1)

# Step 2: Extract relevant details for the best model
data_version=$(echo "$best_model" | awk -F, '{print $1}')
model_name=$(echo "$best_model" | awk -F, '{print $2}')
precision=$(echo "$best_model" | awk -F, '{print $3}')
recall=$(echo "$best_model" | awk -F, '{print $4}')
f1_score=$(echo "$best_model" | awk -F, '{print $5}')
roc_auc=$(echo "$best_model" | awk -F, '{print $6}')

echo "The best model by F1-score metric is $model_name version $data_version with score of $f1_score"

directory="/Users/tosin/Desktop/TDI_Week5/TDI_Week5/reports"
name=$(echo "$best_model" | awk -F, '{print $1 "_" $2}' | sed 's/,/_/g') 


cat <<EOF > baseline_model_report.md

# Baseline Model Evaluation

* Model: $model_name
* Data Version: $data_version

## Metrics

* F1-Score: $f1_score
* Recall: $recall
* Precision: $precision
* ROC-AUC: $roc_auc

## Model Image
![Model Image]($directory/data${name}_confusion_matrix.png)

EOF
