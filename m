Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6BAABE6
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 21:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E9989DE6;
	Thu,  5 Sep 2019 19:22:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820052.outbound.protection.outlook.com [40.107.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B009589DE6
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 19:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLEKsm6c3va8Nz7gVrmGWxyybvv8J6jy2fByN8QXT6UOIFTIwASMZgMHcwQKbOfpFYvW7StPRyAs5IOJHKfvDcszb/7397GiEGIUC2oUJMXYzQPgiBzzv9nG6RFsQ0njfM51wmQ0AfSqGGZim9AJjXYfNNB/7BAJwKKDkSf2JnE4mfwgPEMfV+bKh42oYMAWWINaTwrT5dby2yWPG10ZO5hBXJ4H18VtvG34wB9hL0viNyx2fp/LfKzR7AgfbNMIH9NOPy6J2D/6JA5nL96EANrX3C6RGQn49Mts39tryXM283vLdiTCmCe/jS1tQEpZXt13iC5w2kd6rnmA4JqFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf1J6W7LNGez0S3jK/anZagL9hOvngXQZJ/0H8H5l8c=;
 b=G/OGlER82oJ8QNtZTNZrod6hHVVYAY05PhfM+l17hqBmLMEsSJZrCaqCiDraoHt4EsjGzEP0YpOZHB3/hGCuv7gTpL/Z43GuJMqZIMOk0g6hrgzAb8zvEKlgWtZoIMkiG9AUrniNpKrRpHSof9Ltstv8NICY7nZ5EbOPkap+Fb//4+5PmpEh2qSXiZKvQCppABWfF8Zj4GmYBvwovmBETGVqPMxBJrKuw2nFOdINfUB6Xj8okvOvQU/h+UbBzOHGMisavMdO5gsNBnTNTvr1TTY01E5VyIojzRnoDJp4JP/2i2Y0XAMdWgqfrJb4xUIMhNdsxbT2nSNeiDZSzanH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3179.namprd12.prod.outlook.com (20.179.104.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Thu, 5 Sep 2019 19:22:32 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 19:22:32 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Support Navi14 in KFD
Thread-Topic: [PATCH] drm/amdkfd: Support Navi14 in KFD
Thread-Index: AQHVZB9DS0vrxxgiykSiRY7AKg/VQA==
Date: Thu, 5 Sep 2019 19:22:32 +0000
Message-ID: <20190905192217.5701-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::14) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4cedd9a-dadc-456c-2e92-08d73236665c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3179; 
x-ms-traffictypediagnostic: DM6PR12MB3179:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB317979158DFB8044D4975F62F0BB0@DM6PR12MB3179.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:56;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(8676002)(1076003)(36756003)(53936002)(81166006)(8936002)(316002)(81156014)(7736002)(6486002)(6512007)(6436002)(6506007)(386003)(50226002)(14454004)(5660300002)(3846002)(99286004)(6116002)(6916009)(478600001)(5640700003)(2351001)(2906002)(2501003)(66446008)(476003)(186003)(25786009)(26005)(256004)(486006)(86362001)(64756008)(4326008)(102836004)(66066001)(2616005)(66946007)(66476007)(52116002)(66556008)(305945005)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3179;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DVNp7JjQ9cKl0+U/pWmoNFlMefLbg30xRRPghIJpmXbhzoc60/dYlAbh/1NmxrrGY3IY1hGIqIvfuy3tYSbvcNs1mrC7yi92Hee4OY9KKmg9kd4rbQODdG4FOAdLAiprh5wEflElmrOC6pGDyzd8MRH5T404JIXjxyDzO/xrNdypNYK2OQ1zuuILOn/zlC/p+jvYTic9gswfo9Ey7ZpJDmZUbjZwC574JwTnzcu3lVVjJSZWnCOXT1AYvvVgYntk6d5FyJ7zqUZs6nWR2N4V/s1vYknW4mDcsaJtqXJ8LhU+8AUG1cUYl5RhfTOBWlK5oX9/Au+AYIp4yQG7IsH49o06y5Ery2QQ1lUspaKcEtxReZ0MnlHm8oJoBEzt07zEa+eb8qQvYDTW0d4Ba6ViplWy5AoxBx+70XhhE80p/eU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cedd9a-dadc-456c-2e92-08d73236665c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 19:22:32.5003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKbFjDMSUV4CNufxjX7tvvsrTqXoP9W+iAW4Dx/zqyyGzuYwO8H0baJ7wYQJ+5+G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3179
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf1J6W7LNGez0S3jK/anZagL9hOvngXQZJ/0H8H5l8c=;
 b=WJXT+2u4SSJuUOHmTc6z4bBT5tGAoXI6HU37Ud/rgQ1eUtDG4YK/6e+qWb6OioTa/0Vj+M4287zZQgbFcN7/sYb24cKzozBC/iOxR/a5h6ET2U+867GpcKlKNc3VYWz70Pjz7dl4i7+cyTcrQE0q/JYgDGKoWSiRx8tb9RDosyY=
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

