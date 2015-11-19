import QtQuick 2.5
import QtQuick.Controls 1.4 as QC
import QtQuick.Controls.Styles 1.4 as QCS
import Material 0.1
import Material.ListItems 0.1 as ListItem
import Qt.labs.settings 1.0
import Qt.labs.folderlistmodel 2.1
import QtGraphicalEffects 1.0


ApplicationWindow {
    visible: true
    id: root
    color: "black"
    visibility: Qt.WindowFullScreen
    flags: Qt.FramelessWindowHint
    property var settings: Settings {
       property alias x: root.x
       property alias y: root.y
   }

   theme {
       primaryColor: "grey"
       accentColor: "pink"
   }

    Image {
        id: name
        source: Qt.resolvedUrl("./wallpaper.jpg")
        anchors.fill: parent
    }

    RectangularGlow {
        id: effect
        anchors.fill: topBar
        glowRadius: 5
        spread: 0.2
        color: "#C8363534"
        cornerRadius: glowRadius

        }

    Rectangle {
        id: topBar
        z:40
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: 40
        Keys.onEscapePressed: goNormal()
        property bool isExpanded: state == "Expanded"
        color: "transparent"

        /*MouseArea {
            anchors.fill: parent
            hoverEnabled: true
           // onExited: topBar.goNormal()
        }*/

        Behavior on height {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutCubic
            }
        }
        state: "Normal"
        states: [
            State {
                name: "Normal"
                PropertyChanges {
                    target: topBar
                    height: 40
                }
                PropertyChanges {
                    target: sysicons
                    spacing: 15
                }
                PropertyChanges {
                    target: appsIcon
                    width: 20
                }
                PropertyChanges {
                    target: seachBar
                    opacity: 0
                }
                PropertyChanges {
                    target: expView
                    opacity: 0
                }
            },
            State {
                name: "Expanded"
                PropertyChanges {
                    target: topBar
                    height: 400
                }
                PropertyChanges {
                    target: sysicons
                    spacing: 30
                }
                PropertyChanges {
                    target: appsIcon
                    width: 40
                }
                PropertyChanges {
                    target: seachBar
                    opacity: 1
                }
                PropertyChanges {
                    target: expView
                    opacity: 1
                }
            }

        ]
        Column {
            anchors{
                left: parent.left
                right :parent.right
                top: parent.top
            }
            spacing: 40
            Item {
                width: parent.width
                height: 40
                z:25

                Row {
                    id: lefticons
                    spacing: 15
                    anchors{
                        leftMargin: spacing
                        left: parent.left
                        top: parent.top
                        topMargin: 10
                    }

                    Image {
                        id: appsIcon
                        source: "qrc:/apps.png"
                        width: 20
                        height: width
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: topBar.goExpanded()
                        }
                        Behavior on width {
                            NumberAnimation {
                                duration: 300
                                easing.type: Easing.InOutCubic
                            }
                        }
                    }

                    QC.TextField {
                        id: seachBar
                        placeholderText: "Just Genee it..."
                        textColor: "white"
                        font.weight: "Light"
                        visible: topBar.isExpanded
                        opacity: 0
                        Behavior on opacity {
                            NumberAnimation {
                                duration: 300
                                easing.type: Easing.InOutCubic
                            }
                        }
                        font.pixelSize: 30
                        style: QCS.TextFieldStyle {
                                textColor: "white"
                                placeholderTextColor: "lightGray"
                                background: Rectangle {
                                    border.color: "transparent"
                                    color: "transparent"
                                }
                            }
                    }


                }

                Row {
                    id: sysicons
                    spacing: 15
                    anchors{
                        rightMargin: 15
                        right: parent.right
                        top: parent.top
                        topMargin: 10
                    }

                    Behavior on spacing {
                        NumberAnimation {
                            duration: 300
                            easing.type: Easing.InOutCubic
                        }
                    }

                    Row {
                        id: volume
                        spacing: 10
                        Image {
                            source: "qrc:/volume.png"
                            mipmap: true
                            width: 20
                            height: width

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    appletIndicator.x = topBar.width - volume.width - sysicons.spacing*5 - sysicons.anchors.rightMargin - battery.width - network.width - notifications.width - account.width - calendar.width - 5
                                    appletIndicator.width = volume.width + 10
                                    flick.contentX = 0*flick.width
                                }
                            }
                        }

                        Text {
                            text: "85"
                            color: "white"
                            font.pixelSize: 15
                            anchors{
                                top: parent.top
                                topMargin: 2
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    appletIndicator.x = topBar.width - volume.width - sysicons.spacing*5 - sysicons.anchors.rightMargin - battery.width - network.width - notifications.width - account.width - calendar.width - 5
                                    appletIndicator.width = volume.width + 10
                                    flick.contentX = 0*flick.width
                                }
                            }

                            visible: topBar.isExpanded
                        }
                    }

                    Row {
                        id: battery
                        spacing: 10
                        Image {
                            source: "qrc:/battery.png"
                            mipmap: true
                            width: 20
                            height: width

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    appletIndicator.x = topBar.width - sysicons.spacing*4 - sysicons.anchors.rightMargin - battery.width - network.width - notifications.width - account.width - calendar.width - 5
                                    appletIndicator.width = battery.width + 10
                                    flick.contentX = 1*flick.width
                                }
                            }
                        }

                        Text {
                            text: "90%"
                            color: "white"
                            font.pixelSize: 15
                            visible: topBar.isExpanded
                            anchors{
                                top: parent.top
                                topMargin: 2
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    appletIndicator.x = topBar.width - volume.width - sysicons.spacing*5 - sysicons.anchors.rightMargin - battery.width - network.width - notifications.width - account.width - calendar.width - 5
                                    appletIndicator.width = volume.width + 10
                                    flick.contentX = 0*flick.width
                                }
                            }
                        }
                    }

                    Row {
                        id: network
                        spacing: 10
                        Image {
                            source: "qrc:/network.png"
                            mipmap: true
                            width: 20
                            height: width

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    appletIndicator.x = topBar.width - sysicons.spacing*3 - sysicons.anchors.rightMargin - network.width - notifications.width - account.width - calendar.width - 5
                                    appletIndicator.width = network.width + 10
                                    flick.contentX = 2*flick.width
                                }
                            }
                        }

                        Text {
                            text: "Livebox-9TR4"
                            color: "white"
                            font.pixelSize: 15
                            visible: topBar.isExpanded
                            anchors{
                                top: parent.top
                                topMargin: 2
                            }
                        }
                    }

                    Row {
                        id: notifications
                        spacing: 10
                        Image {
                            source: "qrc:/notifications.png"
                            mipmap: true
                            width: 20
                            height: width

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    appletIndicator.x = topBar.width - sysicons.spacing*2 - sysicons.anchors.rightMargin - notifications.width - account.width - calendar.width - 5
                                    appletIndicator.width = notifications.width + 10
                                    flick.contentX = 3*flick.width
                                }
                            }
                        }

                        Text {
                            text: "3"
                            color: "white"
                            font.pixelSize: 15
                            anchors{
                                top: parent.top
                                topMargin: 2
                            }

                            visible: topBar.isExpanded
                        }
                    }

                    Row {
                        id: account
                        spacing: 10
                        Image {
                            source: "qrc:/account.png"
                            mipmap: true
                            width: 20
                            height: width

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    appletIndicator.x = topBar.width - sysicons.spacing - sysicons.anchors.rightMargin - account.width - calendar.width - 5
                                    appletIndicator.width = account.width + 10
                                    flick.contentX = 4*flick.width
                                }
                            }
                        }

                        Text {
                            text: "Pierre Jacquier"
                            color: "white"
                            font.pixelSize: 15
                            visible: topBar.isExpanded
                            anchors{
                                top: parent.top
                                topMargin: 2
                            }
                        }
                    }

                    Text {
                        id: calendar
                        text: "20:40"
                        color: "white"
                        font.pixelSize: 15
                        anchors{
                            top: parent.top
                            topMargin: 2
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                appletIndicator.x = topBar.width - sysicons.anchors.rightMargin - calendar.width - 5
                                appletIndicator.width = calendar.width + 10
                                flick.contentX = 5*flick.width
                            }
                        }
                    }

                }

                Rectangle {
                    id: appletIndicator
                    width: calendar.width
                    color: "white"
                    height: 2
                    y: 35
                    visible: topBar.isExpanded
                    x: topBar.width - 15 - calendar.width
                    Behavior on width {
                        NumberAnimation {
                            duration: 400
                            easing.type: Easing.InOutCubic
                        }
                    }

                    Behavior on x {
                        NumberAnimation {
                            duration: 400
                            easing.type: Easing.InOutCubic
                        }
                    }
                }
            }

            Item {
                id: expView
                visible: topBar.isExpanded
                width: parent.width
                height: topBar.height - 40 - lefticons.height

                Behavior on opacity {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.InOutCubic
                    }
                }
                Row {
                    width: parent.width
                    height: parent.height
                    Row {
                        width: parent.width / 2.5
                        height: parent.height

                        Column {
                            spacing: 50
                            width: 70
                            y: (75-45)/2
                            height: parent.height
                            Repeater {
                                model: ['a','b','c','d']
                                delegate: Text {
                                    color : "white"
                                    width: 70
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignHCenter
                                    text: modelData.toUpperCase()
                                }
                            }
                        }

                        GridView {
                            width: parent.width - 30
                            clip: true
                            cellHeight: 85
                            cellWidth: cellHeight
                            height: parent.height
                            boundsBehavior: Flickable.StopAtBounds
                            model: FolderListModel {
                                id: folderModel
                                folder: "file:/home/pierremtb/kyklo/"
                                nameFilters: ["*.png"]
                            }
                            delegate: Image {
                                width: 65
                                height: width
                                mipmap: true
                                source: fileURL
                            }
                        }

                    }
                    Flickable {
                        id: flick
                        boundsBehavior: Flickable.StopAtBounds
                        clip: true
                        anchors.right: parent.right
                        anchors.margins: 15
                        //interactive: false
                        height: parent.height - 15
                        width: parent.width/2
                        contentHeight: height
                        contentWidth: width*6
                        Behavior on contentX {
                            NumberAnimation {
                                duration: 400
                                easing.type: Easing.InOutCubic
                            }
                        }

                        Row {
                            Rectangle {
                                color: "transparent"
                                height: flick.height
                                width: flick.width
                                Text {
                                    text: "Sound"
                                    color: "white"
                                    font.weight: "Light"
                                    font.pixelSize: 40
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                color: "transparent"
                                height: flick.height
                                width: flick.width
                                Text {
                                    text: "Battery"
                                    color: "white"
                                    font.weight: "Light"
                                    font.pixelSize: 40
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                color: "transparent"
                                height: flick.height
                                width: flick.width
                                Text {
                                    text: "Network"
                                    color: "white"
                                    font.weight: "Light"
                                    font.pixelSize: 40
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                color: "transparent"
                                height: flick.height
                                width: flick.width
                                ListView {
                                    height: 300
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    spacing: 5
                                    width: 450
                                    model: ListModel {
                                        ListElement {
                                            notTitle: "New message"
                                            date: "01:39"
                                            sub: "From Elon Musk"
                                        }
                                        ListElement {
                                            notTitle: "Meeting in 3h"
                                            date: "01:11"
                                            sub: "Room P123"
                                        }
                                        ListElement {
                                            notTitle: "Genee"
                                            date: "00:23"
                                            sub: "Will beat them all!"
                                        }
                                    }
                                    delegate: Notification {
                                        title: notTitle
                                        time : date
                                        subtitle: sub
                                    }
                                }
                            }

                            Rectangle {
                                height: flick.height
                                color: "transparent"
                                width: flick.width
                                Text {
                                    text: "Account"
                                    color: "white"
                                    font.weight: "Light"
                                    font.pixelSize: 40
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle {
                                color: "transparent"
                                height: flick.height
                                width: flick.width
                                Text {
                                    text: "Calendar"
                                    color: "white"
                                    font.weight: "Light"
                                    font.pixelSize: 40
                                    anchors.centerIn: parent
                                }
                            }
                        }
                    }
                }
            }
        }

        function goExpanded() {
            state = "Expanded"
        }

        function goNormal() {
            state = "Normal"
        }



    }

    Rectangle {
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 80
        color: "#50757575"
        ListView {
            width: (model.count) * (60 + spacing-1)
            anchors.centerIn: parent
            y: spacing /2
            orientation: Qt.Horizontal
            height: 60
            spacing: 15
            clip: false
            model: ListModel {
                ListElement {
                    url: "file:/home/pierremtb/kyklo/inbox.png"
                    opened: false
                }
                ListElement {
                    url: "file:/home/pierremtb/kyklo/google-plus.png"
                    opened: false
                }
                ListElement {
                    url: "file:/home/pierremtb/kyklo/google-hangouts.png"
                    opened: false
                }
                ListElement {
                    url: "file:/home/pierremtb/kyklo/google-calendar.png"
                    opened: false
                }
                ListElement {
                    url: "file:/home/pierremtb/kyklo/clock.png"
                    opened: false
                }
                ListElement {
                    url: "file:/home/pierremtb/kyklo/calculator.png"
                    opened: true
                }
                ListElement {
                    url: "file:/home/pierremtb/kyklo/settings-alt.png"
                    opened: false
                }
            }
            delegate: Column {
                spacing: 8
                Image {
                    source: url
                    width: 60
                    height: width
                    mipmap: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(calculator.visible)
                                hideCalculator()
                            else
                                showCalculator()
                        }
                    }
                }
                Rectangle {
                    width: 60
                    visible: opened && calculator.visible
                    height: 2
                    color: "white"
                }
           }
        }
    }

    function hideCalculator() {
        calculator.visible = false
        topBar.goExpanded()
    }

    function showCalculator() {
        calculator.visible = true
        topBar.goNormal()
    }

    CalculatorApp { id: calculator; visible: false }



}

