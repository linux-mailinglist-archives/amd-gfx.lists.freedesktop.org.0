Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC4F154DB
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 22:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF15189C1A;
	Mon,  6 May 2019 20:23:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C419889C1A
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 20:23:51 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2728.namprd12.prod.outlook.com (20.177.125.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.14; Mon, 6 May 2019 20:23:50 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 20:23:50 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu: Reserve shared fence for eviction fence
Thread-Topic: [PATCH 1/1] drm/amdgpu: Reserve shared fence for eviction fence
Thread-Index: AQHVBEmda5QLQ2HsJUSH1oPwP2wb+Q==
Date: Mon, 6 May 2019 20:23:49 +0000
Message-ID: <20190506202331.7456-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f46d971f-e8a1-4fd9-ac18-08d6d260bfc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2728; 
x-ms-traffictypediagnostic: BYAPR12MB2728:
x-microsoft-antispam-prvs: <BYAPR12MB2728BA7080F7906E6ABAB61D92300@BYAPR12MB2728.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(39860400002)(376002)(346002)(189003)(199004)(86362001)(72206003)(478600001)(8676002)(2616005)(50226002)(256004)(14444005)(81156014)(66066001)(8936002)(5660300002)(53936002)(6116002)(71200400001)(81166006)(71190400001)(386003)(68736007)(4326008)(5640700003)(2906002)(52116002)(99286004)(14454004)(186003)(6436002)(1076003)(102836004)(6506007)(26005)(3846002)(6512007)(6916009)(6486002)(316002)(7736002)(64756008)(66556008)(476003)(66446008)(2501003)(36756003)(66946007)(66476007)(305945005)(2351001)(486006)(73956011)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2728;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2XGLEhB4nsba9ILMUc5RKNw8fJ1wihyj4g2W7v3R4RYbbY93tmn8mtcXgC+HUQ9ySl5IN5obE/SM91nPCV4ZBC/aPKEzx65aUgojDUy+80GLH3XRMRN3WHMOBLxPIqWp4Qax0W1KibrJ6PcCXgzb4Gt5MLe/0PfL6k06Li8ktYoOe0ZKUPLQj6W3IXip68vneb8rJ7/gdDHc1mW5FZW9w753uMJUE4cRk7fti1oWPWGy4gVHKFgpwArkmrxTi9Vf40l7ZQyoB0GUhw3/PhIYg4eS3EFVoDGU8nSbdYNKTxql7GMQeyjKSoEI1AL7VbG9ZSMKtxxEkwVYD5cVbKffWhlb9GAzWJ87ZSiF75VAxZ9FBpOONurlWLgFnduLAv2fq+PakTrnQ+CIdrvjqRcqck62NUeXNjVms2A4EsNimhM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46d971f-e8a1-4fd9-ac18-08d6d260bfc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 20:23:49.9578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2728
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eP285TDMvvVXDcYqSLXXAH9D7o3JnTuh7mq8sLtzY0=;
 b=iKdqUtkDlWEO0rhwvP7Nc4ZeOBt23aO3Uz5Z1bkvlotqDYZvqTGiVFjIsoORQ774Xk96MXJQMuHp/CC5RlqgXhefROH00kj3XmSHy5BNUfu5xI+C7/vJAN/iaZVAt/qCqDPTYkca/C4pKvZiIq68ADlmvhsYMeXz8q+sH9+NVSM=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmVlZCB0byByZXNlcnZlIHNwYWNlIGZvciB0aGUgc2hhcmVkIGV2aWN0aW9uIGZlbmNlIHdoZW4g
aW5pdGlhbGl6aW5nDQphIEtGRCBWTS4NCg0KU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMNCmluZGV4IDIwY2Y4ZTFlNzQ0NS4uZTFjYWU0YTM3MTEzIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCkBAIC04
NzUsNiArODc1LDkgQEAgc3RhdGljIGludCBpbml0X2tmZF92bShzdHJ1Y3QgYW1kZ3B1X3ZtICp2
bSwgdm9pZCAqKnByb2Nlc3NfaW5mbywNCiAJCQkJICBBTURHUFVfRkVOQ0VfT1dORVJfS0ZELCBm
YWxzZSk7DQogCWlmIChyZXQpDQogCQlnb3RvIHdhaXRfcGRfZmFpbDsNCisJcmV0ID0gcmVzZXJ2
YXRpb25fb2JqZWN0X3Jlc2VydmVfc2hhcmVkKHZtLT5yb290LmJhc2UuYm8tPnRiby5yZXN2LCAx
KTsNCisJaWYgKHJldCkNCisJCWdvdG8gcmVzZXJ2ZV9zaGFyZWRfZmFpbDsNCiAJYW1kZ3B1X2Jv
X2ZlbmNlKHZtLT5yb290LmJhc2UuYm8sDQogCQkJJnZtLT5wcm9jZXNzX2luZm8tPmV2aWN0aW9u
X2ZlbmNlLT5iYXNlLCB0cnVlKTsNCiAJYW1kZ3B1X2JvX3VucmVzZXJ2ZSh2bS0+cm9vdC5iYXNl
LmJvKTsNCkBAIC04ODgsNiArODkxLDcgQEAgc3RhdGljIGludCBpbml0X2tmZF92bShzdHJ1Y3Qg
YW1kZ3B1X3ZtICp2bSwgdm9pZCAqKnByb2Nlc3NfaW5mbywNCiANCiAJcmV0dXJuIDA7DQogDQor
cmVzZXJ2ZV9zaGFyZWRfZmFpbDoNCiB3YWl0X3BkX2ZhaWw6DQogdmFsaWRhdGVfcGRfZmFpbDoN
CiAJYW1kZ3B1X2JvX3VucmVzZXJ2ZSh2bS0+cm9vdC5iYXNlLmJvKTsNCi0tIA0KMi4xNy4xDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
