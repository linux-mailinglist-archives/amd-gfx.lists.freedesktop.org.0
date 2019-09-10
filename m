Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428FAE286
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 05:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A67489EEB;
	Tue, 10 Sep 2019 03:23:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700073.outbound.protection.outlook.com [40.107.70.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136E289EEB
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 03:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkfP1L9cX5jaJB4CY8G+toAXmmqb9B26oOXw0EmiXycEq4Ir1XenCnxT4xIBgOdZZZx2KpAZMA6GzzMyIEnmrFnqLiErOINFb4ioQqVWwlq8K3nHjwPyAD5ym1X2nwJKjSdkzBdD2tkvt3fb+irjteHXmrvAqCWD0TwueZOzO+6ym4ECeZ+y4qB/+ToSEA1Iuuvyydwai2EBrXnuaOMZEfpngu/uFIZ7e6tifQkyT+ISESme7N0cMRy0RbiHTMfiGj2kB9cJUfsiQ8HNxTnavQtmYBkbrDiXx0XXJXhsvLLPaT87/JyywpGuRte223cp1k5mEYhXB466da7oc9cgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZMxLSEox9Ulynfdg/DaYSDcIjjXnzn72AVSiU9d8LY=;
 b=eED8okHra9Wz+5uOdHT0Tczb/ur9Te5WoazZh8DZgo/jtT0ozIr3roWksZspv+rkcjgOtHAkJrmZuH0TyDEKM27xZfqU4ubNFRVVdCg9yzEZn2r9WrRETmxri1oFUgc9Ukox+wR/h62ZIGPa+ZBtHtNVsQ5ZpjbY7h135CsXmfvna7l5tubw4fVDGe5wHcg5g/wAQPe1mE2j/GCUE2xJKh6XLj0PyjYUP3WQl7kPfuOi6Sac+TS1ksMPjiojwGar/HvbksNV/qYFx8HtZRINgCIcfkau5zUxrCC3MbxyAPTFV3FFpGCWs+pkUWnSTXDSJd46EFhJMxZZlpzjjjCM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1868.namprd12.prod.outlook.com (10.175.85.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 03:23:41 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 03:23:41 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li, Dennis"
 <Dennis.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block (v2)
Thread-Topic: [PATCH 1/2] drm/amdgpu: initialize ras structures for xgmi block
 (v2)
Thread-Index: AQHVZ4clHNs+ojPyvEKrtj4JjUcWUg==
Date: Tue, 10 Sep 2019 03:23:41 +0000
Message-ID: <1568085803-2202-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::28) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1739ddd-e336-474b-5a09-08d7359e4779
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1868; 
x-ms-traffictypediagnostic: DM5PR12MB1868:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1868A1AD0D28C9EF21ADC6DCFCB60@DM5PR12MB1868.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(199004)(189003)(81166006)(36756003)(316002)(110136005)(86362001)(14444005)(256004)(476003)(6636002)(6116002)(3846002)(8936002)(186003)(26005)(50226002)(66556008)(64756008)(486006)(66446008)(66476007)(66946007)(99286004)(386003)(6506007)(2501003)(25786009)(4326008)(102836004)(6512007)(2616005)(8676002)(2906002)(478600001)(6486002)(7736002)(305945005)(14454004)(66066001)(53936002)(6436002)(71200400001)(71190400001)(52116002)(81156014)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1868;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C5XU9EnErZWJqGPZk8qeSRhiMzBEekeC2A7fJp7t8H0NG1w34+la60aR7oyCtuope0BWhs8H+u1mVon9pBlNH3swkIUaJ7bMOlUSw4I9fMq/QjCImdEyfhIzBNYH6UA0F/ywKbuAP1xV30mZYZPzJdGyrGG976w2TdqnD+1WABlRU30QXMyox9+lS9ir8RNsdh0hfCcHXIn50k7AKwQEYVQpT6THaq4FU7kPN/eBTXJf/gYr4EyBzyJ3dakjdN7UXCevxuV2i+8b0WJGITb4sBKhjaj7vuprSUnHjOaBz64KWKijudO57NeqpZH94i8LxcNtnqUIBAn9m2PI7OtRWx8nrUSOtD3XVF52ivmVbVDJO0jPZgA0eYcGF64lUAPaO4wlYyyuwh69Wo81AmhJws5UGp+/nk5OoNZidtYo2UM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1739ddd-e336-474b-5a09-08d7359e4779
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 03:23:41.8323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g79hJfBWVwkmdFbtVmrFdEgpyXvLGn7v93erTxowTfzEWe8v8sl+YdhWCasX0gA7Z28wiEp7K+JpchuN8bxs1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZMxLSEox9Ulynfdg/DaYSDcIjjXnzn72AVSiU9d8LY=;
 b=k31Xek9olfs84l6AsxxDkI5uaaTCDSwtZ3ugWTP5iCbcUiiN/yBOIz+cNpAfkymwQe+j1BSwxxcZJVsy8lCTWwqwHfd1UO32HLtQHihzMx7wGgRPH3KAPUpPFNM6tuGjZqgBL3f3a97+TWF3LOwLq6KVllCEvfMhk226YHoFbrw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW5pdCByYXMgY29tbW9uIGludGVyZmFjZSBhbmQgZnMgbm9kZSBmb3IgeGdtaSBibG9jawoKdjI6
IHJlbW92ZSB1bm5lY2VzYXJ5IHBoeXNpY2FsIG5vZGUgbnVtYmVyIGNoZWNrIGJlZm9yZQppbnZv
a2luZyBhbWRncHVfeGdtaV9yYXNfbGF0ZV9pbml0CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpo
YW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dtYy5oICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV94Z21pLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuaCB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMgICAgfCAgNCArKystCiA0IGZpbGVzIGNoYW5nZWQsIDQxIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ21jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ21jLmgKaW5kZXggMjMyYThmZi4uOGM4NTQ3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nbWMuaApAQCAtMTIzLDYgKzEyMyw3IEBAIHN0cnVjdCBhbWRncHVfeGdtaSB7
CiAJLyogZ3B1IGxpc3QgaW4gdGhlIHNhbWUgaGl2ZSAqLwogCXN0cnVjdCBsaXN0X2hlYWQgaGVh
ZDsKIAlib29sIHN1cHBvcnRlZDsKKwlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lmOwogfTsK
IAogc3RydWN0IGFtZGdwdV9nbWMgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3hnbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94
Z21pLmMKaW5kZXggNjVhYWU3NS4uN2Y2ZjJlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfeGdtaS5jCkBAIC0yNSw2ICsyNSw3IEBACiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAj
aW5jbHVkZSAiYW1kZ3B1X3hnbWkuaCIKICNpbmNsdWRlICJhbWRncHVfc211LmgiCisjaW5jbHVk
ZSAiYW1kZ3B1X3Jhcy5oIgogI2luY2x1ZGUgImRmL2RmXzNfNl9vZmZzZXQuaCIKIAogc3RhdGlj
IERFRklORV9NVVRFWCh4Z21pX211dGV4KTsKQEAgLTQzNywzICs0MzgsMzggQEAgdm9pZCBhbWRn
cHVfeGdtaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQltdXRl
eF91bmxvY2soJmhpdmUtPmhpdmVfbG9jayk7CiAJfQogfQorCitpbnQgYW1kZ3B1X3hnbWlfcmFz
X2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlpbnQgcjsKKwlzdHJ1
Y3QgcmFzX2loX2lmIGloX2luZm8gPSB7CisJCS5jYiA9IE5VTEwsCisJfTsKKwlzdHJ1Y3QgcmFz
X2ZzX2lmIGZzX2luZm8gPSB7CisJCS5zeXNmc19uYW1lID0gInhnbWlfd2FmbF9lcnJfY291bnQi
LAorCQkuZGVidWdmc19uYW1lID0gInhnbWlfd2FmbF9lcnJfaW5qZWN0IiwKKwl9OworCisJaWYg
KCFhZGV2LT5nbWMueGdtaS5zdXBwb3J0ZWQgfHwKKwkgICAgYWRldi0+Z21jLnhnbWkubnVtX3Bo
eXNpY2FsX25vZGVzID09IDApCisJCXJldHVybiAwOworCisJaWYgKCFhZGV2LT5nbWMueGdtaS5y
YXNfaWYpIHsKKwkJYWRldi0+Z21jLnhnbWkucmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0
IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFhZGV2LT5nbWMueGdtaS5yYXNf
aWYpCisJCQlyZXR1cm4gLUVOT01FTTsKKwkJYWRldi0+Z21jLnhnbWkucmFzX2lmLT5ibG9jayA9
IEFNREdQVV9SQVNfQkxPQ0tfX1hHTUlfV0FGTDsKKwkJYWRldi0+Z21jLnhnbWkucmFzX2lmLT50
eXBlID0gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsKKwkJYWRldi0+Z21j
LnhnbWkucmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAwOworCQlzdHJjcHkoYWRldi0+Z21jLnhn
bWkucmFzX2lmLT5uYW1lLCAieGdtaV93YWZsIik7CisJfQorCWloX2luZm8uaGVhZCA9IGZzX2lu
Zm8uaGVhZCA9ICphZGV2LT5nbWMueGdtaS5yYXNfaWY7CisJciA9IGFtZGdwdV9yYXNfbGF0ZV9p
bml0KGFkZXYsIGFkZXYtPmdtYy54Z21pLnJhc19pZiwKKwkJCQkgJmZzX2luZm8sICZpaF9pbmZv
KTsKKwlpZiAociB8fCAhYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+Z21jLnhn
bWkucmFzX2lmLT5ibG9jaykpIHsKKwkJa2ZyZWUoYWRldi0+Z21jLnhnbWkucmFzX2lmKTsKKwkJ
YWRldi0+Z21jLnhnbWkucmFzX2lmID0gTlVMTDsKKwl9CisKKwlyZXR1cm4gcjsKK30KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5oCmluZGV4IGZiY2VlMzEuLjkwMjM3ODkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuaApAQCAtNDIsNiArNDIs
NyBAQCB2b2lkIGFtZGdwdV94Z21pX3JlbW92ZV9kZXZpY2Uoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpOwogaW50IGFtZGdwdV94Z21pX3NldF9wc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIGludCBwc3RhdGUpOwogaW50IGFtZGdwdV94Z21pX2dldF9ob3BzX2NvdW50KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqcGVlcl9hZGV2
KTsKK2ludCBhbWRncHVfeGdtaV9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsKIAogc3RhdGljIGlubGluZSBib29sIGFtZGdwdV94Z21pX3NhbWVfaGl2ZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmJvX2FkZXYpCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCAwZDA2Yzc5Li40YjEwNjkyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTUxLDYgKzUxLDcgQEAKICNp
bmNsdWRlICJpdnNyY2lkL3ZtYy9pcnFzcmNzX3ZtY18xXzAuaCIKIAogI2luY2x1ZGUgImFtZGdw
dV9yYXMuaCIKKyNpbmNsdWRlICJhbWRncHVfeGdtaS5oIgogCiAvKiBhZGQgdGhlc2UgaGVyZSBz
aW5jZSB3ZSBhbHJlYWR5IGluY2x1ZGUgZGNlMTIgaGVhZGVycyBhbmQgdGhlc2UgYXJlIGZvciBE
Q04gKi8KICNkZWZpbmUgbW1IVUJQMF9EQ1NVUkZfUFJJX1ZJRVdQT1JUX0RJTUVOU0lPTiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDA1
NWQKQEAgLTgwMiw3ICs4MDMsOCBAQCBzdGF0aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQo
dm9pZCAqaGFuZGxlKQogCQlpZiAocikKIAkJCXJldHVybiByOwogCX0KLQlyZXR1cm4gMDsKKwor
CXJldHVybiBhbWRncHVfeGdtaV9yYXNfbGF0ZV9pbml0KGFkZXYpOwogfQogCiBzdGF0aWMgaW50
IGdtY192OV8wX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
