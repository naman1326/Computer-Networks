from scapy.all import *

packets = rdpcap("24BCE5051_CN6.pcap")

for pkt in packets:
    if IP in pkt:
        ip = pkt[IP]
        original = ip.chksum
        del ip.chksum
        new = IP(bytes(ip)).chksum

        print("Packet:", pkt.summary())
        print("Original IP checksum:", hex(original))
        print("Calculated IP checksum:", hex(new))
        print("Valid:", original == new)
        print("-" * 40)
