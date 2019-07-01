Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30ED5B323
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jul 2019 05:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1112789856;
	Mon,  1 Jul 2019 03:37:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6BF89856
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jul 2019 03:37:12 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3360.namprd12.prod.outlook.com (20.178.241.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 03:37:10 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731%4]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 03:37:10 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVL75DJwZOErPEzU6MjZqJYrnFlQ==
Date: Mon, 1 Jul 2019 03:37:10 +0000
Message-ID: <1561952220-5526-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c90faf06-d1f3-4ed6-cb4a-08d6fdd565e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3360; 
x-ms-traffictypediagnostic: MN2PR12MB3360:
x-microsoft-antispam-prvs: <MN2PR12MB33606E36EB13C59D5A5757AEFAF90@MN2PR12MB3360.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(199004)(189003)(52116002)(50226002)(478600001)(99286004)(102836004)(26005)(25786009)(5660300002)(6512007)(5640700003)(316002)(72206003)(64756008)(6486002)(6506007)(386003)(66556008)(73956011)(6916009)(6436002)(68736007)(66446008)(66946007)(66476007)(2616005)(476003)(486006)(81156014)(81166006)(2906002)(66066001)(36756003)(3846002)(2501003)(14454004)(6116002)(186003)(4326008)(71190400001)(2351001)(71200400001)(8936002)(53936002)(305945005)(7736002)(86362001)(256004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3360;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dZ2tC4HruSNJaP/3BrVy2KRJ2K/ISjjVl9jAn5ro+bGRxYVxXa/qZSR/d860fUYd6C/A7QM5rtfLI6IlAVLKAuh2HHxtaTBmzKagEFuRXR2Rip+qz1eQmPV+QYkK76USrkimB/u/S9EVIr9FXNuit2vEUWV/ayzRJcAaWCgtQj/lgb4+q26CX32JK+4j6zcG2GUqzuOK4lbxlSaGfXIFSK2pdFYXE8Yaxep0Ay87LDdPfkN3f/8vwNHu3PtMTaSk5gjmDoTeAKcL6hzK59rrrVci6OzrgdQ7xu3HEAmYdUwsPm/p/PDa9yBua2q6sQ6VSPblnCPnnK4G6Y15hfxv74OYyYYGu0Wjg+UNSVvOlrm/bfLliEtzV/jurR6aZq6FgySo+3IlP3TOaVutfh8oR3WKgAmx7AhkVuP9wPYooFQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90faf06-d1f3-4ed6-cb4a-08d6fdd565e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 03:37:10.1234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3360
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQetsGoHYhLrBAeaNf/KFkOreeePMluXyTDl7/g9eEk=;
 b=Dj+4tjwokwPwkOC0qobOXIlgzmnhnI9uVU+ghHJYogc3z0DON4Oj9czq0/AFD8PJU9POmHhEVDUQvx/lrBtTHfb7uGk7QVqdc5TZ+KBy9x/DiLnr4n796Z+NT/3LbGXv+ZzHcbG2eRj9t9ukolELxfc1h2xCV4E5i1S+EQl+3VE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2NoZWR1bGVyIHRpbWVvdXQgaXMgaW4gamlmZmllcw0KdjI6IG1vdmUgdGltZW91dCBjaGVjayB0
byBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyBhZnRlcg0KcGFyc2luZyB0
aGUgdmFsdWUNCnYzOiBhZGQgbG9ja3VwX3RpbWVvdXQgcGFyYW0gY2hlY2suIDA6IGtlZXAgZGVm
YXVsdCB2YWx1ZS4gbmVnYXRpdmU6DQppbmZpbml0eSB0aW1lb3V0Lg0KdjQ6IHJlZmFjdG9yIGNv
ZGVzLg0KDQpDaGFuZ2UtSWQ6IEkyNjcwOGMxNjNkYjk0M2ZmOGQ5MzBkZDgxYmNhYjRiNGI5ZDg0
ZWIyDQpTaWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTMgKysrKysrKysrLS0t
LQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCmluZGV4IGU3NGExNzUuLmU0NDhm
OGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KQEAgLTI0NSw3
ICsyNDUsOCBAQCBtb2R1bGVfcGFyYW1fbmFtZWQobXNpLCBhbWRncHVfbXNpLCBpbnQsIDA0NDQp
Ow0KICAqIEJ5IGRlZmF1bHQod2l0aCBubyBsb2NrdXBfdGltZW91dCBzZXR0aW5ncyksIHRoZSB0
aW1lb3V0IGZvciBhbGwgbm9uLWNvbXB1dGUoR0ZYLCBTRE1BIGFuZCBWaWRlbykNCiAgKiBqb2Jz
IGlzIDEwMDAwLiBBbmQgdGhlcmUgaXMgbm8gdGltZW91dCBlbmZvcmNlZCBvbiBjb21wdXRlIGpv
YnMuDQogICovDQotTU9EVUxFX1BBUk1fREVTQyhsb2NrdXBfdGltZW91dCwgIkdQVSBsb2NrdXAg
dGltZW91dCBpbiBtcyAoZGVmYXVsdDogMTAwMDAgZm9yIG5vbi1jb21wdXRlIGpvYnMgYW5kIG5v
IHRpbWVvdXQgZm9yIGNvbXB1dGUgam9icyksICINCitNT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90
aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0IGluIG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9u
LWNvbXB1dGUgam9icyBhbmQgaW5maW5pdHkgdGltZW91dCBmb3IgY29tcHV0ZSBqb2JzLiINCisJ
CSIgMDoga2VlcCBkZWZhdWx0IHZhbHVlLiBuZWdhdGl2ZTogaW5maW5pdHkgdGltZW91dCksICIN
CiAJCSJmb3JtYXQgaXMgW05vbi1Db21wdXRlXSBvciBbR0ZYLENvbXB1dGUsU0RNQSxWaWRlb10i
KTsNCiBtb2R1bGVfcGFyYW1fc3RyaW5nKGxvY2t1cF90aW1lb3V0LCBhbWRncHVfbG9ja3VwX3Rp
bWVvdXQsIHNpemVvZihhbWRncHVfbG9ja3VwX3RpbWVvdXQpLCAwNDQ0KTsNCiANCkBAIC0xMzAw
LDcgKzEzMDEsOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Mo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCSAqIEJ5IGRlZmF1bHQgdGltZW91dCBmb3Ig
bm9uIGNvbXB1dGUgam9icyBpcyAxMDAwMC4NCiAJICogQW5kIHRoZXJlIGlzIG5vIHRpbWVvdXQg
ZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KIAkgKi8NCi0JYWRldi0+Z2Z4X3RpbWVvdXQgPSBh
ZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1lb3V0ID0gMTAwMDA7DQorCWFkZXYt
PmdmeF90aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcygxMDAwMCk7DQorCWFkZXYtPnNkbWFfdGlt
ZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsNCiAJYWRldi0+
Y29tcHV0ZV90aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7DQogDQogCWlmIChzdHJubGVu
KGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEgpKSB7DQpAQCAtMTMxMCwxMCAr
MTMxMiwxMyBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCQkJaWYgKHJldCkNCiAJCQkJcmV0dXJuIHJldDsN
CiANCi0JCQkvKiBJbnZhbGlkYXRlIDAgYW5kIG5lZ2F0aXZlIHZhbHVlcyAqLw0KLQkJCWlmICh0
aW1lb3V0IDw9IDApIHsNCisJCQlpZiAodGltZW91dCA9PSAwKSB7DQogCQkJCWluZGV4Kys7DQog
CQkJCWNvbnRpbnVlOw0KKwkJCX0gZWxzZSBpZiAodGltZW91dCA8IDApIHsNCisJCQkJdGltZW91
dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOw0KKwkJCX0gZWxzZSB7DQorCQkJCXRpbWVvdXQgPSBt
c2Vjc190b19qaWZmaWVzKHRpbWVvdXQpOw0KIAkJCX0NCiANCiAJCQlzd2l0Y2ggKGluZGV4Kysp
IHsNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
