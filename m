Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98228613
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 20:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75F66E062;
	Thu, 23 May 2019 18:41:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9406E05A
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 18:41:02 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 18:41:01 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 18:41:01 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/amdkfd: Allocate gws on device initialization
Thread-Topic: [PATCH 3/7] drm/amdkfd: Allocate gws on device initialization
Thread-Index: AQHVEZcRgJHQsFyNHEa40Vjz0auzYw==
Date: Thu, 23 May 2019 18:41:01 +0000
Message-ID: <1558636843-9867-3-git-send-email-Oak.Zeng@amd.com>
References: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::24)
 To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0c960b6-a7ac-4827-7e6b-08d6dfae3424
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB23398278A53B2B23214B80E780010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(81156014)(8676002)(8936002)(305945005)(81166006)(7736002)(68736007)(36756003)(50226002)(71200400001)(2351001)(4326008)(53936002)(71190400001)(486006)(476003)(99286004)(52116002)(6506007)(102836004)(5640700003)(25786009)(6512007)(66066001)(54906003)(386003)(76176011)(14444005)(256004)(2906002)(66476007)(64756008)(186003)(26005)(86362001)(66946007)(66446008)(66556008)(73956011)(6116002)(6486002)(11346002)(2616005)(5660300002)(478600001)(2501003)(6916009)(3846002)(14454004)(446003)(72206003)(316002)(6436002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AMT/AfSXhP37EgDgRD3r5t7PFjhKYdzXQCs2u+FIkIS0HhGkkNi2spgFvn5YzfWSfjZgHv02A2g48kxC7I77BH/gvtpELYRQvGc9ANivhK5TFdYrdR91eardY7Y32bADh0uNTiCbzTLqqL5V2cYMZ01Ksr4gxyCNeTpFZYU9iikQRz1ERDJUvReN+ad/8/Dh2izMTsdlK0rrt3mHy4WUtHOb2Sw0ehtRekOsDaxabiLj8bAjODtiWLocO0Ru5BG00Pmm3hryiTGyx8aRF5+GZxChcx+csZOBh3E4wRBEGmhKQRYupo9fB4d7ZvHAil6OU2yxcoD/V7dmcC6pNSBNDRFAClBZHOn0lP81zUYTtR/rvYeKBXuIjKHKjHY+iaFIbQqirV0KptiWAcIt/q7GibQv0uH7PqCG6GwcVWEehwE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c960b6-a7ac-4827-7e6b-08d6dfae3424
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 18:41:01.6631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4/t/89Okv1kYBUSu0SaYTEb3BBVhugmCPxKuPHy7hs=;
 b=1SRYN4MEgIvsO58jk4mPR/5geNI8m5GwVY5InI9xcYQnUujjHiVO1jnCZlBZPH8RbgeeBHo4VpVo1mEcLRv3jcG9SBQC3lReDN/lKgNmHhAO8vlJn8AKpZV6/q7vvosSnonDTkwQGvtAhd/0bb08KvL0imjhnvyap4z3zVwJRPI=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gZGV2aWNlIGluaXRpYWxpemF0aW9uLCBLRkQgYWxsb2NhdGVzIGFsbCAoNjQpIGd3cyB3aGlj
aA0KaXMgc2hhcmVkIGJ5IGFsbCBLRkQgcHJvY2Vzc2VzLg0KDQpDaGFuZ2UtSWQ6IEkxZjEyNzRi
OGQ0ZjZhOGFkMDg3ODVlMjc5MWE5YTc5ZGVmNzVlOTEzDQpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVu
ZyA8T2FrLlplbmdAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYyB8IDE0ICsrKysrKysrKysrKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3ByaXYuaCAgIHwgIDMgKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMN
CmluZGV4IDdiNGVhMjQuLjlkMWIwMjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYw0KQEAgLTU1Myw2ICs1NTMsMTMgQEAgYm9vbCBrZ2Qya2ZkX2RldmljZV9pbml0
KHN0cnVjdCBrZmRfZGV2ICprZmQsDQogCX0gZWxzZQ0KIAkJa2ZkLT5tYXhfcHJvY19wZXJfcXVh
bnR1bSA9IGh3c19tYXhfY29uY19wcm9jOw0KIA0KKwkvKiBBbGxvY2F0ZSBnbG9iYWwgR1dTIHRo
YXQgaXMgc2hhcmVkIGJ5IGFsbCBLRkQgcHJvY2Vzc2VzICovDQorCWlmIChod3NfZ3dzX3N1cHBv
cnQgJiYgYW1kZ3B1X2FtZGtmZF9hbGxvY19nd3Moa2ZkLT5rZ2QsDQorCQkJYW1kZ3B1X2FtZGtm
ZF9nZXRfbnVtX2d3cyhrZmQtPmtnZCksICZrZmQtPmd3cykpIHsNCisJCWRldl9lcnIoa2ZkX2Rl
dmljZSwgIkNvdWxkIG5vdCBhbGxvY2F0ZSAlZCBnd3NcbiIsDQorCQkJYW1kZ3B1X2FtZGtmZF9n
ZXRfbnVtX2d3cyhrZmQtPmtnZCkpOw0KKwkJZ290byBvdXQ7DQorCX0NCiAJLyogY2FsY3VsYXRl
IG1heCBzaXplIG9mIG1xZHMgbmVlZGVkIGZvciBxdWV1ZXMgKi8NCiAJc2l6ZSA9IG1heF9udW1f
b2ZfcXVldWVzX3Blcl9kZXZpY2UgKg0KIAkJCWtmZC0+ZGV2aWNlX2luZm8tPm1xZF9zaXplX2Fs
aWduZWQ7DQpAQCAtNTc2LDcgKzU4Myw3IEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1
Y3Qga2ZkX2RldiAqa2ZkLA0KIAkJCSZrZmQtPmd0dF9zdGFydF9ncHVfYWRkciwgJmtmZC0+Z3R0
X3N0YXJ0X2NwdV9wdHIsDQogCQkJZmFsc2UpKSB7DQogCQlkZXZfZXJyKGtmZF9kZXZpY2UsICJD
b3VsZCBub3QgYWxsb2NhdGUgJWQgYnl0ZXNcbiIsIHNpemUpOw0KLQkJZ290byBvdXQ7DQorCQln
b3RvIGFsbG9jX2d0dF9tZW1fZmFpbHVyZTsNCiAJfQ0KIA0KIAlkZXZfaW5mbyhrZmRfZGV2aWNl
LCAiQWxsb2NhdGVkICVkIGJ5dGVzIG9uIGdhcnRcbiIsIHNpemUpOw0KQEAgLTY0Niw2ICs2NTMs
OSBAQCBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCiAJa2Zk
X2d0dF9zYV9maW5pKGtmZCk7DQoga2ZkX2d0dF9zYV9pbml0X2Vycm9yOg0KIAlhbWRncHVfYW1k
a2ZkX2ZyZWVfZ3R0X21lbShrZmQtPmtnZCwga2ZkLT5ndHRfbWVtKTsNCithbGxvY19ndHRfbWVt
X2ZhaWx1cmU6DQorCWlmIChod3NfZ3dzX3N1cHBvcnQpDQorCQlhbWRncHVfYW1ka2ZkX2ZyZWVf
Z3dzKGtmZC0+a2dkLCBrZmQtPmd3cyk7DQogCWRldl9lcnIoa2ZkX2RldmljZSwNCiAJCSJkZXZp
Y2UgJXg6JXggTk9UIGFkZGVkIGR1ZSB0byBlcnJvcnNcbiIsDQogCQlrZmQtPnBkZXYtPnZlbmRv
ciwga2ZkLT5wZGV2LT5kZXZpY2UpOw0KQEAgLTY2Myw2ICs2NzMsOCBAQCB2b2lkIGtnZDJrZmRf
ZGV2aWNlX2V4aXQoc3RydWN0IGtmZF9kZXYgKmtmZCkNCiAJCWtmZF9kb29yYmVsbF9maW5pKGtm
ZCk7DQogCQlrZmRfZ3R0X3NhX2Zpbmkoa2ZkKTsNCiAJCWFtZGdwdV9hbWRrZmRfZnJlZV9ndHRf
bWVtKGtmZC0+a2dkLCBrZmQtPmd0dF9tZW0pOw0KKwkJaWYgKGh3c19nd3Nfc3VwcG9ydCkNCisJ
CQlhbWRncHVfYW1ka2ZkX2ZyZWVfZ3dzKGtmZC0+a2dkLCBrZmQtPmd3cyk7DQogCX0NCiANCiAJ
a2ZyZWUoa2ZkKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KaW5kZXggMzM4
ZmIwNy4uNTk2OWUzNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcml2LmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCkBA
IC0yODgsNiArMjg4LDkgQEAgc3RydWN0IGtmZF9kZXYgew0KIA0KIAkvKiBDb21wdXRlIFByb2Zp
bGUgcmVmLiBjb3VudCAqLw0KIAlhdG9taWNfdCBjb21wdXRlX3Byb2ZpbGU7DQorDQorCS8qIEds
b2JhbCBHV1MgcmVzb3VyY2Ugc2hhcmVkIGIvdCBwcm9jZXNzZXMqLw0KKwl2b2lkICpnd3M7DQog
fTsNCiANCiBlbnVtIGtmZF9tZW1wb29sIHsNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
