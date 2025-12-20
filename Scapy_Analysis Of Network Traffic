from scapy.all import rdpcap, IP
from collections import Counter

packets = rdpcap("traffic_capture.pcap")

print("Number of packets:", len(packets))

src_ips = set()
dst_ips = set()
protocols = []

for pkt in packets:
    if pkt.haslayer(IP):
        src_ips.add(pkt[IP].src)
        dst_ips.add(pkt[IP].dst)
        protocols.append(pkt[IP].proto)

proto_count = Counter(protocols)

print("Number of Source IPs:", len(src_ips))
print("Number of Destination IPs:", len(dst_ips))
print("Number of Protocols used:", len(proto_count))

print("\nPackets under each protocol:")
for proto, count in proto_count.items():
    print(f"Protocol {proto}: {count}")
