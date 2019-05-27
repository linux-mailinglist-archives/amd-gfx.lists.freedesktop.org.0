Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D122AF7E
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 09:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F87898CC;
	Mon, 27 May 2019 07:42:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750051.outbound.protection.outlook.com [40.107.75.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B571B898CC
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 07:42:47 +0000 (UTC)
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3935.namprd12.prod.outlook.com (10.255.238.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Mon, 27 May 2019 07:42:45 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6%6]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 07:42:45 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhang, Jerry"
 <Jerry.Zhang@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce 3.0
Thread-Topic: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce
 3.0
Thread-Index: AQHVFF/FxziqBr5pYkiSEO7/JqZY5A==
Date: Mon, 27 May 2019 07:42:45 +0000
Message-ID: <1558942936-16519-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::34) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.156.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7fd9926-c39f-433b-40a6-08d6e276e7fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3935; 
x-ms-traffictypediagnostic: MN2PR12MB3935:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR12MB3935D7B0DCE30CEB9D0CF2F5F21D0@MN2PR12MB3935.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(189003)(50226002)(6636002)(53936002)(478600001)(72206003)(7736002)(71200400001)(71190400001)(8936002)(316002)(14454004)(81156014)(8676002)(81166006)(102836004)(6506007)(386003)(25786009)(4326008)(6486002)(305945005)(36756003)(14444005)(99286004)(86362001)(186003)(256004)(6116002)(2616005)(476003)(6512007)(66066001)(52116002)(68736007)(66476007)(66946007)(26005)(66446008)(64756008)(66556008)(73956011)(6436002)(3846002)(2906002)(486006)(54906003)(110136005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3935;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BQGG3vJ0RAjDT9sUqhaGmzYPHv/ExaQnvYjuZQqnb4QckDawVPvnJ9q2/z0R30VClLNznnCpjefzI1otfQADk6drxsbMkGxFachfG8Qv2JG/5Lw14jlAP9AJH7/ZrEn7VRZMzndBSP3i1rYfLWlkG7PQ6D6ewK6G3duuypxv7jHjLML4vAjgYYYEW+wCvmdI1kFIOK7tbSRFCCfUZTp4+pwqBnRXShZoCnHihpSrbHOC7KRsR2T/osl20ebiShgJVLcIXBjCkovxoXpefKtRvv7fa+87cFZDZwUjf2FcxwZs7wWd5kc2+9n6lpL6CAc0uZLEq2/Q0DYiKDGZCvobpwa/108Snj5vPx4hT5865UACBOqGFijnMQlr0gA6WjYKVHDtFHMMxpH9C2F9b4GCporuBH92dA5E835qoFa7tjw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fd9926-c39f-433b-40a6-08d6e276e7fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 07:42:45.1392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshankar@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpqIeteWzVZOSQSNe5Wa8kmrSXgCr6a3UNj4g4PRwc0=;
 b=r7rKL3ES3Ra1GabWcOIV0IRm5oYHCALGOlY1RoohEQgJVLxzJxki5wNgVj4uUrO7Q0iXGSPsUsra07i86DQ0fu+mO18MvTiRDjL+Mx+DJOloguLNKg11zXjKSiCBqMiLiGY/OYJDryuQ6lSWZR+si17ACIWxwOUTubvuifd5YX0=
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
b25zaXN0ZW50Lg0KDQpTaWduZWQtb2ZmLWJ5OiBMb3VpcyBMaSA8Q2hpbmctc2hpaC5MaUBhbWQu
Y29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jIHwgMiAr
Kw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92Y2UuYw0KaW5kZXggYzAyMWIxMS4uOTJmOWQ0NiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jDQpAQCAtMTA4NCw2ICsxMDg0LDggQEAgaW50
IGFtZGdwdV92Y2VfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KIAlp
ZiAocikNCiAJCXJldHVybiByOw0KIA0KKwlycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmlu
Zyk7DQorDQogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDRV9DTURfRU5EKTsNCiAJYW1kZ3B1
X3JpbmdfY29tbWl0KHJpbmcpOw0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
