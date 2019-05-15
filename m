Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4551FB8D
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCB48920D;
	Wed, 15 May 2019 20:37:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160888919E
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:37:55 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2818.namprd12.prod.outlook.com (20.177.207.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 20:37:54 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 20:37:54 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/amdkfd: Allocate gws on device initialization
Thread-Topic: [PATCH 3/7] drm/amdkfd: Allocate gws on device initialization
Thread-Index: AQHVC14SuvOIZtRxmkOa/5xVU5ky5g==
Date: Wed, 15 May 2019 20:37:53 +0000
Message-ID: <1557952664-12218-3-git-send-email-Oak.Zeng@amd.com>
References: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: ea787bc0-ac2e-42f6-224d-08d6d97534ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2818; 
x-ms-traffictypediagnostic: BL0PR12MB2818:
x-microsoft-antispam-prvs: <BL0PR12MB281857271993F5381761E2D880090@BL0PR12MB2818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(366004)(199004)(189003)(8676002)(2906002)(186003)(8936002)(6506007)(386003)(50226002)(81156014)(81166006)(102836004)(3846002)(6116002)(72206003)(14454004)(66066001)(54906003)(71190400001)(71200400001)(14444005)(256004)(5660300002)(76176011)(52116002)(66446008)(64756008)(66476007)(66556008)(66946007)(73956011)(99286004)(7736002)(305945005)(53936002)(6916009)(86362001)(6436002)(486006)(6486002)(476003)(446003)(2616005)(11346002)(5640700003)(2501003)(2351001)(26005)(478600001)(6512007)(4326008)(25786009)(36756003)(68736007)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2818;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4qJLHKBA4DmbIYqlZOZv/9u4Fdof7KKPP3JqTIwH+8OXvAWNu2i/QAmcdv2gs6tIz175kT5LUsXXq4a40HYmBxju7GGiykjJJ0okiHPKSmldIAEudWsQEU+H9WHx8tcbdA2/8W6tDOvdWDTJhcVHHuLT/N1IJ7qDK3i3vYGXow4KU2GdbH6aphmtmEQbVUDbSkc2ykuKyW41M9NiwJFKunKPb+Vi+/0n+UFAr/Z1+yHNlHYvYimFuwcjaEX0Qob/yzscJR5VT7Nj6wJbwm43n3qxkmRg8X9QluKCUVKf4EUcrkti7XD0r9hZypkzXwUD1fio7+m8I0lQEdWI/Rk9E0JvOQjWO5jVU4dhoApc86+dx3tsF0hcmYmAPdzcDLHSruYLiREEi5mCubzBPMoH9SRVXJ+ZBEBHPavT2YRLcmc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea787bc0-ac2e-42f6-224d-08d6d97534ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 20:37:54.0219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1u9QkSwmoSfhseQeraeSUyG7cmbZS/E1W+hnPnsQOs=;
 b=LsiBtmHkj9trpOEuFtrWqpqeriiz0weGFCTFhBAxYUsTQgmmku0c0nOXfoVJNq94t2AwZknyRI7pXQdYtigX3ulkYbMKJODzb7vba7NeBViW+hBPA5+J18aKgzBPfqY7GaZb8FxbAI3mSNNn8h6vNUB/kQCjOPQe/Mb5GZUbN2E=
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
ZyA8T2FrLlplbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYyB8IDE0ICsrKysrKysrKysrKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaCAgIHwgIDMgKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
LmMNCmluZGV4IDdiNGVhMjQuLjlkMWIwMjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYw0KQEAgLTU1Myw2ICs1NTMsMTMgQEAgYm9vbCBrZ2Qya2ZkX2RldmljZV9p
bml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQogCX0gZWxzZQ0KIAkJa2ZkLT5tYXhfcHJvY19wZXJf
cXVhbnR1bSA9IGh3c19tYXhfY29uY19wcm9jOw0KIA0KKwkvKiBBbGxvY2F0ZSBnbG9iYWwgR1dT
IHRoYXQgaXMgc2hhcmVkIGJ5IGFsbCBLRkQgcHJvY2Vzc2VzICovDQorCWlmIChod3NfZ3dzX3N1
cHBvcnQgJiYgYW1kZ3B1X2FtZGtmZF9hbGxvY19nd3Moa2ZkLT5rZ2QsDQorCQkJYW1kZ3B1X2Ft
ZGtmZF9nZXRfbnVtX2d3cyhrZmQtPmtnZCksICZrZmQtPmd3cykpIHsNCisJCWRldl9lcnIoa2Zk
X2RldmljZSwgIkNvdWxkIG5vdCBhbGxvY2F0ZSAlZCBnd3NcbiIsDQorCQkJYW1kZ3B1X2FtZGtm
ZF9nZXRfbnVtX2d3cyhrZmQtPmtnZCkpOw0KKwkJZ290byBvdXQ7DQorCX0NCiAJLyogY2FsY3Vs
YXRlIG1heCBzaXplIG9mIG1xZHMgbmVlZGVkIGZvciBxdWV1ZXMgKi8NCiAJc2l6ZSA9IG1heF9u
dW1fb2ZfcXVldWVzX3Blcl9kZXZpY2UgKg0KIAkJCWtmZC0+ZGV2aWNlX2luZm8tPm1xZF9zaXpl
X2FsaWduZWQ7DQpAQCAtNTc2LDcgKzU4Myw3IEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChz
dHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KIAkJCSZrZmQtPmd0dF9zdGFydF9ncHVfYWRkciwgJmtmZC0+
Z3R0X3N0YXJ0X2NwdV9wdHIsDQogCQkJZmFsc2UpKSB7DQogCQlkZXZfZXJyKGtmZF9kZXZpY2Us
ICJDb3VsZCBub3QgYWxsb2NhdGUgJWQgYnl0ZXNcbiIsIHNpemUpOw0KLQkJZ290byBvdXQ7DQor
CQlnb3RvIGFsbG9jX2d0dF9tZW1fZmFpbHVyZTsNCiAJfQ0KIA0KIAlkZXZfaW5mbyhrZmRfZGV2
aWNlLCAiQWxsb2NhdGVkICVkIGJ5dGVzIG9uIGdhcnRcbiIsIHNpemUpOw0KQEAgLTY0Niw2ICs2
NTMsOSBAQCBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCiAJ
a2ZkX2d0dF9zYV9maW5pKGtmZCk7DQoga2ZkX2d0dF9zYV9pbml0X2Vycm9yOg0KIAlhbWRncHVf
YW1ka2ZkX2ZyZWVfZ3R0X21lbShrZmQtPmtnZCwga2ZkLT5ndHRfbWVtKTsNCithbGxvY19ndHRf
bWVtX2ZhaWx1cmU6DQorCWlmIChod3NfZ3dzX3N1cHBvcnQpDQorCQlhbWRncHVfYW1ka2ZkX2Zy
ZWVfZ3dzKGtmZC0+a2dkLCBrZmQtPmd3cyk7DQogCWRldl9lcnIoa2ZkX2RldmljZSwNCiAJCSJk
ZXZpY2UgJXg6JXggTk9UIGFkZGVkIGR1ZSB0byBlcnJvcnNcbiIsDQogCQlrZmQtPnBkZXYtPnZl
bmRvciwga2ZkLT5wZGV2LT5kZXZpY2UpOw0KQEAgLTY2Myw2ICs2NzMsOCBAQCB2b2lkIGtnZDJr
ZmRfZGV2aWNlX2V4aXQoc3RydWN0IGtmZF9kZXYgKmtmZCkNCiAJCWtmZF9kb29yYmVsbF9maW5p
KGtmZCk7DQogCQlrZmRfZ3R0X3NhX2Zpbmkoa2ZkKTsNCiAJCWFtZGdwdV9hbWRrZmRfZnJlZV9n
dHRfbWVtKGtmZC0+a2dkLCBrZmQtPmd0dF9tZW0pOw0KKwkJaWYgKGh3c19nd3Nfc3VwcG9ydCkN
CisJCQlhbWRncHVfYW1ka2ZkX2ZyZWVfZ3dzKGtmZC0+a2dkLCBrZmQtPmd3cyk7DQogCX0NCiAN
CiAJa2ZyZWUoa2ZkKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfcHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KaW5kZXgg
MzM4ZmIwNy4uNTk2OWUzNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wcml2LmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgN
CkBAIC0yODgsNiArMjg4LDkgQEAgc3RydWN0IGtmZF9kZXYgew0KIA0KIAkvKiBDb21wdXRlIFBy
b2ZpbGUgcmVmLiBjb3VudCAqLw0KIAlhdG9taWNfdCBjb21wdXRlX3Byb2ZpbGU7DQorDQorCS8q
IEdsb2JhbCBHV1MgcmVzb3VyY2Ugc2hhcmVkIGIvdCBwcm9jZXNzZXMqLw0KKwl2b2lkICpnd3M7
DQogfTsNCiANCiBlbnVtIGtmZF9tZW1wb29sIHsNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
