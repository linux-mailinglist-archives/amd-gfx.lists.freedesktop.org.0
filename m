Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24607DE764
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 11:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB7389C5E;
	Mon, 21 Oct 2019 09:08:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780070.outbound.protection.outlook.com [40.107.78.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE19989C5E
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 09:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOa2MT4MNZYaZGTvpPzrnbiSEecaXgTrBFTuEX9wZ3Hjv9tiCK2OY56cXuf+xc0SURHKM/M8cMbVKRIl9XXnu8Kj+3mVwo1CpGIXDVUFKYJ7Fz4vbNieIS3CMQEbDeFqu1FB3kGVJ95xw8wgqgBMnRRujAHcAugQvH3NCYUm2fWWthXfztlJ4j7GEgvb7ghmarM0XGB8DgEE+vsdV73WQLw24XY2jIUH5weUIe3sqAR/+S4yWlCCz7eUPuoFbyY0zf5g3xrxfXWIu+83MkIyrPNsNn68YpHLp9AmuoAfXSQYYigQDIDYgW0vRZtJ1siPQC4iM4Yo+DF0JyOT4QywLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5HMu/I/f+FQ0KlymZC6xhUsCqRXysE4liw6exzT4hQ=;
 b=B/VCpwC0SB/Z5qZ20ZNlCKSHmTh3uGW4QOiqR2wK1clXOegbcl95ktfFVw1axAQ/As+rUL00PjDmCu8epTbmM9HSydnLalaIFvI6cgbArIeBk9IKb44geO5OZvnjIColXKOamqQZqvNG0B4zSmgoFmh+X/shE2vAHMWHj0bSHYH1aBAbC0XKyaU6wEQEwIe+SsBlG7Dv3YOIJfEhQ+0Aqpqys/jOyu8K0Shfts6mslzfNg0MG+hGObr7E2wPpHTOAbkll/EpUDx3pCzF8twkDeUOIghXyIKTrsniDi/VWbmBcVdd0HvohkqRCbXeb+7D/IKRYRUhGFfx92ivGaxotw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3143.namprd12.prod.outlook.com (20.178.55.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 21 Oct 2019 09:08:06 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.019; Mon, 21 Oct 2019
 09:08:06 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Index: AQHVh+8N5mrw8nPdiEumnSvGbahk/A==
Date: Mon, 21 Oct 2019 09:08:06 +0000
Message-ID: <20191021090735.19696-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0023.apcprd06.prod.outlook.com
 (2603:1096:202:2e::35) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c53b37b3-f54b-4e23-69d7-08d756062f78
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3143:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3143676FB3832C9FB9A3200BF1690@BYAPR12MB3143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(189003)(199004)(14454004)(478600001)(186003)(25786009)(6636002)(102836004)(26005)(6506007)(386003)(66066001)(305945005)(86362001)(36756003)(66946007)(66476007)(66556008)(64756008)(66446008)(52116002)(7736002)(99286004)(4326008)(3846002)(6116002)(81166006)(81156014)(1076003)(6512007)(8936002)(71200400001)(71190400001)(2501003)(6436002)(110136005)(54906003)(256004)(316002)(2616005)(6486002)(476003)(8676002)(5660300002)(486006)(50226002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3143;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8yr2zTBHIfCNKXdkl62MUF0HBWfEeEckr3UPL59DPioHlkbtXNrDwWoMclge7YVp7qOrEa8vx2qgP6Y8EvxCfXiRuoPYdrxKjqd9zVLNTWJxTKJFTLXjEGOrTZOUVkrKdvaC6xL3waRnAoEyQ1Ui3HlCvcnERcz3/SmOJSWY3Q/cWKWZOX/AjsmqMjO0v8TdUsXn5QQeRZ/Jd7OfrPPieFZKyT9k2KcIWQBQrn8drvAsL9f7SdLf2Ah/jGfkBHlko2UABbntkwUfjN9Ouh1oaPw5X6xFNwd5Qw7D3ur1S/b67y0l9sKOliX2TAM7R0VT+wUSBuCDwpmhcfCyUW6HC+i1Pqt+nsJsNg8WskhreRalpCPuYW9u7P2INqfENoXQjmV5NZ1S4dtjOrB1oTFh0xBufz3TRUYKodTyeHCmfIQ36t8yHXAKfo6JmlxZkvsa
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53b37b3-f54b-4e23-69d7-08d756062f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 09:08:06.4256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FN28M24rUUux5AC8gc+qYctt4te2O6BGVeEucZlkM45SzczdDtCgEBGYtVmKOpOvnD9wJjurYoTAKsfJJMywmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5HMu/I/f+FQ0KlymZC6xhUsCqRXysE4liw6exzT4hQ=;
 b=oWWUPVNGTyOIwyZARRKMfaR+7EUZFhoA3vc1ohO6XvFCf7jusZ0mGX1wcQd02bA1RBUBf/VFkPqZvxHG7RpmkknTZECT3h1wUMSjc+mBwP++sMmrHOQx61rXBXD7e1k0bPqlicY8HYRWoQAbX4UFLQTbp82v9Hlq5yKWUlEUuFg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVib290IG9wZXJhdGlvbiBmb3IgcmFzIHJlY292ZXJ5IGlzIG9uZSBjb21tb24gZGVidWdmcwpl
bnRyeSwgd2hpY2ggc2hvdWxkIGdldCByaWQgb2YgcmFzX2N0cmwgbm9kZSBhbmQgcmVtb3ZlCmlw
IGRlcGVuZGVuY2Ugd2hlbiBpbnB1dHRpbmcgYnkgdXNlci4gU28gYWRkIG9uZSBuZXcKYXV0b19y
ZWJvb3Qgbm9kZSBpbiByYXMgZGVidWdmcyBkaXIgdG8gYWNoaWV2ZSB0aGlzLgoKU2lnbmVkLW9m
Zi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IDYyMjAzOTQ1MjFlNC4uM2Fk
Y2QyOWZlYjVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0x
NTMsOCArMTUzLDYgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9k
YXRhKHN0cnVjdCBmaWxlICpmLAogCQlvcCA9IDE7CiAJZWxzZSBpZiAoc3NjYW5mKHN0ciwgImlu
amVjdCAlMzJzICU4cyIsIGJsb2NrX25hbWUsIGVycikgPT0gMikKIAkJb3AgPSAyOwotCWVsc2Ug
aWYgKHNzY2FuZihzdHIsICJyZWJvb3QgJTMycyIsIGJsb2NrX25hbWUpID09IDEpCi0JCW9wID0g
MzsKIAllbHNlIGlmIChzdHJbMF0gJiYgc3RyWzFdICYmIHN0clsyXSAmJiBzdHJbM10pCiAJCS8q
IGFzY2lpIHN0cmluZywgYnV0IGNvbW1hbmRzIGFyZSBub3QgbWF0Y2hlZC4gKi8KIAkJcmV0dXJu
IC1FSU5WQUw7CkBAIC0yMjMsNyArMjIxLDYgQEAgc3RhdGljIHN0cnVjdCByYXNfbWFuYWdlciAq
YW1kZ3B1X3Jhc19maW5kX29iaihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqIC0gMDog
ZGlzYWJsZSBSQVMgb24gdGhlIGJsb2NrLiBUYWtlIDo6aGVhZCBhcyBpdHMgZGF0YS4KICAqIC0g
MTogZW5hYmxlIFJBUyBvbiB0aGUgYmxvY2suIFRha2UgOjpoZWFkIGFzIGl0cyBkYXRhLgogICog
LSAyOiBpbmplY3QgZXJyb3JzIG9uIHRoZSBibG9jay4gVGFrZSA6OmluamVjdCBhcyBpdHMgZGF0
YS4KLSAqIC0gMzogcmVib290IG9uIHVucmVjb3ZlcmFibGUgZXJyb3IKICAqCiAgKiBIb3cgdG8g
dXNlIHRoZSBpbnRlcmZhY2U/CiAgKiBwcm9ncmFtczoKQEAgLTMwNSw5ICszMDIsNiBAQCBzdGF0
aWMgc3NpemVfdCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF93cml0ZShzdHJ1Y3QgZmlsZSAqZiwg
Y29uc3QgY2hhciBfX3VzZXIgKgogCQkvKiBkYXRhLmluamVjdC5hZGRyZXNzIGlzIG9mZnNldCBp
bnN0ZWFkIG9mIGFic29sdXRlIGdwdSBhZGRyZXNzICovCiAJCXJldCA9IGFtZGdwdV9yYXNfZXJy
b3JfaW5qZWN0KGFkZXYsICZkYXRhLmluamVjdCk7CiAJCWJyZWFrOwotCWNhc2UgMzoKLQkJYW1k
Z3B1X3Jhc19nZXRfY29udGV4dChhZGV2KS0+cmVib290ID0gdHJ1ZTsKLQkJYnJlYWs7CiAJZGVm
YXVsdDoKIAkJcmV0ID0gLUVJTlZBTDsKIAkJYnJlYWs7CkBAIC0zNDYsNiArMzQwLDQ2IEBAIHN0
YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19lZXByb21fd3JpdGUoc3RydWN0IGZpbGUg
KmYsIGNvbnN0IGNoYXIgX191c2VyCiAJcmV0dXJuIHJldCA9PSAxID8gc2l6ZSA6IC1FSU87CiB9
CiAKKy8qKgorICogRE9DOiBBTURHUFUgUkFTIGRlYnVnZnMgYXV0byByZWJvb3QgaW50ZXJmYWNl
CisgKgorICogQWZ0ZXIgb25lIHVuY29ycmVjdGFibGUgZXJyb3IgaGFwcGVucywgR1BVIHJlY292
ZXJ5IHdpbGwgYmUgc2NoZWR1bGVkLgorICogRHVlIHRvIHRoZSBrbm93biBwcm9ibGVtIGluIEdQ
VSByZWNvdmVyeSBmYWlsaW5nIHRvIGJyaW5nIEdQVSBiYWNrLCB0aGlzCisgKiBpbnRlcmZhY2Ug
cHJvdmlkZXMgb25lIGRpcmVjdCB3YXkgdG8gdXNlciB0byByZWJvb3Qgc3lzdGVtIGF1dG9tYXRp
Y2FsbHkKKyAqIGluIHN1Y2ggY2FzZSB3aXRoaW4gRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGdl
bmVyYXRlZC4gTm9ybWFsIEdQVSByZWNvdmVyeQorICogcm91dGluZSB3aWxsIG5ldmVyIGJlIGNh
bGxlZC4KKyAqCisgKiBFbmFibGUgYXV0b19yZWJvb3Q6CisgKgorICoJZWNobyAxID4gL3N5cy9r
ZXJuZWwvZGVidWcvZHJpL3gvcmFzL2F1dG9fcmVib290CisgKgorICogUmV2ZXJ0IGF1dG9fcmVi
b290OgorICoKKyAqIAllY2hvIDAgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkveC9yYXMvYXV0b19y
ZWJvb3QKKyAqCisgKi8KK3N0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rf
d3JpdGUoc3RydWN0IGZpbGUgKmYsCisJY29uc3QgY2hhciBfX3VzZXIgKmJ1Ziwgc2l6ZV90IHNp
emUsIGxvZmZfdCAqcG9zKQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0KKwkJKHN0
cnVjdCBhbWRncHVfZGV2aWNlICopZmlsZV9pbm9kZShmKS0+aV9wcml2YXRlOworCWNoYXIgdG1w
WzhdID0gezB9OworCWludCB2YWx1ZSA9IC0xOworCisJaWYgKHNpemUgIT0gc2ltcGxlX3dyaXRl
X3RvX2J1ZmZlcih0bXAsIHNpemVvZih0bXApLCBwb3MsIGJ1Ziwgc2l6ZSkpCisJCXJldHVybiAt
RUlOVkFMOworCisJaWYgKGtzdHJ0b2ludCh0bXAsIDEwLCAmdmFsdWUpKQorCQlyZXR1cm4gLUVJ
TlZBTDsKKworCWlmICh2YWx1ZSA9PSAxKQorCQlhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYp
LT5yZWJvb3QgPSB0cnVlOworCWVsc2UgaWYgKHZhbHVlID09IDApCisJCWFtZGdwdV9yYXNfZ2V0
X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IGZhbHNlOworCisJcmV0dXJuIHNpemU7Cit9CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGFtZGdwdV9yYXNfZGVidWdmc19jdHJs
X29wcyA9IHsKIAkub3duZXIgPSBUSElTX01PRFVMRSwKIAkucmVhZCA9IE5VTEwsCkBAIC0zNjAs
NiArMzk0LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGFtZGdwdV9y
YXNfZGVidWdmc19lZXByb21fb3BzID0gewogCS5sbHNlZWsgPSBkZWZhdWx0X2xsc2VlawogfTsK
IAorc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgYW1kZ3B1X3Jhc19kZWJ1Z2Zz
X3JlYm9vdF9vcHMgPSB7CisJLm93bmVyID0gVEhJU19NT0RVTEUsCisJLnJlYWQgPSBOVUxMLAor
CS53cml0ZSA9IGFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rfd3JpdGUsCisJLmxsc2VlayA9IGRl
ZmF1bHRfbGxzZWVrCit9OworCiAvKioKICAqIERPQzogQU1ER1BVIFJBUyBzeXNmcyBFcnJvciBD
b3VudCBJbnRlcmZhY2UKICAqCkBAIC0xMDM3LDYgKzEwNzgsOCBAQCBzdGF0aWMgdm9pZCBhbWRn
cHVfcmFzX2RlYnVnZnNfY3JlYXRlX2N0cmxfbm9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAkJCQlhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3BzKTsKIAlkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKCJyYXNfZWVwcm9tX3Jlc2V0IiwgU19JV1VHTyB8IFNfSVJVR08sIGNvbi0+ZGly
LAogCQkJCWFkZXYsICZhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9tX29wcyk7CisJZGVidWdmc19j
cmVhdGVfZmlsZSgiYXV0b19yZWJvb3QiLCBTX0lXVUdPIHwgU19JUlVHTywgY29uLT5kaXIsCisJ
CQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rfb3BzKTsKIH0KIAogdm9pZCBhbWRn
cHVfcmFzX2RlYnVnZnNfY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
