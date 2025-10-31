import QtQuick 2.12
import QtQuick.Controls 2.5
ApplicationWindow {
    visible: true
    width: 480; height: 800
    title: "NamoOs Home"
    Rectangle { anchors.fill: parent; color: "#202020" }
    Text { text: "Welcome to NamoOs"; anchors.centerIn: parent; color: "white"; font.pixelSize: 24 }
}
