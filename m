Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F0AE3C3
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 08:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA4789F85;
	Tue, 10 Sep 2019 06:31:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820052.outbound.protection.outlook.com [40.107.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76BB89F75
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 06:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkxTteSNwGGRzc2RhrnWLflJNvw/CVIPonAkKqXoi4YPZpv0F20KLb/xkTprqYycMBggiVR+rGroXgVMLzHOn1oKziC7DV2IQ2xST4ymm/FntzXsEGQVSfzcihzjqx6YYUufK1A5cuGjkpEb+TUma3lUPULJuX53Gi5JC1Lwmzm/GfpukOqigumgJnQRY1SlsvAdT6JgVD3QvgOIsXjPvjSsbyyo56rLz2GRgD9L6dad9Goe3SsBycAHP66MhJYnibicLJRwGDcKuY5aWYIQAUw7NBukEcQgk9B8KL0hObXsEBrmURMnq378AOTszRbA4nTq2TyWYdrLImWdwQc2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dohABUcjmQYjz8giy3uiptdn464qmthL8DF4Wvx6B4=;
 b=dhK2PqNoTFIntVIzmhsvI/zJgPGsfSL6c1ME6ektka5tjzw/02zabHwTxfE0SRn6mJmDQm+oBo61pN/HpiShGT89RTIZgLU02gJI6kZyn+uCY7bPAQg1wlPYM9jl9Qn9IkDD8ey53+3porqeVbXLojST2Au4mesPu9+fif2uK78yRROuVG2FPrV2f/r+QQsKCnIC7iI9GcCexs7ibbqzVC2ingBGFMAgMdYt40ZDqhTqubcQBfIRevlg+BvRmHnen7wbvTK6T5LHdHt3Tnrn6Sc7n9pxoxZaGrEK0KmujDxNJk+gjqNU0thtyjCtYKHlFE+dhchR44CU8eyLq3IrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 10 Sep 2019 06:31:25 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 06:31:25 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: rename umc ras_init to err_cnt_init
Thread-Topic: [PATCH 3/3] drm/amdgpu: rename umc ras_init to err_cnt_init
Thread-Index: AQHVZ6FeabRIClFWtUqJVqjrgXjiJg==
Date: Tue, 10 Sep 2019 06:31:25 +0000
Message-ID: <20190910063103.14099-3-tao.zhou1@amd.com>
References: <20190910063103.14099-1-tao.zhou1@amd.com>
In-Reply-To: <20190910063103.14099-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0061.apcprd03.prod.outlook.com
 (2603:1096:203:52::25) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 495f3ded-28d0-4647-425c-08d735b880fc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3389; 
x-ms-traffictypediagnostic: MN2PR12MB3389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33890213BEF6DE2AC840CAC0B0B60@MN2PR12MB3389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(52116002)(316002)(76176011)(256004)(4326008)(6636002)(25786009)(6512007)(102836004)(36756003)(186003)(2906002)(6486002)(71190400001)(71200400001)(6116002)(5660300002)(66066001)(6436002)(3846002)(53936002)(66556008)(66476007)(66946007)(66446008)(64756008)(486006)(50226002)(478600001)(2501003)(86362001)(1076003)(446003)(11346002)(476003)(2616005)(81166006)(8936002)(8676002)(26005)(81156014)(110136005)(7736002)(6506007)(386003)(14454004)(305945005)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A4j8FGesz52PCjW3sUba/YSxmvZBOlUkT4KQk9LLQl0xCD4QykX8CvevjlEE/CJCn0F46AJZTZJmpX20hQNHkulVD+J8NJpFZkpnudy9Wx9zsjb1uuB8qSS33LYWpe7CrueNrLDjQqTXCy51me3x6oGDEoa+b+DvehnITRVm7TB4GnZ+kaaNTabsLuJm5r/Ch+S9vVNQUOmNHhfvU9DrtbCyvoOnjcvQPiQlw9noNUGqWjK0RK/80rF3r7BNA7+gk/U3g0MjfHyVJvfUXlvMmhyDY5yPZWJGgr6WyQw5SNRm5bXEsWcb8LUFwgWXT2m19umzF83XA1AjD4oLr3LkaMg9bCaXpXLxq3uEUT4Cf20Jdc6hBHNbYC3EsbMagHJjX4VO/c81y7/Hm+NCX3M27yYvxs0BHFkwg0nI6a8W2TY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495f3ded-28d0-4647-425c-08d735b880fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 06:31:25.3852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I89Z3CvtKTugKqaJn9f/wbKiz6fydgr0FXGKSXP2TCcewHVtV6WDfAivsrOo9L+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dohABUcjmQYjz8giy3uiptdn464qmthL8DF4Wvx6B4=;
 b=xdUug7IxEDnIYPfeKQiA0uq7FPXN0agmSljm7u/4b8JG5f2ma00O2RjGOttCG/wOIoqRwEYvJEkCd+xIN/p1v0i10EUR7XTIzVOAJJcim9gPKdigMWUBYE7INtev70gjQ8zRhf373PZ9sR42eD3CGRbhZursCz6TDe5GUg+mhRo=
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

dGhpcyBpbnRlcmZhY2UgaXMgcmVsYXRlZCB0byBzcGVjaWZpYyB2ZXJzaW9uIG9mIHVtYywgZGlz
dGluZ3Vpc2ggaXQKZnJvbSByYXNfbGF0ZV9pbml0CgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8
dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgg
fCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jICAgfCA4ICsrKyst
LS0tCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMKaW5kZXggNTY4M2M1MTcxMGFhLi5j
NWQ4YjA4YWY3MzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91bWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMKQEAg
LTYzLDggKzYzLDggQEAgaW50IGFtZGdwdV91bWNfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdm9pZCAqcmFzX2loX2luZm8pCiAJfQogCiAJLyogcmFzIGluaXQgb2Yg
c3BlY2lmaWMgdW1jIHZlcnNpb24gKi8KLQlpZiAoYWRldi0+dW1jLmZ1bmNzICYmIGFkZXYtPnVt
Yy5mdW5jcy0+cmFzX2luaXQpCi0JCWFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQoYWRldik7CisJ
aWYgKGFkZXYtPnVtYy5mdW5jcyAmJiBhZGV2LT51bWMuZnVuY3MtPmVycl9jbnRfaW5pdCkKKwkJ
YWRldi0+dW1jLmZ1bmNzLT5lcnJfY250X2luaXQoYWRldik7CiAKIAlyZXR1cm4gMDsKIApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oCmluZGV4IDZmMjJjOTcwNDU1NS4uM2Vj
MzZkOWUwMTJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oCkBAIC01
NCw3ICs1NCw3IEBACiAJYWRldi0+dW1jLmZ1bmNzLT5kaXNhYmxlX3VtY19pbmRleF9tb2RlKGFk
ZXYpOwogCiBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyB7Ci0Jdm9pZCAoKnJhc19pbml0KShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CisJdm9pZCAoKmVycl9jbnRfaW5pdCkoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOwogCWludCAoKnJhc19sYXRlX2luaXQpKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbyk7CiAJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJv
cl9jb3VudCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCXZvaWQgKnJhc19lcnJv
cl9zdGF0dXMpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2
XzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKaW5kZXggNGNkYjVj
MDRjZDE3Li4xYzBkYTMyYzE1NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3VtY192Nl8xLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEu
YwpAQCAtMjM0LDcgKzIzNCw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJ5X3Jhc19lcnJv
cl9hZGRyZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWFtZGdwdV91bWNfZm9yX2Vh
Y2hfY2hhbm5lbCh1bWNfdjZfMV9xdWVyeV9lcnJvcl9hZGRyZXNzKTsKIH0KIAotc3RhdGljIHZv
aWQgdW1jX3Y2XzFfcmFzX2luaXRfcGVyX2NoYW5uZWwoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCitzdGF0aWMgdm9pZCB1bWNfdjZfMV9lcnJfY250X2luaXRfcGVyX2NoYW5uZWwoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCSBzdHJ1Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0
YSwKIAkJCQkJIHVpbnQzMl90IHVtY19yZWdfb2Zmc2V0LCB1aW50MzJfdCBjaGFubmVsX2luZGV4
KQogewpAQCAtMjY0LDE1ICsyNjQsMTUgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcmFzX2luaXRf
cGVyX2NoYW5uZWwoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJV1JFRzMyKGVjY19lcnJf
Y250X2FkZHIgKyB1bWNfcmVnX29mZnNldCwgVU1DX1Y2XzFfQ0VfQ05UX0lOSVQpOwogfQogCi1z
dGF0aWMgdm9pZCB1bWNfdjZfMV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
K3N0YXRpYyB2b2lkIHVtY192Nl8xX2Vycl9jbnRfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIHsKIAl2b2lkICpyYXNfZXJyb3Jfc3RhdHVzID0gTlVMTDsKIAotCWFtZGdwdV91bWNf
Zm9yX2VhY2hfY2hhbm5lbCh1bWNfdjZfMV9yYXNfaW5pdF9wZXJfY2hhbm5lbCk7CisJYW1kZ3B1
X3VtY19mb3JfZWFjaF9jaGFubmVsKHVtY192Nl8xX2Vycl9jbnRfaW5pdF9wZXJfY2hhbm5lbCk7
CiB9CiAKIGNvbnN0IHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHVtY192Nl8xX2Z1bmNzID0gewot
CS5yYXNfaW5pdCA9IHVtY192Nl8xX3Jhc19pbml0LAorCS5lcnJfY250X2luaXQgPSB1bWNfdjZf
MV9lcnJfY250X2luaXQsCiAJLnJhc19sYXRlX2luaXQgPSBhbWRncHVfdW1jX3Jhc19sYXRlX2lu
aXQsCiAJLnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCA9IHVtY192Nl8xX3F1ZXJ5X3Jhc19lcnJvcl9j
b3VudCwKIAkucXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MgPSB1bWNfdjZfMV9xdWVyeV9yYXNfZXJy
b3JfYWRkcmVzcywKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
