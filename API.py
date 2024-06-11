from flask import Flask, request, jsonify
import pandas as pd

app = Flask(__name__)

class KnowledgeBase:
    def __init__(self):
        self.rules = []

    def add_rule(self, rule):
        self.rules.append(rule)

    def get_rules(self):
        return self.rules

class InferenceEngine:
    def __init__(self, kb):
        self.kb = kb

    def forward_chain(self, initial_symptoms):
        known_symptoms = set(initial_symptoms)
        inferred_diseases = set()
        disease_info = {}

        rules_applied = True

        while rules_applied:
            rules_applied = False
            new_symptoms = set()

            for rule in self.kb.get_rules():
                rule_symptoms = set(rule["symptoms"])

                if rule_symptoms.issubset(known_symptoms) and rule["disease"] not in inferred_diseases:
                    inferred_diseases.add(rule["disease"])
                    disease_info[rule["disease"]] = {
                        "Description": rule["Description"],
                        "age": rule["age"],
                        "gender": rule["gender"]
                    }
                    new_symptoms.update(rule_symptoms)
                    rules_applied = True

            known_symptoms.update(new_symptoms)

        return disease_info

# Initialize the knowledge base
kb = KnowledgeBase()

# Load the rules from the CSV file into the knowledge base
df = pd.read_csv("projectDB.csv")
df.drop_duplicates(inplace=True)
for _, row in df.iterrows():
    symptoms = [row[f'Symptom{i}'].strip() for i in range(1, 13) if pd.notna(row[f'Symptom{i}'])]
    kb.add_rule({
        "symptoms": symptoms,
        "disease": row['diseases'],
        "Description": row['Description'],
        "age": row['age'],
        "gender": row['gender']
    })

engine = InferenceEngine(kb)

@app.route('/predict', methods=['POST'])
def diagnose():
    data = request.get_json()
    symptoms = data.get('symptoms', [])
    disease_info = engine.forward_chain(symptoms)
    
    result = [
        {
            "disease": disease,
            "Description": info["Description"],
            "age": info["age"],
            "gender": info["gender"]
        }
        for disease, info in disease_info.items()
    ]
    
    return jsonify(result)

if __name__ == "__main__":
   app.run(host='127.0.0.1', port=5000, debug=True)
