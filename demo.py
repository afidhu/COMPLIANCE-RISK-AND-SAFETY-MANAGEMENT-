import pandas as pd
import numpy as np

# Number of rows
rows = 200

# Generate dummy data
data = {
    "Age": np.random.randint(10, 60, rows),
    "Height": np.random.randint(130, 200, rows),
    "Gender": np.random.choice(["Male", "Female"], rows)
}

# Create DataFrame
df = pd.DataFrame(data)

# Save to Excel
df.to_excel("age_height_gender_200_rows.xlsx", index=False)

print("Excel file created successfully!")