﻿var EditorWrapper = function (editorId) {
    var editorObj = null;
    var isTinymce = false;
    var isCKEditor = false;
    var _editorId = editorId;

    if (typeof (tinymce) !== 'undefined') {
        editorObj = tinymce.get(_editorId);
        if (editorObj) {
            isTinymce = true;
        }
    }
    if (!editorObj && typeof (CKEDITOR) !== 'undefined') {
        editorObj = CKEDITOR.instances[_editorId];
        if (editorObj) {
            isCKEditor = true;
        }
    }

    return {
        get id() {
            return _editorId;
        },
        get editorObj() {
            return editorObj;
        },
        get isTinymce() {
            return isTinymce;
        },
        get isCKEditor() {
            return isCKEditor;
        },
        get container() {
            if (isTinymce) {
                return editorObj.getContainer();
            } else {
                return editorObj.container.$;
            }
        },
        get document() {
            if (isTinymce) {
                return editorObj.getDoc();
            } else {
                return editorObj.document.$;
            }
        },
        getData: function () {
            if (isTinymce) {
                return editorObj.getContent();
            } else {
                return editorObj.getData();
            }
        },
        setData: function (value, callbackFunction, options) {
            if (isTinymce) {
                if (callbackFunction) {
                    editorObj.once('SetContent', callbackFunction);
                    editorObj.once('init', callbackFunction);
                }
                editorObj.setContent(value, options);
            } else {
                if (!options) {
                    options = {
                        noSnapshot: true
                    };
                }
                options.callback = callbackFunction;
                editorObj.setData(value, options);
            }
        },
        checkDirty: function () {
            if (isTinymce) {
                return editorObj.isDirty();
            } else {
                return editorObj.checkDirty();
            }
        },
        resetDirty: function () {
            if (isTinymce) {
                editorObj.setDirty(false);
            } else {
                editorObj.resetDirty();
            }
        },
        setReadOnly: function (disabled) {
            if (isTinymce) {
                const modeValue = disabled ? 'readonly' : 'design';
                editorObj.mode.set(modeValue);
            } else {
                editorObj.setReadOnly(disabled);
            }
        },
        focus: function () {
            if (isTinymce) {
                const body = editorObj.getBody();
                editorObj.fire('focus', body);
            } else {
                editorObj.focus();
            }
        },
        onInstanceReady: function (callbackFunction) {
            const eventName = isTinymce ? 'init' : 'instanceReady';
            if (isCKEditor && editorObj.status && editorObj.status == "ready") {
                //ckeditor already loaded and not going to fire ready event
                callbackFunction();
            } else {
                editorObj.on(eventName, callbackFunction);
            }
        }
    };
};