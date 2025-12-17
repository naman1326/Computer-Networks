clear;
clc; 
NameOfNetwork = 'Hybrid Topology (Star + Ring + Bus)';
NumberOfNodes = 25;

// EDGE DEFINITIONS

// STAR (Nodes 1–9, center = 1)
StarHead = [1 1 1 1 1 1 1 1];
StarTail = [2 3 4 5 6 7 8 9];

// RING (Nodes 10–17)
RingHead = [10 11 12 13 14 15 16 17];
RingTail = [11 12 13 14 15 16 17 10];

// BUS (Nodes 18–25)
BusHead = [18 19 20 21 22 23 24];
BusTail = [19 20 21 22 23 24 25];

// INTER-CONNECTIONS BETWEEN TOPOLOGIES
HybridHead = [1 10 18];
HybridTail = [10 18 5];

// COMBINE ALL EDGES
EndingNodesOfEdge = [StarHead RingHead BusHead HybridHead];
StartingNodesOfEdge = [StarTail RingTail BusTail HybridTail];

// NODE COORDINATES
XCoordinatesOfNodes = [
    300 200 300 400 250 350 200 300 400 ...   // Star
    700 750 800 850 850 800 750 700 ...       // Ring
    100 150 200 250 300 350 400 450            // Bus
];

YCoordinatesOfNodes = [
    400 300 300 300 400 400 500 500 500 ...
    400 450 500 450 350 300 300 350 ...
    100 100 100 100 100 100 100 100
];

// CREATE GRAPH
[TopologyGraph] = NL_G_MakeGraph( ...
    NameOfNetwork, NumberOfNodes, ...
    EndingNodesOfEdge, StartingNodesOfEdge, ...
    XCoordinatesOfNodes, YCoordinatesOfNodes);

// DISPLAY TOPOLOGY
WindowIndex = 1;
NL_G_ShowGraph(TopologyGraph, WindowIndex);
xtitle("Hybrid Topology (Star + Ring + Bus)", "X-Nodes", "Y-Nodes");

// (b) NUMBER NODES AND EDGES
WindowIndex = 2;
NL_G_ShowGraphNE(TopologyGraph, WindowIndex);
xtitle("Node and Edge Numbering", "X-Nodes", "Y-Nodes");

// (c) COLOUR NODES AND EDGES
NodeColor = 5;
BorderThickness = 10;
NodeDiameter = 25;
WindowIndex = 3;
NodesToHighlight = [1 5 10 15 20 25];

NL_G_HighlightNodes(TopologyGraph, NodesToHighlight, ...
    NodeColor, BorderThickness, NodeDiameter, WindowIndex);
xtitle("Highlighted Nodes", "X-Nodes", "Y-Nodes");

EdgeColor = 30;
EdgeWidth = 5;
WindowIndex = 4;
EdgesToHighlight = [1 5 10 15 20 25];

NL_G_HighlightEdges(TopologyGraph, EdgesToHighlight, ...
    EdgeColor, EdgeWidth, WindowIndex);
xtitle("Highlighted Edges", "X-Nodes", "Y-Nodes");

// (d) DEGREE OF EACH NODE & MAX DEGREE NODE
disp("Node Degree Information");

MaxEdges = 0;
MaxNode = 1;

for i = 1:NumberOfNodes
    EdgesOfNode = NL_G_EdgesOfNode(TopologyGraph, i);
    Degree = length(EdgesOfNode);
    disp("Node " + string(i) + " has " + string(Degree) + " edges");

    if Degree > MaxEdges then
        MaxEdges = Degree;
        MaxNode = i;
    end
end

disp("Node with maximum edges: Node " + string(MaxNode));
disp("Maximum number of edges: " + string(MaxEdges));

// (e) TOTAL NODES AND EDGES
[TotalNodes, TotalEdges] = NL_G_GraphSize(TopologyGraph);

disp("Total Number of Nodes: ");
disp(TotalNodes);

disp("Total Number of Edges: ");
disp(TotalEdges);
