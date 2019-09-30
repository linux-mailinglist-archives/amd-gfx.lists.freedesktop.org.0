Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5FC1A4F
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 05:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BA78994D;
	Mon, 30 Sep 2019 03:20:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720052.outbound.protection.outlook.com [40.107.72.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68198994D
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 03:19:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kegWGIbXowHB3iLg1E1+L9dgSb6Zoz5DR2H2KfE0F4ALec2XaFuSI6Ow+4NWl6FwhtMvyfafFysRnHCaZ/J3CkCpAV/Q6fEcK6/v1gyoJTKrA0jVYYPh8vdEYvK8m8jS/FhOF7h4BOX+oUemJpBl66iEGGeSUkf8gmKxvbR/uSa2+fIgf46V1t24ml2ltNvD8PhwrCtXs7irC2cwoRgh/rt0m9Pzf2VqEhu7hCaSgyhdaBcBjHbglhwJSIQYhKaWlKaPvGp8RdjQnfLA9+N+ptYwu4dr3rkXdHkApPWl5zo2TePtquVo5Zxxlo/TyHM0FMUrkKaDJ3x9pZk0TIJDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwwhJDw43/TV3291+w/qU/ZYHvKoT1hxbKJhd84TYwQ=;
 b=VLzULbzuZDe3HLFonmgVTGGBWBUBC1FQU96zr3NENKr83R9g9CtCWE7QG0pcRfQ32zOyfQ3s3MADVFL9EQV3TOtJVAon9Et8kBEc3Votv3bzQFDmRdCPiD2obi+G2cUYbo+1pH8snB5cVfkFOooRLuywdHCutnTyiUIbt8GhmZdohcAPtsES3tTvekfAGVAW2VO/BxTuwZ4Gvn/shPKfVD9QUgMNo5SS//wEcI7y3dizMUjKrubT2mr83OE9xLHDzbT95kz+pXYqNVOOtVpmNbMiVb6uF24TMotx3ELC2neAKp7uUOTHVYBdph9OMKS7vfksFkiLZB6YQ40hAH/qHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3629.namprd12.prod.outlook.com (20.178.242.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 30 Sep 2019 03:19:56 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 03:19:55 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: recreate retired page's bo if vram get lost
 in gpu reset
Thread-Topic: [PATCH 1/3] drm/amdgpu: recreate retired page's bo if vram get
 lost in gpu reset
Thread-Index: AQHVdz3uGX/LW6ISLEmATDYlQvboSw==
Date: Mon, 30 Sep 2019 03:19:55 +0000
Message-ID: <20190930031938.10982-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::18) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 648513fd-59c1-4fc8-1d4c-08d7455510d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3629; 
x-ms-traffictypediagnostic: MN2PR12MB3629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36298B5E3DEB11D47D61D543B0820@MN2PR12MB3629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(189003)(66066001)(26005)(71200400001)(71190400001)(1076003)(5660300002)(316002)(186003)(3846002)(2906002)(6116002)(52116002)(66556008)(66476007)(64756008)(66946007)(6486002)(102836004)(86362001)(99286004)(6636002)(6436002)(386003)(14444005)(6506007)(50226002)(305945005)(256004)(6512007)(81166006)(110136005)(476003)(2616005)(486006)(25786009)(7736002)(4326008)(478600001)(66446008)(36756003)(8936002)(8676002)(14454004)(2501003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3629;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pvklS71pMDUPXIYjvY4fbzUgCOIeV8FivqmnzNYczN65PoV9wMxfQoVzmoVd3SemFg0vaHz03q/cnkmAB6oCxh9SqChkg8scqdLrnnU1svwAx/IuFwnljLxdMEML9AJWcvA9FoRdP0IYklUzLEhbHQ63/jT/b/pUPXFt2nf4I/9HLwEJazwj43k6lOolwERAfsJ0+oVtTT117N8hh7780j5rP1GwJt2a7B4QUCcfZk/j0Y3aNAoiJcujOZ9ZNB6tnqO08ED483eVF5B84984Gd6l0hwIoP1PdGAO4U9G3HKNQV5FWTexsjaurJOHZ66/w9v96ZSr/GTPWXTi+pYD/4ngW1gbWB27kDxKrEShEIGgVuqMw85gaB/hxkzo7FnDqgOVyVmDEqQVUOTjyWD5Y8BpYw4XvtlAmaqjCPdQDXg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648513fd-59c1-4fc8-1d4c-08d7455510d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 03:19:55.6417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCXntGi9wMtB5d/t25FIohJN850Wr7bW/FVskoi2k5OuVhcMWhHHL0eqTum/DP2L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwwhJDw43/TV3291+w/qU/ZYHvKoT1hxbKJhd84TYwQ=;
 b=UK7//TiZllSDe2TOkoPP6+VpUV7x1+Xco5ifJGNO8BOusX2TCitXS7GikhR8VPMYpH8T4G1zNJsIk9I5fZw7uC7H9obnVbCis159ocu34tsZ77YqY3Hg4zLPQE/woPTWpAn3QNogX3biHorGXglEMBP7TxxGI8zeWPjdzHVPXJo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIGluZm8gb2YgcmV0aXJlZCBwYWdlJ3MgYm8gbWF5IGJlIGxvc3QgaWYgdnJhbSBsb3N0IGlz
IGVuY291bnRlcmVkCmluIGdwdSByZXNldCAoZ3B1IHBhZ2UgdGFibGUgaW4gdnJhbSBtYXkgYmUg
bG9zdCksIGZvcmNlIHRvIHJlY3JlYXRlCmFsbCBib3MKCnYyOiBzaW1wbGlmeSBOVUxMIHBvaW50
ZXIgY2hlY2sKICAgIGFkZCBtb3JlIGNvbW1lbnRzCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8
dGFvLnpob3UxQGFtZC5jb20+ClN1Z2dlc3RlZC1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJl
eS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5oICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4
IDYyOTU1MTU2NjUzYy4uYTg5ZjZkMDUzYjNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCkBAIC0zNjc1LDYgKzM2NzUsNyBAQCBzdGF0aWMgaW50IGFtZGdw
dV9kb19hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfaGl2ZV9pbmZvICpoaXZlLAogCQkJCWlmICh2
cmFtX2xvc3QpIHsKIAkJCQkJRFJNX0lORk8oIlZSQU0gaXMgbG9zdCBkdWUgdG8gR1BVIHJlc2V0
IVxuIik7CiAJCQkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KHRtcF9hZGV2KTsKKwkJCQkJYW1kZ3B1
X3Jhc19yZWNvdmVyeV9yZXNldCh0bXBfYWRldik7CiAJCQkJfQogCiAJCQkJciA9IGFtZGdwdV9n
dHRfbWdyX3JlY292ZXIoCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5k
ZXggNDg2NTY4ZGVkNmQ2Li4zZjJhMmYxM2U0YzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKQEAgLTE1NzMsNiArMTU3Myw1NCBAQCBzdGF0aWMgaW50IGFtZGdwdV9y
YXNfcmVjb3ZlcnlfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCXJldHVybiAw
OwogfQorCisvKgorICogdGhlIGluZm8gb2YgcmV0aXJlZCBwYWdlJ3MgYm8gbWF5IGJlIGxvc3Qg
aWYgdnJhbSBsb3N0IGlzIGVuY291bnRlcmVkCisgKiBpbiBncHUgcmVzZXQgKGdwdSBwYWdlIHRh
YmxlIGluIHZyYW0gbWF5IGJlIGxvc3QpLCBmb3JjZSB0byByZWNyZWF0ZQorICogYWxsIGJvcwor
ICovCit2b2lkIGFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCit7CisJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRl
eHQoYWRldik7CisJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICpkYXRhOworCXVpbnQ2NF90
IGJwOworCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gTlVMTDsKKwlpbnQgaTsKKworCWlmICghY29u
IHx8ICFjb24tPmVoX2RhdGEpCisJCXJldHVybjsKKworCS8qIE5vdGU6IEl0J3MgY2FsbGVkIGlu
IGdwdSByZXNldCwgcmVjb3ZlcnlfbG9jayBtYXkgYmUgYWNxdWlyZWQgYmVmb3JlCisJICogZ3B1
IHJlc2V0LiBUaGUgZm9sbG93aW5nIGNvZGUgaXMgb3V0IG9mIHByb3RlY3Qgb2YgY29uLT5yZWNv
dmVyeV9sb2NrCisJICogaW4gY2FzZSBvZiBkZWFkbG9jayBhbmQgYnBzX2JvIHNob3VsZCBiZSBy
ZWNyZWF0ZWQgKGlmIHN1Y2Nlc3NmdWxseSkKKwkgKiB3aGV0aGVyIHJlY292ZXJ5X2xvY2sgaXMg
bG9ja2VkIG9yIG5vdC4KKwkgKiBXZSBhc3N1bWUgdGhlcmUgaXMgbm8gb3RoZXIgcmFzIHJlY292
ZXJ5IG9wZXJhdGlvbiBzaW11bHRhbmVvdXMgZHVyaW5nCisJICogZ3B1IHJlc2V0LgorCSAqLwor
CWRhdGEgPSBjb24tPmVoX2RhdGE7CisJLyogZm9yY2UgdG8gcmVzZXJ2ZSBhbGwgcmV0aXJlZCBw
YWdlIGFnYWluICovCisJZGF0YS0+bGFzdF9yZXNlcnZlZCA9IDA7CisKKwlmb3IgKGkgPSBkYXRh
LT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgeworCQlicCA9IGRhdGEtPmJw
c1tpXS5yZXRpcmVkX3BhZ2U7CisKKwkJLyogVGhlcmUgYXJlIHRocmVlIGNhc2VzIG9mIHJlc2Vy
dmUgZXJyb3Igc2hvdWxkIGJlIGlnbm9yZWQ6CisJCSAqIDEpIGEgcmFzIGJhZCBwYWdlIGhhcyBi
ZWVuIGFsbG9jYXRlZCAodXNlZCBieSBzb21lb25lKTsKKwkJICogMikgYSByYXMgYmFkIHBhZ2Ug
aGFzIGJlZW4gcmVzZXJ2ZWQgKGR1cGxpY2F0ZSBlcnJvciBpbmplY3Rpb24KKwkJICogICAgZm9y
IG9uZSBwYWdlKTsKKwkJICogMykgYm8gaW5mbyBpc24ndCBsb3N0IGluIGdwdSByZXNldAorCQkg
Ki8KKwkJaWYgKGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IEFNREdQVV9H
UFVfUEFHRV9TSElGVCwKKwkJCQkJICAgICAgIEFNREdQVV9HUFVfUEFHRV9TSVpFLAorCQkJCQkg
ICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKKwkJCQkJICAgICAgICZibywgTlVMTCkpCisJ
CQlEUk1fTk9URSgiUkFTIE5PVEU6IHJlY3JlYXRlIGJvIGZvciByZXRpcmVkIHBhZ2UgMHglbGx4
IGZhaWxcbiIsIGJwKTsKKwkJZWxzZQorCQkJZGF0YS0+YnBzX2JvW2ldID0gYm87CisJCWRhdGEt
Pmxhc3RfcmVzZXJ2ZWQgPSBpICsgMTsKKwkJYm8gPSBOVUxMOworCX0KK30KIC8qIHJlY292ZXJ5
IGVuZCAqLwogCiAvKiByZXR1cm4gMCBpZiByYXMgd2lsbCByZXNldCBncHUgYW5kIHJlcG9zdC4q
LwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCmluZGV4IGY4MGZkMzQyOGM5
OC4uN2E2MDZkM2JlODA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
CkBAIC00NzksNiArNDc5LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19pc19zdXBw
b3J0ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiB9CiAKIGludCBhbWRncHVfcmFzX3Jl
Y292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwordm9pZCBhbWRncHVfcmFz
X3JlY292ZXJ5X3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIGludCBhbWRncHVf
cmFzX3JlcXVlc3RfcmVzZXRfb25fYm9vdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJ
dW5zaWduZWQgaW50IGJsb2NrKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
