from scapy.all import *
import matplotlib.pyplot as plt
from collections import defaultdict

pcap_file = "test.pcap"
packets = rdpcap(pcap_file)

total = defaultdict(int)
tcp = defaultdict(int)
udp = defaultdict(int)
tls = defaultdict(int)
dns = defaultdict(int)

for pkt in packets:
    if hasattr(pkt, 'time'):
        t = int(pkt.time)

        total[t] += 1

        if TCP in pkt:
            tcp[t] += 1

        if UDP in pkt:
            udp[t] += 1

        if TCP in pkt and (pkt[TCP].sport == 443 or pkt[TCP].dport == 443):
            tls[t] += 1

        if pkt.haslayer(DNS):
            dns[t] += 1

def plot_graph(data, title):
    x = sorted(data.keys())
    y = [data[i] for i in x]

    plt.figure()
    plt.plot(x, y)
    plt.title(title)
    plt.xlabel("Time (seconds)")
    plt.ylabel("Packets")
    plt.grid(True)
    plt.show()

plot_graph(total, "Total Traffic")
plot_graph(tcp, "TCP Traffic")
plot_graph(udp, "UDP Traffic")
plot_graph(tls, "TLS Traffic (Port 443)")
plot_graph(dns, "DNS Traffic")
