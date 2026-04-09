

//Experiment No.2
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//This Source file is Written by Dr. T. Subbulaskhmi, Professor, 
//School of Computing Science and Engineering, VIT University Chennai 
//using the NARVAL examples of Scilab for Network Topology Creation  
//The Operating System used for writing the code found in this file is Windows 8
//SCILAB version 5.5.2 and NARVAL toolbox version 3.1
//Program to 1. create and Display Ring Topology 2. Colour the nodes 3. Display the node number and edge number 4. Display the number of nodes and edges 5. insert new nodes in the specified edge 6. insert new edges 7. Display the number of nodes and edges again after adding the nodes and edges. 

clear;
clc;

//1. create and Display Ring Topology 
NameOfNetwork='Ring Topology';// Name of your network
NumberOfNodes=8;//Number of Nodes in the network
ConnectionEndingNode=[1 2 3 4 5 6 7 8]; //Ending Nodes of the connection lines
ConnectionStartingNode=[2 3 4 5 6 7 8 1];//Starting Nodes of the connection lines
XCoordinatedOfNodes=[100 100 200 300 500 600 600 400]; // X-Coordinates of the nodes
YCoordinatedOfNodes=[400 600 700 700 700 600 400 300]; // Y-Coordinates of the nodes
[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,ConnectionEndingNode,ConnectionEndingNode,XCoordinatedOfNodes,YCoordinatedOfNodes)//Creates the Ring topoplogy

WindowIndex=1;//Graph Window Number

[VisualizeGraph1] = NL_G_ShowGraph(TopologyGraph,WindowIndex);// Visualize the Graph

//2. Colour the nodes 
NodeColor=30; // Node Colour 2:[Blue],3:[Green], 5:[Red]
BorderThickness=10; // Node Border thickness
NodeDiameter=25; //Node diameter 
WindowIndex=2;//window index
ListOfNodes=[1 3 5 7];//list of nodes
[NodeHighlight,VisualizeGraph1]=NL_G_HighlightNodes(TopologyGraph,ListOfNodes,NodeColor,BorderThickness,NodeDiameter,WindowIndex);// Highlight the specified nodes

WindoeIndex=3; //Graph Window Number
[VisualizeGraph2] = NL_G_ShowGraphNE(TopologyGraph,WindoeIndex);// Visualize the Graph along with indices for Nodes and Edges

// 4. Display the number of nodes and edges 
[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 

//5. insert new nodes in the specified edge
EdgeIndex=8;//edge index
NewNodeQuantity=3;//quantity of new nodes
[go]=NL_G_SplitEdge(TopologyGraph,EdgeIndex,NewNodeQuantity);//application of NL_G_SplitEdge
WindowIndex=3;//window index
VisualizeGraph1=NL_G_ShowGraphNE(go,WindowIndex)

//6. insert new edges 
NewEdgeHeadVector=[9 7 8 1];//head vector of new edges
NewEdgeTailVector=[5 3 3 6];//tail vector of new edges
NewEdgeNameVector=['e5' 'e6' 'e7' 'e8'];//name vector of new edges
[TopologyGraph]  = NL_G_AddEdges(go,NewEdgeHeadVector,NewEdgeTailVector,NewEdgeNameVector);
WindowIndex=4;
VisualizeGraph1=NL_G_ShowGraphNE(TopologyGraph,WindowIndex);

// 7. Display the number of nodes and edges again after adding the nodes and edges. 
[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 
