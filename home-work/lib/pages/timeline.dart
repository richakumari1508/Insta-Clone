import 'package:flutter/material.dart';
import 'package:home_work/widgets/header.dart';
import 'package:home_work/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final usersRef = Firestore.instance.collection('users');
class Timeline extends StatefulWidget {

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users=[];
  @override
  void initState() {
    //getUsers(); 
    //getUsers();
    //createUser();
   // deleteUser();
   deleteUser();
    super.initState();
    
  }
  createUser() async{
    await usersRef.document("abcdef").setData({
      "username": "subodh",
      "postCount":0,
      "isAdmin": false
    });
  }
  updateUser() async{
    final doc=await usersRef.document("U7UfypwNCUENWnKKZduN").get();
    if(doc.exists){
      doc.reference.updateData({"username": "kamini","postCount": 0,"isAdmin": false});
    }
  }
  deleteUser() async{
    final DocumentSnapshot doc= await usersRef.document("U7UfypwNCUENWnKKZduN").get();
    if(doc.exists){
      doc.reference.delete();
    }
  }
  getUsers() async{
    final QuerySnapshot snapshot=await usersRef.getDocuments();
    setState(() {
      users=snapshot.documents;
    });
        //snapshot.documents.forEach((DocumentSnapshot doc){
          // print(doc.data);
           //print(doc.documentID);
           //print(doc.exists);
           //});
           }
 // getUserById() async{
   // final String id = "bUTBXXdK96k98nu68JdE";
    //final DocumentSnapshot doc = await usersRef.document(id).get();
      //print(doc.data);
      //print(doc.documentID);
      //print(doc.exists);
  //}
  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return circularProgress();
          }
          final List<Text> children=snapshot.data.documents.map((doc)=>Text(doc['username'])).toList();
          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      )
      );
  }
}