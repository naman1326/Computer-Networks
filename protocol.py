import pandas as pd

file = "protocol.csv"
df = pd.read_csv(file)

print("========== PROTOCOL HIERARCHY ANALYSIS ==========\n")

total_packets = df["Packets"].sum()

total_bytes = df["Bytes"].sum()

frame_bytes = df[df["Protocol"] == "Frame"]["Bytes"].values

if len(frame_bytes) > 0:
    total_frame_bytes = frame_bytes[0]
else:
    total_frame_bytes = total_bytes

header_size = total_frame_bytes - total_bytes

print("Total Number of Packets:", total_packets)
print("Total Size of Data (Bytes):", total_bytes)
print("Estimated Header Size (Bytes):", header_size)
