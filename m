Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA72CFCD
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 21:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE4E89F3C;
	Tue, 28 May 2019 19:53:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810082.outbound.protection.outlook.com [40.107.81.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508D989F3C
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 19:53:13 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2820.namprd12.prod.outlook.com (20.177.240.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Tue, 28 May 2019 19:53:11 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 19:53:11 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Return proper error code for gws alloc API
Thread-Topic: [PATCH] drm/amdkfd: Return proper error code for gws alloc API
Thread-Index: AQHVFY76txIN52yqrUetiHSfDTOIPw==
Date: Tue, 28 May 2019 19:53:11 +0000
Message-ID: <1559073185-26048-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a93ba2c-ca1e-4d8b-b1b2-08d6e3a61cf6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2820; 
x-ms-traffictypediagnostic: BL0PR12MB2820:
x-microsoft-antispam-prvs: <BL0PR12MB2820928EB3C969468546B267801E0@BL0PR12MB2820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:489;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(52116002)(5660300002)(6512007)(6916009)(99286004)(68736007)(66446008)(64756008)(66556008)(66476007)(66066001)(6116002)(3846002)(316002)(66946007)(73956011)(54906003)(478600001)(72206003)(71190400001)(14444005)(256004)(71200400001)(14454004)(8676002)(2906002)(7736002)(486006)(2616005)(4326008)(476003)(2501003)(25786009)(26005)(186003)(36756003)(53936002)(2351001)(6486002)(6506007)(386003)(50226002)(8936002)(6436002)(5640700003)(86362001)(81166006)(81156014)(305945005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2820;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /TYD8rZjTI9t+rxilKG/XSzuvEAYjjydX6TGMBfabnfOmIZ9nJVi0yfAgMuRhfDWcHWQkd8KPJBk1LwEZnaoldqvSUEERplwvFLQX/yOxjeNdaaa/98q6K4997d7y+hxL1UwpHMg3AzFYkNb35jkJM4X4lyDLyfPLDt4kbvlzfLJH24FOsO5FJmYfnxHXIIRx+U9bQ5HEmpX0ovp3o1Jo+fflr9cVVQLpiWc7vu9DzY1Hf85876GFLdlXHjtiAzM9GWUTxhYvHOJj7vN3XsmyhwFDXmoaK1c/XqtGzybljojgVmzVHwH3jLbokaI+uoMPm/m3IycWa+9f2UpYlkhfYNv7pnX/pJHLgkxUqx1bo1z+6bTkmgYjyOgiyD5TysheYwUjwGr20/U9y7po4zGYqrcYjyrIO1PXtuDTuhAW6U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a93ba2c-ca1e-4d8b-b1b2-08d6e3a61cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 19:53:11.2417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unGTETWRW3R2w+QbFlCOZ/2dbQFB8SIonlaIR7EFey0=;
 b=GVcg7bDQ36I/oxQADT0+hwtOZ4OumANYe5lShrF1EMHOysVfuVXrNoS1lU4M+h6ZfiruZtm7b4dRp+26aUE6H+Cew9eKZ3fR8QTwFMOVLhRgskIuKqO5nj2OpLDAHvE8qHxDHr7MlV3gt7mVT9SgFBnv7RQKGktEhaTHMzAqHWQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJYWE4MWM2YWE1Zjk3ZTg4ODI5MTc3MWUxYWE3MGIwMmZjY2RjYjllMA0KU2ln
bmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgICAgICAgfCAyICstDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyAgICAgICAgICAgICAgIHwgMiAr
LQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIu
YyB8IDIgKy0NCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1
dm0uYw0KaW5kZXggODcxNzdlZC4uZTMwNDI3MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQpAQCAtMjEyNCw3ICsyMTI0LDcgQEAg
aW50IGFtZGdwdV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHZvaWQgKmluZm8sIHZvaWQgKmd3
cywgc3RydWN0IGtnZF9tZW0gKiptZW0NCiANCiAJKm1lbSA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVj
dCBrZ2RfbWVtKSwgR0ZQX0tFUk5FTCk7DQogCWlmICghKm1lbSkNCi0JCXJldHVybiAtRUlOVkFM
Ow0KKwkJcmV0dXJuIC1FTk9NRU07DQogDQogCW11dGV4X2luaXQoJigqbWVtKS0+bG9jayk7DQog
CSgqbWVtKS0+Ym8gPSBhbWRncHVfYm9fcmVmKGd3c19ibyk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9jaGFyZGV2LmMNCmluZGV4IGFhYjJhYTYuLjQ5MWYwZGQgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQpAQCAtMTU3Niw3ICsxNTc2LDcgQEAg
c3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVjdCBmaWxlICpmaWxlcCwN
CiANCiAJaWYgKCFod3NfZ3dzX3N1cHBvcnQgfHwNCiAJCWRldi0+ZHFtLT5zY2hlZF9wb2xpY3kg
PT0gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1MpDQotCQlyZXR1cm4gLUVJTlZBTDsNCisJCXJldHVy
biAtRU5PREVWOw0KIA0KIAlkZXYgPSBrZmRfZGV2aWNlX2J5X2lkKGFyZ3MtPmdwdV9pZCk7DQog
CWlmICghZGV2KSB7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQppbmRleCBjMmM1NzBlLi5kYTA5NTg2IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdl
ci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9t
YW5hZ2VyLmMNCkBAIC0xMDMsNyArMTAzLDcgQEAgaW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9j
ZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCiANCiAJLyogT25seSBh
bGxvdyBvbmUgcXVldWUgcGVyIHByb2Nlc3MgY2FuIGhhdmUgR1dTIGFzc2lnbmVkICovDQogCWlm
IChnd3MgJiYgcGRkLT5xcGQubnVtX2d3cykNCi0JCXJldHVybiAtRUlOVkFMOw0KKwkJcmV0dXJu
IC1FQlVTWTsNCiANCiAJaWYgKCFnd3MgJiYgcGRkLT5xcGQubnVtX2d3cyA9PSAwKQ0KIAkJcmV0
dXJuIC1FSU5WQUw7DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
