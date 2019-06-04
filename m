Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FA34E85
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 19:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955888910D;
	Tue,  4 Jun 2019 17:15:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700060.outbound.protection.outlook.com [40.107.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012F68910D
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 17:15:45 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1696.namprd12.prod.outlook.com (10.172.52.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 17:15:41 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 17:15:41 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v2)
Thread-Topic: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v2)
Thread-Index: AQHVGvkibtcSQ02iC0aN0XWY3egjtw==
Date: Tue, 4 Jun 2019 17:15:41 +0000
Message-ID: <20190604171532.17816-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0115.namprd02.prod.outlook.com
 (2603:10b6:208:35::20) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a216001d-340a-439d-3649-08d6e9104514
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1696; 
x-ms-traffictypediagnostic: MWHPR12MB1696:
x-microsoft-antispam-prvs: <MWHPR12MB1696210C39A6464B75FE7357F7150@MWHPR12MB1696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(376002)(396003)(346002)(189003)(199004)(478600001)(72206003)(66066001)(14454004)(6486002)(71200400001)(71190400001)(52116002)(5660300002)(6436002)(5640700003)(6512007)(2351001)(36756003)(53936002)(2501003)(486006)(4326008)(6916009)(2906002)(66556008)(25786009)(6506007)(386003)(86362001)(66476007)(73956011)(102836004)(476003)(66446008)(64756008)(2616005)(99286004)(186003)(6116002)(66946007)(26005)(316002)(3846002)(305945005)(50226002)(81166006)(81156014)(8936002)(8676002)(68736007)(256004)(14444005)(1076003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1696;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gQwNIaht6wwoTY+cYeLDeKGeS+ZFKUeJthKnkQr1q7GssA5dHUvdGsHIkeK/8dFCr6VB5LGjyiHoeN4r093UDtIQIBcDX79zGuZNei2rRLTb1uutLo7Vx9AMwTNyxzQgCtyvNcea2VhfK03ArgBIN/KkTTJMXV2/QXqtHqCjze2bnU+3XouEXuVZ/M/0xoRFS3MGp62AdmXke9isGrU7yFdKAvYYhVC5ewgqKPsjwYvHj0RFZs9N0AwTZ83N6wVJIj5lA2k9h+shaqUYtZQ+xNgWddthU5p7wYSFuqdw33wPLpeIYTyCinY0bXouqY9tV9rrreoqsrz4LdUej9oGNimZRTtr8YbfZikLnZKPtqc4Vgn/1viHCJYR6VD6ho/7/ErytFw937q0B7o9g1kYY8cBAfeFSDA2pClGwJYt0Xo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a216001d-340a-439d-3649-08d6e9104514
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 17:15:41.2869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN+umGl2uBG4BkNZz20HOKu3ZQ6AJWvneATSIJawrMM=;
 b=qgyijJpfK8hH2wLnK0NoTJAk8wUU4y6gjJ+JRogDlgqL8bcPvC9XJUes6GLL0mEUXm9CUwMBFN4Hh81rEFw9fRiOCdoAiEzQ+it0uZFFiPib6d93v86Mvz4NCmqNcOS3Ms718wBT+90/Jk9K5i5Gdy1W/YeUNHNFcL3g2AIEQUg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBvcHRpb24gaXMgbm8gbG9uZ2VyIG5lZWRlZC4gIFRoZSBkZWZhdWx0IGNvZGUgcGF0aHMN
CmFyZSBub3cgdGhlIG9ubHkgb3B0aW9uLg0KDQp2MjogQWRkIEhQQUdFIHN1cHBvcnQgYW5kIGEg
ZGVmYXVsdCBmb3Igbm9uIGNvbnRpZ3VvdXMgbWFwcw0KDQpTaWduZWQtb2ZmLWJ5OiBUb20gU3Qg
RGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUuaCAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMgICB8ICA3IC0tLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMgICAgICB8ICA4IC0tLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAxNCArKysrKysrKystLS0tLQ0KIDQgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1LmgNCmluZGV4IDE5YTAwMjgyZTM0Yy4uZTU0ZjMxODY1ZjYwIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQpAQCAtMTQyLDcgKzE0Miw2IEBAIGV4dGVy
biB1aW50IGFtZGdwdV9zZG1hX3BoYXNlX3F1YW50dW07DQogZXh0ZXJuIGNoYXIgKmFtZGdwdV9k
aXNhYmxlX2N1Ow0KIGV4dGVybiBjaGFyICphbWRncHVfdmlydHVhbF9kaXNwbGF5Ow0KIGV4dGVy
biB1aW50IGFtZGdwdV9wcF9mZWF0dXJlX21hc2s7DQotZXh0ZXJuIGludCBhbWRncHVfdnJhbV9w
YWdlX3NwbGl0Ow0KIGV4dGVybiBpbnQgYW1kZ3B1X25nZzsNCiBleHRlcm4gaW50IGFtZGdwdV9w
cmltX2J1Zl9wZXJfc2U7DQogZXh0ZXJuIGludCBhbWRncHVfcG9zX2J1Zl9wZXJfc2U7DQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQppbmRleCBkMDBmZDVkZDMw
N2EuLmVmN2Q5OWViZTkyZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jDQpAQCAtOTczLDEzICs5NzMsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2Vf
Y2hlY2tfYXJndW1lbnRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIA0KIAlhbWRncHVf
ZGV2aWNlX2NoZWNrX2Jsb2NrX3NpemUoYWRldik7DQogDQotCWlmIChhbWRncHVfdnJhbV9wYWdl
X3NwbGl0ICE9IC0xICYmIChhbWRncHVfdnJhbV9wYWdlX3NwbGl0IDwgMTYgfHwNCi0JICAgICFp
c19wb3dlcl9vZl8yKGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQpKSkgew0KLQkJZGV2X3dhcm4oYWRl
di0+ZGV2LCAiaW52YWxpZCBWUkFNIHBhZ2Ugc3BsaXQgKCVkKVxuIiwNCi0JCQkgYW1kZ3B1X3Zy
YW1fcGFnZV9zcGxpdCk7DQotCQlhbWRncHVfdnJhbV9wYWdlX3NwbGl0ID0gMTAyNDsNCi0JfQ0K
LQ0KIAlyZXQgPSBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhhZGV2KTsN
CiAJaWYgKHJldCkgew0KIAkJZGV2X2VycihhZGV2LT5kZXYsICJpbnZhbGlkIGxvY2t1cF90aW1l
b3V0IHBhcmFtZXRlciBzeW50YXhcbiIpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYw0KaW5kZXggMWYzOGQ2ZmMxZmUzLi5lZjIyYTJhMjU0NDggMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KQEAgLTEwOCw3ICsxMDgsNiBAQCBpbnQgYW1k
Z3B1X3ZtX2ZyYWdtZW50X3NpemUgPSAtMTsNCiBpbnQgYW1kZ3B1X3ZtX2Jsb2NrX3NpemUgPSAt
MTsNCiBpbnQgYW1kZ3B1X3ZtX2ZhdWx0X3N0b3AgPSAwOw0KIGludCBhbWRncHVfdm1fZGVidWcg
PSAwOw0KLWludCBhbWRncHVfdnJhbV9wYWdlX3NwbGl0ID0gNTEyOw0KIGludCBhbWRncHVfdm1f
dXBkYXRlX21vZGUgPSAtMTsNCiBpbnQgYW1kZ3B1X2V4cF9od19zdXBwb3J0ID0gMDsNCiBpbnQg
YW1kZ3B1X2RjID0gLTE7DQpAQCAtMzQyLDEzICszNDEsNiBAQCBtb2R1bGVfcGFyYW1fbmFtZWQo
dm1fZGVidWcsIGFtZGdwdV92bV9kZWJ1ZywgaW50LCAwNjQ0KTsNCiBNT0RVTEVfUEFSTV9ERVND
KHZtX3VwZGF0ZV9tb2RlLCAiVk0gdXBkYXRlIHVzaW5nIENQVSAoMCA9IG5ldmVyIChkZWZhdWx0
IGV4Y2VwdCBmb3IgbGFyZ2UgQkFSKExCKSksIDEgPSBHcmFwaGljcyBvbmx5LCAyID0gQ29tcHV0
ZSBvbmx5IChkZWZhdWx0IGZvciBMQiksIDMgPSBCb3RoIik7DQogbW9kdWxlX3BhcmFtX25hbWVk
KHZtX3VwZGF0ZV9tb2RlLCBhbWRncHVfdm1fdXBkYXRlX21vZGUsIGludCwgMDQ0NCk7DQogDQot
LyoqDQotICogRE9DOiB2cmFtX3BhZ2Vfc3BsaXQgKGludCkNCi0gKiBPdmVycmlkZSB0aGUgbnVt
YmVyIG9mIHBhZ2VzIGFmdGVyIHdlIHNwbGl0IFZSQU0gYWxsb2NhdGlvbnMgKGRlZmF1bHQgNTEy
LCAtMSA9IGRpc2FibGUpLiBUaGUgZGVmYXVsdCBpcyA1MTIuDQotICovDQotTU9EVUxFX1BBUk1f
REVTQyh2cmFtX3BhZ2Vfc3BsaXQsICJOdW1iZXIgb2YgcGFnZXMgYWZ0ZXIgd2Ugc3BsaXQgVlJB
TSBhbGxvY2F0aW9ucyAoZGVmYXVsdCA1MTIsIC0xID0gZGlzYWJsZSkiKTsNCi1tb2R1bGVfcGFy
YW1fbmFtZWQodnJhbV9wYWdlX3NwbGl0LCBhbWRncHVfdnJhbV9wYWdlX3NwbGl0LCBpbnQsIDA0
NDQpOw0KLQ0KIC8qKg0KICAqIERPQzogZXhwX2h3X3N1cHBvcnQgKGludCkNCiAgKiBFbmFibGUg
ZXhwZXJpbWVudGFsIGh3IHN1cHBvcnQgKDEgPSBlbmFibGUpLiBUaGUgZGVmYXVsdCBpcyAwIChk
aXNhYmxlZCkuDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3Iu
Yw0KaW5kZXggZWM5ZWEzZmRiYjRhLi4wYmMwMWUyNWEwYjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCkBAIC0yODQsMTcgKzI4NCwyMSBAQCBz
dGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2Vy
ICptYW4sDQogCWlmICghbHBmbikNCiAJCWxwZm4gPSBtYW4tPnNpemU7DQogDQotCWlmIChwbGFj
ZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdVT1VTIHx8DQotCSAgICBhbWRncHVfdnJhbV9w
YWdlX3NwbGl0ID09IC0xKSB7DQorCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05U
SUdVT1VTKSB7DQogCQlwYWdlc19wZXJfbm9kZSA9IH4wdWw7DQogCQludW1fbm9kZXMgPSAxOw0K
IAl9IGVsc2Ugew0KLQkJcGFnZXNfcGVyX25vZGUgPSBtYXgoKHVpbnQzMl90KWFtZGdwdV92cmFt
X3BhZ2Vfc3BsaXQsDQotCQkJCSAgICAgbWVtLT5wYWdlX2FsaWdubWVudCk7DQorI2lmZGVmIENP
TkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQ0KKwkJcGFnZXNfcGVyX25vZGUgPSBIUEFHRV9QTURf
TlI7DQorI2Vsc2UNCisJCS8qIGRlZmF1bHQgdG8gNTEyTUIgKi8NCisJCXBhZ2VzX3Blcl9ub2Rl
ID0gKDUxMlVMIDw8ICgyMFVMIC0gUEFHRV9TSElGVCkpOw0KKyNlbmRpZg0KKwkJcGFnZXNfcGVy
X25vZGUgPSBtYXgoKHVpbnQzMl90KXBhZ2VzX3Blcl9ub2RlLCBtZW0tPnBhZ2VfYWxpZ25tZW50
KTsNCiAJCW51bV9ub2RlcyA9IERJVl9ST1VORF9VUChtZW0tPm51bV9wYWdlcywgcGFnZXNfcGVy
X25vZGUpOw0KIAl9DQogDQotCW5vZGVzID0ga3ZtYWxsb2NfYXJyYXkobnVtX25vZGVzLCBzaXpl
b2YoKm5vZGVzKSwNCisJbm9kZXMgPSBrdm1hbGxvY19hcnJheSgodWludDMyX3QpbnVtX25vZGVz
LCBzaXplb2YoKm5vZGVzKSwNCiAJCQkgICAgICAgR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOw0K
IAlpZiAoIW5vZGVzKQ0KIAkJcmV0dXJuIC1FTk9NRU07DQotLSANCjIuMjEuMA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
