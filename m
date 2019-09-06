Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05097AB481
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 11:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBC86E203;
	Fri,  6 Sep 2019 09:00:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C166E215
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 09:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLyiLU5WQH3WFmVl86QNo+PtDu91cy4gplAla16mV2+5uGDbfuWy3qGdQZL6xfq8rTQEtW/yAXkyh/6GTXHloHzg5iRwfnyidaNfks3jJpDFEDB8GRhpgEm0t6q8wNIt4QSX+H7rTxn0mjH47iNsdqF4n/RkJbaVmfHhZ4nE6HSE+Q5SDdgRALmSfD808IxoVmDQ8OJ4iuoD2eFICDNEtUYAm0MkHB1bU2eOt9M5OIy55ADT9ubA8kSQ4sA1kqUGnn5HQs48ZwruXOlY4mS8frQJ0XDrAmVPyL8aXSnZNy1/YUgjQxU3+YCEZgiXjKSR4yvQxyqX2xjbsjnUesCCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkpBPf1kXL5xQqOa42ln/278hmvG37A64iGEttvtjfQ=;
 b=WG+XU93BFlk3wzVAfUgVtYBerkbDexybXOC/j9IWc425rkeUr4v53KeJDvGBwpjlwUQm/PJ225UeoWIZgEWfqgigLCg3gPw8B9N6E7DwnHsThulkl2g7hmtyq8ydIxALWhp5EL6W0K8ZcGbRXXuDbsL8sz6akpYj5nSKrvpygNaSfjyDZahPuLpCjrGBjY4n2/WqcKiNisb5gvFoMHC/ivY+vDmsXqZbFd6YI1mw1UrGS6h7izX3CsOWxyV/v3NxB2Pm0dv1/ejBjjWcI8+AvwcjYNBtjR6BxikhjV2Qx2+jtl0NqAHsPV3GhDVFBMQS52dAxCTP2EE7tinV7pOi0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3709.namprd12.prod.outlook.com (10.255.236.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Fri, 6 Sep 2019 09:00:33 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 09:00:33 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: move umc ras init to umc block
Thread-Topic: [PATCH 2/3] drm/amdgpu: move umc ras init to umc block
Thread-Index: AQHVZJGK3KIlP/mla0qr9q7H1kGlIQ==
Date: Fri, 6 Sep 2019 09:00:33 +0000
Message-ID: <20190906090011.20271-2-tao.zhou1@amd.com>
References: <20190906090011.20271-1-tao.zhou1@amd.com>
In-Reply-To: <20190906090011.20271-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0050.apcprd04.prod.outlook.com
 (2603:1096:202:14::18) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4a2201b-0964-4b97-f960-08d732a8accf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3709; 
x-ms-traffictypediagnostic: MN2PR12MB3709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3709BCA20DA31E6D5E6D7BCFB0BA0@MN2PR12MB3709.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(199004)(189003)(256004)(26005)(110136005)(386003)(102836004)(6506007)(6436002)(2501003)(36756003)(186003)(6116002)(6486002)(3846002)(2906002)(486006)(66066001)(476003)(316002)(86362001)(2616005)(11346002)(446003)(66476007)(76176011)(64756008)(50226002)(81166006)(81156014)(25786009)(99286004)(5660300002)(6512007)(66556008)(8676002)(52116002)(66946007)(6636002)(8936002)(53936002)(1076003)(478600001)(14454004)(305945005)(71190400001)(71200400001)(4326008)(66446008)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3709;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wdwUEMDBkvmF+TP+xIobyp4Xr3G5BYZI2eNOBGh14LXpeu1X0JrCIh4mwjh1cmL/KAGCoL/9AYX6irggc3x7/df0U2R6IRsLnS+m65Pnu83Jzp7yNh5pa7maamPLJmZ/ve/YlAn2BgXVG2i27rdd0uvt1p+wbbxcPK26QSZIwcEBPmm6KMhxB/vJ3+Fr+BuQTyE/HNH3rxapZ3LH3ntAxGSLekQkzLKYIp/4iZJ1w24M42yudREe+foUBU/Ig+b+KpHJnhWmujDuNeenwMHjcDjjRhpqIYcSgGqSXzhd+1IFoqkMubL/bg2/FconCXVEeyVn8NAwnwUab2KdIr5pFaMBALcCIJ7ykTfu7ej+dEO25/FZIOPXx4kYPlvHTXXKutXHraV8i6xsCkguEq/LFisMF8o867jUgBdS/twAgGM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a2201b-0964-4b97-f960-08d732a8accf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 09:00:33.5077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xm+rwmKm+Y6YIBM6jLTQSTcwO0H7FoS5t/ZahxSbcnWBrH6KBIK/iz+GxW/j7+x8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkpBPf1kXL5xQqOa42ln/278hmvG37A64iGEttvtjfQ=;
 b=LvWLMPBWWswq+hAqg1zrQ7M3pPsItPbbtoiWKwmohVe50FsdTqHj64YVis+x6W+LiaqXfM7p8GQAdXcPzhtxnQ5aLbYwdW3Sog5nsmloZI4lxQUD50izsLblQ88OdThgDe/+Yy0WMwssNq/OXBs1BEEl5usx5/hGHsx7LKOC8qc=
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

bW92ZSB1bWMgcmFzIGluaXQgZnJvbSByYXMgbW9kdWxlIHRvIHVtYyBibG9jaywgZ2VuZXJpYyBy
YXMgbW9kdWxlCnNob3VsZCBwYXkgbGVzcyBhdHRlbnRpb24gdG8gc3BlY2lmaWMgcmFzIGJsb2Nr
LgoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDQgLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMKaW5kZXggZDI0MzdlMTNhMDg1Li5hMGM5ODRkMzU2ZDIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTE2NDgsMTAgKzE2NDgsNiBAQCBpbnQg
YW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmIChhbWRncHVf
cmFzX2ZzX2luaXQoYWRldikpCiAJCWdvdG8gZnNfb3V0OwogCi0JLyogcmFzIGluaXQgZm9yIGVh
Y2ggcmFzIGJsb2NrICovCi0JaWYgKGFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQpCi0JCWFkZXYt
PnVtYy5mdW5jcy0+cmFzX2luaXQoYWRldik7Ci0KIAlEUk1fSU5GTygiUkFTIElORk86IHJhcyBp
bml0aWFsaXplZCBzdWNjZXNzZnVsbHksICIKIAkJCSJoYXJkd2FyZSBhYmlsaXR5WyV4XSByYXNf
bWFza1sleF1cbiIsCiAJCQljb24tPmh3X3N1cHBvcnRlZCwgY29uLT5zdXBwb3J0ZWQpOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jCmluZGV4IGM4ZGUxMjcwOTdhYi4uNTY4
M2M1MTcxMGFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jCkBAIC02
Miw2ICs2MiwxMCBAQCBpbnQgYW1kZ3B1X3VtY19yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbykKIAkJZ290byBmcmVlOwogCX0KIAorCS8q
IHJhcyBpbml0IG9mIHNwZWNpZmljIHVtYyB2ZXJzaW9uICovCisJaWYgKGFkZXYtPnVtYy5mdW5j
cyAmJiBhZGV2LT51bWMuZnVuY3MtPnJhc19pbml0KQorCQlhZGV2LT51bWMuZnVuY3MtPnJhc19p
bml0KGFkZXYpOworCiAJcmV0dXJuIDA7CiAKIGxhdGVfZmluaToKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
