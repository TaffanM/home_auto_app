import 'dart:convert';

class DeviceModel {
    int id;
    String deviceNama;
    String deviceLabel;
    String deviceAsset;
    int deviceStatus;
    DateTime? createdAt;
    DateTime updatedAt;

    DeviceModel({
        required this.id,
        required this.deviceNama,
        required this.deviceLabel,
        required this.deviceAsset,
        required this.deviceStatus,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DeviceModel.fromRawJson(String str) => DeviceModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
        id: json["id"],
        deviceNama: json["device_nama"],
        deviceLabel: json["device_label"],
        deviceAsset: json["device_asset"],
        deviceStatus: json["device_status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "device_nama": deviceNama,
        "device_label": deviceLabel,
        "device_asset": deviceAsset,
        "device_status": deviceStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
