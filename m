Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C227EEAC4
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 21:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE65891B8;
	Mon, 29 Apr 2019 19:19:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710043.outbound.protection.outlook.com [40.107.71.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C00891B8
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 19:19:40 +0000 (UTC)
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3337.namprd12.prod.outlook.com (20.178.31.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 19:19:37 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::1551:7e8e:b18f:fe69]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::1551:7e8e:b18f:fe69%3]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 19:19:37 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Update latest xgmi topology info after each
 device is enumulated
Thread-Topic: [PATCH] drm/amdgpu: Update latest xgmi topology info after each
 device is enumulated
Thread-Index: AQHU/sB7csE7jCxRx069jABn1qApJQ==
Date: Mon, 29 Apr 2019 19:19:36 +0000
Message-ID: <1556565568-31183-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1580af8-bbd0-4d1d-4bb1-08d6ccd79e3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3337; 
x-ms-traffictypediagnostic: DM6PR12MB3337:
x-microsoft-antispam-prvs: <DM6PR12MB3337DDBB03D534EE7663B863F4390@DM6PR12MB3337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(366004)(189003)(199004)(5660300002)(3846002)(305945005)(4326008)(256004)(6512007)(71200400001)(71190400001)(81166006)(14444005)(25786009)(81156014)(2906002)(66066001)(53936002)(36756003)(50226002)(6916009)(6486002)(6116002)(8936002)(68736007)(99286004)(97736004)(2501003)(6436002)(478600001)(476003)(15650500001)(72206003)(14454004)(102836004)(66946007)(186003)(6506007)(66476007)(66446008)(64756008)(66556008)(52116002)(386003)(86362001)(8676002)(73956011)(26005)(2616005)(7736002)(5640700003)(486006)(316002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3337;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /kIND5bdjU2H4b5JRyM9l9E2yU1Yolq3uQ7du6u5rlmrsrlCOivR9Hg35xj5qzRiw/xo4CqsmR5VMw67J3Y3yymlx7CT77j/JKHdsSuT5Mrpx1T2zj02XJduibjyNnnUb9yzgldAFdbEzkyGimeZ6U3CnH5sx3CjtFQWQTkhY0hdqxF4mWB8fEVy3h6CGVbhCBoWPbWR5V9BA67mxvO0DvJ+93MGvBYUG7dPozbT+CWcuH81lQxQdLw0rWEQQ0HEs3I9SRnVEaWZFkRvbzsbWBwIpyH8WWo6KEdNJJFIDg65B0hEWxd1lAgVKU6et01Ef1uTM37Ix9ebJNpVWv4Lcd+TAy4CYEgEEZhb8ROl2Gb06mOphZh1KOG2+X+Vagv9DkjTP4xKzI5hteckKdO/tmpj78RAyiH1t8Z+/UvOGBc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1580af8-bbd0-4d1d-4bb1-08d6ccd79e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 19:19:37.0490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3337
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSrAn/v11MDuw6Iw82U78CawzRXt+SCDIcmjJTRK7Bo=;
 b=tNcv4mEGrqshzfnVhWU1EL7kypaZO/ihmdApCewK4qR7OoIsgOjPAvfB5R/0SG6nnhshAr62kpXNJtHfRmkXALbsuHWecJnmgKj8KJuPR6N5yrsYIfb9lD68XuQHmiXQuONWivfVFZlpGH3qmQTJHzluXyYmhNWKz2M+B8bVOFc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRqdXN0IHRoZSBzZXF1ZW5jZSBvZiBzZXQvZ2V0IHhnbWkgdG9wb2xvZ3ksIHNvIGRyaXZlciBj
YW4gaGF2ZSB0aGUgbGF0ZXN0DQpYR01JIHRvcG9sb2d5IGluZm8gZm9yIGZ1dHVyZSB1c2FnZQ0K
DQpDaGFuZ2UtSWQ6IEk2Mjc4MTRmODI0NTlhNmM5YzNkNzI0NjlmODEzMDk0ODhiMmE5MTMzDQpT
aWduZWQtb2ZmLWJ5OiBzaGFveXVubCA8c2hhb3l1bi5saXVAYW1kLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMgfCAzMiArKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV94Z21pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jDQpp
bmRleCAwNGRmYzhiLi5lNDhlOTM5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3hnbWkuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3hnbWkuYw0KQEAgLTMwMSwzMCArMzAxLDQxIEBAIGludCBhbWRncHVfeGdtaV9hZGRfZGV2
aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAlsaXN0X2FkZF90YWlsKCZhZGV2LT5n
bWMueGdtaS5oZWFkLCAmaGl2ZS0+ZGV2aWNlX2xpc3QpOw0KIAlsaXN0X2Zvcl9lYWNoX2VudHJ5
KGVudHJ5LCAmaGl2ZS0+ZGV2aWNlX2xpc3QsIGhlYWQpDQogCQl0b3BfaW5mby0+bm9kZXNbY291
bnQrK10ubm9kZV9pZCA9IGVudHJ5LT5ub2RlX2lkOw0KKwl0b3BfaW5mby0+bnVtX25vZGVzID0g
Y291bnQ7DQogCWhpdmUtPm51bWJlcl9kZXZpY2VzID0gY291bnQ7DQogDQotCS8qIEVhY2ggcHNw
IG5lZWQgdG8gZ2V0IHRoZSBsYXRlc3QgdG9wb2xvZ3kgKi8NCiAJbGlzdF9mb3JfZWFjaF9lbnRy
eSh0bXBfYWRldiwgJmhpdmUtPmRldmljZV9saXN0LCBnbWMueGdtaS5oZWFkKSB7DQotCQlyZXQg
PSBwc3BfeGdtaV9nZXRfdG9wb2xvZ3lfaW5mbygmdG1wX2FkZXYtPnBzcCwgY291bnQsIHRvcF9p
bmZvKTsNCisJCS8qIHVwZGF0ZSBub2RlIGxpc3QgZm9yIG90aGVyIGRldmljZSBpbiB0aGUgaGl2
ZSAqLw0KKwkJaWYgKHRtcF9hZGV2ICE9IGFkZXYpIHsNCisJCQl0b3BfaW5mbyA9ICZ0bXBfYWRl
di0+cHNwLnhnbWlfY29udGV4dC50b3BfaW5mbzsNCisJCQl0b3BfaW5mby0+bm9kZXNbY291bnQg
LSAxXS5ub2RlX2lkID0gYWRldi0+Z21jLnhnbWkubm9kZV9pZDsNCisJCQl0b3BfaW5mby0+bnVt
X25vZGVzID0gY291bnQ7DQorCQl9DQorCQlyZXQgPSBhbWRncHVfeGdtaV91cGRhdGVfdG9wb2xv
Z3koaGl2ZSwgdG1wX2FkZXYpOw0KKwkJaWYgKHJldCkNCisJCQlnb3RvIGV4aXQ7DQorCX0NCisN
CisJLyogZ2V0IGxhdGVzdCB0b3BvbG9neSBpbmZvIGZvciBlYWNoIGRldmljZSBmcm9tIHBzcCAq
Lw0KKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcF9hZGV2LCAmaGl2ZS0+ZGV2aWNlX2xpc3QsIGdt
Yy54Z21pLmhlYWQpIHsNCisJCXJldCA9IHBzcF94Z21pX2dldF90b3BvbG9neV9pbmZvKCZ0bXBf
YWRldi0+cHNwLCBjb3VudCwNCisJCQkJJnRtcF9hZGV2LT5wc3AueGdtaV9jb250ZXh0LnRvcF9p
bmZvKTsNCiAJCWlmIChyZXQpIHsNCiAJCQlkZXZfZXJyKHRtcF9hZGV2LT5kZXYsDQogCQkJCSJY
R01JOiBHZXQgdG9wb2xvZ3kgZmFpbHVyZSBvbiBkZXZpY2UgJWxseCwgaGl2ZSAlbGx4LCByZXQg
JWQiLA0KIAkJCQl0bXBfYWRldi0+Z21jLnhnbWkubm9kZV9pZCwNCiAJCQkJdG1wX2FkZXYtPmdt
Yy54Z21pLmhpdmVfaWQsIHJldCk7DQogCQkJLyogVG8gZG8gOiBjb250aW51ZSB3aXRoIHNvbWUg
bm9kZSBmYWlsZWQgb3IgZGlzYWJsZSB0aGUgd2hvbGUgaGl2ZSAqLw0KLQkJCWJyZWFrOw0KKwkJ
CWdvdG8gZXhpdDsNCiAJCX0NCiAJfQ0KIA0KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcF9hZGV2
LCAmaGl2ZS0+ZGV2aWNlX2xpc3QsIGdtYy54Z21pLmhlYWQpIHsNCi0JCXJldCA9IGFtZGdwdV94
Z21pX3VwZGF0ZV90b3BvbG9neShoaXZlLCB0bXBfYWRldik7DQotCQlpZiAocmV0KQ0KLQkJCWJy
ZWFrOw0KLQl9DQotDQogCWlmICghcmV0KQ0KIAkJcmV0ID0gYW1kZ3B1X3hnbWlfc3lzZnNfYWRk
X2Rldl9pbmZvKGFkZXYsIGhpdmUpOw0KIA0KKw0KKwltdXRleF91bmxvY2soJmhpdmUtPmhpdmVf
bG9jayk7DQorZXhpdDoNCiAJaWYgKCFyZXQpDQogCQlkZXZfaW5mbyhhZGV2LT5kZXYsICJYR01J
OiBBZGQgbm9kZSAlZCwgaGl2ZSAweCVsbHguXG4iLA0KIAkJCSBhZGV2LT5nbWMueGdtaS5waHlz
aWNhbF9ub2RlX2lkLCBhZGV2LT5nbWMueGdtaS5oaXZlX2lkKTsNCkBAIC0zMzMsOSArMzQ0LDYg
QEAgaW50IGFtZGdwdV94Z21pX2FkZF9kZXZpY2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQogCQkJYWRldi0+Z21jLnhnbWkucGh5c2ljYWxfbm9kZV9pZCwgYWRldi0+Z21jLnhnbWkuaGl2
ZV9pZCwNCiAJCQlyZXQpOw0KIA0KLQ0KLQltdXRleF91bmxvY2soJmhpdmUtPmhpdmVfbG9jayk7
DQotZXhpdDoNCiAJcmV0dXJuIHJldDsNCiB9DQogDQotLSANCjIuNy40DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