Q2hhbmdlLUlkOiBJZTJjNjIyNjAyMmZmNGQzODllYWEwNWIxYzg0YWZhN2FlNGNlYTBhYQpTaWdu
ZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysK
IC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8ICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0X21lbW9yeS5jICB8ICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWUuYyB8ICAxICsKIC4uLi9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMgICB8ICAxICsKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jICAgICB8ICAxICsKIDcgZmlsZXMgY2hhbmdl
ZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9jcmF0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCmlu
ZGV4IDNkN2Q1ZWI5ZWQ3YS4uMzMzYjQ0ZWI3MmU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9jcmF0LmMKQEAgLTY3MSw2ICs2NzEsNyBAQCBzdGF0aWMgaW50IGtmZF9maWxsX2dwdV9j
YWNoZV9pbmZvKHN0cnVjdCBrZmRfZGV2ICprZGV2LAogCQludW1fb2ZfY2FjaGVfdHlwZXMgPSBB
UlJBWV9TSVpFKHJhdmVuX2NhY2hlX2luZm8pOwogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEw
OgorCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCXBjYWNoZV9pbmZvID0gbmF2aTEwX2NhY2hlX2luZm87
CiAJCW51bV9vZl9jYWNoZV90eXBlcyA9IEFSUkFZX1NJWkUobmF2aTEwX2NhY2hlX2luZm8pOwog
CQlicmVhazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwppbmRleCA0NDQz
OTZhMmZiMGEuLmU3MTAxOGI1Nzc4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYwpAQCAtMzY5LDYgKzM2OSwyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZp
Y2VfaW5mbyBuYXZpMTBfZGV2aWNlX2luZm8gPSB7CiAJLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5n
aW5lID0gOCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkx
NF9kZXZpY2VfaW5mbyA9IHsKKwkuYXNpY19mYW1pbHkgPSBDSElQX05BVkkxNCwKKwkuYXNpY19u
YW1lID0gIm5hdmkxNCIsCisJLm1heF9wYXNpZF9iaXRzID0gMTYsCisJLm1heF9ub19vZl9ocWQg
ID0gMjQsCisJLmRvb3JiZWxsX3NpemUgID0gOCwKKwkuaWhfcmluZ19lbnRyeV9zaXplID0gOCAq
IHNpemVvZih1aW50MzJfdCksCisJLmV2ZW50X2ludGVycnVwdF9jbGFzcyA9ICZldmVudF9pbnRl
cnJ1cHRfY2xhc3NfdjksCisJLm51bV9vZl93YXRjaF9wb2ludHMgPSA0LAorCS5tcWRfc2l6ZV9h
bGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwKKwkubmVlZHNfaW9tbXVfZGV2aWNlID0gZmFsc2Us
CisJLnN1cHBvcnRzX2N3c3IgPSB0cnVlLAorCS5uZWVkc19wY2lfYXRvbWljcyA9IGZhbHNlLAor
CS5udW1fc2RtYV9lbmdpbmVzID0gMiwKKwkubnVtX3hnbWlfc2RtYV9lbmdpbmVzID0gMCwKKwku
bnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LAorfTsKKwogLyogRm9yIGVhY2ggZW50cnks
IFswXSBpcyByZWd1bGFyIGFuZCBbMV0gaXMgdmlydHVhbGlzYXRpb24gZGV2aWNlLiAqLwogc3Rh
dGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmtmZF9zdXBwb3J0ZWRfZGV2aWNlc1td
WzJdID0gewogI2lmZGVmIEtGRF9TVVBQT1JUX0lPTU1VX1YyCkBAIC0zODgsNiArNDA2LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmtmZF9zdXBwb3J0ZWRfZGV2aWNl
c1tdWzJdID0gewogCVtDSElQX1ZFR0EyMF0gPSB7JnZlZ2EyMF9kZXZpY2VfaW5mbywgTlVMTH0s
CiAJW0NISVBfQVJDVFVSVVNdID0geyZhcmN0dXJ1c19kZXZpY2VfaW5mbywgJmFyY3R1cnVzX2Rl
dmljZV9pbmZvfSwKIAlbQ0hJUF9OQVZJMTBdID0geyZuYXZpMTBfZGV2aWNlX2luZm8sIE5VTEx9
LAorCVtDSElQX05BVkkxNF0gPSB7Jm5hdmkxNF9kZXZpY2VfaW5mbywgTlVMTH0sCiB9OwogCiBz
dGF0aWMgaW50IGtmZF9ndHRfc2FfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLCB1bnNpZ25lZCBp
bnQgYnVmX3NpemUsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jCmluZGV4IDU2NjM5ZWU3ODYwOC4uOWE3YjUxMjA0OWQ2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21h
bmFnZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVl
X21hbmFnZXIuYwpAQCAtMTkwOCw2ICsxOTA4LDcgQEAgc3RydWN0IGRldmljZV9xdWV1ZV9tYW5h
Z2VyICpkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0KHN0cnVjdCBrZmRfZGV2ICpkZXYpCiAJCWRl
dmljZV9xdWV1ZV9tYW5hZ2VyX2luaXRfdjkoJmRxbS0+YXNpY19vcHMpOwogCQlicmVhazsKIAlj
YXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCWRldmljZV9xdWV1ZV9tYW5h
Z2VyX2luaXRfdjEwX25hdmkxMCgmZHFtLT5hc2ljX29wcyk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZmxhdF9tZW1vcnku
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0X21lbW9yeS5jCmluZGV4IGVl
N2ZmNmIwNTQxYi4uZWQ0ZWZhYjBhMTkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZmxhdF9tZW1vcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZmxhdF9tZW1vcnkuYwpAQCAtNDEyLDYgKzQxMiw3IEBAIGludCBrZmRfaW5pdF9hcGVy
dHVyZXMoc3RydWN0IGtmZF9wcm9jZXNzICpwcm9jZXNzKQogCQkJY2FzZSBDSElQX1JBVkVOOgog
CQkJY2FzZSBDSElQX0FSQ1RVUlVTOgogCQkJY2FzZSBDSElQX05BVkkxMDoKKwkJCWNhc2UgQ0hJ
UF9OQVZJMTQ6CiAJCQkJa2ZkX2luaXRfYXBlcnR1cmVzX3Y5KHBkZCwgaWQpOwogCQkJCWJyZWFr
OwogCQkJZGVmYXVsdDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9rZXJuZWxfcXVldWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxf
cXVldWUuYwppbmRleCA3YTNiMDQ4MmFiMWEuLjEwOTdlMDQ3YjRiYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWUuYwpAQCAtMzY4LDYgKzM2OCw3IEBA
IHN0cnVjdCBrZXJuZWxfcXVldWUgKmtlcm5lbF9xdWV1ZV9pbml0KHN0cnVjdCBrZmRfZGV2ICpk
ZXYsCiAJCWtlcm5lbF9xdWV1ZV9pbml0X3Y5KCZrcS0+b3BzX2FzaWNfc3BlY2lmaWMpOwogCQli
cmVhazsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCWtlcm5lbF9x
dWV1ZV9pbml0X3YxMCgma3EtPm9wc19hc2ljX3NwZWNpZmljKTsKIAkJYnJlYWs7CiAJZGVmYXVs
dDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMK
aW5kZXggNmNmMTI0MjJhN2Q4Li5iNzgyOGEyNDE5ODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jCkBAIC0yNDMsNiArMjQzLDcgQEAgaW50
IHBtX2luaXQoc3RydWN0IHBhY2tldF9tYW5hZ2VyICpwbSwgc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0pCiAJCXBtLT5wbWYgPSAma2ZkX3Y5X3BtX2Z1bmNzOwogCQlicmVhazsKIAlj
YXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCXBtLT5wbWYgPSAma2ZkX3Yx
MF9wbV9mdW5jczsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3RvcG9sb2d5LmMKaW5kZXggYzYxOGM1NTk1YzRjLi5lMjM1ZTQwNzRjZTMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jCkBAIC0xMzk1LDYgKzEzOTUs
NyBAQCBpbnQga2ZkX3RvcG9sb2d5X2FkZF9kZXZpY2Uoc3RydWN0IGtmZF9kZXYgKmdwdSkKIAlj
YXNlIENISVBfUkFWRU46CiAJY2FzZSBDSElQX0FSQ1RVUlVTOgogCWNhc2UgQ0hJUF9OQVZJMTA6
CisJY2FzZSBDSElQX05BVkkxNDoKIAkJZGV2LT5ub2RlX3Byb3BzLmNhcGFiaWxpdHkgfD0gKChI
U0FfQ0FQX0RPT1JCRUxMX1RZUEVfMl8wIDw8CiAJCQlIU0FfQ0FQX0RPT1JCRUxMX1RZUEVfVE9U
QUxCSVRTX1NISUZUKSAmCiAJCQlIU0FfQ0FQX0RPT1JCRUxMX1RZUEVfVE9UQUxCSVRTX01BU0sp
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
