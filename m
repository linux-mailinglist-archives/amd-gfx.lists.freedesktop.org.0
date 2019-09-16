Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FF0B3480
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 07:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FB56E102;
	Mon, 16 Sep 2019 05:47:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720071.outbound.protection.outlook.com [40.107.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0196E102
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 05:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTUD0RHGPZQ1tF6OipZSdhAVFpE0/eaU58zVwv7II+H1GUH6i2d5WHYlFLMhmcIWzn3GQ/i3CL75xurfJFHYJ6YmwuwRNM4Q7+yxmFKvGZqZG3n0Qkk5mNM5IXny2OJ9uOJNDUhMON9u2t5ZLimYA5ETkLWy4xTqZ+iRbQ1tqw8vKBcP/KQDcbgAvkCCv5oaUFKWiVklzLLxKy50mKnC5h7qO9AHe18rlbVxdQJk5slN2P6/awV1Xux0cwZxobRqVQJZaR/l1OLwsEsZeQI5uDU2FfJEOG5Wlnas/DQ0psJ/CoLfaVKNrg7TyAugu+qOBgHJMLFZglhHe0taMr529Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDyyVRwlx0oKVPxrJ7tkfWx/x+NNr1R8QzBx3xKiLvI=;
 b=mIME2H+U+cbGNpkBdA/dOwGAc0h403PTnfwd5rf04WkB7fTfH0ciYL3P8UZpyaWF/qQLteOU33r6ey7o4T6CugI5uG/y2I8yXT796tGdcf/uPWmJ49pE2rcrIIpKUI5NZGMrd3R1f+eqOu5THIlP83oxw0EXW1ftlTp/XX5DTBEhUytxCm+ZcrUr8B+tGLRrRquzUPBJ/H/lRAlgvutXZs8uzgZvrlJiiQJyQzjQ024EzCTKNy88GvXPHbUla1tN7YCczduwHrSXBM0u/TGJd95p7tUNg9HYVm3Uf04IZFAV6H/dGzDRU2FG2Wnkt98rWX018tqwrOKL9Drgz4AMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2711.namprd12.prod.outlook.com (20.177.125.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 05:47:15 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 05:47:15 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: [PATCH] drm/amdgpu: fix ras ctrl debugfs node leak
Thread-Topic: [PATCH] drm/amdgpu: fix ras ctrl debugfs node leak
Thread-Index: AQHVbFIx/NbEVbzuvU+//X8+osjz1w==
Date: Mon, 16 Sep 2019 05:47:15 +0000
Message-ID: <20190916054655.26380-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0018.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::30) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbd71415-3d64-40f6-e749-08d73a695415
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB2711; 
x-ms-traffictypediagnostic: BYAPR12MB2711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB27116286C50E5B854514D80CF18C0@BYAPR12MB2711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(2906002)(6636002)(8676002)(71200400001)(26005)(71190400001)(7736002)(305945005)(36756003)(478600001)(66446008)(64756008)(66556008)(66476007)(66946007)(316002)(4326008)(110136005)(25786009)(5660300002)(486006)(6506007)(476003)(2616005)(14454004)(3846002)(6116002)(99286004)(256004)(1076003)(6512007)(186003)(6486002)(66066001)(8936002)(53936002)(386003)(81156014)(2501003)(6436002)(50226002)(102836004)(52116002)(86362001)(81166006)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OrAJAADG1+ezQ+52cPnfPAkuFEDa1p9RHot9ccIz7Idw67PLgkT15JYdDZtnMRcKV7keYLZFXRovcIr6+eNiZarxM8srBxNW28Z3ulCIqamKQK1wqALQmr2iZiV84j1RCvlnNtlLgQv8Fti/G8JieePYMxbwbBZ6zrImO/8frazyiqzNogjiveJFMZlrsO8YSgAuXAzsMTZSjGOZFUhZMT9ih4qtdLKFj7n+BiYHhlvPmlXGoEtLRshfNLcL7s370tA6+TEtob8gAFHIRnp9ehFRhA1Zm99iEww55nkTzsbKRHqhaYVVzvDJU0HNZKkherabBckIgFTepIuBhld2t9p82u/V6VLCSsSPSLgFvdAzFMFig4P4M6s+jzPJWRDqlhwzx9FeYLvr5iHl+1/lca50f1xj9W3ufEM2WyEDECc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd71415-3d64-40f6-e749-08d73a695415
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 05:47:15.4532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9GQLZt0MV0OALK0QvEQ/Cw4v4eiqesF+sRcSpGB8C05Aig5ujDs8LN2Gr+7nDf9MqumbqJZwTcnA2RgR5MZLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDyyVRwlx0oKVPxrJ7tkfWx/x+NNr1R8QzBx3xKiLvI=;
 b=gvqj5uv7sA0h6vmqLpKZWRAAaE9UVz4Y0thgEsTisg7uZupcZ9/ILrfiUVQWoXnUKHZNZ/nRIwzXknSEdIfx+5ZaSIBojBeLc1vtMdWcpWDj1qt4s7m/Oo8eFHqwKDSM9rveVWUUXwyNsLrATp7bJrHv2Mwqp3y8/pp4tBFqVQM=
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSB0byByZW1vdmUgdGhlIHdob2xlIGRlYnVnZnMK
ZGlyZWN0b3J5IGluc3RlYWQgb2YgcmVtb3ZpbmcgdGhlIG5vZGUgb25lIGJ5IG9uZS4KCkNoYW5n
ZS1JZDogSTI3ZTllZGFiMjBkNTY4YjE2ZDAxNjNmOGM3YzNkODFmYjY4MzJhY2QKU2lnbmVkLW9m
Zi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTIgKysrKystLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCAgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jCmluZGV4IDVmMDZmMWU2NDVjNy4uMGE5MGU1Y2IzY2E0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC05NzgsMTAgKzk3OCwxMCBAQCBzdGF0
aWMgdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlX2N0cmxfbm9kZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAlzdHJ1Y3QgZHJtX21pbm9yICptaW5vciA9IGFkZXYtPmRkZXYtPnBy
aW1hcnk7CiAKIAljb24tPmRpciA9IGRlYnVnZnNfY3JlYXRlX2RpcigicmFzIiwgbWlub3ItPmRl
YnVnZnNfcm9vdCk7Ci0JY29uLT5lbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYXNfY3RybCIs
IFNfSVdVR08gfCBTX0lSVUdPLCBjb24tPmRpciwKLQkJCQkgICAgICAgYWRldiwgJmFtZGdwdV9y
YXNfZGVidWdmc19jdHJsX29wcyk7Ci0JY29uLT5lbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJy
YXNfZWVwcm9tX3Jlc2V0IiwgU19JV1VHTyB8IFNfSVJVR08sIGNvbi0+ZGlyLAotCQkJCQkgICAg
ICAgYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19lZXByb21fb3BzKTsKKwlkZWJ1Z2ZzX2NyZWF0
ZV9maWxlKCJyYXNfY3RybCIsIFNfSVdVR08gfCBTX0lSVUdPLCBjb24tPmRpciwKKwkJCQlhZGV2
LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3BzKTsKKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJy
YXNfZWVwcm9tX3Jlc2V0IiwgU19JV1VHTyB8IFNfSVJVR08sIGNvbi0+ZGlyLAorCQkJCWFkZXYs
ICZhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9tX29wcyk7CiB9CiAKIHZvaWQgYW1kZ3B1X3Jhc19k
ZWJ1Z2ZzX2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKQEAgLTEwMjYsMTAgKzEw
MjYsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfcmVtb3ZlX2FsbChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlbW92ZShhZGV2LCAm
b2JqLT5oZWFkKTsKIAl9CiAKLQlkZWJ1Z2ZzX3JlbW92ZShjb24tPmVudCk7Ci0JZGVidWdmc19y
ZW1vdmUoY29uLT5kaXIpOworCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShjb24tPmRpcik7CiAJ
Y29uLT5kaXIgPSBOVUxMOwotCWNvbi0+ZW50ID0gTlVMTDsKIH0KIC8qIGRlYnVnZnMgZW5kICov
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCBkZDVkYTNjNjMy
N2UuLmFlMzg2YzQ2NmMwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
aApAQCAtMzE3LDggKzMxNyw2IEBAIHN0cnVjdCBhbWRncHVfcmFzIHsKIAlzdHJ1Y3QgbGlzdF9o
ZWFkIGhlYWQ7CiAJLyogZGVidWdmcyAqLwogCXN0cnVjdCBkZW50cnkgKmRpcjsKLQkvKiBkZWJ1
Z2ZzIGN0cmwgKi8KLQlzdHJ1Y3QgZGVudHJ5ICplbnQ7CiAJLyogc3lzZnMgKi8KIAlzdHJ1Y3Qg
ZGV2aWNlX2F0dHJpYnV0ZSBmZWF0dXJlc19hdHRyOwogCXN0cnVjdCBiaW5fYXR0cmlidXRlIGJh
ZHBhZ2VzX2F0dHI7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
