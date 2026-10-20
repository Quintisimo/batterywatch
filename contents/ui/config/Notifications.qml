import QtQuick 2.0
import QtQuick.Controls 2.5 as QQC2
import QtQuick.Layouts 1.1 as QQL

import org.kde.kirigami 2.4 as Kirigami
import org.kde.kcmutils as KCMUtils

KCMUtils.SimpleKCM {
    id: root

    property alias cfg_notificationEnabled: notificationEnabled.checked
    property alias cfg_notificationThreshold: notificationThreshold.value

    Kirigami.FormLayout {
        id: page
        readonly property int boxWidth: Kirigami.Units.gridUnit * 3

        QQL.RowLayout {
            Kirigami.FormData.label: i18n("Enable Notification")

            QQC2.CheckBox {
                id: notificationEnabled
            }
        }

        QQL.RowLayout {
            Kirigami.FormData.label: i18n("Threshold")

            QQC2.SpinBox {
                id: notificationThreshold
                enabled: notificationEnabled.checked
                from: 1
                to: 99
                value: 20
                QQL.Layout.preferredWidth: page.boxWidth
            }

            QQC2.Label {
                opacity: notificationEnabled.checked ? 0.8 : 0.5
                text: i18n("%")
            }

            QQC2.ToolButton {
                id: notificationThresholdHelp
                icon.name: "help-about"

                QQC2.ToolTip {
                    visible: notificationThresholdHelp.hovered
                    text: i18n("Shows system notification when battery falls below the set threshold.")
                }
            }
        }
    }
}
