Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B21A0E9
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 18:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1463989FC3;
	Fri, 10 May 2019 16:01:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780087.outbound.protection.outlook.com [40.107.78.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8773089FC3
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 16:01:22 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2434.namprd12.prod.outlook.com (52.132.11.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 16:01:21 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 16:01:21 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/amdkfd: Allocate gws on device initialization
Thread-Topic: [PATCH 4/8] drm/amdkfd: Allocate gws on device initialization
Thread-Index: AQHVB0mcNwd6JskveUioRPgfH+74cQ==
Date: Fri, 10 May 2019 16:01:21 +0000
Message-ID: <1557504063-1559-4-git-send-email-Oak.Zeng@amd.com>
References: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ab914a6-6438-4399-2deb-08d6d560be7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2434; 
x-ms-traffictypediagnostic: BL0PR12MB2434:
x-microsoft-antispam-prvs: <BL0PR12MB2434EC410CA02D9B0A9D365B800C0@BL0PR12MB2434.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(2906002)(5660300002)(4326008)(186003)(6116002)(102836004)(26005)(478600001)(11346002)(446003)(72206003)(53936002)(2616005)(476003)(36756003)(6512007)(2351001)(14454004)(2501003)(486006)(3846002)(25786009)(8676002)(81166006)(81156014)(5640700003)(68736007)(6486002)(6436002)(316002)(71190400001)(86362001)(7736002)(305945005)(50226002)(54906003)(6916009)(8936002)(99286004)(71200400001)(66946007)(64756008)(66556008)(66476007)(66446008)(73956011)(76176011)(386003)(6506007)(14444005)(256004)(52116002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2434;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d81zrnyCVXIUQcrJhHzN1iw4mbjqyU+FMxB5g450beoRUZMEaSW3yl+1psI46QvNXkPH5EfbLiCwZ8sxt7+FN2g6jhsSRq+0czkxow0/IIwOcfZg9f/1qQYrWMUhOFxSXTBmDP1i139d4ruG72/rGSJ9AB4u593dqCMBtYGMW6NPFz/h/QKbnWuvuUWyV4npO67aQhalWchnhWycByAsD49HDWBnqtQKkbpNixiCOxgeh6q83tupbfKZgqV1C7+2SiacyQTHV4HvpKVlfFxeXgoC5xTHxcyOFP7mgFn5zUEUs1nZq9SFfmiBTeqhcEhEXnH2trO66GistwIfdlXQXupXJ+HuNbxe/CH2UVsq1aZbQw+EVZkwtN8rZ0S0lFuCzGZQacdsd3b1oAe/Y0m4WJQZ5Qq/W6TzEfTZjymBUeE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab914a6-6438-4399-2deb-08d6d560be7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 16:01:21.1469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hQu9rOu9ENtEFFn63K2Qox9Z7zSZUiVacgui8/ec88=;
 b=y4mT35HVC31KrESC9CYhviFsQSDijKVsT2/OLZKU8iykYMeyvQaSU1YGQ/sZnsNqpF4ZQ/f9CyL83VeZmNDaHIzI18e900W+lbyWRUD99QW8EW5WZp2zJJW2gl51ow36trzjJ39c8R0Hxv0sMKLQ5BunD7UTx5ELIG1tbbYIsE8=
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
LmMNCmluZGV4IGE1M2RkYTkuLmIwOGRjMjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYw0KQEAgLTU1Miw2ICs1NTIsMTMgQEAgYm9vbCBrZ2Qya2ZkX2RldmljZV9p
bml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQogCX0gZWxzZQ0KIAkJa2ZkLT5tYXhfcHJvY19wZXJf
cXVhbnR1bSA9IGh3c19tYXhfY29uY19wcm9jOw0KIA0KKwkvKiBBbGxvY2F0ZSBnbG9iYWwgR1dT
IHRoYXQgaXMgc2hhcmVkIGJ5IGFsbCBLRkQgcHJvY2Vzc2VzICovDQorCWlmIChod3NfZ3dzX3N1
cHBvcnQgJiYgYW1kZ3B1X2FtZGtmZF9hbGxvY19nd3Moa2ZkLT5rZ2QsDQorCQkJYW1kZ3B1X2Ft
ZGtmZF9nZXRfbnVtX2d3cyhrZmQtPmtnZCksICZrZmQtPmd3cykpIHsNCisJCWRldl9lcnIoa2Zk
X2RldmljZSwgIkNvdWxkIG5vdCBhbGxvY2F0ZSAlZCBnd3NcbiIsDQorCQkJYW1kZ3B1X2FtZGtm
ZF9nZXRfbnVtX2d3cyhrZmQtPmtnZCkpOw0KKwkJZ290byBvdXQ7DQorCX0NCiAJLyogY2FsY3Vs
YXRlIG1heCBzaXplIG9mIG1xZHMgbmVlZGVkIGZvciBxdWV1ZXMgKi8NCiAJc2l6ZSA9IG1heF9u
dW1fb2ZfcXVldWVzX3Blcl9kZXZpY2UgKg0KIAkJCWtmZC0+ZGV2aWNlX2luZm8tPm1xZF9zaXpl
X2FsaWduZWQ7DQpAQCAtNTc1LDcgKzU4Miw3IEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChz
dHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KIAkJCSZrZmQtPmd0dF9zdGFydF9ncHVfYWRkciwgJmtmZC0+
Z3R0X3N0YXJ0X2NwdV9wdHIsDQogCQkJZmFsc2UpKSB7DQogCQlkZXZfZXJyKGtmZF9kZXZpY2Us
ICJDb3VsZCBub3QgYWxsb2NhdGUgJWQgYnl0ZXNcbiIsIHNpemUpOw0KLQkJZ290byBvdXQ7DQor
CQlnb3RvIGFsbG9jX2d0dF9tZW1fZmFpbHVyZTsNCiAJfQ0KIA0KIAlkZXZfaW5mbyhrZmRfZGV2
aWNlLCAiQWxsb2NhdGVkICVkIGJ5dGVzIG9uIGdhcnRcbiIsIHNpemUpOw0KQEAgLTY0NSw2ICs2
NTIsOSBAQCBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCiAJ
a2ZkX2d0dF9zYV9maW5pKGtmZCk7DQoga2ZkX2d0dF9zYV9pbml0X2Vycm9yOg0KIAlhbWRncHVf
YW1ka2ZkX2ZyZWVfZ3R0X21lbShrZmQtPmtnZCwga2ZkLT5ndHRfbWVtKTsNCithbGxvY19ndHRf
bWVtX2ZhaWx1cmU6DQorCWlmIChod3NfZ3dzX3N1cHBvcnQpDQorCQlhbWRncHVfYW1ka2ZkX2Zy
ZWVfZ3dzKGtmZC0+a2dkLCBrZmQtPmd3cyk7DQogCWRldl9lcnIoa2ZkX2RldmljZSwNCiAJCSJk
ZXZpY2UgJXg6JXggTk9UIGFkZGVkIGR1ZSB0byBlcnJvcnNcbiIsDQogCQlrZmQtPnBkZXYtPnZl
bmRvciwga2ZkLT5wZGV2LT5kZXZpY2UpOw0KQEAgLTY2Miw2ICs2NzIsOCBAQCB2b2lkIGtnZDJr
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
