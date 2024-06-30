import pandas as pd
import scipy.stats as stats
import matplotlib.pyplot as plt
import seaborn as sns

file_path = "02_understanding_the_data/count_MESP_AUTP_per_lot.csv"

# Load the data
data = pd.read_csv(file_path)

# Calculate the Pearson correlation coefficient
correlation, p_value = stats.pearsonr(data['measurement_steps'], data['sorting_steps'])

print(f'Pearson correlation coefficient: {correlation}')
print(f'P-value: {p_value}')


# Set the style of the visualization
sns.set(style="whitegrid")

# Create a scatter plot with a regression line
plt.figure(figsize=(10, 6))
sns.regplot(x='measurement_steps', y='sorting_steps', data=data, scatter_kws={'s': 50}, line_kws={'color': 'red'})

# Add titles and labels
plt.title('Correlation between Measurement Steps and Sorting Steps per Lot')
plt.xlabel('Number of Measurement Steps')
plt.ylabel('Number of Sorting Steps')

# Display the plot
plt.show()
