import pandas as pd

highlight_df = pd.DataFrame(
    {
     "column1": [-5, -2, 1, 4],
     "column2": [2, 3, -1, 4]
    }
)

def highlight_number(row):
    return [
    "background-color: red; color: white"
    if cell < 0
    else "background-color: green; color: white"
    for cell in row
    ]

highlight_df.apply(highlight_number)