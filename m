Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E487B28D54
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 00:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F176E08A;
	Thu, 23 May 2019 22:41:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0A16E088
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 22:41:15 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 22:41:15 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 22:41:15 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/amdkfd: Allocate gws on device initialization
Thread-Topic: [PATCH 3/8] drm/amdkfd: Allocate gws on device initialization
Thread-Index: AQHVEbih6qQ7J5q/O0W8Rs4sTW8Eow==
Date: Thu, 23 May 2019 22:41:15 +0000
Message-ID: <1558651263-3478-3-git-send-email-Oak.Zeng@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a16bd95-8dea-4ef3-853e-08d6dfcfc361
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB233942FAF78D254C6BAF48D680010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(81156014)(8676002)(81166006)(71190400001)(8936002)(305945005)(68736007)(7736002)(50226002)(71200400001)(2351001)(4326008)(53936002)(36756003)(486006)(476003)(99286004)(52116002)(102836004)(5640700003)(25786009)(6512007)(66066001)(6506007)(54906003)(386003)(76176011)(73956011)(14444005)(256004)(2906002)(186003)(66476007)(64756008)(26005)(86362001)(66946007)(66446008)(66556008)(6486002)(2616005)(5660300002)(11346002)(478600001)(6916009)(2501003)(6116002)(3846002)(14454004)(446003)(72206003)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0aZIZ2ozpS4lIIEQ+eVJIAOHF0QnFUgIt0S8x929aRRIn9wjysXAgJJkLb2d/K70VwILiBffyLZvl5IEZNaZavITcUGaoK0EdvH5XOu/aiMxKFl13Kol58mgdkeNYaVpcdoyv52mL4ocn8/tkFj98RIOFHUTBVgcEFlrVawXgXkVr3IW78EFOKDvTg9OM8CCBiwE6AqYfGjOYH+bYEi8Lns2ls5FlkysEYDI2S3rDnCmIbOuHEdn99iEAKyFFEQKp2n1hHnQKkSFlD57dKE7t1ydWn9GyvpefuQ+Zo1vEtPwUpydupBI4cHy/mMzUtKBRP/rCLQN56umJgMIDo5RVH/E2+KrQmGmykO6EmYutpmHwz6awyr4iTVstSbP01cDk95/6l0qBlTjMk0zlPu40U0fXyTUXZSTW/M6ojP6xqk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a16bd95-8dea-4ef3-853e-08d6dfcfc361
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 22:41:15.1055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4/t/89Okv1kYBUSu0SaYTEb3BBVhugmCPxKuPHy7hs=;
 b=YwuRtCW+eSGpwYyNUUVDkG8l8l44fflyCg5lD1LkXiPPWhObVjOZdllG4B3f5vc2a8quKUYZ6DaJ1zvL/u/FjasCHCn0PXn2HtqOkVoJm5bWf6ooGCA0kBrz06ru8OJ60APG9xG4XAP9bxQmap0/Wi1WaXbktgxEQFrLx8dQ6mc=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng,
 Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
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
