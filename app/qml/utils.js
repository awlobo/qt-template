.pragma library

function toRGB(color) {
    return "#"
        + (color.r * 255).toString(16)
        + (color.g * 255).toString(16)
        + (color.b * 255).toString(16)
}

function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}

function isDesktop() {
    return ["linux", "osx", "windows"].indexOf(Qt.platform.os) != -1;
}

function isPlatform(name) {
    return [name].indexOf(Qt.platform.os) != -1;
}
