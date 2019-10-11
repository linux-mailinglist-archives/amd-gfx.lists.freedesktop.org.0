Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD79D3688
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 02:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954456E3EE;
	Fri, 11 Oct 2019 00:51:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79B16E3EE
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 00:51:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrQfwUmNi3ixPA1rxIQOAn7nypJr3S0CCfQ9qTLPHOc0NS8aUh0m/P0xVOU5Iwcj1IzI0G20JAh29Tvr5VTfxCs9bc6GvYpplrstOnwVAHUP0V0Rv5/pQf43aKNkg3uquMl3dUwIm2cQrNzqQz0p8gFCaLjPcZxOe7EA+fSdGjJPWu6O7JREhPFMxds+5KEow//zaceW6rsp20GnvhQ+G8FzxVRjC7wGOZKwNiqfV0gSfWN1Cp7XScN4Qslj+gJ4zzHFSfY1ajnXiqtPWkvf0weuUBV1KKJzSPhujh9A2YV7Bq+5t9HNtoihWNqAPhi9s8//6rMQaktmy/+fLo6yXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWm+Xt7ldJjEMQAtxC582keptH/iEePp/SWIW2vEbMg=;
 b=SnVWQQi0x23fYSsLHO0ZAM2GVFx75x+bZQ30flWl9e1+k1Jalde9AxH2XVl7a3R4K06F3RI1uJV/72opcgFUyqfsU8yAfvLMpKx9Cc42TEve+HT6cJVJh+wzY4kcUsXosVBD3Sb3dvX6zou8KmIzQ43KKpg7nkbZg0hvDnDWeRmfNGurgqQYgG088HiwNDaIURO3424ckSUMvVauak4HVCaVPG9ruG0BAsFk+f75MInWstJehlpOI5dmnWb/QC/9MapaKnP8Lc8VLh2dW115qf5W76b/t7CrFJgtDmk4VlkCkekpA+TItAit1qRTry7KKQO4K7tSWKtw3/WRJRX8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3118.namprd12.prod.outlook.com (20.178.241.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Fri, 11 Oct 2019 00:51:35 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 00:51:35 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/swSMU: custom UMD pstate peak clock for navi14
Thread-Topic: [PATCH] drm/amdgpu/swSMU: custom UMD pstate peak clock for navi14
Thread-Index: AQHVf84HIcvjNtombEWf59fV2faqMg==
Date: Fri, 11 Oct 2019 00:51:34 +0000
Message-ID: <20191011005107.29716-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::14) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa1b4390-6666-48c2-5e27-08d74de52a2b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3118:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3118198AC5F6C3A2E969FFE2A2970@MN2PR12MB3118.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(199004)(189003)(54906003)(6436002)(5660300002)(1076003)(4326008)(66066001)(66946007)(25786009)(6506007)(5640700003)(386003)(2501003)(6916009)(66556008)(6486002)(66476007)(486006)(476003)(2616005)(71200400001)(71190400001)(256004)(64756008)(66446008)(26005)(6512007)(99286004)(102836004)(316002)(36756003)(14454004)(186003)(478600001)(2906002)(81156014)(81166006)(8676002)(6116002)(52116002)(2351001)(305945005)(7736002)(50226002)(3846002)(8936002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3118;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FTRBPtxCOPwl107Ne8sbn61Pshps4BbX2A0nGpZqMoTfZFfGmdO6ru/04sgIYxwGZ2dnvZtcQmErpcKKPn2JhKW4twIUiDyBbXm7AgzXm9cbt4jmNnAi/OIP6umok8JJsyidqI2N2hC1/Us3ut8IummyJ49iGVUSI+iL068E/6LgHcGkcXD91FURcnG+eM3FTNvWlvizLS5zGheyaAI4iYb6P35Z8rdPTkmp83rBBcm1LJhtpJlzGGU7Difw+WtAHDZTZSJlJDMBsdvRHrgwi9EWDYnC6iuPV2tWV1y80nSbVPRgDnJNsk+KhYWmsZBZLwi8PsftWGPH9WI1fefgvKYb5/xyjrJMQmvgjUk0ct1JgOCnsNIin0XciHqr9mFI1ig3fPXnYynPey5IqfBJa4ELJXYO14wpAPgBhEPj3eI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1b4390-6666-48c2-5e27-08d74de52a2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 00:51:34.9037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Bla06fADSZNiaNfnz2dekrTRD69XX5nNDd5rIPmiFDvlh30M/OK9VduIQaz3yBE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWm+Xt7ldJjEMQAtxC582keptH/iEePp/SWIW2vEbMg=;
 b=P/LtXmYXT4eyfM4mb7cRuQYIbSEaLP1rwmO04TsfYx4SIIR5uihaZPfPSk0yfZvgEh0XhsluRb+PbHZQGbJqaQ7pXtcsXb7KaptkBf/d3KJdxB6EdjpU4kQGA+CjQYAvI3iyW45x6Jf4patq2zCZzyDq8jxaeZv5GZI09CtWtBY=
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
Cc: "Hesik, Christopher" <Christopher.Hesik@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIG5hdmkxNCB1bWQgcHN0YXRlIHBlYWsgY2xvY2sgc3VwcG9ydC4KCk5BVkkxNF9VTURfUFNU
QVRFX1BFQUtfWFRfR0ZYQ0xLICAgMTY3MCBNSHoKTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19YVE1f
R0ZYQ0xLICAxNDQ4IE1IegpOQVZJMTRfVU1EX1BTVEFURV9QRUFLX1hMTV9HRlhDTEsgIDExODEg
TUh6Ck5BVkkxNF9VTURfUFNUQVRFX1BFQUtfWFRYX0dGWENMSyAgMTcxNyBNSHoKTkFWSTE0X1VN
RF9QU1RBVEVfUEVBS19YTF9HRlhDTEsgICAxNDQ4IE1IegoKU2lnbmVkLW9mZi1ieTogS2V2aW4g
V2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMgfCA1MyArKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmggfCAgNiArKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNDUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IDY2YTNmY2Q3YjFkMC4uODBlOTZlMzQxMmFj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0xNDY3
LDE4ICsxNDY3LDQ3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX3NldF9wZWFrX2Nsb2NrX2J5X2Rldmlj
ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAl1aW50MzJfdCBzY2xrX2ZyZXEgPSAwLCB1Y2xr
X2ZyZXEgPSAwOwogCXVpbnQzMl90IHVjbGtfbGV2ZWwgPSAwOwogCi0Jc3dpdGNoIChhZGV2LT5w
ZGV2LT5yZXZpc2lvbikgewotCWNhc2UgMHhmMDogLyogWFRYICovCi0JY2FzZSAweGMwOgotCQlz
Y2xrX2ZyZXEgPSBOQVZJMTBfUEVBS19TQ0xLX1hUWDsKLQkJYnJlYWs7Ci0JY2FzZSAweGYxOiAv
KiBYVCAqLwotCWNhc2UgMHhjMToKLQkJc2Nsa19mcmVxID0gTkFWSTEwX1BFQUtfU0NMS19YVDsK
Kwlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgeworCWNhc2UgQ0hJUF9OQVZJMTA6CisJCXN3aXRj
aCAoYWRldi0+cGRldi0+cmV2aXNpb24pIHsKKwkJY2FzZSAweGYwOiAvKiBYVFggKi8KKwkJY2Fz
ZSAweGMwOgorCQkJc2Nsa19mcmVxID0gTkFWSTEwX1BFQUtfU0NMS19YVFg7CisJCQlicmVhazsK
KwkJY2FzZSAweGYxOiAvKiBYVCAqLworCQljYXNlIDB4YzE6CisJCQlzY2xrX2ZyZXEgPSBOQVZJ
MTBfUEVBS19TQ0xLX1hUOworCQkJYnJlYWs7CisJCWRlZmF1bHQ6IC8qIFhMICovCisJCQlzY2xr
X2ZyZXEgPSBOQVZJMTBfUEVBS19TQ0xLX1hMOworCQkJYnJlYWs7CisJCX0KIAkJYnJlYWs7Ci0J
ZGVmYXVsdDogLyogWEwgKi8KLQkJc2Nsa19mcmVxID0gTkFWSTEwX1BFQUtfU0NMS19YTDsKKwlj
YXNlIENISVBfTkFWSTE0OgorCQlzd2l0Y2ggKGFkZXYtPnBkZXYtPnJldmlzaW9uKSB7CisJCWNh
c2UgMHhjNzogLyogWFQgKi8KKwkJY2FzZSAweGY0OgorCQkJc2Nsa19mcmVxID0gTkFWSTE0X1VN
RF9QU1RBVEVfUEVBS19YVF9HRlhDTEs7CisJCQlicmVhazsKKwkJY2FzZSAweGMxOiAvKiBYVE0g
Ki8KKwkJY2FzZSAweGYyOgorCQkJc2Nsa19mcmVxID0gTkFWSTE0X1VNRF9QU1RBVEVfUEVBS19Y
VE1fR0ZYQ0xLOworCQkJYnJlYWs7CisJCWNhc2UgMHhjMzogLyogWExNICovCisJCWNhc2UgMHhm
MzoKKwkJCXNjbGtfZnJlcSA9IE5BVkkxNF9VTURfUFNUQVRFX1BFQUtfWExNX0dGWENMSzsKKwkJ
CWJyZWFrOworCQljYXNlIDB4YzU6IC8qIFhUWCAqLworCQljYXNlIDB4ZjY6CisJCQlzY2xrX2Zy
ZXEgPSBOQVZJMTRfVU1EX1BTVEFURV9QRUFLX1hMTV9HRlhDTEs7CisJCQlicmVhazsKKwkJZGVm
YXVsdDogLyogWEwgKi8KKwkJCXNjbGtfZnJlcSA9IE5BVkkxNF9VTURfUFNUQVRFX1BFQUtfWExf
R0ZYQ0xLOworCQkJYnJlYWs7CisJCX0KIAkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcmV0dXJuIC1F
SU5WQUw7CiAJfQogCiAJcmV0ID0gc211X2dldF9kcG1fbGV2ZWxfY291bnQoc211LCBTTVVfVUNM
SywgJnVjbGtfbGV2ZWwpOwpAQCAtMTUwMSwxMCArMTUzMCw2IEBAIHN0YXRpYyBpbnQgbmF2aTEw
X3NldF9wZWFrX2Nsb2NrX2J5X2RldmljZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHN0YXRp
YyBpbnQgbmF2aTEwX3NldF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCkKIHsKIAlpbnQgcmV0ID0gMDsKLQlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKLQotCWlmIChhZGV2LT5hc2lj
X3R5cGUgIT0gQ0hJUF9OQVZJMTApCi0JCXJldHVybiAtRUlOVkFMOwogCiAJc3dpdGNoIChsZXZl
bCkgewogCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9QRUFLOgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5oCmluZGV4IDYyMGZmMTdjMmZlZi4uYTM3
ZTM3YzVmMTA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5o
CkBAIC0yNyw2ICsyNywxMiBAQAogI2RlZmluZSBOQVZJMTBfUEVBS19TQ0xLX1hUICAJCSgxNzU1
KQogI2RlZmluZSBOQVZJMTBfUEVBS19TQ0xLX1hMICAJCSgxNjI1KQogCisjZGVmaW5lIE5BVkkx
NF9VTURfUFNUQVRFX1BFQUtfWFRfR0ZYQ0xLICAgICAgKDE2NzApCisjZGVmaW5lIE5BVkkxNF9V
TURfUFNUQVRFX1BFQUtfWFRNX0dGWENMSyAgICAgKDE0NDgpCisjZGVmaW5lIE5BVkkxNF9VTURf
UFNUQVRFX1BFQUtfWExNX0dGWENMSyAgICAgKDExODEpCisjZGVmaW5lIE5BVkkxNF9VTURfUFNU
QVRFX1BFQUtfWFRYX0dGWENMSyAgICAgKDE3MTcpCisjZGVmaW5lIE5BVkkxNF9VTURfUFNUQVRF
X1BFQUtfWExfR0ZYQ0xLICAgICAgKDE0NDgpCisKIGV4dGVybiB2b2lkIG5hdmkxMF9zZXRfcHB0
X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAogI2VuZGlmCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
