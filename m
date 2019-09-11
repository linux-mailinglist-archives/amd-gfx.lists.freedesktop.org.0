Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD0AF632
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 08:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E33A6EA17;
	Wed, 11 Sep 2019 06:55:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8A96EA17
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 06:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MisgLj6bqe+5Gu1ZweCG13K5mb5sbf4ZU77c7XP2IKJZhVEGQQHudbEGuYUdNsFBRpl0czQeyFE7XzTxxTE05NVanNK+OsoGorpQdbLB2uQGI0hthGR6w6zh+4pDQl32sAvopLxIWUhS01GMw65UBhfNer/d2gnuTLKQSCBW3ZahFU+jEj/WvoOc5siLdCTxCO7Dw9+kRuOjMF24wPlgsFZw5AQ1Bq7ZR2sxnunVmFrlZKi1o9GsxijRUXkW8bkCtIpNVts20jPg2dc5ejutWbX6K0ApWLU6lMKqfvTfQaIWVBtCrcBWG5QmukTnX0Visec4C5kyIa2soVolCPJjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjIL6eARHH0UUFEvM63RcepNoIEEmKyXb2Yn5NEull4=;
 b=YSAdcz6d6ZMzhdBd75+QXztSfOphn8gNSf5d7zpsuvaiqF7qC0X0Q6Tn+tEIba80BvtjQiDUl/D24dH5oL5FuEFrMev5NKQ5pfNdfLJrYOcZ017aYK3iYE8/iitq8mw3MoGMgXuWUMBqMKCft+g/p8pEvYQtfmDuIV8TfAOpafD/CfA87pCw2i3JUNi5UE5FzKqw3YgSKueT3V81QX1DI4DRJ7bKjc7iR9Vj8EaN1d1GoFUv1ZAG9nY8Fub5t7Snf/lOWDJk/w/JTV/09cMQai9cKoefg8wUDT2Tgsn5xfUqO3R5KPSy+mnl6YyKAkMx/Dz7F9N5vVua9N3g+CwmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2902.namprd12.prod.outlook.com (20.179.91.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.17; Wed, 11 Sep 2019 06:54:58 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 06:54:58 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/AgJcYa7VSXEuMmnK++rrhg6cmCqxg
Date: Wed, 11 Sep 2019 06:54:58 +0000
Message-ID: <BYAPR12MB280636CE43902317A10C3E8CF1B10@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 528f239d-045c-4953-1377-08d73684f60e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB2902; 
x-ms-traffictypediagnostic: BYAPR12MB2902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2902056CF1D96AA05005C9A4F1B10@BYAPR12MB2902.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(13464003)(199004)(189003)(14444005)(5660300002)(8676002)(81166006)(486006)(81156014)(54906003)(76176011)(110136005)(25786009)(6506007)(53546011)(102836004)(66066001)(6246003)(26005)(186003)(14454004)(6116002)(4326008)(8936002)(3846002)(53936002)(55016002)(476003)(446003)(11346002)(9686003)(66476007)(66556008)(66946007)(64756008)(74316002)(305945005)(316002)(71190400001)(6436002)(478600001)(52536014)(2906002)(66446008)(7736002)(256004)(86362001)(71200400001)(76116006)(229853002)(7696005)(2501003)(99286004)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2902;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hp1QYQZW+TTNKKPUEhPXMQKknFla+gLqAo6O1yMYRhPENl/nqrnmiMaYGkbfGBwx+abR804qvIEtlsRCuvbAUbcsYvjIFpX/fkotMRZTRsn8K8kyLDFl+MXfdHOEz0MmeDhfZNf13OaqHhVvqU6vuF7ooZP3sUEQLn2DEvgpbWbw0pZbybztLqS6pTJLIKco931fe4Tmt8INOrAGH8wyw23kp/UeUCEMse6zWU8zLQ9pP7EdToYv7jnOSjghQXmFDpp5+StlK6+lc2X80YLYGIauBV2CIrWPr7ohqn1yerTYthQsxzgPZaXgNwHSIOIMGbgsveSs/CtHwLKD9MwOrpFcLa8pG2G1BrY5Of7H1Gn6DQWoCvrdwZgjIBA68Ql9qkN+JgIDugHWQCZUDvnbhNgJ6v1Qgf2+OBR2Yd89SMc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528f239d-045c-4953-1377-08d73684f60e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 06:54:58.5466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5pwZqNKozKVcwdmlrNz3jgkCHTfVV1N8A9BaXqAQOvGbRj0uXelLdZjBoYpbO/9Vgq5v4SKypTme4bowgWJKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2902
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjIL6eARHH0UUFEvM63RcepNoIEEmKyXb2Yn5NEull4=;
 b=c6MlMZ3AOxy2u+iSOKn4vB1FDfnlNkJG1Mt1wkvtUnPvV/9ZLBzAvqKkDMXPwP0vzDWhJSeDD2Nr6r6gvxwu01t1ksmp2gm0cHj8fxEZ0NgA1LAfKsUFNjQE+JIyUMFBRW7OQRGOacDMuC4MarnGXkrw0sdhUlcYKFoKaTlnV20=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWxzbyBpdCdzIGlycmVsZXZhbnQgZm9yIHRoaXMgcGFydGlsY3VsYXIgaW50ZXJydXB0IGFzIHRo
aXMgaXMgZ2VuZXJpYyBSQVMgaW50ZXJydXB0IGFuZCBub3QgbWVtb3J5IGVycm9ycyBzcGVjaWZp
Yy4KW0d1Y2h1bl1PbmUgdHlwbywgaXQgc2hvdWxkIGJlICJwYXJ0aWN1bGFyIiwgbm90ICIgcGFy
dGlsY3VsYXIiLiBXaXRoIHRoYXQgZml4ZWQsIHRoZSBwYXRjaCBpczogUmV2aWV3ZWQtYnk6IEd1
Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgoKCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCkZyb206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPiAK
U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMTkgMzo0MSBBTQpUbzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNv
bT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxB
bGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3Jv
ZHpvdnNreUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBtdXRleCBs
b2NrIGZyb20gYXRvbWljIGNvbnRleHQuCgpQcm9ibGVtOgphbWRncHVfcmFzX3Jlc2VydmVfYmFk
X3BhZ2VzIHdhcyBtb3ZlZCB0byBhbWRncHVfcmFzX3Jlc2V0X2dwdSBiZWNhdXNlIHdyaXRpbmcg
dG8gRUVQUk9NIGR1cmluZyBBU0lDIHJlc2V0IHdhcyB1bnN0YWJsZS4KQnV0IGZvciBFUlJFVkVO
VF9BVEhVQl9JTlRFUlJVUFQgYW1kZ3B1X3Jhc19yZXNldF9ncHUgaXMgY2FsbGVkIGRpcmVjdGx5
IGZyb20gSVNSIGNvbnRleHQgYW5kIHNvIGxvY2tpbmcgaXMgbm90IGFsbG93ZWQuIEFsc28gaXQn
cyBpcnJlbGV2YW50IGZvciB0aGlzIHBhcnRpbGN1bGFyIGludGVycnVwdCBhcyB0aGlzIGlzIGdl
bmVyaWMgUkFTIGludGVycnVwdCBhbmQgbm90IG1lbW9yeSBlcnJvcnMgc3BlY2lmaWMuCltHdWNo
dW5dT25lIHR5cG8sIGl0IHNob3VsZCBiZSAicGFydGljdWxhciIsIG5vdCAiIHBhcnRpbGN1bGFy
Ii4gV2l0aCB0aGF0IGZpeGVkLCB0aGUgcGF0Y2ggaXM6IFJldmlld2VkLWJ5OiBHdWNodW4gQ2hl
biA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4KCkZpeDoKQXZvaWQgY2FsbGluZyBhbWRncHVfcmFzX3Jl
c2VydmVfYmFkX3BhZ2VzIGlmIG5vdCBpbiB0YXNrIGNvbnRleHQuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmgKaW5kZXggMDEyMDM0ZC4uZGQ1ZGEzYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuaApAQCAtNTA0LDcgKzUwNCw5IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGFtZGdwdV9yYXNfcmVzZXRfZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCS8q
IHNhdmUgYmFkIHBhZ2UgdG8gZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQsCiAJICogaTJjIG1heSBi
ZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQKIAkgKi8KLQlhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3Bh
Z2VzKGFkZXYpOworCWlmIChpbl90YXNrKCkpCisJCWFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFn
ZXMoYWRldik7CisKIAlpZiAoYXRvbWljX2NtcHhjaGcoJnJhcy0+aW5fcmVjb3ZlcnksIDAsIDEp
ID09IDApCiAJCXNjaGVkdWxlX3dvcmsoJnJhcy0+cmVjb3Zlcnlfd29yayk7CiAJcmV0dXJuIDA7
Ci0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
