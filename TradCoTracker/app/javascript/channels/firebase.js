var app_firebase = {};
(function(){

  var firebaseConfig = {
    apiKey: "AIzaSyDUOQ3HrMmc6-zqgIjhIyfDbJkvuokB-so",
    authDomain: "csce-431-project.firebaseapp.com",
    projectId: "csce-431-project",
    storageBucket: "csce-431-project.appspot.com",
    messagingSenderId: "443866308993",
    appId: "1:443866308993:web:c45df679bef1929aeec880",
    measurementId: "G-CPLNPCWHH1"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
  app_firebase = firebase;
})()
// These samples are intended for Web so this import would normally be
// done in HTML however using modules here is more convenient for
// ensuring sample correctness offline.
