Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0732926746
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B49C89C1A;
	Wed, 22 May 2019 15:51:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4564989C27
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:51:34 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2578.namprd12.prod.outlook.com (52.132.27.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 15:51:30 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 15:51:30 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/amdkfd: Allocate gws on device initialization
Thread-Topic: [PATCH 3/7] drm/amdkfd: Allocate gws on device initialization
Thread-Index: AQHVELY4yIeSMoR/SkqWNWo7s3EHmA==
Date: Wed, 22 May 2019 15:51:29 +0000
Message-ID: <1558540278-23734-3-git-send-email-Oak.Zeng@amd.com>
References: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e78ecf8-7331-4734-d4cd-08d6decd5b0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2578; 
x-ms-traffictypediagnostic: BL0PR12MB2578:
x-microsoft-antispam-prvs: <BL0PR12MB2578396EAD1DAA0DFE82B4C080000@BL0PR12MB2578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(64756008)(66446008)(6916009)(8676002)(66476007)(66556008)(73956011)(316002)(102836004)(53936002)(68736007)(2906002)(2501003)(66946007)(76176011)(7736002)(52116002)(186003)(2351001)(305945005)(5640700003)(81166006)(81156014)(386003)(6506007)(8936002)(6436002)(6512007)(26005)(54906003)(256004)(14444005)(478600001)(50226002)(11346002)(476003)(2616005)(446003)(486006)(71200400001)(3846002)(6116002)(66066001)(36756003)(71190400001)(99286004)(14454004)(25786009)(4326008)(86362001)(5660300002)(72206003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2578;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WzzpbXXcSKmt9e8meTzVeuTFZZ5k/3kQZYKJxsNg0ZBdMSuNCOEzfj0QS4HcNUcbGsuDmnExm16q9y7YO3TzhHLSqsvZ6yr3R9idFdmgVNXbTNpM1psBl701LO5yJ3l551aPfmvBc010k6x1L1DFFAYfkoT3z/PaiB9dkn4gT+hAJXlEdwL53Z94Knc1LvDIBdm5Tiw47C7C0pvpz/kGxm7y4GpABoDaQlu5Ca6tqsoOkBf9TkEaaTm8WMvHcu5tBjtZawYPMtQswm21+rJc0sRB0BskDHxi0u+Bel6AXa4GX371N7Tf7JBsuGcYg23Kw0hFo7C9WgCG9mLebPliOVhlnNyCURI6cVlb5KXwY7mQvbMi4V2RX3R1R6uD6NexO277WNPEr8v2gUfJ2KXA820HXuR5q0b7FUDHmXnT5+w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e78ecf8-7331-4734-d4cd-08d6decd5b0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:51:30.0047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4/t/89Okv1kYBUSu0SaYTEb3BBVhugmCPxKuPHy7hs=;
 b=s/7m7KWddw9Fm81bg/2xg8j3ykntRWUMIZsVcZ3EXzU0Tmh/yiAaPs6wWE72Obs+QpJnR+Dj/4JlVnSwJCQE35rh1ygq5LIRZtB/ZlspdeSCezF78de7qStc44V0nRCEhR50Quw+dqfAzu6zUrGYUnmgT4+Ni8hxN9JdBeqdV0A=
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
