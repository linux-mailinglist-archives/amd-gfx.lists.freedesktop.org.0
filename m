Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296CBFA45
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 21:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59BB6EDFD;
	Thu, 26 Sep 2019 19:46:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3526EDFD
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 19:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwuyj3c9uAXNYWZGT4mbJxGHFGaUwGntxmIXbQkxFWV+alynoFEmgMHEHj+6A6TJukC4fUepYv29/PUz2+C8fykwohRKUCm2jyz8n97wTpaPi8vrxapfyMFDiZH/NcTxqhMiwwD3Zj4OYQ/Knn9aDr3D/6EWlKs877MkUFKOo/pVsxe+xWjHR5Y7Hg6JhtB2GFzzI3vomRXp3dqQDENuIAL/4E6W5JAdk8cMfj2OoMkxTB1qXCtjF49B5liUbEYZWVMISNywSwMYTfVgZ+iaoCF8A7nyeLQz7Am61xxPQU+Rc8jxXCCdcR+VklPaagDvWnPfEzWlNWrt7HsM86BiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28id2AqthcugBL3PyNuVxEJQK/4fWk5H8gUR0Us/bMQ=;
 b=Q69RjbJxSdBHwLoNPiY0yzPVoIp8LPgMoV6TZwiX1PxOg+bnPS2I+XdaL59uvWjaHLZdmAonNkaFdYKNW2CBJOuJmyVuq2jTQ+C74FLws2pth04yFNuXE9Lsx5KSheE1ouVf31fltkd7AtKObJZgHmvVP3dQp9vhd1yCV7vsRsR4M/llQfyU9m6UyM+HMMgJg7UwUAdckA4bgFHCTk8QmvdxCl3LqNPzNk9sKcOqMm9cqlgijqbfo9jHY7GLW7stDeXu2T2uXuy5ousSnkFrgYcGWRlyhgpXyte7U8YinQDeXZ3ZpdzB42OwYl+dbljuVEN9UsGgxAd63NV/+pIiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3980.namprd12.prod.outlook.com (10.255.175.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 19:46:01 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 19:46:01 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Topic: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Index: AQHVdKMG7khOrFhgmkqHjqrwDcRQ6g==
Date: Thu, 26 Sep 2019 19:46:00 +0000
Message-ID: <20190926194548.15119-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::32) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d64f0f90-5096-451f-f503-08d742ba2865
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3980:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3980B5143B7AAEDC42F1EAE1F0860@DM6PR12MB3980.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(189003)(199004)(186003)(305945005)(86362001)(8936002)(52116002)(256004)(8676002)(81156014)(2906002)(66446008)(386003)(81166006)(6506007)(5640700003)(2351001)(6512007)(50226002)(66476007)(66556008)(64756008)(6916009)(6486002)(478600001)(66946007)(7736002)(14454004)(6436002)(1076003)(71200400001)(71190400001)(2501003)(66066001)(476003)(486006)(316002)(36756003)(6116002)(26005)(4326008)(3846002)(99286004)(25786009)(5660300002)(102836004)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3980;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tjUmrKZ/J3rYzuEnZivYHPu9rznx/m94LRALCoeUGnCl/fqox/6mYgEblcLlI+o6MN8xaaOnBn2m6FcaiQvdzzjmE1ztowbNoV+eN//0VYsTA8i98i82/nhxozWLBE6CVjGN8hY/Rg+St5v6KKEA0uHC/Vmy0w2oSALyhtoR5w3/pw8DQG7wFnIKUI3FlE7T0MsyqC/moHhWFXWsLS5YG/Lny/fYqcrru5T8F2rSuOc/hrjRTaFEKoCRDSkuOmiRBrDoa3JnZ5sMZV7iNL6iI2Bcb1ttf6gqnq07ypSzR6Xc1lH3qhFcDE8ZF/gI1A8Bs7QD0l2L6FurP2A3a42NKd8uY4vQ3I7NQp4nbLP8jpswHBaCea6xqaKggnuWwoF55pAmk8mVwnQ9S2iGbEU27lALMpyy8LIkfCXa1OC6CQ0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64f0f90-5096-451f-f503-08d742ba2865
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 19:46:00.9223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +WWqlyigv2S95lZh8fn7f4OOuIrU/c1JbuVH6XlR+5bQG4VwLmQXTz3wN7G8lEkG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3980
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28id2AqthcugBL3PyNuVxEJQK/4fWk5H8gUR0Us/bMQ=;
 b=f8V797a5lqssQtibcdse8vRDbkETVMU5Ds6hwJETJWbEL6lZO095ZjIGHyTiX7Qf1mCr31p1nBnvGecfg8FfjWLaWqGfJP9El7ZajhFFsXKs7YmuDAeILqRjANdHa/eUERDpxPW0T3dOwqkO3g78LUG02+WzB7HSZNLfBBFeNoo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBwb3NzaWJsZSB0aGUgdm1pZCBwYXNpZCBtYXBwaW5nIHF1ZXJ5IHRocm91Z2gg
c29mdHdhcmUuCgpDaGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQy
ODliODdiClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQog
Li4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgMzMgKysrKysr
KysrKysrLS0tLS0tLQogLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5oIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAg
ICB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmMKaW5kZXggZTdmMGEzMmUwZTQ0Li45MmZlZGUxOGJmMWQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5jCkBAIC0yMjQsMjAgKzIyNCwzMCBAQCBzdGF0aWMgaW50IGFsbG9jYXRlX3ZtaWQoc3RydWN0
IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sCiAJCQlzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNl
ICpxcGQsCiAJCQlzdHJ1Y3QgcXVldWUgKnEpCiB7Ci0JaW50IGJpdCwgYWxsb2NhdGVkX3ZtaWQ7
CisJaW50IGFsbG9jYXRlZF92bWlkID0gLTEsIGk7CiAKLQlpZiAoZHFtLT52bWlkX2JpdG1hcCA9
PSAwKQotCQlyZXR1cm4gLUVOT01FTTsKKwlmb3IgKGkgPSBkcW0tPmRldi0+dm1faW5mby5maXJz
dF92bWlkX2tmZDsKKwkJCWkgPD0gZHFtLT5kZXYtPnZtX2luZm8ubGFzdF92bWlkX2tmZDsgaSsr
KSB7CisJCWlmICghZHFtLT52bWlkX3Bhc2lkW2ldKSB7CisJCQlhbGxvY2F0ZWRfdm1pZCA9IGk7
CisJCQlicmVhazsKKwkJfQorCX0KKworCWlmIChhbGxvY2F0ZWRfdm1pZCA8IDApIHsKKwkJcHJf
ZXJyKCJubyBtb3JlIHZtaWQgdG8gYWxsb2NhdGVcbiIpOworCQlyZXR1cm4gLUVOT1NQQzsKKwl9
CisKKwlwcl9kZWJ1Zygidm1pZCBhbGxvY2F0ZWQ6ICVkXG4iLCBhbGxvY2F0ZWRfdm1pZCk7CisK
KwlkcW0tPnZtaWRfcGFzaWRbYWxsb2NhdGVkX3ZtaWRdID0gcS0+cHJvY2Vzcy0+cGFzaWQ7CiAK
LQliaXQgPSBmZnMoZHFtLT52bWlkX2JpdG1hcCkgLSAxOwotCWRxbS0+dm1pZF9iaXRtYXAgJj0g
figxIDw8IGJpdCk7CisJc2V0X3Bhc2lkX3ZtaWRfbWFwcGluZyhkcW0sIHEtPnByb2Nlc3MtPnBh
c2lkLCBhbGxvY2F0ZWRfdm1pZCk7CiAKLQlhbGxvY2F0ZWRfdm1pZCA9IGJpdCArIGRxbS0+ZGV2
LT52bV9pbmZvLmZpcnN0X3ZtaWRfa2ZkOwotCXByX2RlYnVnKCJ2bWlkIGFsbG9jYXRpb24gJWRc
biIsIGFsbG9jYXRlZF92bWlkKTsKIAlxcGQtPnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsKIAlxLT5w
cm9wZXJ0aWVzLnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsKIAotCXNldF9wYXNpZF92bWlkX21hcHBp
bmcoZHFtLCBxLT5wcm9jZXNzLT5wYXNpZCwgcS0+cHJvcGVydGllcy52bWlkKTsKIAlwcm9ncmFt
X3NoX21lbV9zZXR0aW5ncyhkcW0sIHFwZCk7CiAKIAkvKiBxcGQtPnBhZ2VfdGFibGVfYmFzZSBp
cyBzZXQgZWFybGllciB3aGVuIHJlZ2lzdGVyX3Byb2Nlc3MoKQpAQCAtMjc4LDggKzI4OCw2IEBA
IHN0YXRpYyB2b2lkIGRlYWxsb2NhdGVfdm1pZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIg
KmRxbSwKIAkJCQlzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNlICpxcGQsCiAJCQkJc3RydWN0IHF1
ZXVlICpxKQogewotCWludCBiaXQgPSBxcGQtPnZtaWQgLSBkcW0tPmRldi0+dm1faW5mby5maXJz
dF92bWlkX2tmZDsKLQogCS8qIE9uIEdGWCB2NywgQ1AgZG9lc24ndCBmbHVzaCBUQyBhdCBkZXF1
ZXVlICovCiAJaWYgKHEtPmRldmljZS0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5ID09IENISVBf
SEFXQUlJKQogCQlpZiAoZmx1c2hfdGV4dHVyZV9jYWNoZV9ub2Nwc2NoKHEtPmRldmljZSwgcXBk
KSkKQEAgLTI4OSw4ICsyOTcsOCBAQCBzdGF0aWMgdm9pZCBkZWFsbG9jYXRlX3ZtaWQoc3RydWN0
IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sCiAKIAkvKiBSZWxlYXNlIHRoZSB2bWlkIG1hcHBp
bmcgKi8KIAlzZXRfcGFzaWRfdm1pZF9tYXBwaW5nKGRxbSwgMCwgcXBkLT52bWlkKTsKKwlkcW0t
PnZtaWRfcGFzaWRbcXBkLT52bWlkXSA9IDA7CiAKLQlkcW0tPnZtaWRfYml0bWFwIHw9ICgxIDw8
IGJpdCk7CiAJcXBkLT52bWlkID0gMDsKIAlxLT5wcm9wZXJ0aWVzLnZtaWQgPSAwOwogfQpAQCAt
MTAxNyw3ICsxMDI1LDggQEAgc3RhdGljIGludCBpbml0aWFsaXplX25vY3BzY2goc3RydWN0IGRl
dmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pCiAJCQkJZHFtLT5hbGxvY2F0ZWRfcXVldWVzW3BpcGVd
IHw9IDEgPDwgcXVldWU7CiAJfQogCi0JZHFtLT52bWlkX2JpdG1hcCA9ICgxIDw8IGRxbS0+ZGV2
LT52bV9pbmZvLnZtaWRfbnVtX2tmZCkgLSAxOworCW1lbXNldChkcW0tPnZtaWRfcGFzaWQsIDAs
IFZNSURfTlVNICogc2l6ZW9mKHVpbnQxNl90KSk7CisKIAlkcW0tPnNkbWFfYml0bWFwID0gfjBV
TEwgPj4gKDY0IC0gZ2V0X251bV9zZG1hX3F1ZXVlcyhkcW0pKTsKIAlkcW0tPnhnbWlfc2RtYV9i
aXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3hnbWlfc2RtYV9xdWV1ZXMoZHFtKSk7CiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVf
bWFuYWdlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9t
YW5hZ2VyLmgKaW5kZXggZWVkOGY5NTBiNjYzLi45OWM4YjM2MzAxZWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oCkBA
IC0xODgsNyArMTg4LDggQEAgc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyIHsKIAl1bnNpZ25l
ZCBpbnQJCSphbGxvY2F0ZWRfcXVldWVzOwogCXVpbnQ2NF90CQlzZG1hX2JpdG1hcDsKIAl1aW50
NjRfdAkJeGdtaV9zZG1hX2JpdG1hcDsKLQl1bnNpZ25lZCBpbnQJCXZtaWRfYml0bWFwOworCS8q
IHRoZSBwYXNpZCBtYXBwaW5nIGZvciBlYWNoIGtmZCB2bWlkICovCisJdWludDE2X3QJCXZtaWRf
cGFzaWRbVk1JRF9OVU1dOwogCXVpbnQ2NF90CQlwaXBlbGluZXNfYWRkcjsKIAlzdHJ1Y3Qga2Zk
X21lbV9vYmoJKnBpcGVsaW5lX21lbTsKIAl1aW50NjRfdAkJZmVuY2VfZ3B1X2FkZHI7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAppbmRleCAwZDJjN2ZhMWZhNDYuLmEwODAxNTcy
MDg0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCkBAIC00Myw2ICs0Myw4
IEBACiAKICNpbmNsdWRlICJhbWRfc2hhcmVkLmgiCiAKKyNkZWZpbmUgVk1JRF9OVU0gMTYKKwog
I2RlZmluZSBLRkRfTUFYX1JJTkdfRU5UUllfU0laRQk4CiAKICNkZWZpbmUgS0ZEX1NZU0ZTX0ZJ
TEVfTU9ERSAwNDQ0Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
