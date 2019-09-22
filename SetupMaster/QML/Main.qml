import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: window
    width: 800
    height: 500
    visible: true
    title: "Setup Master"

    Material.theme: Material.Light
    Material.accent: '#4682B4'
    Material.primary: '#4682B4'
	flags: Qt.Window | Qt.FramelessWindowHint
	property int previousX
    property int previousY

    StackView {
        id: stackView
        anchors.fill: parent
		padding: 0

        initialItem: Pane {
            id: pane
			padding: 0

			Rectangle {
				width: parent.width
				height: 40
				color: "#4682B4"

				anchors.top: parent.top
				

				MouseArea {
					anchors.fill: parent

					onPressed: {
						previousX = mouseX
						previousY = mouseY
					}

					onMouseXChanged: {
						var dx = mouseX - previousX
						window.setX(window.x + dx)
					}

					onMouseYChanged: {
						var dy = mouseY - previousY
						window.setY(window.y + dy)
					}

				}
				Button {
					id: closeApplication
					padding: 0
					text: "X"
					anchors.right: parent.right
					anchors.top: parent.top
	
					contentItem: Text {
						text: closeApplication.text
						font: closeApplication.font
						color: "white"
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
					}
				
					background: Rectangle {
						implicitWidth: 40
						implicitHeight: 40
						color: closeApplication.down ? "#8B0000" : "transparent"
						border.width: 0
						radius: 0
					}
				}
			}
        }
    }
}