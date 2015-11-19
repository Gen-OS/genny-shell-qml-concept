import QtQuick 2.0


Row {
    property string title
    property string time
    property string subtitle
    spacing: 17
    Text {
        color: "white"
        y: 22
        text: time
    }

    Column {
        spacing: 5
        Rectangle {
            x: 4
            width: 3
            height: 8
        }
        Rectangle {
            x: 4
            width: 3
            height: 8
        }
        Rectangle {
            width: 10
            height: 10
            radius: 5
        }
        Rectangle {
            x: 4
            width: 3
            height: 8
        }
        Rectangle {
            x: 4
            width: 3
            height: 8
        }
        Rectangle {
            x: 4
            width: 3
            height: 8
        }
        Rectangle {
            x: 4
            width: 3
            height: 8
        }
        Rectangle {
            x: 4
            width: 3
            height: 8
        }

    }
    Rectangle {
        width: 350
        height: 80
        radius: 5
        y: 8
        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 8
            Text {
                text: title
                font.pointSize: 16
            }
            Text {
                text: subtitle
            }
        }
    }
}
