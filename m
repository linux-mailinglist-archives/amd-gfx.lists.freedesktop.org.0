Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D26AD17A
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 03:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0F5896F7;
	Mon,  9 Sep 2019 01:21:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810088.outbound.protection.outlook.com [40.107.81.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94E7896F7
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 01:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brz+iEh/5660ean4a5pRy2zM6df3mEzgq+jyS+9RAqVn60Y9zaCSCiAy+h6eLCmnzrQi9E1VixmIHY/FCKUbRlovwDp0EeEqXmTKuNdk6FkamJ/yNaANMzGDrsEGBcnDAwEJ5CbkcbEStCpHMSTtKzqV1NM52trlvGVZblaLd1+o14pqAaN9N6f6gMVzcS1WS8fM9PwCtzc5tOiJgZgUkASjuD5J5zeNTZSQha45pVCVUwc/TtxrLC2nCy7nNSWyhZtveP0i3MIjmcQMCEwNs3feFfVy12ZUdkKg1kYwnmdyG15WRJs5aKIqDQRhHivXx/pPtZa+n4OtqOGpkHPj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxRN367RSXdO3xzcaJOT+AmIm6EwVbSYnlvJVp3ivVo=;
 b=AznfELmN5fmuMIRcx0RP4E52E7X1DmdJhzGYWK4wiE9m4h98ZYD0zcTJOPp/K0FsvjMSlai8VQXJzm4SOk3cTHeiAHibMrLgX0hnw/hEoDdHv6hdz/eTbDFsiSfKy3AGXvl2LyAAEZjH/HlDpe4z2hg9veehDVA8xuEfrSxEB6eSC7FhSWez+evePB3DO3/jDF97EeRot2ZVWsIsNZjnivh+mtsF1+SD6xyCY+2WQBZ2Uf8tvbdQEW3up3OYsNnnbftkguYx2IVoyCzX3q1fc5bYKQpW1LxgoLuGhPT7hKSu396yFlaMqE+MGfRs8OkkWuODEHbZrHNoHk9vI3WzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3496.namprd12.prod.outlook.com (20.178.196.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 01:21:43 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.014; Mon, 9 Sep 2019
 01:21:43 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block
Thread-Topic: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block
Thread-Index: AQHVZpHG247Z18idHkKWUie/Nqxq0acii62g
Date: Mon, 9 Sep 2019 01:21:43 +0000
Message-ID: <BYAPR12MB2806FF92FAA92669B7886542F1B70@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <1567980418-32146-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567980418-32146-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d9cb2e8-d0b4-4b9a-715f-08d734c4132a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3496; 
x-ms-traffictypediagnostic: BYAPR12MB3496:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB34969435C531003AC218BC04F1B70@BYAPR12MB3496.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(199004)(189003)(13464003)(186003)(53546011)(6506007)(7736002)(74316002)(81156014)(8936002)(81166006)(66066001)(55016002)(6436002)(305945005)(8676002)(9686003)(76176011)(71190400001)(25786009)(2501003)(256004)(99286004)(6246003)(2906002)(33656002)(110136005)(6116002)(76116006)(102836004)(3846002)(6636002)(14454004)(53936002)(14444005)(7696005)(71200400001)(86362001)(52536014)(26005)(5660300002)(446003)(476003)(316002)(478600001)(486006)(229853002)(66446008)(64756008)(66556008)(66476007)(66946007)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3496;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 57Lgoosir2iML9tK7ZnVxbRgvZVR7ZjqOAoErxClP1h4bL69BDppQF/3MKOJ63fmoSHNia0IsKMYSGSK/Gh7qBJD0eweLnQv9tt3DhtFm61vmc0KWT4TNzFzqIsSwS6QTBbRjvaPnWM0nJ6Y3fUhfnsQ/e4BX95LlCmeIJLdH0xh/6vky8GDhYfbpndwkOvwrOpBMObwER2/S13gf+Nnp7pRrsHa/uBOIo1kAOlTT30+8oeH8AqPtlbJCVBWzIVs2t6xY3uAbreg3tRh68USltOyZxs5cO/IBrxEJHrgGbWx9+j7uAOj4yP2U581N77tYk8b4vZYx9K8EsZrTY7uMr/PJH+/Wro/6eHy/yT3RBwjyA+PYoRvq5pSKCZTdUdnhwog/vk8BkqklCWMX7lAiawZrAyYLEMQ9V089BhPz4w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9cb2e8-d0b4-4b9a-715f-08d734c4132a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 01:21:43.4338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16Ckc34VlVgv5r7vX9LoUveRRno5ky2LUZKiyzoAnMZmyzaCFk1TjcGgbtTbqVlgdRs1JzFe6fKnbeXPI5E3yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3496
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxRN367RSXdO3xzcaJOT+AmIm6EwVbSYnlvJVp3ivVo=;
 b=U1lHdMgpA90sorBUR0qKydH3ZnVtpjWs3seCiWgtHAEwnenfqTtiXKc/sJKRw/ByvxLrXD90kEnssdJPc6TElD/KeFggDDG5DzlcFDdSrslVkwcu7QV4Meq6+dNZHxUULpab6mwmL/RDDJGK4njHTdBrhcOY+mvQNqAa4G2iUAc=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBaaGFuZywgSGF3a2luZyA8SGF3a2lu
Zy5aaGFuZ0BhbWQuY29tPiAKU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgOSwgMjAxOSA2OjA3IEFN
ClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhvdTEsIFRhbyA8VGFvLlpob3Ux
QGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBMaSwgRGVubmlz
IDxEZW5uaXMuTGlAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT4KQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClN1
YmplY3Q6IFtQQVRDSCAxLzJdIGRybS9hbWRncHU6IGluaXRpYWxpemUgcmFzIHN0cnVjdHVyZXMg
Zm9yIHhnbWkgYmxvY2sKCmluaXQgcmFzIGNvbW1vbiBpbnRlcmZhY2UgYW5kIGZzIG5vZGUgZm9y
IHhnbWkgYmxvY2sKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggIHwg
IDEgKyAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyB8IDM2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfeGdtaS5oIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YyAgICB8ICA3ICsrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaAppbmRleCAzMzFjZTUwLi5mMDliZDMw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCkBAIC0xMjAsNiArMTIw
LDcgQEAgc3RydWN0IGFtZGdwdV94Z21pIHsKIAkvKiBncHUgbGlzdCBpbiB0aGUgc2FtZSBoaXZl
ICovCiAJc3RydWN0IGxpc3RfaGVhZCBoZWFkOwogCWJvb2wgc3VwcG9ydGVkOworCXN0cnVjdCBy
YXNfY29tbW9uX2lmICpyYXNfaWY7CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1X2dtYyB7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYwppbmRleCA2NWFhZTc1Li43ZjZmMmU5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKQEAgLTI1LDYgKzI1LDcg
QEAKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfeGdtaS5oIgogI2luY2x1
ZGUgImFtZGdwdV9zbXUuaCIKKyNpbmNsdWRlICJhbWRncHVfcmFzLmgiCiAjaW5jbHVkZSAiZGYv
ZGZfM182X29mZnNldC5oIgogCiBzdGF0aWMgREVGSU5FX01VVEVYKHhnbWlfbXV0ZXgpOwpAQCAt
NDM3LDMgKzQzOCwzOCBAQCB2b2lkIGFtZGdwdV94Z21pX3JlbW92ZV9kZXZpY2Uoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJCW11dGV4X3VubG9jaygmaGl2ZS0+aGl2ZV9sb2NrKTsKIAl9
CiB9CisKK2ludCBhbWRncHVfeGdtaV9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KSB7CisJaW50IHI7CisJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0geworCQkuY2Ig
PSBOVUxMLAorCX07CisJc3RydWN0IHJhc19mc19pZiBmc19pbmZvID0geworCQkuc3lzZnNfbmFt
ZSA9ICJ4Z21pX3dhZmxfZXJyX2NvdW50IiwKKwkJLmRlYnVnZnNfbmFtZSA9ICJ4Z21pX3dhZmxf
ZXJyX2luamVjdCIsCisJfTsKKworCWlmICghYWRldi0+Z21jLnhnbWkuc3VwcG9ydGVkIHx8CisJ
ICAgIGFkZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9ub2RlcyA9PSAwKQorCQlyZXR1cm4gMDsK
W0d1Y2h1bl1Mb29rcyB0aGlzIGNoZWNrIG51bV9waHlzaWNhbF9ub2Rlcz09MCBpcyByZWR1bmRh
bnQsIGFzIHRoZXJlIGlzIGFscmVhZHkgb25lIGNoZWNrIG91dHNpZGUgb2YgdGhpcyBmdW5jdGlv
bi4KSXMgaXQgYmV0dGVyIHRvIG1vdmUgdGhlc2UgdHdvIGNvbmRpdGlvbnMgb3V0c2lkZSBvZiB0
aGlzIGZ1bmN0aW9uLCB0byBhbGxvdyBmdW5jdGlvbiBlbnRyYW5jZSBvbmNlIHhnbWkuc3VwcG9y
dGVkIGlzIHRydWUgYW5kIG51bV9waHlzaWNhbF9ub2RlcyA+IDA/CglpZiAoYWRldi0+Z21jLnhn
bWkubnVtX3BoeXNpY2FsX25vZGVzID4gMSkgewoJCXIgPSBhbWRncHVfeGdtaV9yYXNfbGF0ZV9p
bml0KGFkZXYpOwoJCWlmIChyKQoJCQlyZXR1cm4gcjsKCX0KCisJaWYgKCFhZGV2LT5nbWMueGdt
aS5yYXNfaWYpIHsKKwkJYWRldi0+Z21jLnhnbWkucmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3Ry
dWN0IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFhZGV2LT5nbWMueGdtaS5y
YXNfaWYpCisJCQlyZXR1cm4gLUVOT01FTTsKKwkJYWRldi0+Z21jLnhnbWkucmFzX2lmLT5ibG9j
ayA9IEFNREdQVV9SQVNfQkxPQ0tfX1hHTUlfV0FGTDsKKwkJYWRldi0+Z21jLnhnbWkucmFzX2lm
LT50eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKKwkJYWRldi0+
Z21jLnhnbWkucmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAwOworCQlzdHJjcHkoYWRldi0+Z21j
LnhnbWkucmFzX2lmLT5uYW1lLCAieGdtaV93YWZsIik7CisJfQorCWloX2luZm8uaGVhZCA9IGZz
X2luZm8uaGVhZCA9ICphZGV2LT5nbWMueGdtaS5yYXNfaWY7CisJciA9IGFtZGdwdV9yYXNfbGF0
ZV9pbml0KGFkZXYsIGFkZXYtPmdtYy54Z21pLnJhc19pZiwKKwkJCQkgJmZzX2luZm8sICZpaF9p
bmZvKTsKKwlpZiAociB8fCAhYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+Z21j
LnhnbWkucmFzX2lmLT5ibG9jaykpIHsKKwkJa2ZyZWUoYWRldi0+Z21jLnhnbWkucmFzX2lmKTsK
KwkJYWRldi0+Z21jLnhnbWkucmFzX2lmID0gTlVMTDsKKwl9CisKKwlyZXR1cm4gcjsKK30KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5oCmluZGV4IGZiY2VlMzEuLjkwMjM3
ODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuaApAQCAtNDIsNiAr
NDIsNyBAQCB2b2lkIGFtZGdwdV94Z21pX3JlbW92ZV9kZXZpY2Uoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpOyAgaW50IGFtZGdwdV94Z21pX3NldF9wc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIGludCBwc3RhdGUpOyAgaW50IGFtZGdwdV94Z21pX2dldF9ob3BzX2NvdW50KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqcGVlcl9h
ZGV2KTsKK2ludCBhbWRncHVfeGdtaV9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKIAogc3RhdGljIGlubGluZSBib29sIGFtZGdwdV94Z21pX3NhbWVfaGl2ZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmJvX2FkZXYp
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBiZWI2Yzg0Li4wNWE5YThh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTUxLDYgKzUxLDcgQEAK
ICNpbmNsdWRlICJpdnNyY2lkL3ZtYy9pcnFzcmNzX3ZtY18xXzAuaCIKIAogI2luY2x1ZGUgImFt
ZGdwdV9yYXMuaCIKKyNpbmNsdWRlICJhbWRncHVfeGdtaS5oIgogCiAvKiBhZGQgdGhlc2UgaGVy
ZSBzaW5jZSB3ZSBhbHJlYWR5IGluY2x1ZGUgZGNlMTIgaGVhZGVycyBhbmQgdGhlc2UgYXJlIGZv
ciBEQ04gKi8KICNkZWZpbmUgbW1IVUJQMF9EQ1NVUkZfUFJJX1ZJRVdQT1JUX0RJTUVOU0lPTiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
eDA1NWQKQEAgLTgwMiw2ICs4MDMsMTIgQEAgc3RhdGljIGludCBnbWNfdjlfMF9lY2NfbGF0ZV9p
bml0KHZvaWQgKmhhbmRsZSkKIAkJaWYgKHIpCiAJCQlyZXR1cm4gcjsKIAl9CisKKwlpZiAoYWRl
di0+Z21jLnhnbWkubnVtX3BoeXNpY2FsX25vZGVzID4gMSkgeworCQlyID0gYW1kZ3B1X3hnbWlf
cmFzX2xhdGVfaW5pdChhZGV2KTsKKwkJaWYgKHIpCisJCQlyZXR1cm4gcjsKKwl9CiAJcmV0dXJu
IDA7CiB9CiAKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
