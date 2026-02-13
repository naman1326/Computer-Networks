import pandas as pd

file = "conversation.csv"
df = pd.read_csv(file)

print("========== CONVERSATION ANALYSIS ==========\n")

max_row = df.loc[df["Bytes"].idxmax()]

print("Address Pair with Maximum Bytes:")
print("Address A:", max_row["Address A"])
print("Address B:", max_row["Address B"])
print("Maximum Bytes:", max_row["Bytes"])

print("\n------------------------------------")

print("\nTotal Packets per Pair:\n")
print(df[["Address A", "Address B", "Packets"]])

print("\n------------------------------------")


print("\nNOTE:")
print("For protocol-wise counts, export CSV separately from TCP and UDP tabs.")
