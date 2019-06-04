Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD969341F1
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 10:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AA589650;
	Tue,  4 Jun 2019 08:36:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740074.outbound.protection.outlook.com [40.107.74.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D713289650
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 08:36:04 +0000 (UTC)
Received: from BYAPR12MB3237.namprd12.prod.outlook.com (20.179.93.25) by
 BYAPR12MB3431.namprd12.prod.outlook.com (20.178.196.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.20; Tue, 4 Jun 2019 08:36:02 +0000
Received: from BYAPR12MB3237.namprd12.prod.outlook.com
 ([fe80::84a5:ec68:9f97:36d4]) by BYAPR12MB3237.namprd12.prod.outlook.com
 ([fe80::84a5:ec68:9f97:36d4%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 08:36:02 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Jerry.Zhang@amd.com" <Jerry.Zhang@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>
Subject: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce 3.0
 (V2)
Thread-Topic: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce
 3.0 (V2)
Thread-Index: AQHVGrCKNaLukVC8cU2vhafasL6Ulw==
Date: Tue, 4 Jun 2019 08:36:02 +0000
Message-ID: <1559637339-2124-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::33) To BYAPR12MB3237.namprd12.prod.outlook.com
 (2603:10b6:a03:136::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.156.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd908e95-4013-4e25-76a1-08d6e8c7ad0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3431; 
x-ms-traffictypediagnostic: BYAPR12MB3431:
x-microsoft-antispam-prvs: <BYAPR12MB3431F106E428D033E9AB0409F2150@BYAPR12MB3431.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(376002)(136003)(346002)(189003)(199004)(102836004)(6506007)(486006)(186003)(5660300002)(386003)(71200400001)(316002)(71190400001)(26005)(66476007)(14444005)(110136005)(50226002)(53936002)(54906003)(73956011)(66946007)(66556008)(66446008)(2906002)(64756008)(52116002)(2616005)(99286004)(4326008)(6116002)(8936002)(476003)(25786009)(3846002)(66066001)(256004)(8676002)(6512007)(68736007)(36756003)(2501003)(6486002)(72206003)(86362001)(81156014)(81166006)(14454004)(6636002)(305945005)(6436002)(478600001)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3431;
 H:BYAPR12MB3237.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TkN20V3d7uz/Bh9PMcGxrwXnLPAZDD8nsM7H/hOMRgHTE2nWTutWIQfSq0qNz6tAPk8NfZ0x0gpI70mcXJVHIiF81qZe8i8utcEs0qzjkZo/29YHjM8pJGcZMnCbwE6JB3ghsvIifV7oH/juOHkV78jzwN2etqBD3OR3QDi/jW4y2697tURX//lt4mDizPEHwbStAZ/7cXDBeRPZwNVpVA5c/DmQHpZAXRJ1U+n3ZjaufmTOBSqX0yNI/ApFJbGfg4aS5vx+0jTpVNtIpFtvh9Nr0gclZlmHDvpVfXTdGVzM5ubMABm98TUw9pKrUZOP+pic9uwnlXIRJxS+rXkE5/Bt9Cv/HISE/3wK7wlMAFRAQNH16Yw56YHgD+EoH3KliytzaPSCcpSpULDg9CnRoS8Dk6mpa9Re79aFuw61AW0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd908e95-4013-4e25-76a1-08d6e8c7ad0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 08:36:02.3349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshankar@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3431
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0MAIbzyPKiuciRM6TpAGLFzU6l36k328yLc3odkLuo=;
 b=vIwrPeL0w9vVTDMX6mGw+MwxuqjUF5X1fi9HCM1JZY7WxE0BWTfqQtLG3jlX5EHXtEX4/bKA2hoOsa4opm4thpLrUiGgZPmD89GnxOdQJXWziwcCONbi5d3gvQYfh+G1w7On/oCtUn3T3dJ/3CiyYQkH1DQKvAL48CVQiF92xpM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTG91aXMgTGkgPENoaW5nLXNoaWguTGlAYW1kLmNvbT4NCg0KW1doYXRdDQp2Y2Ugcmlu
ZyB0ZXN0IGZhaWxzIGNvbnNpc3RlbnRseSBkdXJpbmcgcmVzdW1lIGluIHMzIGN5Y2xlLCBkdWUg
dG8NCm1pc21hdGNoIHJlYWQgJiB3cml0ZSBwb2ludGVycy4NCk9uIGRlYnVnL2FuYWx5c2lzIGl0
cyBmb3VuZCB0aGF0IHJwdHIgdG8gYmUgY29tcGFyZWQgaXMgbm90IGJlaW5nDQpjb3JyZWN0bHkg
dXBkYXRlZC9yZWFkLCB3aGljaCBsZWFkcyB0byB0aGlzIGZhaWx1cmUuDQpCZWxvdyBpcyB0aGUg
ZmFpbHVyZSBzaWduYXR1cmU6DQoJW2RybTphbWRncHVfdmNlX3JpbmdfdGVzdF9yaW5nXSAqRVJS
T1IqIGFtZGdwdTogcmluZyAxMiB0ZXN0IGZhaWxlZA0KCVtkcm06YW1kZ3B1X2RldmljZV9pcF9y
ZXN1bWVfcGhhc2UyXSAqRVJST1IqIHJlc3VtZSBvZiBJUCBibG9jayA8dmNlX3YzXzA+IGZhaWxl
ZCAtMTEwDQoJW2RybTphbWRncHVfZGV2aWNlX3Jlc3VtZV0gKkVSUk9SKiBhbWRncHVfZGV2aWNl
X2lwX3Jlc3VtZSBmYWlsZWQgKC0xMTApLg0KDQpbSG93XQ0KZmV0Y2ggcnB0ciBhcHByb3ByaWF0
ZWx5LCBtZWFuaW5nIG1vdmUgaXRzIHJlYWQgbG9jYXRpb24gZnVydGhlciBkb3duDQppbiB0aGUg
Y29kZSBmbG93Lg0KV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQgdGhlIHMzIGZhaWx1cmUgaXMgbm8g
bW9yZSBzZWVuIGZvciA+NWsgczMgY3ljbGVzLA0Kd2hpY2ggb3RoZXJ3aXNlIGlzIHByZXR0eSBj
b25zaXN0ZW50Lg0KDQpWMjogcmVtb3ZlIHJlZHVudGFudCBmZXRjaCBvZiBycHRyDQoNClNpZ25l
ZC1vZmYtYnk6IExvdWlzIExpIDxDaGluZy1zaGloLkxpQGFtZC5jb20+DQotLS0NCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgfCA0ICsrKy0NCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdmNlLmMNCmluZGV4IGMwMjFiMTEuLmY3MTg5ZTIgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KQEAgLTEwNzIsNyArMTA3Miw3IEBAIHZvaWQg
YW1kZ3B1X3ZjZV9yaW5nX2VtaXRfZmVuY2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1NjQg
YWRkciwgdTY0IHNlcSwNCiBpbnQgYW1kZ3B1X3ZjZV9yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcpDQogew0KIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmct
PmFkZXY7DQotCXVpbnQzMl90IHJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsNCisJ
dWludDMyX3QgcnB0cjsNCiAJdW5zaWduZWQgaTsNCiAJaW50IHIsIHRpbWVvdXQgPSBhZGV2LT51
c2VjX3RpbWVvdXQ7DQogDQpAQCAtMTA4NCw2ICsxMDg0LDggQEAgaW50IGFtZGdwdV92Y2Vfcmlu
Z190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KIAlpZiAocikNCiAJCXJldHVy
biByOw0KIA0KKwlycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7DQorDQogCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFZDRV9DTURfRU5EKTsNCiAJYW1kZ3B1X3JpbmdfY29tbWl0KHJp
bmcpOw0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
