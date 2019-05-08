Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B61815E
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 22:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA18589958;
	Wed,  8 May 2019 20:56:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9A189958
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 20:56:47 +0000 (UTC)
Received: from MWHPR12MB1375.namprd12.prod.outlook.com (10.169.206.10) by
 MWHPR12MB1437.namprd12.prod.outlook.com (10.169.206.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Wed, 8 May 2019 20:56:42 +0000
Received: from MWHPR12MB1375.namprd12.prod.outlook.com
 ([fe80::5596:38b6:e81c:99c1]) by MWHPR12MB1375.namprd12.prod.outlook.com
 ([fe80::5596:38b6:e81c:99c1%8]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 20:56:42 +0000
From: "Lin, Amber" <Amber.Lin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Kernel crash at reloading amdgpu
Thread-Topic: Kernel crash at reloading amdgpu
Thread-Index: AQHVBeCJTb+V50ABekGYwdmvFZy8CA==
Date: Wed, 8 May 2019 20:56:42 +0000
Message-ID: <235b28d2-5fe9-d62d-cef2-014c7ecfcb4e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::31) To MWHPR12MB1375.namprd12.prod.outlook.com
 (2603:10b6:300:12::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 733ae33c-cccc-4aae-b5e8-08d6d3f7ac31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1437; 
x-ms-traffictypediagnostic: MWHPR12MB1437:
x-microsoft-antispam-prvs: <MWHPR12MB1437FB37E0AF7F1C3E2E6035E1320@MWHPR12MB1437.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(366004)(396003)(51234002)(189003)(199004)(5640700003)(316002)(2616005)(486006)(36756003)(99286004)(14444005)(256004)(52116002)(6486002)(6436002)(14454004)(6116002)(3846002)(476003)(6916009)(2351001)(72206003)(478600001)(64756008)(66946007)(66556008)(66476007)(31696002)(73956011)(66446008)(86362001)(2906002)(6512007)(71190400001)(71200400001)(66066001)(186003)(31686004)(8676002)(81156014)(81166006)(386003)(26005)(25786009)(6506007)(102836004)(68736007)(7736002)(5660300002)(2501003)(53936002)(305945005)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1437;
 H:MWHPR12MB1375.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VehAwBE+dZjYngjaHvEQOcbuWc9KerXAurte5anma65d7RPMFyUwJxyzkQnDFJl3CfrhMJBe8meKIyPRa4vvdmRmxNxz00867jYrX0YfE1+zF1NF4tw3QZ8sXKrq6XRFf7M6XFT8zTYcpxlQw2hN3hxYsykfqMydE8H/+Cnc0DXOTDZuKllOBTstY1jo+abZHPo7jrIJCSSjkilu3aSEFskVXHeqQOYwg/jWu0V3U6hELFijYrNvF1+ODtTWxI6TsHnl4mzCF1U5Q4/KK4XzVIsE3IkAvbSnj8WGV+TwRs7JmpFkwJx08ld3itReLLhqbhY5fuTGPlzEX890DDA6g+2+VpSY5rePWQrhQzD2mYkKtFr/H5/HggczAw2G3w0vraGeako2ymd3OBxW2GODrOQoq2CpxSiJZxUbFpWgAOk=
Content-ID: <BF6226A2C8A22E4F8CEBC3AF00E021C1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733ae33c-cccc-4aae-b5e8-08d6d3f7ac31
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 20:56:42.3999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1437
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYYtWSrqPlAcMI9OeWMZaPaLCpcw8ADX3VpduadHfwE=;
 b=rbbQUeXZEIznM9qP6D2jE5JS35L5OlMLsba+btrQxscKLRb6HU8bSS/36XJ3VRmf+o+IbejK/Z4EKQxaI1yW7G5o8M9ls5yCMmCBZj1S7n4oMxa3kHKkE0Vy+SZLPaOWkXg+T+t6iHvuKjvdgQUAgSzzB/WMcRG6fsXJ13+kvSY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksDQoNCldoZW4gSSBkbyAicm1tb2QgYW1kZ3B1OyBtb2Rwcm9iZSBhbWRncHUiLCBrZXJuZWwg
Y3Jhc2hlZC4gVGhpcyBpcyANCnZlZ2EyMC4gV2hhdCBoYXBwZW5zIGlzIGluIGFtZGdwdV9kZXZp
Y2VfaW5pdCgpOg0KDQoNCiDCoMKgwqDCoMKgwqDCoCAvKiBjaGVjayBpZiB3ZSBuZWVkIHRvIHJl
c2V0IHRoZSBhc2ljDQogwqDCoMKgwqDCoMKgwqDCoCAqwqAgRS5nLiwgZHJpdmVyIHdhcyBub3Qg
Y2xlYW5seSB1bmxvYWRlZCBwcmV2aW91c2x5LCBldGMuDQogwqDCoMKgwqDCoMKgwqDCoCAqLw0K
IMKgwqDCoMKgwqDCoMKgIGlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIA0KYW1kZ3B1X2Fz
aWNfbmVlZF9yZXNldF9vbl9pbml0KGFkZXYpKSB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHIgPSBhbWRncHVfYXNpY19yZXNldChhZGV2KTsNCiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKHIpIHsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRldl9lcnIoYWRldi0+ZGV2LCAiYXNpYyByZXNldCBvbiBpbml0IGZhaWxl
ZFxuIik7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGZhaWxlZDsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KIMKgwqDCoMKg
wqDCoMKgIH0NCg0KYW1kZ3B1X2FzaWNfbmVlZF9yZXNldF9vbl9pbml0KCkvc29jMTVfbmVlZF9y
ZXNldF9vbl9pbml0KCkgcmV0dXJucyB0cnVlIA0KYW5kIGl0IGdvZXMgdG8gYW1kZ3B1X2FzaWNf
cmVzZXQoKS9zb2MxNV9hc2ljX21vZGUxX3Jlc2V0KCksIHdoZXJlIGl0IA0KY2FsbHMgcHNwX2dw
dV9yZXNldCgpOg0KDQogwqDCoMKgwqDCoMKgwqAgaW50IHBzcF9ncHVfcmVzZXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQogwqDCoMKgwqDCoMKgwqAgew0KIMKgwqDCoCDCoMKgIMKgIMKg
wqAgaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSAhPSBBTURHUFVfRldfTE9BRF9QU1ApDQog
wqDCoMKgwqDCoMKgwqAgwqDCoCDCoCDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQoNCiDCoMKgwqDC
oMKgwqDCoCDCoMKgwqAgcmV0dXJuIHBzcF9tb2RlMV9yZXNldCgmYWRldi0+cHNwKTsNCiDCoMKg
wqDCoMKgwqDCoCB9DQoNCkhlcmUsIGhvd2V2ZXIsIHBzcF9tb2RlMV9yZXNldCBpcyBOT1QgYXNz
aWduZWQgYXMgDQpwc3BfdjExXzBfbW9kZTFfcmVzZXQoKSB1bnRpbCBhbWRncHVfZGV2aWNlX2lw
X2luaXQoKSwgd2hpY2ggaXMgYWZ0ZXIgDQphbWRncHVfYXNpY19yZXNldC4gVGhpcyBudWxsIGZ1
bmN0aW9uIHBvaW50ZXIgY2F1c2VzIHRoZSBrZXJuZWwgY3Jhc2ggDQphbmQgSSBoYXZlIHRvIHJl
Ym9vdCBteSBzeXN0ZW0uDQoNCkRvZXMgYW55b25lIGhhdmUgYW4gaWRlYSBob3cgdG8gZml4IHRo
aXMgcHJvcGVybHk/DQoNCkJUVyB0aGlzIGlzIHRoZSBsb2c6DQoNClvCoCAxNTcuNjg2MzAzXSBQ
R0QgMCBQNEQgMA0KW8KgIDE1Ny42ODg4MzddIE9vcHM6IDAwMDAgWyMxXSBTTVAgUFRJDQpbwqAg
MTU3LjY5MjMzMV0gQ1BVOiAwIFBJRDogMTkwMiBDb21tOiBrd29ya2VyLzA6MiBUYWludGVkOiBH
IFfCoMKgwqDCoMKgwqDCoMKgIA0KNS4wLjAtcmMxLWtmZCsgIzYNClvCoCAxNTcuNzAwNzYwXSBI
YXJkd2FyZSBuYW1lOiBBU1VTIEFsbCBTZXJpZXMvWDk5LUUgV1MsIEJJT1MgMTMwMiAwMS8wNS8y
MDE2DQpbwqAgMTU3LjcwNzU0M10gV29ya3F1ZXVlOiBldmVudHMgd29ya19mb3JfY3B1X2ZuDQpb
wqAgMTU3LjcxMTk3Nl0gUklQOiAwMDEwOnBzcF9ncHVfcmVzZXQrMHgxOC8weDMwIFthbWRncHVd
DQpbwqAgMTU3LjcxNzEwNl0gQ29kZTogZmYgZmYgZmYgNWIgYzMgYjggZWEgZmYgZmYgZmYgYzMg
MGYgMWYgODAgMDAgMDAgMDAgDQowMCAwZiAxZiA0NCAwMCAwMCA4MyBiZiBjOCAyMiAwMSAwMCAw
MiA3NCAwMyAzMSBjMCBjMyA0OCA4YiA4NyBjMCAyMyAwMSANCjAwIDw0OD4gOGIgNDAgNTAgNDgg
ODUgYzAgNzQgZWQgNDggODEgYzcgODggMjMgMDEgMDAgZTkgMDMgM2IgOGQgZDYgMGYNClvCoCAx
NTcuNzM1ODUyXSBSU1A6IDAwMTg6ZmZmZmFhMjU0NDI0M2NlMCBFRkxBR1M6IDAwMDEwMjQ2DQpb
wqAgMTU3Ljc0MTA3N10gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZjk3ZTk0NmY2MDAw
MCBSQ1g6IA0KMDAwMDAwMDAwMDAwMDAwMA0KW8KgIDE1Ny43NDgyMDJdIFJEWDogMDAwMDAwMDAw
MDAwMDAyNyBSU0k6IGZmZmZmZmZmOTc2NjU1YTAgUkRJOiANCmZmZmY5N2U5NDZmNjAwMDANClvC
oCAxNTcuNzU1MzI2XSBSQlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAw
IFIwOTogDQowMDAwMDAwMDAwMDAwMDAyDQpbwqAgMTU3Ljc2MjQ1OV0gUjEwOiBmZmZmYWEyNTQ0
MjQzYmEwIFIxMTogMzhhNzlhYzNlYzE5ZWRkNSBSMTI6IA0KZmZmZjk3ZTk0NmY3NTA4OA0KW8Kg
IDE1Ny43Njk2MDhdIFIxMzogMDAwMDAwMDAwMDAwMDAwYSBSMTQ6IGZmZmY5N2U5NDZmNzUxMjgg
UjE1OiANCjAwMDAwMDAwMDAwMDAwMDENClvCoCAxNTcuNzc2NzQxXSBGUzrCoCAwMDAwMDAwMDAw
MDAwMDAwKDAwMDApIEdTOmZmZmY5N2U5NGY4MDAwMDAoMDAwMCkgDQprbmxHUzowMDAwMDAwMDAw
MDAwMDAwDQpbwqAgMTU3Ljc4NDgyN10gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6
IDAwMDAwMDAwODAwNTAwMzMNClvCoCAxNTcuNzkwNTY0XSBDUjI6IDAwMDAwMDAwMDAwMDAwNTAg
Q1IzOiAwMDAwMDAwODA4M2U2MDAzIENSNDogDQowMDAwMDAwMDAwMTYwNmYwDQpbwqAgMTU3Ljc5
NzY5Nl0gQ2FsbCBUcmFjZToNClvCoCAxNTcuODAwMTg0XcKgIHNvYzE1X2FzaWNfcmVzZXQrMHg4
MS8weDFmMCBbYW1kZ3B1XQ0KW8KgIDE1Ny44MDQ5MzZdwqAgYW1kZ3B1X2RldmljZV9pbml0KzB4
Y2YxLzB4MTgwMCBbYW1kZ3B1XQ0KW8KgIDE1Ny44MDk5OTNdwqAgPyByY3VfcmVhZF9sb2NrX3Nj
aGVkX2hlbGQrMHg3NC8weDgwDQpbwqAgMTU3LjgxNDczNF3CoCBhbWRncHVfZHJpdmVyX2xvYWRf
a21zKzB4NjUvMHgyNzAgW2FtZGdwdV0NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KQW1iZXINCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
