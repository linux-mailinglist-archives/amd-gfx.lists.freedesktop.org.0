Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C7899EE
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 11:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855556E390;
	Mon, 12 Aug 2019 09:38:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A05C6E390
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 09:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgevmG6rClw3k3TgJ4F4HS7fD6AKOxLx9qopSIVsJpjhPjJww143a80TTVdxmJbRaWEipF8q32QCuyLrL5dm806Jsw42j2gJMaN6Ndekgxb0QVaICZfVjna36RjK1opBYXMlboPvRH3yETyvz4SMc+8kc0YCWB9Rg8YQnevlrlpfFqRJivwuY0GMNJKwARlv9bmd0G7+TGg+CKBuQ+cer8lztXbLQ5xA97INhnnrZTBvbSbJdAOsXe+xFOVkCcVz5R9VEBN9IuDQkDbiGgW2/E5ahkNDy28/S7dsxk8BQocIZchklY+/kNyeZgWnqjuErUFVj/7jxlYA5nM45pyKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wMrTgUdba9M3b7pGw0+CGFS92Lkkn69fWuw3FDtaG0=;
 b=Hi1WO1hBx5flLnKXu3NfO8mo8oqbFED9aF/4qf9FHJ4L+t3hhOh4a3Vn0mZP8S3zMr9IuSV2sD+T8d44yi3CTr9GZa5cGCdEGz9QODI/UngBYUUfz/QgGmfbMgE2C/R1QJ2Jplwrw4BVjVOoamwZhlXVGc5Ne6u9l7yoXqx8/UuE3PI7k9696rSDgZn3q83MguMkJrG1vTQQyJnjshV6mgjM/z9diRxlbqpF6qp3kaCuwMhir472YcvQLOf8WRSOLEa4AxHWsBxwMagkjPdXvohUHV25nOx4m6NmBbQr4MEAcvFQM9frE9D7kk3rE+kU9WYdSHOgbD1towQeLSyzCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3117.namprd12.prod.outlook.com (20.178.244.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Mon, 12 Aug 2019 09:38:56 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.011; Mon, 12 Aug 2019
 09:38:56 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Gui, Jack" <Jack.Gui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Index: AQHVUOceU1u8nxUzI0ChW76FYWBLIab3QSgQ
Date: Mon, 12 Aug 2019 09:38:56 +0000
Message-ID: <MN2PR12MB33441DEDEEB00F8F321F72BBE4D30@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
 <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>
In-Reply-To: <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce907e65-79e5-44f5-a0b5-08d71f08e565
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3117; 
x-ms-traffictypediagnostic: MN2PR12MB3117:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3117B2D8D3C0C6BC75F21BA5E4D30@MN2PR12MB3117.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(13464003)(199004)(189003)(76176011)(99286004)(8676002)(76116006)(8936002)(6116002)(66446008)(64756008)(66476007)(2501003)(53546011)(66556008)(6246003)(3846002)(102836004)(66946007)(6506007)(33656002)(52536014)(478600001)(7736002)(6436002)(4326008)(66066001)(25786009)(966005)(9686003)(14454004)(86362001)(81156014)(186003)(6306002)(2906002)(476003)(5660300002)(14444005)(81166006)(11346002)(316002)(256004)(55016002)(110136005)(446003)(71190400001)(71200400001)(486006)(305945005)(53936002)(7696005)(26005)(229853002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3117;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P3KAuo3zfhIQvklEiBgDYW8SnmRI7VQODES0gElDgFtT+84dAjjIpyJsZT/AnB/t/LykrT5carGBqKHXNeA8shKyObIqZqfWpXbdhYbXGJz2N0pKltAr6obccxdnPDusYek2JtMTXkenoSK+nOM2Sk3Xpypu4v+E6oQBx17Wh4sbddsPTKz2Kv0Lp/LpjDZvS6PTeVj9Aty0Z28s/faw/cjc1n0X+NZBmlpymBHFzN0vsitN7pganvjaYcgHd30QU6qhdgs/0zLXa78iOcURcGuPTcBei07lZNVFtqZOQNTHbOjuBv5FJ8rPnPciocal6II/cz7sfpsZX3tCNeBbTms260/M9Bc4thPcOthUHuyV5NsL5NQ81qfV9uFEHRjtZbK7jw1DB2EoyujARCGAvBzkniMbshWmPk0Nm3ZsZT4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce907e65-79e5-44f5-a0b5-08d71f08e565
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 09:38:56.4067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ox9CEP1EN1EXceSC5wHr8WUU9ZQW8s0Mseb9MuAB47L9twbad3Vk+0eITewF9Oz8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wMrTgUdba9M3b7pGw0+CGFS92Lkkn69fWuw3FDtaG0=;
 b=pxtsiI+Y/tgK9s4eMyzJJb21OsBzabTlOSJJEbjjc9cwDZE8qfBejbMj7ahQBsGGgbJFPbqRAwQT407NA9EO8bth3nS21ZF+db3BiyfCK6fiofjFD8WYmtmpzrN9/dR2GPn8pxTd56KkkTN8DOmbSnNtmTq2CvQrWGoKEM6qO9Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIHNldCBGRUFUVVJFX0RQTV9QUkVGRVRDSEVSX01BU0sgfCBGRUFUVVJFX0RQTV9HRlhD
TEtfTUFTSyBvbmx5LiBGb3Igbm93LCBvbmx5IHRoZXNlIHR3byBhcmUgZW5hYmxlZCBvbiBhcmN0
dXJ1cy4NCg0KV2l0aCB0aGF0IGZpeGVkLCB0aGUgcGF0Y2ggaXMgcmV2aWV3ZWQtYnk6IEV2YW4g
UXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9u
IEJlaGFsZiBPZg0KPiBDaGVuZ21pbmcgR3VpDQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAy
MDE5IDQ6MjIgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBH
dWksIEphY2sgPEphY2suR3VpQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS9h
bWQvcG93ZXJwbGF5OiBhZGQgYXJjdHVydXNfaXNfZHBtX3J1bm5pbmcNCj4gZnVuY3Rpb24gZm9y
IGFyY3R1cnVzDQo+IA0KPiBhZGQgYXJjdHVydXNfaXNfZHBtX3J1bm5pbmcgZnVuY3Rpb24NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IENoZW5nbWluZyBHdWkgPEphY2suR3VpQGFtZC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgfCAyMQ0K
PiArKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJj
dHVydXNfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19w
cHQuYw0KPiBpbmRleCAwM2NlODcxLi45MTA3YmViIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiBAQCAtNTEsNiArNTEsMTUgQEANCj4g
ICNkZWZpbmUgU01VX0ZFQVRVUkVTX0hJR0hfTUFTSyAgICAgICAweEZGRkZGRkZGMDAwMDAwMDAN
Cj4gICNkZWZpbmUgU01VX0ZFQVRVUkVTX0hJR0hfU0hJRlQgICAgICAzMg0KPiANCj4gKyNkZWZp
bmUgU01DX0RQTV9GRUFUVVJFICggXA0KPiArCUZFQVRVUkVfRFBNX1BSRUZFVENIRVJfTUFTSyB8
IFwNCj4gKwlGRUFUVVJFX0RQTV9HRlhDTEtfTUFTSyB8IFwNCj4gKwlGRUFUVVJFX0RQTV9VQ0xL
X01BU0sgfCBcDQo+ICsJRkVBVFVSRV9EUE1fU09DQ0xLX01BU0sgfCBcDQo+ICsJRkVBVFVSRV9E
UE1fTVAwQ0xLX01BU0sgfCBcDQo+ICsJRkVBVFVSRV9EUE1fRkNMS19NQVNLIHwgXA0KPiArCUZF
QVRVUkVfRFBNX1hHTUlfTUFTSykNCj4gKw0KPiAgLyogcG9zc2libGUgZnJlcXVlbmN5IGRyaWZ0
ICgxTWh6KSAqLw0KPiAgI2RlZmluZSBFUFNJTE9OCQkJCTENCj4gDQo+IEBAIC0xODczLDYgKzE4
ODIsMTcgQEAgc3RhdGljIHZvaWQgYXJjdHVydXNfZHVtcF9wcHRhYmxlKHN0cnVjdA0KPiBzbXVf
Y29udGV4dCAqc211KQ0KPiANCj4gIH0NCj4gDQo+ICtzdGF0aWMgYm9vbCBhcmN0dXJ1c19pc19k
cG1fcnVubmluZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkgew0KPiArCWludCByZXQgPSAwOw0K
PiArCXVpbnQzMl90IGZlYXR1cmVfbWFza1syXTsNCj4gKwl1bnNpZ25lZCBsb25nIGZlYXR1cmVf
ZW5hYmxlZDsNCj4gKwlyZXQgPSBzbXVfZmVhdHVyZV9nZXRfZW5hYmxlZF9tYXNrKHNtdSwgZmVh
dHVyZV9tYXNrLCAyKTsNCj4gKwlmZWF0dXJlX2VuYWJsZWQgPSAodW5zaWduZWQgbG9uZykoKHVp
bnQ2NF90KWZlYXR1cmVfbWFza1swXSB8DQo+ICsJCQkgICAoKHVpbnQ2NF90KWZlYXR1cmVfbWFz
a1sxXSA8PCAzMikpOw0KPiArCXJldHVybiAhIShmZWF0dXJlX2VuYWJsZWQgJiBTTUNfRFBNX0ZF
QVRVUkUpOyB9DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBhcmN0
dXJ1c19wcHRfZnVuY3MgPSB7DQo+ICAJLyogdHJhbnNsYXRlIHNtdSBpbmRleCBpbnRvIGFyY3R1
cnVzIHNwZWNpZmljIGluZGV4ICovDQo+ICAJLmdldF9zbXVfbXNnX2luZGV4ID0gYXJjdHVydXNf
Z2V0X3NtdV9tc2dfaW5kZXgsIEBAIC0xOTEwLDYNCj4gKzE5MzAsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHBwdGFibGVfZnVuY3MgYXJjdHVydXNfcHB0X2Z1bmNzID0gew0KPiAgCS8qIGRlYnVn
IChpbnRlcm5hbCB1c2VkKSAqLw0KPiAgCS5kdW1wX3BwdGFibGUgPSBhcmN0dXJ1c19kdW1wX3Bw
dGFibGUsDQo+ICAJLmdldF9wb3dlcl9saW1pdCA9IGFyY3R1cnVzX2dldF9wb3dlcl9saW1pdCwN
Cj4gKwkuaXNfZHBtX3J1bm5pbmcgPSBhcmN0dXJ1c19pc19kcG1fcnVubmluZywNCj4gIH07DQo+
IA0KPiAgdm9pZCBhcmN0dXJ1c19zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211
KQ0KPiAtLQ0KPiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
