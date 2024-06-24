from flask import Flask, jsonify, request
import pandas as pd

app = Flask(__name__)

# Read data and preprocess
file_path = 'projectDB.csv'
data = pd.read_csv(file_path)
data.replace('none', pd.NA, inplace=True)
symptom_columns = ['Symptom1', 'Symptom2', 'Symptom3', 'Symptom4', 
                'Symptom5', 'Symptom6', 'Symptom7', 'Symptom8', 
                'Symptom9', 'Symptom10', 'Symptom11', 'Symptom12']
for col in symptom_columns:
    data[col] = data[col].str.lower()

data['all_symptoms'] = data[symptom_columns].apply(lambda row: [symptom for symptom in row if pd.notna(symptom)], axis=1)

rules = []
for index, row in data.iterrows():
    symptoms = row['all_symptoms']
    disease_info = {
        "disease": row['diseases'],
        "description": row['Description'],
        "age": row['age'],
        "gender": row['gender']
    }
    rules.append((symptoms, disease_info))

class ExpertSystem:
    def __init__(self, rules):
        self.rules = rules

    def infer_disease(self, user_symptoms):
        probable_diseases = []
        
        for symptoms, disease_info in self.rules:
            match_count = sum(1 for symptom in user_symptoms if symptom in symptoms)
            if match_count > 0:
                probable_diseases.append((match_count, disease_info))
        
        probable_diseases.sort(reverse=True, key=lambda x: x[0])
        
        if probable_diseases:
            return probable_diseases[0][1]
        else:
            return {"disease": "No matching disease found", "description": "", "age": "", "gender": ""}

expert_system = ExpertSystem(rules)

@app.route('/diagnose', methods=['POST'])
def diagnose():
    req_data = request.get_json()
    user_symptoms = [symptom.lower() for symptom in req_data['symptoms']]
    diagnosed_disease_info = expert_system.infer_disease(user_symptoms)
    return jsonify(diagnosed_disease_info)

if __name__ == '__main__':
      app.run(host='127.0.0.1', port=5000, debug=True)
