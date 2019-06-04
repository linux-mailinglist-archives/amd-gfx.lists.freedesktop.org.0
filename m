Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ABD34CD4
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 18:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E9B89173;
	Tue,  4 Jun 2019 16:07:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810042.outbound.protection.outlook.com [40.107.81.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C7489173
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 16:07:08 +0000 (UTC)
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3871.namprd12.prod.outlook.com (10.255.237.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 16:07:07 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6%6]) with mapi id 15.20.1965.011; Tue, 4 Jun 2019
 16:07:07 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>
Subject: [PATCH] drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
Thread-Topic: [PATCH] drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
Thread-Index: AQHVGu+OrT/8P8EeokmFRVCBZI4Fag==
Date: Tue, 4 Jun 2019 16:07:07 +0000
Message-ID: <1559664412-5512-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::29) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.156.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85cdd259-abfe-45bd-b4ea-08d6e906b126
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3871; 
x-ms-traffictypediagnostic: MN2PR12MB3871:
x-microsoft-antispam-prvs: <MN2PR12MB38711BBB335DCCF931C52594F2150@MN2PR12MB3871.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(5660300002)(386003)(7736002)(256004)(81166006)(486006)(2616005)(6436002)(476003)(110136005)(81156014)(6116002)(3846002)(71190400001)(71200400001)(26005)(305945005)(6486002)(99286004)(53936002)(54906003)(72206003)(102836004)(66946007)(66066001)(8936002)(8676002)(6506007)(4326008)(6636002)(73956011)(66556008)(36756003)(25786009)(186003)(66476007)(64756008)(66446008)(86362001)(316002)(50226002)(6512007)(2906002)(52116002)(68736007)(14454004)(478600001)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3871;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YGfC7IX7h+DdS4KRglmOu5eMiOG0umKLAKDXCVFKjBaOhtNT1jnhqqb+9HwZwyY+Ua+cRp7aO2n6ag0Eh6pF16aYptEh0uX26xhoNbI8F7l/A+CjRB1UhreFmxZaA5w54UtOhYdFlLO3iBVp1CtDIKdXnfffK6NZay/2zkRNgXZHp9yH1lLg74BcUcjqEpgZCwdcrg2xh0Tpa5GPoaDENol+MbiR7t6UFNoz1QUYbRfzOdZiw4es1Yv5MUIqGPlcjUlYJBuuMAWUyb+cf9ln6dUYr4r+g0X7iBM3qnIAjDDRVlYfn9bedKhwbSAaUlsY03vgb3aZ0Yh3KIaysrl9r17ecQEDdrnSbOVMfd1yg1CQLx46d9nCG+lHkzmiM425huQp/meCMOUO1ishS0VsvTs2BhSLf5WDFoPzH9RmvyY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cdd259-abfe-45bd-b4ea-08d6e906b126
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 16:07:07.4661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshankar@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTKPoOBGzbjsujyKODPofNpETI3PabxUOb1scksc8AA=;
 b=BWW3msSAftFb7GJY+Kbaxruqvqiny+3hO87QoUUW9I6vfErkp5dffwzKubJ7GOHO+g2TdEv3AVzGKm431KMRZzoBVUfk7uPC96bJgxYPD9B3zkzpTPQ5qZhGOqKfW1PLKsT28wUxO+RZCL4+agxsaxxIL2EUIrO+iB1wgvHhqlU=
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
Cc: "Li, Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S, 
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doYXRdDQpyZWFkcHRyIHJlYWQgYWx3YXlzIHJldHVybnMgemVybywgc2luY2UgbW9zdCBsaWtl
bHkNClVWRCBibG9jayBpcyBlaXRoZXIgcG93ZXIgb3IgY2xvY2sgZ2F0ZWQuDQoNCltIb3ddDQpm
ZXRjaCBycHRyIGFmdGVyIGFtZGdwdV9yaW5nX2FsbG9jKCkgd2hpY2ggaW5mb3Jtcw0KdGhlIHBv
d2VyIG1hbmFnZW1lbnQgY29kZSB0aGF0IHRoZSBibG9jayBpcyBhYm91dCB0byBiZQ0KdXNlZCBh
bmQgaGVuY2UgdGhlIGdhdGluZyBpcyB0dXJuZWQgb2ZmLg0KDQpTaWduZWQtb2ZmLWJ5OiBMb3Vp
cyBMaSA8Q2hpbmctc2hpaC5MaUBhbWQuY29tPg0KU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxz
aGlyaXNoLnNAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y24uYyB8IDQgKysrLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMg
ICB8IDUgKysrKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jICAgfCA1
ICsrKystDQogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jDQppbmRleCAxMTg0NTFm
Li5kNzg2MDk4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Zjbi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMNCkBA
IC00NjgsNyArNDY4LDcgQEAgaW50IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9pYihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkNCiBpbnQgYW1kZ3B1X3Zjbl9lbmNfcmlu
Z190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KIHsNCiAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Ow0KLQl1aW50MzJfdCBycHRyID0gYW1kZ3B1X3Jp
bmdfZ2V0X3JwdHIocmluZyk7DQorCXVpbnQzMl90IHJwdHI7DQogCXVuc2lnbmVkIGk7DQogCWlu
dCByOw0KIA0KQEAgLTQ3Niw2ICs0NzYsOCBAQCBpbnQgYW1kZ3B1X3Zjbl9lbmNfcmluZ190ZXN0
X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KIAlpZiAocikNCiAJCXJldHVybiByOw0K
IA0KKwlycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7DQorDQogCWFtZGdwdV9yaW5n
X3dyaXRlKHJpbmcsIFZDTl9FTkNfQ01EX0VORCk7DQogCWFtZGdwdV9yaW5nX2NvbW1pdChyaW5n
KTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYw0KaW5kZXggYzYxYTMxNC4u
MTY2ODJiNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8w
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCkBAIC0xNzAs
MTMgKzE3MCwxNiBAQCBzdGF0aWMgdm9pZCB1dmRfdjZfMF9lbmNfcmluZ19zZXRfd3B0cihzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQogc3RhdGljIGludCB1dmRfdjZfMF9lbmNfcmluZ190ZXN0
X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KIHsNCiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSByaW5nLT5hZGV2Ow0KLQl1aW50MzJfdCBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0
X3JwdHIocmluZyk7DQorCXVpbnQzMl90IHJwdHI7DQogCXVuc2lnbmVkIGk7DQogCWludCByOw0K
IA0KIAlyID0gYW1kZ3B1X3JpbmdfYWxsb2MocmluZywgMTYpOw0KIAlpZiAocikNCiAJCXJldHVy
biByOw0KKw0KKwlycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7DQorDQogCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIEhFVkNfRU5DX0NNRF9FTkQpOw0KIAlhbWRncHVfcmluZ19jb21t
aXQocmluZyk7DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMNCmluZGV4IGNk
Yjk2ZDQuLjc0ODExYjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91
dmRfdjdfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jDQpA
QCAtMTc1LDcgKzE3NSw3IEBAIHN0YXRpYyB2b2lkIHV2ZF92N18wX2VuY19yaW5nX3NldF93cHRy
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCiBzdGF0aWMgaW50IHV2ZF92N18wX2VuY19yaW5n
X3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQogew0KIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7DQotCXVpbnQzMl90IHJwdHIgPSBhbWRncHVfcmlu
Z19nZXRfcnB0cihyaW5nKTsNCisJdWludDMyX3QgcnB0cjsNCiAJdW5zaWduZWQgaTsNCiAJaW50
IHI7DQogDQpAQCAtMTg1LDYgKzE4NSw5IEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX3Jpbmdf
dGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCiAJciA9IGFtZGdwdV9yaW5nX2Fs
bG9jKHJpbmcsIDE2KTsNCiAJaWYgKHIpDQogCQlyZXR1cm4gcjsNCisNCisJcnB0ciA9IGFtZGdw
dV9yaW5nX2dldF9ycHRyKHJpbmcpOw0KKw0KIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBIRVZD
X0VOQ19DTURfRU5EKTsNCiAJYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOw0KIA0KLS0gDQoyLjcu
NA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
