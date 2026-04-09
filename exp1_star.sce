//Experiment No.3
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//This Source file is Written by Dr. T. Subbulaskhmi, Professor, 
//School of Computing Science and Engineering, VIT University Chennai 
//using the NARVAL examples of Scilab for Network Topology Creation  
//The Operating System used for writing the code found in this file is Windows 8
//SCILAB version 5.5.2 and NARVAL toolbox version 3.1//Program to 1. Create and Visualize the Star Topology // 2. Colour the nodes and visualize 3. Display the node number and edge number 4. Display the number of nodes and edges 

clear;
clc;

//1. Create and Visualize the Star Topology
NameOfNetwork='Star Topology';// Name of your network
NumberOfNodes=9;//Number of Nodes in the network
EndingNodesOfEdge=[1 1 1 1 1 1 1 1];//Ending Nodes of the connection lines
StartNodesOfEdge=[2 3 4 5 6 7 8 9];//Starting Nodes of the connection lines
XCoordinatesOfNodes=[500 500 500 200 200 200 800 800 800];// X-Coordinates of the nodes
YCoordinatesOfNodes=[500 200 800 800 200 500 200 500 800]; // Y-Coordinates of the nodes
[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,EndingNodesOfEdge,StartNodesOfEdge,XCoordinatesOfNodes,YCoordinatesOfNodes)//Creates the Star topoplogy
WindowNumber=1;//Graph Window Number
[GraphVisualize] = NL_G_ShowGraph(TopologyGraph,WindowNumber); // Visualize the Graph
xtitle("Star Topology","X-Nodes","Y-Nodes");
// 2.Colour the nodes and visualize 
NodeColor=30; // Node Colour 2:[Blue],3:[Green], 5:[Red]
BorderThickness=10; // Node Border thickness
NodeDiameter=25; //Node diameter 
WindowNumber=2;//window index

[OutputGraph]=NL_G_GraphEdgesLength(TopologyGraph);

disp(OutputGraph);

disp('Edge Length',OutputGraph.edge_length); 

ListOfNodes=[1 3 5 7];//list of nodes
[NodeHighlight,f2]=NL_G_HighlightNodes(TopologyGraph,ListOfNodes,NodeColor,BorderThickness,NodeDiameter,WindowNumber);// Highlight the specified nodes
xtitle("Node Higlight","X-Nodes","Y-Nodes");
WindowNumber=3; //Graph Window Number
[VisualizeNodesEdges] = NL_G_ShowGraphNE(TopologyGraph,WindowNumber);// Visualize the Graph along with indices for Nodes and Edges

[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 

//4. Display the number of nodes and edges 
[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp('Number of nodes:',ExtractNode); //display the number of nodes and edges 
disp('Number of edges:',ExtractEdge);
//5.Display the Edge Index between two nodes
StartingNode=4;//starting node
EndingNode=1;//ending node
xtitle("Edge Index","X-Nodes","Y-Nodes");
[EdgeIndex]=NL_G_Nodes2Edge(TopologyGraph,StartingNode,EndingNode);//Get the Edge Index
disp('Index of Edge across nodes 4 and 1:',EdgeIndex);



