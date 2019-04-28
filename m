Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558D3B59B
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268FB8919F;
	Sun, 28 Apr 2019 07:44:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850B689178
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:16 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:15 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:15 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/27] drm/amdkfd: Expose sdma engine numbers to topology
Thread-Topic: [PATCH 17/27] drm/amdkfd: Expose sdma engine numbers to topology
Thread-Index: AQHU/ZYtzOIuczX5vUKe+p/OOd202w==
Date: Sun, 28 Apr 2019 07:44:15 +0000
Message-ID: <20190428074331.30107-18-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1fbe5b4-4e84-416f-749a-08d6cbad5004
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB293329BF73FC3AFB39C4FC2292380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SVQ8nSA01yQLutc0M/8lzmahm1Rw/H3d9zoPbyQjnpep3ilifPTYsJkrnv8NabE2zSYhZVUxRxkdUwVhPlUr0TNcnX83UU6gTgWRfvo6UYuLzuI340h9jp8ANm1Ir/L5W3H98n9x55SuP/Z6d32MFsNMFc9nCtIeLE5cuZB1tpUZYwNYbCRdBK6FoZBRvz/YwcDjPJmIZnB/XtjWxr9zAKyGgPejzcSVsRPvUOvRhA9dq/Lzl41hN5SX46ef7nnhIbNo5s1T2+ua+Btv8QtK9gWLSZWtW/dHYNubs4myK4tsPUDBRQp9/05IlHqlQYzK1p8Cae7lYXL4gU/BzwcjGu2UDcPEW1OuvtYdYxOpqL6dP1GJ0YXAHpb0/+GqRNf5GRzk8xRy7RNNsR6rV9R0keNEq9FWn6BFisqGny8YRxA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fbe5b4-4e84-416f-749a-08d6cbad5004
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:15.4695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtB6qXfwLjrST+c6PWREWq51PaaFwJizJc9K9IAO0aA=;
 b=k3BUi+wq98xmUYBxU1MXLAJcJuegzvDei8qsCh0UaH2lJCfzj3NFlTE0PCt+M+e3cGb8VBlyOJ/WO9FlhK8jbrccgcDYMajq6DPtZZu34J6BmeQVIX1o/ax+riuqU6W8DNt5YdCtuulEzQoxi2syVTr4/Y6Vthm3A9X/b+yGE+8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQoNCkV4cG9zZSBhdmFpbGFibGUgbnVt
YmVycyBvZiBib3RoIFNETUEgcXVldWUgdHlwZXMgaW4gdGhlIHRvcG9sb2d5Lg0KDQpTaWduZWQt
b2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgfCA3ICsrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfdG9wb2xvZ3kuaCB8IDIgKysNCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Rv
cG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYw0KaW5k
ZXggMmNiMDllMDg4ZGNlLi5lNTM2ZjRiNjY5OGYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3RvcG9sb2d5LmMNCkBAIC00NzYsNiArNDc2LDEwIEBAIHN0YXRpYyBzc2l6ZV90
IG5vZGVfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGF0dHJpYnV0ZSAqYXR0ciwN
CiAJCQlkZXYtPm5vZGVfcHJvcHMuZHJtX3JlbmRlcl9taW5vcik7DQogCXN5c2ZzX3Nob3dfNjRi
aXRfcHJvcChidWZmZXIsICJoaXZlX2lkIiwNCiAJCQlkZXYtPm5vZGVfcHJvcHMuaGl2ZV9pZCk7
DQorCXN5c2ZzX3Nob3dfMzJiaXRfcHJvcChidWZmZXIsICJudW1fc2RtYV9lbmdpbmVzIiwNCisJ
CQlkZXYtPm5vZGVfcHJvcHMubnVtX3NkbWFfZW5naW5lcyk7DQorCXN5c2ZzX3Nob3dfMzJiaXRf
cHJvcChidWZmZXIsICJudW1fc2RtYV94Z21pX2VuZ2luZXMiLA0KKwkJCWRldi0+bm9kZV9wcm9w
cy5udW1fc2RtYV94Z21pX2VuZ2luZXMpOw0KIA0KIAlpZiAoZGV2LT5ncHUpIHsNCiAJCWxvZ19t
YXhfd2F0Y2hfYWRkciA9DQpAQCAtMTI4Miw2ICsxMjg2LDkgQEAgaW50IGtmZF90b3BvbG9neV9h
ZGRfZGV2aWNlKHN0cnVjdCBrZmRfZGV2ICpncHUpDQogCQlncHUtPnNoYXJlZF9yZXNvdXJjZXMu
ZHJtX3JlbmRlcl9taW5vcjsNCiANCiAJZGV2LT5ub2RlX3Byb3BzLmhpdmVfaWQgPSBncHUtPmhp
dmVfaWQ7DQorCWRldi0+bm9kZV9wcm9wcy5udW1fc2RtYV9lbmdpbmVzID0gZ3B1LT5kZXZpY2Vf
aW5mby0+bnVtX3NkbWFfZW5naW5lczsNCisJZGV2LT5ub2RlX3Byb3BzLm51bV9zZG1hX3hnbWlf
ZW5naW5lcyA9DQorCQkJCWdwdS0+ZGV2aWNlX2luZm8tPm51bV94Z21pX3NkbWFfZW5naW5lczsN
CiANCiAJa2ZkX2ZpbGxfbWVtX2Nsa19tYXhfaW5mbyhkZXYpOw0KIAlrZmRfZmlsbF9pb2xpbmtf
bm9uX2NyYXRfaW5mbyhkZXYpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF90b3BvbG9neS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9s
b2d5LmgNCmluZGV4IDg0NzEwY2ZkMjNjMi4uOTQ5ZTg4NWRmYjUzIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmgNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5oDQpAQCAtNzgsNiArNzgsOCBAQCBzdHJ1Y3Qg
a2ZkX25vZGVfcHJvcGVydGllcyB7DQogCXVpbnQzMl90IG1heF9lbmdpbmVfY2xrX2Zjb21wdXRl
Ow0KIAl1aW50MzJfdCBtYXhfZW5naW5lX2Nsa19jY29tcHV0ZTsNCiAJaW50MzJfdCAgZHJtX3Jl
bmRlcl9taW5vcjsNCisJdWludDMyX3QgbnVtX3NkbWFfZW5naW5lczsNCisJdWludDMyX3QgbnVt
X3NkbWFfeGdtaV9lbmdpbmVzOw0KIAl1aW50MTZfdCBtYXJrZXRpbmdfbmFtZVtLRkRfVE9QT0xP
R1lfUFVCTElDX05BTUVfU0laRV07DQogfTsNCiANCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
