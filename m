Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E646DA3
	for <lists+amd-gfx@lfdr.de>; Sat, 15 Jun 2019 03:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097A989613;
	Sat, 15 Jun 2019 01:52:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730069.outbound.protection.outlook.com [40.107.73.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A65B89613
 for <amd-gfx@lists.freedesktop.org>; Sat, 15 Jun 2019 01:52:48 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB0043.namprd12.prod.outlook.com (10.174.107.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Sat, 15 Jun 2019 01:52:47 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1987.013; Sat, 15 Jun 2019
 01:52:47 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: improve HMM error -ENOMEM and -EBUSY handling
Thread-Topic: [PATCH] drm/amdgpu: improve HMM error -ENOMEM and -EBUSY handling
Thread-Index: AQHVIx0HLyWDaLKsC02J/23Ep4RctQ==
Date: Sat, 15 Jun 2019 01:52:46 +0000
Message-ID: <20190615015231.31871-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::49) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a33b7479-a2e7-4331-8025-08d6f1342a0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0043; 
x-ms-traffictypediagnostic: DM5PR1201MB0043:
x-microsoft-antispam-prvs: <DM5PR1201MB00431427041E86A10FE337C4E6E90@DM5PR1201MB0043.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(376002)(39860400002)(189003)(199004)(71200400001)(2351001)(2906002)(14444005)(66066001)(26005)(256004)(71190400001)(186003)(386003)(86362001)(66446008)(66946007)(66476007)(66556008)(64756008)(73956011)(6506007)(99286004)(102836004)(316002)(1076003)(6436002)(5660300002)(68736007)(14454004)(486006)(53936002)(72206003)(478600001)(52116002)(36756003)(476003)(2616005)(6512007)(5640700003)(8676002)(7736002)(81156014)(305945005)(8936002)(6116002)(25786009)(81166006)(50226002)(6916009)(4326008)(6486002)(2501003)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0043;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HudT+JJ9eLt1w+nB0P7ayys0NX3An3uxmAb1vVGwpLYKJgt+LE6KG85qqSvtbjWFzHvDllzDTcgrcjWDJPwFxPYpVL+PqfjaEApZiocHwj5ltrRVEu1r/w7HixMNSai902f+E8wwIRz0vw1il+7qv1PJN46j6MQbsiHFxSUQHMJp9czCYOz0n+DTP0WUCsfcHxgdcOIc1Z86fAYagp42/j9qjCvt4jN4vcnj2aE6ZZYCA4t/CYhlviwVNffehSthXFsNABKV7kv2M2+NnMHlCKVNfcWFaZaU95Tjd+Ox6kX4z9JMlvX4Q4AckI78nfzJt5JRRw1WiVMJliz9OaBH8Sccxoo26Eh0wjNpIlBvxkAdC4owoqQgjw4Dhz9Sh8/vHFZkBvI1SU9EVxz+JNnVdVMkN2GFi0ObXSA1fOZ2+Tw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33b7479-a2e7-4331-8025-08d6f1342a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2019 01:52:46.8967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0043
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfCWtLs/odvK1XXlJPO6DZv070wjJVpToWp11bDcRL4=;
 b=p472cmXAo/0btcbqYVj6aCNrXSbfjeNa5g1SE0qyCFaqQCOQ9QThnxigfbnWsHOGRL1rttbhqOD5CzrYIMWwa3/elSQl+DmuDq/FOABw5ZpYlBqPYtecCeN+6YC2vU51ajhRFeDKxK7TNxL01oOcyCviCVR71kreb7kllJP3tN8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VW5kZXIgbWVtb3J5IHByZXNzdXJlLCBobW1fcmFuZ2VfZmF1bHQgbWF5IHJldHVybiBlcnJvciBj
b2RlIC1FTk9NRU0NCm9yIC1FQlVTWSwgY2hhbmdlIHByX2luZm8gdG8gcHJfZGVidWcgdG8gcmVt
b3ZlIHVubmVjZXNzYXJ5IGtlcm5lbCBsb2cNCm1lc3NhZ2UgYmVjYXVzZSB3ZSB3aWxsIHJldHJ5
IHJlc3RvcmUgYWdhaW4uDQoNCkNhbGwgZ2V0X3VzZXJfcGFnZXNfZG9uZSBpZiBUVE0gZ2V0IHVz
ZXIgcGFnZXMgZmFpbGVkIHdpbGwgaGF2ZQ0KV0FSTl9PTkNFIGtlcm5lbCBjYWxsaW5nIHN0YWNr
IGR1bXAgbG9nLg0KDQpDaGFuZ2UtSWQ6IEkwODZmOTI5NDQ2MzBmOWQxYTcwMzY1YzAwNDE3Y2I5
NDQwNjYyNDY0DQpTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNv
bT4NCi0tLQ0KIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8
IDM4ICsrKy0tLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAzMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0uYw0KaW5kZXggNzRlODY5NTI1NTNmLi4xMGFiYWUzOThlNTEgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0u
Yw0KQEAgLTE3MzEsMzUgKzE3MzEsMTcgQEAgc3RhdGljIGludCB1cGRhdGVfaW52YWxpZF91c2Vy
X3BhZ2VzKHN0cnVjdCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8sDQogCQlyZXQg
PSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKGJvLT50Ym8udHRtLA0KIAkJCQkJCSAgIGJv
LT50Ym8udHRtLT5wYWdlcyk7DQogCQlpZiAocmV0KSB7DQotCQkJYm8tPnRiby50dG0tPnBhZ2Vz
WzBdID0gTlVMTDsNCi0JCQlwcl9pbmZvKCIlczogRmFpbGVkIHRvIGdldCB1c2VyIHBhZ2VzOiAl
ZFxuIiwNCisJCQlwcl9kZWJ1ZygiJXM6IEZhaWxlZCB0byBnZXQgdXNlciBwYWdlczogJWRcbiIs
DQogCQkJCV9fZnVuY19fLCByZXQpOw0KLQkJCS8qIFByZXRlbmQgaXQgc3VjY2VlZGVkLiBJdCB3
aWxsIGZhaWwgbGF0ZXINCi0JCQkgKiB3aXRoIGEgVk0gZmF1bHQgaWYgdGhlIEdQVSB0cmllcyB0
byBhY2Nlc3MNCi0JCQkgKiBpdC4gQmV0dGVyIHRoYW4gaGFuZ2luZyBpbmRlZmluaXRlbHkgd2l0
aA0KLQkJCSAqIHN0YWxsZWQgdXNlciBtb2RlIHF1ZXVlcy4NCi0JCQkgKi8NCi0JCX0NCi0JfQ0K
LQ0KLQlyZXR1cm4gMDsNCi19DQogDQotLyogUmVtb3ZlIGludmFsaWQgdXNlcnB0ciBCT3MgZnJv
bSBobW0gdHJhY2sgbGlzdA0KLSAqDQotICogU3RvcCBITU0gdHJhY2sgdGhlIHVzZXJwdHIgdXBk
YXRlDQotICovDQotc3RhdGljIHZvaWQgdW50cmFja19pbnZhbGlkX3VzZXJfcGFnZXMoc3RydWN0
IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbykNCi17DQotCXN0cnVjdCBrZ2RfbWVt
ICptZW0sICp0bXBfbWVtOw0KLQlzdHJ1Y3QgYW1kZ3B1X2JvICpibzsNCisJCQkvKiBSZXR1cm4g
ZXJyb3IgLUVCVVNZIG9yIC1FTk9NRU0sIHJldHJ5IHJlc3RvcmUgKi8NCisJCQlyZXR1cm4gcmV0
Ow0KKwkJfQ0KIA0KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUobWVtLCB0bXBfbWVtLA0KLQkJ
CQkgJnByb2Nlc3NfaW5mby0+dXNlcnB0cl9pbnZhbF9saXN0LA0KLQkJCQkgdmFsaWRhdGVfbGlz
dC5oZWFkKSB7DQotCQlibyA9IG1lbS0+Ym87DQogCQlhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzX2RvbmUoYm8tPnRiby50dG0pOw0KIAl9DQorDQorCXJldHVybiAwOw0KIH0NCiANCiAvKiBW
YWxpZGF0ZSBpbnZhbGlkIHVzZXJwdHIgQk9zDQpAQCAtMTg0MSwxMyArMTgyMyw2IEBAIHN0YXRp
YyBpbnQgdmFsaWRhdGVfaW52YWxpZF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRrZmRfcHJvY2Vzc19p
bmZvICpwcm9jZXNzX2luZm8pDQogCQlsaXN0X21vdmVfdGFpbCgmbWVtLT52YWxpZGF0ZV9saXN0
LmhlYWQsDQogCQkJICAgICAgICZwcm9jZXNzX2luZm8tPnVzZXJwdHJfdmFsaWRfbGlzdCk7DQog
DQotCQkvKiBTdG9wIEhNTSB0cmFjayB0aGUgdXNlcnB0ciB1cGRhdGUuIFdlIGRvbnQgY2hlY2sg
dGhlIHJldHVybg0KLQkJICogdmFsdWUgZm9yIGNvbmN1cnJlbnQgQ1BVIHBhZ2UgdGFibGUgdXBk
YXRlIGJlY2F1c2Ugd2Ugd2lsbA0KLQkJICogcmVzY2hlZHVsZSB0aGUgcmVzdG9yZSB3b3JrZXIg
aWYgcHJvY2Vzc19pbmZvLT5ldmljdGVkX2Jvcw0KLQkJICogaXMgdXBkYXRlZC4NCi0JCSAqLw0K
LQkJYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lKGJvLT50Ym8udHRtKTsNCi0NCiAJ
CS8qIFVwZGF0ZSBtYXBwaW5nLiBJZiB0aGUgQk8gd2FzIG5vdCB2YWxpZGF0ZWQNCiAJCSAqIChi
ZWNhdXNlIHdlIGNvdWxkbid0IGdldCB1c2VyIHBhZ2VzKSwgdGhpcyB3aWxsDQogCQkgKiBjbGVh
ciB0aGUgcGFnZSB0YWJsZSBlbnRyaWVzLCB3aGljaCB3aWxsIHJlc3VsdCBpbg0KQEAgLTE5NDYs
NyArMTkyMSw2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9hbWRrZmRfcmVzdG9yZV91c2VycHRyX3dv
cmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQogCX0NCiANCiB1bmxvY2tfb3V0Og0KLQl1
bnRyYWNrX2ludmFsaWRfdXNlcl9wYWdlcyhwcm9jZXNzX2luZm8pOw0KIAltdXRleF91bmxvY2so
JnByb2Nlc3NfaW5mby0+bG9jayk7DQogCW1tcHV0KG1tKTsNCiAJcHV0X3Rhc2tfc3RydWN0KHVz
ZXJ0YXNrKTsNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
