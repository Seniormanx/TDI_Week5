#!/bin/bash

# Automate and identify the best baseline model by iterating baseline_model_results.csv in the report directory 
# we need to find the csv file



csv_file="/Users/tosin/Desktop/TDI_Week5/TDI_Week5/reports/baseline_model_results.csv"

# Iterating through the model
best_model=$(cat "$csv_file" | sort -t, -k5 -rg | head -n 1)

# Extract metrics from the model
 
model_name=$(echo "$best_model" | awk -F, '{print $2}')
recall=$(echo "$best_model" | awk -F,  '{print $4}')
f1_score=$(echo "$best_model" | awk -F,  '{print $5}')
roc_auc=$(echo "$best_model" | awk -F, '{print $6}')
precision=$(echo "$best_model" | awk -F, '{print $3}')
data_version=$(echo "$best_model" | awk -F, '{print $1}')

echo "The best model by F1-score metric is $model_name version $data_version with score of $f1_score"

# Find the picture that fits the model
directory="/Users/tosin/Desktop/TDI_Week5/TDI_Week5/reports"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
name=$(echo "$best_model" | awk -F, '{print $1 "_" $2}' | sed 's/,/_/g' )

cat <<EOF >>  baseline_model_report.md

# Baseline Model Evaluation

* Model: $model_name
* Data Version: $data_version

## Metrics

* F!-Score: $f1_score
* Recall: $recall
* Precision: $precision
* ROC-AUC: $roc_auc

![Confusion Matrix]($directory/data${name}_confusion_matrix.png)
EOF
