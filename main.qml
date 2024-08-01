import QtQuick 2.15
import QtQuick.Controls 2.15
import QtWebEngine 1.15
import QtWebChannel 1.15
import QtQuick.Window 2.14

Window {
    visible: true
    width: 800
    height: 600
    title: "Qt5 WebChannel JavaScript/C++ Map Demo"

    WebEngineView {
        id: webView
        anchors.fill: parent
        url: "qrc:///map.html"

        // FIXME: Temporary removal for build debugging
        // onLoadingChanged: {
        //     if (loadRequest.status === WebEngineLoadRequest.LoadSucceededStatus) {
        //         console.log("QML WebEngine loaded successfully.")
        //     } else {
        //         console.log("QML WebEngine failed to load.")
        //     }
        // }

        // Set up the WebChannel and register objects
        WebChannel {
            id: channel
            registeredObjects: [entityManagerObject]
        }

        webChannel: channel
    }

    /* Developer Note:
       This is annoying, it seems like you shouldn't have to write these wrapper functions to expose internal C++
       functions to JS, since the exposure of the C++ class to the QML application should do that anyway.
       Maybe I'm an idiot, maybe it's a syntax error, not sure.

       Current thinking is to have the entityManager handle being in here with defined interface functions, and
       only interact with entities by way of the manager.
       E.g. JS calls entityManager.em_GetEntityByUUID("UID001").<Some entity internal C++ function>
    */
    // Expose EntityManager to the JavaScript
    QtObject {
        id: entityManagerObject
        WebChannel.id: "entityManager"

        function createEntity(name, UID, radius, latitude, longitude) {
            if (entityManager) {
                var entity = entityManager.createEntity(name, UID, radius, latitude, longitude);
                return entity;
            }
            return null;
        }

        function getEntityByUID(UID) {
            if (entityManager) {
                return entityManager.getEntityByUID(UID);
            }
            return null;
        }

        function updateEntityId(newId) {
            if (entityManager) {
                entityManager.updateEntityId(newId);
            }
        }

        function listAllEntities() {
            if (entityManager) {
                return entityManager.listAllEntities();
            }
            return [];
        }

        function logMessage(message) {
            if (entityManager) {
                entityManager.logMessage(message);
            }
        }
    }

    // QtObject {
    //     id: entityQt
    //     WebChannel.id: "entityQt"

    //     // Interface Functions - To be called from JS
    //     function e_TransportMessage(message) { entity.logMessage("Forwarded from HTML to Entity: " + message) }
    //     function e_radius() { console.log("Entity returned a radius of: " + entity.radius) }
    // }
}
