Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D38B362
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 11:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDD56E0AF;
	Tue, 13 Aug 2019 09:08:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760048.outbound.protection.outlook.com [40.107.76.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BEE6E0AF
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 09:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6pmdL6stwBCSISi4PVBtTcOBt7OyevTVi6MIslSsdWTaC0XBK+REfIdXCSsCWsFPonzJh+EANPzsvjGJxVoO1k0/2NKIw0slSd8HM4d5DmjdY58jj4Ns9uMyMmbNitpYnOiplFDEPV/4cQUly5N0nmikqQd6RUOiL/AUOl7EozNktdlxad480ctDTsrqJnPAtqfW1v3X9K+zLn8cvL6qlTIDkRG4LRKviF9xl2QaKePXcylglEOLbWeFFn9GUOqf60is9p4SOEfxR4912RZuV0/zabdVVUWdmdk15baz+Iy7MOtlSRE4KczbwdVdq4R33OEd15zwaFOAX8DvlqVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP7bXD2bEiiDRDhNtZtfWC5KWvBEAMmCuRR8dLZK2EM=;
 b=Aoz+S4rKdaKKUmtR+EFW51yhu7bFBFOdbTKkOx0m+Sznmutu3UwVMDSR+c8By8jgeOjzZ9wM4HWKVRMiYxyLHxa+NoUKRNc/irg6dvWRSWAcuc/FAFYGJ1Z+eT1cExD8pCoW3H+6LoDBEtYu2PxlUNCLtwde6BX+Jusxp3SbdcOi1EnRzdJWQNkMLzuRjpv+qomHbsbui0Cp8YdoFczipYXRc1POasKVtD9PPue7bGhGLOyXPs/m1ySIBioqgfRLVRWLrlz9rV90UENEYbmfvp7L57qUyjsB0OeubSwiiDkGjr0+6X0JGhD1Pe8lPKus68YOmFZoIA1Yl4RuoW6A+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4125.namprd12.prod.outlook.com (52.135.50.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 09:08:19 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 09:08:19 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: dl.srdc_lnx_nv10 <dl.srdc_lnx_nv10@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: fix typo error amdgput -> amdgpu
Thread-Topic: [PATCH 1/2] drm/amdgpu: fix typo error amdgput -> amdgpu
Thread-Index: AQHVUbamfDR1nu8+N0idsC1uy4s/BQ==
Date: Tue, 13 Aug 2019 09:08:19 +0000
Message-ID: <20190813090745.9496-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0044.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::32) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b0e2966-7d71-417f-f352-08d71fcdc89b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4125; 
x-ms-traffictypediagnostic: MN2PR12MB4125:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB41259802BE547025331F9CCCA2D20@MN2PR12MB4125.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(6636002)(4326008)(316002)(52116002)(26005)(5660300002)(6486002)(99286004)(8936002)(102836004)(6862004)(8676002)(86362001)(54906003)(6512007)(50226002)(386003)(6506007)(14454004)(81166006)(81156014)(486006)(186003)(7736002)(2616005)(25786009)(53936002)(1076003)(256004)(36756003)(305945005)(71190400001)(478600001)(476003)(6116002)(2906002)(66446008)(66476007)(66946007)(6436002)(37006003)(64756008)(66556008)(3846002)(66066001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4125;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dHKVj/lWaPgnATaRm7vjt+YtPgSIRiyWlpD62e9IiNrOXJQJnXeijkzgurr2886OFnUsFfchc4zNxFadqmM01qPdfmTnJ8jCgqI66VxfcooDxcfaAt9THPJY79hqQJoik7cc+55cC+xQGzpXZ29K5A2yIQQxNaOr+l2gzKBmoEMsgfXNwzpfEGxJ1qq+P+a5fRJZOg/lNCvMysDsBWl9ceKCyeff8XXka4ArPFFdKWxOwLAKrAVoI6dV+ikKKmJZYpP/mIdFXbNmEA7oQd2jYkrt6gEE8xTNdPviS1ybpZoLLRtfaBLdRupSa2fZK/dSIqs+t2PPYRpsZD3PG0HnlQ0pgGU5U+TJ1RIY6k+UyiVpV4dsdIjAay+8UJsHBWy/9WYA/O92Y/Z411QnGzhKh2QRzEaJG0tYvshxmoWWPvc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0e2966-7d71-417f-f352-08d71fcdc89b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 09:08:19.2793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: toiVRG3BagmRCC9bLFObMcwLFxM9Eex/x2pBQoAXrgEENXtYoMj/CryN5XkpWaYN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP7bXD2bEiiDRDhNtZtfWC5KWvBEAMmCuRR8dLZK2EM=;
 b=AR4lKpt71GjeEW0ZdOOR7OUfLC6OzxCn7Sziumb4LY9aXSimqCdkmNfU3iAymaxxznxNT6Q6HvY8rN8KhgD3RuWgNCbNmm8Stj++YQjlGE+2ns1DFDOl7LQOjT8tijmhQzU4SJzbAIrBrMB34lNE2G4b6wLCvjxaxp3Wm0OI1Lw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zml4IHR5cG8gZXJyb3I6CmNoYW5nZSBmdW5jdGlvbiBuYW1lIGZyb20gImFtZGdwdXRfY3R4X3Rv
dGFsX251bV9lbnRpdGllcyIgdG8KImFtZGdwdV9jdHhfdG90YWxfbnVtX2VudGl0aWVzIi4KClNp
Z25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwppbmRleCBiN2I0Y2ZhMjU2ZjEuLjk1ZDgyMDFhNzM4
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwpAQCAtNDMsNyArNDMs
NyBAQCBjb25zdCB1bnNpZ25lZCBpbnQgYW1kZ3B1X2N0eF9udW1fZW50aXRpZXNbQU1ER1BVX0hX
X0lQX05VTV0gPSB7CiAJW0FNREdQVV9IV19JUF9WQ05fSlBFR10JPQkxLAogfTsKIAotc3RhdGlj
IGludCBhbWRncHV0X2N0eF90b3RhbF9udW1fZW50aXRpZXModm9pZCkKK3N0YXRpYyBpbnQgYW1k
Z3B1X2N0eF90b3RhbF9udW1fZW50aXRpZXModm9pZCkKIHsKIAl1bnNpZ25lZCBpLCBudW1fZW50
aXRpZXMgPSAwOwogCkBAIC03NCw3ICs3NCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgc3RydWN0IGRybV9maWxlICpmaWxw
LAogCQkJICAgc3RydWN0IGFtZGdwdV9jdHggKmN0eCkKIHsKLQl1bnNpZ25lZCBudW1fZW50aXRp
ZXMgPSBhbWRncHV0X2N0eF90b3RhbF9udW1fZW50aXRpZXMoKTsKKwl1bnNpZ25lZCBudW1fZW50
aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251bV9lbnRpdGllcygpOwogCXVuc2lnbmVkIGksIGos
IGs7CiAJaW50IHI7CiAKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jdHhf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIHN0YXRpYyB2b2lkIGFtZGdwdV9jdHhf
ZmluaShzdHJ1Y3Qga3JlZiAqcmVmKQogewogCXN0cnVjdCBhbWRncHVfY3R4ICpjdHggPSBjb250
YWluZXJfb2YocmVmLCBzdHJ1Y3QgYW1kZ3B1X2N0eCwgcmVmY291bnQpOwotCXVuc2lnbmVkIG51
bV9lbnRpdGllcyA9IGFtZGdwdXRfY3R4X3RvdGFsX251bV9lbnRpdGllcygpOworCXVuc2lnbmVk
IG51bV9lbnRpdGllcyA9IGFtZGdwdV9jdHhfdG90YWxfbnVtX2VudGl0aWVzKCk7CiAJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBjdHgtPmFkZXY7CiAJdW5zaWduZWQgaSwgajsKIApAQCAt
NTI1LDcgKzUyNSw3IEBAIHN0cnVjdCBkbWFfZmVuY2UgKmFtZGdwdV9jdHhfZ2V0X2ZlbmNlKHN0
cnVjdCBhbWRncHVfY3R4ICpjdHgsCiB2b2lkIGFtZGdwdV9jdHhfcHJpb3JpdHlfb3ZlcnJpZGUo
c3RydWN0IGFtZGdwdV9jdHggKmN0eCwKIAkJCQkgIGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHBy
aW9yaXR5KQogewotCXVuc2lnbmVkIG51bV9lbnRpdGllcyA9IGFtZGdwdXRfY3R4X3RvdGFsX251
bV9lbnRpdGllcygpOworCXVuc2lnbmVkIG51bV9lbnRpdGllcyA9IGFtZGdwdV9jdHhfdG90YWxf
bnVtX2VudGl0aWVzKCk7CiAJZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgY3R4X3ByaW87CiAJdW5z
aWduZWQgaTsKIApAQCAtNTcwLDcgKzU3MCw3IEBAIHZvaWQgYW1kZ3B1X2N0eF9tZ3JfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2N0eF9tZ3IgKm1ncikKIAogbG9uZyBhbWRncHVfY3R4X21ncl9lbnRpdHlf
Zmx1c2goc3RydWN0IGFtZGdwdV9jdHhfbWdyICptZ3IsIGxvbmcgdGltZW91dCkKIHsKLQl1bnNp
Z25lZCBudW1fZW50aXRpZXMgPSBhbWRncHV0X2N0eF90b3RhbF9udW1fZW50aXRpZXMoKTsKKwl1
bnNpZ25lZCBudW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251bV9lbnRpdGllcygpOwog
CXN0cnVjdCBhbWRncHVfY3R4ICpjdHg7CiAJc3RydWN0IGlkciAqaWRwOwogCXVpbnQzMl90IGlk
LCBpOwpAQCAtNTkyLDcgKzU5Miw3IEBAIGxvbmcgYW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2ZsdXNo
KHN0cnVjdCBhbWRncHVfY3R4X21nciAqbWdyLCBsb25nIHRpbWVvdXQpCiAKIHZvaWQgYW1kZ3B1
X2N0eF9tZ3JfZW50aXR5X2Zpbmkoc3RydWN0IGFtZGdwdV9jdHhfbWdyICptZ3IpCiB7Ci0JdW5z
aWduZWQgbnVtX2VudGl0aWVzID0gYW1kZ3B1dF9jdHhfdG90YWxfbnVtX2VudGl0aWVzKCk7CisJ
dW5zaWduZWQgbnVtX2VudGl0aWVzID0gYW1kZ3B1X2N0eF90b3RhbF9udW1fZW50aXRpZXMoKTsK
IAlzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4OwogCXN0cnVjdCBpZHIgKmlkcDsKIAl1aW50MzJfdCBp
ZCwgaTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
