Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AF4DA18
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 21:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD536E433;
	Thu, 20 Jun 2019 19:22:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591336E433
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 19:22:11 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2828.namprd12.prod.outlook.com (20.177.221.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 20 Jun 2019 19:22:09 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 19:22:09 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Topic: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Index: AQHVJ510MSBuJg2pPEm3H7nb3OJCdA==
Date: Thu, 20 Jun 2019 19:22:09 +0000
Message-ID: <20190620192155.20226-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99cb2182-d5c8-42ae-3fdb-08d6f5b496da
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2828; 
x-ms-traffictypediagnostic: DM6PR12MB2828:
x-microsoft-antispam-prvs: <DM6PR12MB2828BADC8BF254E5CB0CEB4492E40@DM6PR12MB2828.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(366004)(189003)(199004)(6116002)(2501003)(66556008)(478600001)(64756008)(53936002)(99286004)(66066001)(186003)(25786009)(26005)(36756003)(2906002)(102836004)(14444005)(386003)(256004)(72206003)(52116002)(486006)(2351001)(68736007)(14454004)(86362001)(6506007)(8936002)(50226002)(8676002)(81156014)(81166006)(3846002)(6512007)(476003)(2616005)(5640700003)(316002)(7736002)(4326008)(305945005)(6486002)(6436002)(73956011)(1076003)(71200400001)(71190400001)(66446008)(6916009)(66476007)(5660300002)(66946007)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2828;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tFAX6VUO3wDrfTLqA+t/OmDnEuDtM2swetKOp4v1OovQaGlS1tkL9maKRUxeI3iU5iWdTuCjIK+FhfIYIA9BUqZGZctC/fREh7z/GSUfTfrhV6y/mbC2XrUpwGeVwHRMs85EiH7hHWVM8kIsUriUbtP2wgoYV3r9+YKvzKuNNqBPyvbGiU4DhQOhTbAQJ0fVmB//gfGXq/iJ2gBVvwcd5joARz1hRTMaLCXBlN9T9WeP5PhN1IahvSo+zeTBXQT0C/HVPbL+4MIx1ai/xSCEaCkHz48/xQMZzVVRlvjc2g7gfim1ocKM3ShxAWHhqGqn1Tm/c5cJN/MzS8a/RSfqn1qGspnYTS/DgGI1M3LdFiVK6otU/Zu1mxHHzALKS1o4YeVVJUH7YoWtigtYYs/mLAxLn993LyzVeoOEnBcb3vY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cb2182-d5c8-42ae-3fdb-08d6f5b496da
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 19:22:09.6575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2828
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkxSgHe/UpKCeYcX7qMG74qTRQnHSBwtl6MuR6e0FHs=;
 b=kcefMQS1E4Or6RCaptZJFCJKuUusOoW/pTZe8mYxG1ddZlxiPn+BNUJBibu2vVZCSHMr/1qDyu9NfhdbizkQ8Jgsq/atVEdlipGSdznKshGO5dF7/RpBE/TE/bDK0Yupbalo9haoi0scK7NN+GtRZNtFzrM39yw7CNgHBXVvF14=
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

TmV3IGZsYWcgdG8gZGlzYWJsZSBhbiBpZGxlIHJ1bmxpc3Qgb3B0aW1pemF0aW9uIHRoYXQgaXMg
Y2F1c2luZyBzb2Z0DQpoYW5ncyB3aXRoIHNvbWUgZGlmZnVsdC10by1yZXByb2R1Y2UgY3VzdG9t
ZXIgd29ya2xvYWRzLiBUaGlzIHdpbGwNCnNlcnZlIGFzIGEgd29ya2Fyb3VuZCB1bnRpbCB0aGUg
cHJvYmxlbSBjYW4gYmUgcmVwcm9kdWNlZCBhbmQgdGhlDQpyb290LWNhdXNlIGRldGVybWluZWQu
DQoNClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
Pg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmgg
fCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNf
YWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQpp
bmRleCA0OWFiNjZiNzAzZmEuLmUzZTIxNDA0Y2ZhMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaA0KQEAgLTEyMCw3ICsxMjAsNyBAQCBz
dHJ1Y3QgcG00X21lc19ydW5saXN0IHsNCiAJCQl1aW50MzJfdCBpYl9zaXplOjIwOw0KIAkJCXVp
bnQzMl90IGNoYWluOjE7DQogCQkJdWludDMyX3Qgb2ZmbG9hZF9wb2xsaW5nOjE7DQotCQkJdWlu
dDMyX3QgcmVzZXJ2ZWQyOjE7DQorCQkJdWludDMyX3QgY2hhaW5lZF9ydW5saXN0X2lkbGVfZGlz
YWJsZToxOw0KIAkJCXVpbnQzMl90IHZhbGlkOjE7DQogCQkJdWludDMyX3QgcHJvY2Vzc19jbnQ6
NDsNCiAJCQl1aW50MzJfdCByZXNlcnZlZDM6NDsNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
