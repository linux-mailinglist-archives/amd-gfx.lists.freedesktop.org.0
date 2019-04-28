Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB73B5A6
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF208926A;
	Sun, 28 Apr 2019 07:44:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810052.outbound.protection.outlook.com [40.107.81.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905F989228
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:22 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:21 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:21 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/27] drm/amdgpu: Use heavy weight for tlb invalidation on
 xgmi configuration
Thread-Topic: [PATCH 26/27] drm/amdgpu: Use heavy weight for tlb invalidation
 on xgmi configuration
Thread-Index: AQHU/ZYxmzdAq0/keUe9T/idy3/xdA==
Date: Sun, 28 Apr 2019 07:44:21 +0000
Message-ID: <20190428074331.30107-27-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a5a47de-faed-4544-26b8-08d6cbad53ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB293349B581529BE416428EE792380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003)(16393002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /xYUHPmoLisx+FCqX1SuIs2xhAbO8EC0FfwYfrpHO36+VYPVOGcCDMahZCQ7N9J03nzMFyydMDZWccDmsoEqeFmwjgp4wr8NFXJjxb8mB2axtBSW/rpJKi1GsgBiNo1JWpaUBOJRwxIVmEgCAMmIp6YMT51rrJEw1eb86vCjgrNDazKAj1hUO4QrgJkaozDH/PXs0mV8E0zVOPd4Drc3V14VZZj2k1xqZ+DwPRpEzKFMBXQhVk4dj4HhFrPYSzfZJNpahdBj5lt5P4ZjJ7Zb7aefMYi4TReY9fEesdVa5EK9i78Rjnz7Luwv1G2FsoetTT50lPb3wEryd9kSlHknQJJTF2vFjeVGSfeAra9yehKVLlPc3Xca1uGyQGKfctgh7sheP3uHKs3pWgaLWtdGAWpB3Z7n3hN5dZ7wET5Oi+8=
Content-ID: <F0CB4F674506B348BAF5DC0EA59FAB6F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5a47de-faed-4544-26b8-08d6cbad53ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:21.5548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imCAJYPkD2F7YH6q1XzfzdH2vGnoZUr1GMwPrAyj+4g=;
 b=32MNArQKDcoSC22lynvgL5gdQEyDbsru91n8EYRH08jTSpdt7AxtfaXW7ESbQIx4vP8Ul3qAyGyg/lN9+0ZoBaDhX6umcRTGY66qWDwCgFh0+8KwLnbKcqTDsBiCVnrGVvN2APMC3fBcz3LX64Mhg2HPo9QESG6SiZkaL8AJX2c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogc2hhb3l1bmwgPFNoYW95dW4uTGl1QGFtZC5jb20+DQoNClRoZXJlIGlzIGEgYnVnIGZv
dW5kIGluIHZtbDIgeGdtaSBsb2dpYzoNCm10eXBlIGlzIGFsd2F5cyBzZW50IGFzIE5DIG9uIHRo
ZSBWTUMgdG8gVEMgaW50ZXJmYWNlIGZvciBhIHBhZ2Ugd2FsaywNCnJlZ2FyZGxlc3Mgb2Ygd2hl
dGhlciB0aGUgcmVxdWVzdCBpcyBiZWluZyBzZW50IHRvIGxvY2FsIG9yIHJlbW90ZSBHUFUuDQpO
QyBtZWFucyBub24tY29oZXJlbnQgYW5kIHdpbGwgY2F1c2UgdGhlIFZNQyByZXR1cm4gZGF0YSB0
byBiZSBjYWNoZWQNCmluIHRoZSBUQ0MgKHZlcnN1cyBVQyDigJMgdW5jYWNoZWQgd2lsbCBub3Qg
Y2FjaGUgdGhlIGRhdGEpLiBTaW5jZSB0aGUNCnBhZ2UgdGFibGUgdXBkYXRlcyBhcmUgYmVpbmcg
ZG9uZSBieSBTRE1BL0hEUCwgdGhlbiBUQ0Mgd2lsbCBuZXZlciBiZQ0KdXBkYXRlZCBhbmQgdGhl
IEdDIFZNTDIgd2lsbCBjb250aW51ZSB0byBoaXQgb24gdGhlIFRDQyBhbmQgbmV2ZXIgZ2V0DQp0
aGUgdXBkYXRlZCBwYWdlIHRhYmxlcyBhbmQgcmVzdWx0IGluIGEgZmF1bHQuDQpIZWF2ZSB3ZWln
aCB0bGIgaW52YWxpZGF0aW9uIGRvZXMgYSBXQi9JTlZBTCBvZiB0aGUgTDEvTDIgR0wgZGF0YQ0K
Y2FjaGVzIHNvIFRDQyB3aWxsIG5vdCBiZSBoaXQgb24gbmV4dCByZXF1ZXN0DQoNClNpZ25lZC1v
ZmYtYnk6IHNoYW95dW5sIDxTaGFveXVuLkxpdUBhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IEZlbGl4
IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KU2lnbmVkLW9mZi1ieTogRmVsaXgg
S3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiAuLi4vZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y5LmMgfCA1MyArKysrKysrKystLS0tLS0tLS0tDQog
MSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjku
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y5LmMNCmlu
ZGV4IGVmM2Q5M2I5OTViMi4uN2VjOTdlOTAzYTFiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuYw0KQEAgLTcyNiwyOSArNzI2LDgg
QEAgc3RhdGljIHVpbnQxNl90IGdldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5nX3Bhc2lkKHN0cnVj
dCBrZ2RfZGV2ICprZ2QsDQogCXJldHVybiByZWcgJiBBVENfVk1JRDBfUEFTSURfTUFQUElOR19f
UEFTSURfTUFTSzsNCiB9DQogDQotc3RhdGljIHZvaWQgd3JpdGVfdm1pZF9pbnZhbGlkYXRlX3Jl
cXVlc3Qoc3RydWN0IGtnZF9kZXYgKmtnZCwgdWludDhfdCB2bWlkKQ0KLXsNCi0Jc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKikga2dkOw0KLQ0KLQkv
KiBVc2UgbGVnYWN5IG1vZGUgdGxiIGludmFsaWRhdGlvbi4NCi0JICoNCi0JICogQ3VycmVudGx5
IG9uIFJhdmVuIHRoZSBjb2RlIGJlbG93IGlzIGJyb2tlbiBmb3IgYW55dGhpbmcgYnV0DQotCSAq
IGxlZ2FjeSBtb2RlIGR1ZSB0byBhIE1NSFVCIHBvd2VyIGdhdGluZyBwcm9ibGVtLiBBIHdvcmth
cm91bmQNCi0JICogaXMgZm9yIE1NSFVCIHRvIHdhaXQgdW50aWwgdGhlIGNvbmRpdGlvbiBQRVJf
Vk1JRF9JTlZBTElEQVRFX1JFUQ0KLQkgKiA9PSBQRVJfVk1JRF9JTlZBTElEQVRFX0FDSyBpbnN0
ZWFkIG9mIHNpbXBseSB3YWl0aW5nIGZvciB0aGUgYWNrDQotCSAqIGJpdC4NCi0JICoNCi0JICog
VE9ETyAxOiBhZ3JlZSBvbiB0aGUgcmlnaHQgc2V0IG9mIGludmFsaWRhdGlvbiByZWdpc3RlcnMg
Zm9yDQotCSAqIEtGRCB1c2UuIFVzZSB0aGUgbGFzdCBvbmUgZm9yIG5vdy4gSW52YWxpZGF0ZSBi
b3RoIEdDIGFuZA0KLQkgKiBNTUhVQi4NCi0JICoNCi0JICogVE9ETyAyOiBzdXBwb3J0IHJhbmdl
LWJhc2VkIGludmFsaWRhdGlvbiwgcmVxdWlyZXMga2ZnMmtnZA0KLQkgKiBpbnRlcmZhY2UgY2hh
bmdlDQotCSAqLw0KLQlhbWRncHVfZ21jX2ZsdXNoX2dwdV90bGIoYWRldiwgdm1pZCwgMCk7DQot
fQ0KLQ0KLXN0YXRpYyBpbnQgaW52YWxpZGF0ZV90bGJzX3dpdGhfa2lxKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB1aW50MTZfdCBwYXNpZCkNCitzdGF0aWMgaW50IGludmFsaWRhdGVfdGxi
c193aXRoX2tpcShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDE2X3QgcGFzaWQsDQor
CQkJdWludDMyX3QgZmx1c2hfdHlwZSkNCiB7DQogCXNpZ25lZCBsb25nIHI7DQogCXVpbnQzMl90
IHNlcTsNCkBAIC03NjEsNyArNzQwLDcgQEAgc3RhdGljIGludCBpbnZhbGlkYXRlX3RsYnNfd2l0
aF9raXEoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQxNl90IHBhc2lkKQ0KIAkJCVBB
Q0tFVDNfSU5WQUxJREFURV9UTEJTX0RTVF9TRUwoMSkgfA0KIAkJCVBBQ0tFVDNfSU5WQUxJREFU
RV9UTEJTX0FMTF9IVUIoMSkgfA0KIAkJCVBBQ0tFVDNfSU5WQUxJREFURV9UTEJTX1BBU0lEKHBh
c2lkKSB8DQotCQkJUEFDS0VUM19JTlZBTElEQVRFX1RMQlNfRkxVU0hfVFlQRSgwKSk7IC8qIGxl
Z2FjeSAqLw0KKwkJCVBBQ0tFVDNfSU5WQUxJREFURV9UTEJTX0ZMVVNIX1RZUEUoZmx1c2hfdHlw
ZSkpOw0KIAlhbWRncHVfZmVuY2VfZW1pdF9wb2xsaW5nKHJpbmcsICZzZXEpOw0KIAlhbWRncHVf
cmluZ19jb21taXQocmluZyk7DQogCXNwaW5fdW5sb2NrKCZhZGV2LT5nZngua2lxLnJpbmdfbG9j
ayk7DQpAQCAtNzgwLDEyICs3NTksMTYgQEAgc3RhdGljIGludCBpbnZhbGlkYXRlX3RsYnMoc3Ry
dWN0IGtnZF9kZXYgKmtnZCwgdWludDE2X3QgcGFzaWQpDQogCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopIGtnZDsNCiAJaW50IHZtaWQ7DQogCXN0
cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZhZGV2LT5nZngua2lxLnJpbmc7DQorCXVpbnQzMl90
IGZsdXNoX3R5cGUgPSAwOw0KIA0KIAlpZiAoYWRldi0+aW5fZ3B1X3Jlc2V0KQ0KIAkJcmV0dXJu
IC1FSU87DQorCWlmIChhZGV2LT5nbWMueGdtaS5udW1fcGh5c2ljYWxfbm9kZXMgJiYNCisJCWFk
ZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0EyMCkNCisJCWZsdXNoX3R5cGUgPSAyOw0KIA0KIAlp
ZiAocmluZy0+c2NoZWQucmVhZHkpDQotCQlyZXR1cm4gaW52YWxpZGF0ZV90bGJzX3dpdGhfa2lx
KGFkZXYsIHBhc2lkKTsNCisJCXJldHVybiBpbnZhbGlkYXRlX3RsYnNfd2l0aF9raXEoYWRldiwg
cGFzaWQsIGZsdXNoX3R5cGUpOw0KIA0KIAlmb3IgKHZtaWQgPSAwOyB2bWlkIDwgMTY7IHZtaWQr
Kykgew0KIAkJaWYgKCFhbWRncHVfYW1ka2ZkX2lzX2tmZF92bWlkKGFkZXYsIHZtaWQpKQ0KQEAg
LTc5Myw3ICs3NzYsOCBAQCBzdGF0aWMgaW50IGludmFsaWRhdGVfdGxicyhzdHJ1Y3Qga2dkX2Rl
diAqa2dkLCB1aW50MTZfdCBwYXNpZCkNCiAJCWlmIChnZXRfYXRjX3ZtaWRfcGFzaWRfbWFwcGlu
Z192YWxpZChrZ2QsIHZtaWQpKSB7DQogCQkJaWYgKGdldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5n
X3Bhc2lkKGtnZCwgdm1pZCkNCiAJCQkJPT0gcGFzaWQpIHsNCi0JCQkJd3JpdGVfdm1pZF9pbnZh
bGlkYXRlX3JlcXVlc3Qoa2dkLCB2bWlkKTsNCisJCQkJYW1kZ3B1X2dtY19mbHVzaF9ncHVfdGxi
KGFkZXYsIHZtaWQsDQorCQkJCQkJCSBmbHVzaF90eXBlKTsNCiAJCQkJYnJlYWs7DQogCQkJfQ0K
IAkJfQ0KQEAgLTgxMSw3ICs3OTUsMjIgQEAgc3RhdGljIGludCBpbnZhbGlkYXRlX3RsYnNfdm1p
ZChzdHJ1Y3Qga2dkX2RldiAqa2dkLCB1aW50MTZfdCB2bWlkKQ0KIAkJcmV0dXJuIDA7DQogCX0N
CiANCi0Jd3JpdGVfdm1pZF9pbnZhbGlkYXRlX3JlcXVlc3Qoa2dkLCB2bWlkKTsNCisJLyogVXNl
IGxlZ2FjeSBtb2RlIHRsYiBpbnZhbGlkYXRpb24uDQorCSAqDQorCSAqIEN1cnJlbnRseSBvbiBS
YXZlbiB0aGUgY29kZSBiZWxvdyBpcyBicm9rZW4gZm9yIGFueXRoaW5nIGJ1dA0KKwkgKiBsZWdh
Y3kgbW9kZSBkdWUgdG8gYSBNTUhVQiBwb3dlciBnYXRpbmcgcHJvYmxlbS4gQSB3b3JrYXJvdW5k
DQorCSAqIGlzIGZvciBNTUhVQiB0byB3YWl0IHVudGlsIHRoZSBjb25kaXRpb24gUEVSX1ZNSURf
SU5WQUxJREFURV9SRVENCisJICogPT0gUEVSX1ZNSURfSU5WQUxJREFURV9BQ0sgaW5zdGVhZCBv
ZiBzaW1wbHkgd2FpdGluZyBmb3IgdGhlIGFjaw0KKwkgKiBiaXQuDQorCSAqDQorCSAqIFRPRE8g
MTogYWdyZWUgb24gdGhlIHJpZ2h0IHNldCBvZiBpbnZhbGlkYXRpb24gcmVnaXN0ZXJzIGZvcg0K
KwkgKiBLRkQgdXNlLiBVc2UgdGhlIGxhc3Qgb25lIGZvciBub3cuIEludmFsaWRhdGUgYm90aCBH
QyBhbmQNCisJICogTU1IVUIuDQorCSAqDQorCSAqIFRPRE8gMjogc3VwcG9ydCByYW5nZS1iYXNl
ZCBpbnZhbGlkYXRpb24sIHJlcXVpcmVzIGtmZzJrZ2QNCisJICogaW50ZXJmYWNlIGNoYW5nZQ0K
KwkgKi8NCisJYW1kZ3B1X2dtY19mbHVzaF9ncHVfdGxiKGFkZXYsIHZtaWQsIDApOw0KIAlyZXR1
cm4gMDsNCiB9DQogDQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
