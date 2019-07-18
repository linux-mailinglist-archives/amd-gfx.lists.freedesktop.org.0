Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C76CC18
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 11:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA856E35B;
	Thu, 18 Jul 2019 09:43:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0776E35B
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 09:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd00CGQfFBov+0RxB+aQqge9a+YeKV/wT3m7A0wVy/7GGev9B5zNZyjjK5amAt05LiS3JgE1tbMV1Gg8Uq50bkq0JjGID3Am1mkXxrsMZfQASsIiFzO/WPHvlRQwjdOHYYGjwITPJUpnaNZYAskiqO54XGWOTmx18Z+7gO5OhFQoFNh9oWXR9t7NEtlaaDSUGGafvv/rdLN57zd7Sfc1+rtCTFLkXhssDP7Ld9IIy/lTJxnWD2hgBJQpJ6GV9/G5u2NEDGWQLzOdusEbaagiMbIwT6iemvwFp4StX6T+yq+T+Z1TiAN75/1Yhi3Kf6Xqy1A9/0S+OGVd0HMi352xEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSQPEwMn+wBgi5AN2Cpvh1CEUexZCO6hMhf4af1GN20=;
 b=n0N0eUP80bIknBjyxG4QvtRHV1Vw59ZFEXAG4U05TsPSq4gEZilGr2uCz9EJtKq3Jkf8WlshHMOjZEc06CYprnRZOBz67NNWwH7SrsPMh2xbuSE4J1cbHlbnUNJPs1cx0o7SiET5ReuQx19YxPro7HdIKjdgxg2j/g+nmoEqsXNJI3KivdvezrvzMP8i/ID4KIRcaHxA02vgSRyYROPkK06xvDb2U3l+rg1X6IVonqjbq5fryzZ3Ok2suaM10F8S/LieTzswsZnfIwvGGd832abIk4Mz6hLsbfMdCcAzj21PXF2P6uuIZ0qonFZGHn+KN6ty8SbNhtQr1ahhblf3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB3348.namprd12.prod.outlook.com (20.178.210.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 18 Jul 2019 09:43:06 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 09:43:06 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Topic: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPU0zi/IEJ0Yhq0yFgHm+keJTNQ==
Date: Thu, 18 Jul 2019 09:43:06 +0000
Message-ID: <20190718094249.22234-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To BN8PR12MB3283.namprd12.prod.outlook.com
 (2603:10b6:408:6e::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05b80502-4955-4607-aceb-08d70b6455b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3348; 
x-ms-traffictypediagnostic: BN8PR12MB3348:
x-microsoft-antispam-prvs: <BN8PR12MB334886A94B64F9A35D2C5FAAA2C80@BN8PR12MB3348.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:293;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(2906002)(54906003)(186003)(71200400001)(5660300002)(6486002)(66556008)(2351001)(26005)(14454004)(6506007)(8676002)(386003)(2616005)(6436002)(71190400001)(2501003)(52116002)(256004)(476003)(102836004)(64756008)(6916009)(36756003)(5640700003)(99286004)(6116002)(68736007)(3846002)(86362001)(81156014)(4326008)(25786009)(53936002)(66066001)(1076003)(316002)(50226002)(66946007)(66446008)(6512007)(478600001)(7736002)(305945005)(486006)(81166006)(8936002)(66476007)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3348;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sbZ/NUXJt8jq8zcIsC3zmoKuhFKGxfTKqjKzVbw1hFy1l5aVTAOcP4KoX2OrfNKFqPC7mWrLWZCzHUFjoXN0C1f1asYILaE5lx/tEXljZDl7E86uodWv60Br6fdZPA61g4KSW1nBMjCkzjOF7NYIj/ksUaNUkAlmxIE1ClzhrL/RNwXNDTNjeehpt/2f/ABgY8qxs9oKI8JOj3QLMMKpFJQj19ESi6EdnkdGIKAf55WWx+OHCScSw8qhMEdLKUyeY6EkqpcxA9Bq9L/HPw54GJyYMsIJYO6ZhH2ARWLg1q7OVertMtBRnY+jNsidPsLBfjduXdoawC0UONIAYbyHX4dVjdzNOws1oNkbCd/IBu3g+ESY8TNvUbO+81gSgUjnUMpsnEFr5fgTeLIIgsEV075FxB8nu2OiAM4EQV8dkXc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b80502-4955-4607-aceb-08d70b6455b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:43:06.1725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3348
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSQPEwMn+wBgi5AN2Cpvh1CEUexZCO6hMhf4af1GN20=;
 b=qnlAlhAT+tqvLqdOb+f1yF/KXi0uDvaQ01FlGFOXIjHpSKAgYmyN6WFumnioAmSQunnpMdnCRn9Fp6f0Y9dt5Sk3LtDwTx4EtZMKeOUvYtCzE4Jcz9etKFhNoIUdBRKYUsYDSK2bBM5Du5zYu7yo+mUsWMDHPKEcbdrYDzm4DvY=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Wang, 
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Xu, Feifei" <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

djI6CnNldCBhdmVyYWdlIGNsb2NrIHZhbHVlIG9uIGxldmVsIDEgd2hlbiBjdXJyZW50IGNsb2Nr
IGVxdWFsCm1pbiBvciBtYXggY2xvY2sgKGZpbmUgZ3JhaW5lZCBkcG0gc3VwcG9ydCkuCgp0aGUg
bmF2aTEwIGdmeGNsayAoc2Nsaykgc3VwcG9ydCBmaW5lIGdyYWluZWQgRFBNLApzbyB1c2UgbGV2
ZWwgMSB0byBzaG93IGN1cnJlbnQgZHBtIGZyZXEgaW4gc3lzZnMgcHBfZHBtX3h4eAoKQ2hhbmdl
LUlkOiBJMTRkYWE2ZTMwYzUyYzg5Nzk1NzA4ZWMwNjY2MDg2MmJiNDU5MTAzNgpTaWduZWQtb2Zm
LWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCA4OTVhNGU1OTJkNWEu
LjFmNzIxYjg1YzBmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
bmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYwpAQCAtNjI3LDExICs2MjcsMjYgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0X2N1cnJlbnRf
Y2xrX2ZyZXFfYnlfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJuIHJldDsK
IH0KIAorc3RhdGljIGJvb2wgbmF2aTEwX2lzX3N1cHBvcnRfZmluZV9ncmFpbmVkX2RwbShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUpCit7CisJUFBU
YWJsZV90ICpwcHRhYmxlID0gc211LT5zbXVfdGFibGUuZHJpdmVyX3BwdGFibGU7CisJRHBtRGVz
Y3JpcHRvcl90ICpkcG1fZGVzYyA9IE5VTEw7CisJdWludDMyX3QgY2xrX2luZGV4ID0gMDsKKwor
CWNsa19pbmRleCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOworCWRwbV9kZXNj
ID0gJnBwdGFibGUtPkRwbURlc2NyaXB0b3JbY2xrX2luZGV4XTsKKworCS8qIDAgLSBGaW5lIGdy
YWluZWQgRFBNLCAxIC0gRGlzY3JldGUgRFBNICovCisJcmV0dXJuIGRwbV9kZXNjLT5TbmFwVG9E
aXNjcmV0ZSA9PSAwID8gdHJ1ZSA6IGZhbHNlOworfQorCiBzdGF0aWMgaW50IG5hdmkxMF9wcmlu
dF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJZW51bSBzbXVfY2xrX3R5
cGUgY2xrX3R5cGUsIGNoYXIgKmJ1ZikKIHsKIAlpbnQgaSwgc2l6ZSA9IDAsIHJldCA9IDA7CiAJ
dWludDMyX3QgY3VyX3ZhbHVlID0gMCwgdmFsdWUgPSAwLCBjb3VudCA9IDA7CisJdWludDMyX3Qg
ZnJlcV92YWx1ZXNbM10gPSB7MH07CisJdWludDMyX3QgbWFya19pbmRleCA9IDA7CiAKIAlzd2l0
Y2ggKGNsa190eXBlKSB7CiAJY2FzZSBTTVVfR0ZYQ0xLOgpAQCAtNjQ0LDIyICs2NTksNDIgQEAg
c3RhdGljIGludCBuYXZpMTBfcHJpbnRfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwKIAkJcmV0ID0gc211X2dldF9jdXJyZW50X2Nsa19mcmVxKHNtdSwgY2xrX3R5cGUsICZjdXJf
dmFsdWUpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHNpemU7CisKIAkJLyogMTBLSHogLT4gTUh6
ICovCiAJCWN1cl92YWx1ZSA9IGN1cl92YWx1ZSAvIDEwMDsKIAotCQlzaXplICs9IHNwcmludGYo
YnVmLCAiY3VycmVudCBjbGs6ICV1TWh6XG4iLCBjdXJfdmFsdWUpOwotCiAJCXJldCA9IHNtdV9n
ZXRfZHBtX2xldmVsX2NvdW50KHNtdSwgY2xrX3R5cGUsICZjb3VudCk7CiAJCWlmIChyZXQpCiAJ
CQlyZXR1cm4gc2l6ZTsKIAotCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgewotCQkJcmV0
ID0gc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzbXUsIGNsa190eXBlLCBpLCAmdmFsdWUpOwor
CQlpZiAoIW5hdmkxMF9pc19zdXBwb3J0X2ZpbmVfZ3JhaW5lZF9kcG0oc211LCBjbGtfdHlwZSkp
IHsKKwkJCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJCQkJcmV0ID0gc211X2dldF9k
cG1fZnJlcV9ieV9pbmRleChzbXUsIGNsa190eXBlLCBpLCAmdmFsdWUpOworCQkJCWlmIChyZXQp
CisJCQkJCXJldHVybiBzaXplOworCisJCQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIl
ZDogJXVNaHogJXNcbiIsIGksIHZhbHVlLAorCQkJCQkJY3VyX3ZhbHVlID09IHZhbHVlID8gIioi
IDogIiIpOworCQkJfQorCQl9IGVsc2UgeworCQkJcmV0ID0gc211X2dldF9kcG1fZnJlcV9ieV9p
bmRleChzbXUsIGNsa190eXBlLCAwLCAmZnJlcV92YWx1ZXNbMF0pOworCQkJaWYgKHJldCkKKwkJ
CQlyZXR1cm4gc2l6ZTsKKwkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc211LCBj
bGtfdHlwZSwgY291bnQgLSAxLCAmZnJlcV92YWx1ZXNbMl0pOwogCQkJaWYgKHJldCkKIAkJCQly
ZXR1cm4gc2l6ZTsKIAotCQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlZDogJXVNaHog
JXNcbiIsIGksIHZhbHVlLAotCQkJCQljdXJfdmFsdWUgPT0gdmFsdWUgPyAiKiIgOiAiIik7CisJ
CQlmcmVxX3ZhbHVlc1sxXSA9IGN1cl92YWx1ZTsKKwkJCW1hcmtfaW5kZXggPSBjdXJfdmFsdWUg
PT0gZnJlcV92YWx1ZXNbMF0gPyAwIDoKKwkJCQkgICAgIGN1cl92YWx1ZSA9PSBmcmVxX3ZhbHVl
c1syXSA/IDIgOiAxOworCQkJaWYgKG1hcmtfaW5kZXggIT0gMSkKKwkJCQlmcmVxX3ZhbHVlc1sx
XSA9IChmcmVxX3ZhbHVlc1swXSArIGZyZXFfdmFsdWVzWzJdKSAvIDI7CisKKwkJCWZvciAoaSA9
IDA7IGkgPCAzOyBpKyspIHsKKwkJCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVkOiAl
dU1oeiAlc1xuIiwgaSwgZnJlcV92YWx1ZXNbaV0sCisJCQkJCQlpID09IG1hcmtfaW5kZXggPyAi
KiIgOiAiIik7CisJCQl9CisKIAkJfQogCQlicmVhazsKIAlkZWZhdWx0OgotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
