Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BD9D9C3
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 01:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA2889FC5;
	Mon, 26 Aug 2019 23:07:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F57889DFA
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 23:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCtnA/nEaasXU11pqTDpkowX96e9f1vkMvhUfV+Sa5l7qlqc6JS0598Kj7g4b3dYrNfoGv452F+KVDow4ZZUv9D43zZ+eOf7FV04jiPksOVsPaS2vYDI/CKq18kRYSIVVdaGSR0yQlkrka6BmvXl/+sxWyJcdYW4buputV0vVRcq1w5cfcNMRmf7ddgKfBHMVo5PsvD3HH2SvBiBzyQMjI5XF+jld4xlffK98Bku2Vw3aFmq+cFMptdyLA34Miihj5mGoK8qywjudj8gF3oULX8JwCB1IjO/3icZjXf/vJxbYKlZEwVBPXBu7vssgMtX4P8pOvoA7z3A4PDcULA+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S7mzg94gYAKDtu7XaYsXAAIC1CdlyvZz2U/4a1pUoI=;
 b=SbNQ5xBtBSNHxzYeHDixd11imgakmwtgmrBHCLa4KRjUNZUBd4aaFjNTqzoTDZ45foLPMIYDfLwZcPlQvSWlMimEo/eq7/RWpa+YVaMQmb7uDft0UqLB320Lv6Lgen/pSoiyt4XtfeG7TqiCxdBwJ2n8ISvswwe7zo4HQ8oxThZ8yCvF6kmiPC2U3HolAIpTfyUjXHlr3JHCX7NJOmaGXcU0PjdHmjicfpeEciM5T7hIKAddDKq1tg3l8lZG2tiaYtnVSX742vpL1BCS7TFR2x48J74fU5Pn6NETvTdS40XALb6MpmbUpEGf8d668XArtHJbSKQXXGxkugg5UqihkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3419.namprd12.prod.outlook.com (20.178.198.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 23:07:14 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 23:07:14 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for Arcturus
Thread-Topic: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for
 Arcturus
Thread-Index: AQHVXGL/I/tzupQUr0KVuaVWBJkkvg==
Date: Mon, 26 Aug 2019 23:07:14 +0000
Message-ID: <20190826230355.25007-4-Felix.Kuehling@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a523d99-1dab-43cf-3a10-08d72a7a21e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3419; 
x-ms-traffictypediagnostic: DM6PR12MB3419:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3419204B826B06CC77F9C8CB92A10@DM6PR12MB3419.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:190;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(7736002)(305945005)(8676002)(6512007)(8936002)(81166006)(99286004)(76176011)(6506007)(386003)(1076003)(50226002)(316002)(102836004)(66476007)(6486002)(81156014)(6436002)(478600001)(2906002)(5660300002)(14454004)(5640700003)(4326008)(36756003)(71200400001)(256004)(14444005)(71190400001)(54906003)(25786009)(3846002)(6116002)(66446008)(64756008)(53936002)(2501003)(66066001)(66946007)(486006)(86362001)(66556008)(11346002)(186003)(2351001)(446003)(6916009)(26005)(52116002)(476003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3419;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mdCGKBr6wLtbECoNg2aNfhSmPJhIFqNSR3iiU/ioknxqh/3tHFhelt5HkoqebzZXjd8Xqb5SP6GP7Nip+klcPY40u3UwpxNsDCj8369Z+JxQU2NLYiWmXA77JHvv6XQOlMK8K6mvRmiFK6bxIyyA1WNI/EO3yXZDcY3i2XCQXs4v903nyzFVhBxz9wwuWgidzKGrotUUglRrFuCGvOyMz4FCgVr6r+vslhYyVyjyaMX73MjpuawU40K0+Rd8G7PT6bsLNjx/nRtQZLiFKU080Pag2c31O5yy6ccgjRuqtneRM24ycdGdLOwVSABdkiUv4rP6YBk57RWNCHpV6wAadzaecDPefK4y1Sricjt1UOlCZJtj5bsY4NaM2/io0BZYxT1vlqPLSSOgLNUo9hHs67qo1Km9J0mbcv9/BYusAo0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a523d99-1dab-43cf-3a10-08d72a7a21e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 23:07:14.2502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mr2YUoaW1tZVErk8JeGHKCRg89xTJ5WYiPuMd2w1cY1VKfyeG5xEtPooETbsMlzkyb0RN2nZc2cWcPQ8CtER8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S7mzg94gYAKDtu7XaYsXAAIC1CdlyvZz2U/4a1pUoI=;
 b=mQOAxnmwsZq7O2NmX8HqGnP7rfChwExedmv4+WGVgvUjdWn/klNpeDBmRRbTBHzXCaXOqwEZxD8T27vR5v04RlJwIdIFiHzsn0Jzipd3eosdTKa9pE6eyyTri9jxqrM/rItjtS9F7vW5xioyTqGkS4VlxRco6A9m+229uVWqnek=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIGNvbXB1dGUgVlJBTSBhbGxvY2F0aW9ucyBvbiBBcnR1cnVzIHVzZSB0aGUgbmV3IFJXIG10
eXBlCmZvciBub24tY29oZXJlbnQgbG9jYWwgbWVtb3J5LCBDQyBtdHlwZSBmb3IgY29oZXJlbnQg
bG9jYWwKbWVtb3J5IGFuZCBQVEVfU05PT1BFRCBiaXQgZm9yIGludmFsaWRhdGluZyBub24tZGly
dHkgY2FjaGUKbGluZXMgb24gcmVtb3RlIFhHTUkgbWFwcGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCAyMCArKysrKysrKysrKysrKysrKy0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgICAgICAgfCAgNCArKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4
IDFiNzM0MGExOGY2Ny4uYzVjMThlMjkyYWUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBAIC0zNTcsNiArMzU3LDcgQEAgc3RhdGlj
IGludCB2bV91cGRhdGVfcGRzKHN0cnVjdCBhbWRncHVfdm0gKnZtLCBzdHJ1Y3QgYW1kZ3B1X3N5
bmMgKnN5bmMpCiAKIHN0YXRpYyB1aW50MzJfdCBnZXRfcHRlX2ZsYWdzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBzdHJ1Y3Qga2dkX21lbSAqbWVtKQogeworCXN0cnVjdCBhbWRncHVfZGV2
aWNlICpib19hZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KG1lbS0+Ym8tPnRiby5iZGV2KTsKIAlib29s
IGNvaGVyZW50ID0gbWVtLT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19DT0hFUkVOVDsK
IAl1aW50MzJfdCBtYXBwaW5nX2ZsYWdzOwogCkBAIC0zNjYsOCArMzY3LDIzIEBAIHN0YXRpYyB1
aW50MzJfdCBnZXRfcHRlX2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qg
a2dkX21lbSAqbWVtKQogCWlmIChtZW0tPmFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX0VY
RUNVVEFCTEUpCiAJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRTsK
IAotCW1hcHBpbmdfZmxhZ3MgfD0gY29oZXJlbnQgPwotCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBB
TURHUFVfVk1fTVRZUEVfTkM7CisJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKKwljYXNlIENI
SVBfQVJDVFVSVVM6CisJCWlmIChtZW0tPmFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1ZS
QU0pIHsKKwkJCWlmIChib19hZGV2ID09IGFkZXYpCisJCQkJbWFwcGluZ19mbGFncyB8PSBjb2hl
cmVudCA/CisJCQkJCUFNREdQVV9WTV9NVFlQRV9DQyA6IEFNREdQVV9WTV9NVFlQRV9SVzsKKwkJ
CWVsc2UKKwkJCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9NVFlQRV9VQzsKKwkJfSBlbHNl
IHsKKwkJCW1hcHBpbmdfZmxhZ3MgfD0gY29oZXJlbnQgPworCQkJCUFNREdQVV9WTV9NVFlQRV9V
QyA6IEFNREdQVV9WTV9NVFlQRV9OQzsKKwkJfQorCQlicmVhazsKKwlkZWZhdWx0OgorCQltYXBw
aW5nX2ZsYWdzIHw9IGNvaGVyZW50ID8KKwkJCUFNREdQVV9WTV9NVFlQRV9VQyA6IEFNREdQVV9W
TV9NVFlQRV9OQzsKKwl9CiAKIAlyZXR1cm4gYW1kZ3B1X2dtY19nZXRfcHRlX2ZsYWdzKGFkZXYs
IG1hcHBpbmdfZmxhZ3MpOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpp
bmRleCA3ZGRjYTNlZWI2Y2YuLjE4OWFkNTY5OTk0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmMKQEAgLTE1OTIsNiArMTU5MiwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV92
bV9ib19zcGxpdF9tYXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQl9CiAJCWZs
YWdzICY9IH5BTURHUFVfUFRFX1ZBTElEOwogCX0KKwlpZiAoYWRldi0+YXNpY190eXBlID09IENI
SVBfQVJDVFVSVVMgJiYKKwkgICAgIShmbGFncyAmIEFNREdQVV9QVEVfU1lTVEVNKSAmJgorCSAg
ICBtYXBwaW5nLT5ib192YS0+aXNfeGdtaSkKKwkJZmxhZ3MgfD0gQU1ER1BVX1BURV9TTk9PUEVE
OwogCiAJdHJhY2VfYW1kZ3B1X3ZtX2JvX3VwZGF0ZShtYXBwaW5nKTsKIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
