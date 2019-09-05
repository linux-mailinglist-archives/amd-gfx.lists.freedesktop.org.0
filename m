Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDBA9E3B
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B927489FBC;
	Thu,  5 Sep 2019 09:25:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790074.outbound.protection.outlook.com [40.107.79.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE0689FBC
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 09:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4nbNub7Gy94QXtMzgrhfT+FxJErYJQYmf7BjgNhL3yevXpWNoZveNmVx3q1peJcMnAqQo6fm9SAHEqxzYlrcyYf7LpQvZmsUGJKSkY0WGflEMy19Ch2whHb3HHu2OdxLVUYh8FbfBqHqgPaDrScOvx2CDyPeCXEXvg64RwvZGHfkq7IZg10eOxdTCvr88RZ5gMx+YgdtplE5nOQMLB11buhZuON2cI6LgQZv0iqjkW9u28QWJRVmG/gsl+8kgI0FMvBERJQBhUuulWFKvwJa1T7+rY6Hf7g8vxXBSyB7TQhxt0ZhKyIhqFtK6Z8z8LMNM36udjJHlEDTkaVFR+gOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGCX9+PPVJcR0pXTw3lp6RBLAbF4i4iyhHVBydVXRag=;
 b=gN3VG0Xnw/fqRrDBjbnqEu0plFk/ibdC5mtd1fdjd7iUAGCh6muPzlV0jMkj1Lw8mT3cO8u62Cek1OQsU3GboHgppKA24ltkGyQYgqUgVrk2e47u21xe4poGqVUOYtyk6aN1IzgEgoPvG8zr2Wn0yd89+KI4SyRbffvbD0QxhbIuUNO/Ne6RoMt+6b33OHBWXHbDEqa6D/bSpbv45/eKQ5BI30ZBGEkJbZUeBjXfse6MF6z3wfXQQ6eeiWubktipwhnEQ1g3mZq47L2dbyXtkVv1NbSKmDPS8UgeMjogwfvAUZsivZot4T4w/2a25qW1Btv11jmFZ7VA1PiYUplXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2881.namprd12.prod.outlook.com (20.179.65.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 09:25:46 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 09:25:45 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix 'unusedd variable' compile warning
Thread-Topic: [PATCH] drm/amd/powerplay: fix 'unusedd variable' compile warning
Thread-Index: AQHVY8vluvawTcHLNEugyERMvsFgPw==
Date: Thu, 5 Sep 2019 09:25:45 +0000
Message-ID: <20190905092526.5962-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0090.apcprd03.prod.outlook.com
 (2603:1096:203:72::30) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c977a3f7-5aa5-4b85-ead3-08d731e307d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB2881; 
x-ms-traffictypediagnostic: BN8PR12MB2881:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB2881C3E81A69DE617FA86E2E89BB0@BN8PR12MB2881.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(2616005)(66066001)(476003)(8936002)(486006)(53936002)(7736002)(81156014)(81166006)(8676002)(2906002)(54906003)(50226002)(316002)(186003)(26005)(305945005)(102836004)(6506007)(386003)(478600001)(6512007)(66946007)(6486002)(36756003)(5660300002)(5640700003)(3846002)(6116002)(99286004)(6436002)(256004)(66476007)(86362001)(71200400001)(2351001)(71190400001)(4326008)(1076003)(52116002)(2501003)(66556008)(14454004)(25786009)(6916009)(66446008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2881;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T5vbQQqpvUj2vpnRiT2EBS7+JccFZfo+xgvipi7dgkmy2p3jrSLukCbWkZnpY5GWFWFO3+gvh15LQMnQucHxErT8cA/H/4WkDHx/NvfeBntPt8DmkLfb8BOERqthYjQDgOm0VoZG5PbRqbmFERKp2no0nxjAdNsg7kaIJ3DpkdmZxQLCw0+YKMt55YPEuhHGL5YOaItilFyz5s5yD2iwuEwKijOGfqoR6nqFRAHkLzcAHj4763FbPVkq3oCrJbrdt31IlBPKG7PmQl5lM8WlrtPN2FGJS4JvfnhBJ3NfWNwDASfgdQb6xu5Vj5/XM0bxsiNM0TXGr/HdfUWrv/9ap/ihKFlVI8i+n3ESQ2MlRBud46H8E1kxIUbOnLXd8MXTIcLR68uDJBi24WKBQCcVH1SlxjAA8mWGSVBoCiFtyqE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c977a3f7-5aa5-4b85-ead3-08d731e307d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 09:25:45.7304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l+IgzG/SCa6BH5yKdsGt0GHXQkV9F46XlWFFrmq65yKpeop7kFiPAWXZ725uV08E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2881
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGCX9+PPVJcR0pXTw3lp6RBLAbF4i4iyhHVBydVXRag=;
 b=scp+kJQijwaNzXL8ifO2eGY6Cy/hBqI+GVtQD/pralS46t/8cA+x08AG7xlyHB57+gHFcrIFhWthfHBTW3hwg5hBH79Soj+N1TygL+RHJuszAvKvUTkXkzlzB4DluY5KKSTOgVa1lXatiBfpcxa0n339h2KYp40bOER3qWt7isA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDIgLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgIHwgMiAtLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jICAgfCAyIC0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICB8IDIgLS0KIDQgZmlsZXMgY2hhbmdlZCwg
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hcmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVz
X3BwdC5jCmluZGV4IDZlOGViMGY5NGM4Yi4uMWM2NzMyODQ3MTg1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwpAQCAtMTkzMSw3ICsxOTMxLDUgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsK
IAogdm9pZCBhcmN0dXJ1c19zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQog
ewotCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlID0gJnNtdS0+c211X3RhYmxl
OwotCiAJc211LT5wcHRfZnVuY3MgPSAmYXJjdHVydXNfcHB0X2Z1bmNzOwogfQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGUzYWRkOGI1OTI5MS4uMTY2
MzRlNjU3NTg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CkBAIC0xNjMwLDcgKzE2MzAsNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3Mg
bmF2aTEwX3BwdF9mdW5jcyA9IHsKIAogdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSkKIHsKLQlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90YWJs
ZSA9ICZzbXUtPnNtdV90YWJsZTsKLQogCXNtdS0+cHB0X2Z1bmNzID0gJm5hdmkxMF9wcHRfZnVu
Y3M7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXgg
YjdmYThiMTU4ZmYyLi5hNWNmODQ2YjUwZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9yZW5vaXJfcHB0LmMKQEAgLTI1Nyw4ICsyNTcsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAogdm9pZCByZW5vaXJfc2V0X3Bw
dF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHsKLQlzdHJ1Y3Qgc211X3RhYmxlX2Nv
bnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKLQogCXNtdS0+cHB0X2Z1bmNzID0g
JnJlbm9pcl9wcHRfZnVuY3M7CiAJc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTEyX0RSSVZFUl9J
Rl9WRVJTSU9OOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
dmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5j
CmluZGV4IDE4ZDFiNDMyZjcxOS4uOTI5ZjYxODkxZGZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0zMTgwLDcgKzMxODAsNSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgdmVnYTIwX3BwdF9mdW5jcyA9IHsKIAogdm9pZCB2ZWdh
MjBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHsKLQlzdHJ1Y3Qgc211
X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKLQogCXNtdS0+cHB0
X2Z1bmNzID0gJnZlZ2EyMF9wcHRfZnVuY3M7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
