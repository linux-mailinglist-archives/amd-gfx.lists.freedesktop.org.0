Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2138FF88
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 11:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0516E2C4;
	Fri, 16 Aug 2019 09:59:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B998C6E2C4
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 09:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMSZisy9HUuc2G8QspH3l/SVpFn53FX2DmvUsfqwAtPZCWdrMqoCjO+hZ1Rv0ncWwdqeKz4NpAL6EhC2CY9ejEHJz7FgJDA7FP9+xHm7lYI4tiaRZUvLGOqyAGNZghUIY0SERRf8ZRoBOmHeuxPg/6y/b+UkVRopQiSIg1x278jIXPZri+mtrPVPBsi6yfLyUyIA5f6YhGdRmMbpPwSBcXrgRoEzkz64o7IggjLHdkUolTcQmQPywjIblBJMVf6x+lPVbYpyWjwVA/k87hchij8Qfcv7POU25hTi5QDwY4dd4SCidQNh9FdSzXpT8D+fSStW0VMq4QYxDgNR69fJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK8+0r2GOQTPXdK48jcHDba4JwqEmy//UMbslqH4KM0=;
 b=Wxew2oDoprwy2/+g7k5RehsSTWh81jiSbOgaNmIRmvXLrf6zk9UB2GXuI7c7mIHi6AYNOWHjCHXHTenkOpU0xFtIILmSwZT3HS0RaNXmUvLuYqp8O4jdXwyTzE3slyPDZuCRzuhWXePvxbalAiq97xNFJjauciMKZ2di805lRqWi99cSGA0P39jAywEC+N0QKDT6hyW4W0qk2us9AgHlN4BnOlLAV+g864/9wdTu6+p5UcGYgEDzTILVgRHZ4PF4ECOXiKbQg21nbIoAvRXyJ+rHy7dWTvjiuwDtvR0BYhqATAof6M6Kw+qEldNUo9f/UGr5sNwucriLaMDVNyVV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4237.namprd12.prod.outlook.com (52.135.49.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 09:59:00 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 09:59:00 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH] drm/amdgpu: correct return type of
 amdgpu_ras_query_error_count
Thread-Topic: [PATCH] drm/amdgpu: correct return type of
 amdgpu_ras_query_error_count
Thread-Index: AQHVVAGzW8D11pAnNEuqK2+HkjJ4mab9iOFg
Date: Fri, 16 Aug 2019 09:59:00 +0000
Message-ID: <MN2PR12MB30540425780469918EB12945B0AF0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190816071013.21034-1-guchun.chen@amd.com>
In-Reply-To: <20190816071013.21034-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d7d59cb-fab0-42a3-6dd1-08d722305c78
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4237; 
x-ms-traffictypediagnostic: MN2PR12MB4237:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4237BC5562E172780C34A542B0AF0@MN2PR12MB4237.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(199004)(189003)(13464003)(53546011)(76116006)(486006)(66556008)(25786009)(6436002)(66446008)(316002)(33656002)(476003)(3846002)(6116002)(53936002)(66476007)(6306002)(64756008)(478600001)(55016002)(76176011)(102836004)(66946007)(81156014)(9686003)(8936002)(6506007)(186003)(99286004)(7696005)(81166006)(66066001)(26005)(74316002)(2501003)(6246003)(8676002)(14454004)(4326008)(71200400001)(256004)(110136005)(229853002)(2906002)(71190400001)(446003)(966005)(86362001)(11346002)(5660300002)(52536014)(7736002)(6636002)(305945005)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4237;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /S7f1qKyOAyOWkPKlbfYqLVadFgMfilXPhCzPKFldLpC81LtLpgoQEcar6nPZ1XLt8nwLl+PoRAcZNe7GugH/IyFfFFURTX5+cRzZWJZIAH5IRk4spn4EQ+CRkeFb70C4Cgn48sVH0Qvin0UAh6Po8naCT1NtHaPLBunWiCcoS9pMDUBa3s5Vu87LTyqw5m/PeDmYBZCiNhQMUYiq4GyZhhY/6DWNZ4bEOmFrKs868UtrYDcjnMX63CMjKigjDVUkURsxtTEOKX2/c+FN9pMcnuDhw2li3Uc8GHDkdIE6/eYuAjU45ENC1rpnvtEibzbhFZrf+Sm9pG4xIqjXtIqqFj0Jd78Wygo1HGhKimhAi0vG/vdt9TcJZFIq3qi1UEP7BMTam+vn1sgAvKvPPznmZRSQHMMv81B5igOr7OlVBk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7d59cb-fab0-42a3-6dd1-08d722305c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 09:59:00.0206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZD33h4M3lAcfU3aXT5/C3JvEQsu9frLf/XHJeVgCgvbYYQzoz3VeL2073HsIo7G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK8+0r2GOQTPXdK48jcHDba4JwqEmy//UMbslqH4KM0=;
 b=bS44KPLPR5rUt1tPhUTbKRzCgKQR4CMi6VzZjB+4AdRYC99Ff47g/VgD3liNEdyQVJWGXl245TrI/JVXP5xhUZepaubPqFXpb4CUjgiupDQp3/siJxZ6Ol8C7HV8KMl47jktBCuSSX/J5MvHzsSjgHdoLn27Cxh7OrZPXZWz2zw=
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGNoYW5nZSBpcyByZWFzb25hYmxlLCBidXQgSSBhbHNvIGNoZWNrIHRoZSBmdW5jdGlvbidz
IGNhbGxlciwgYSB1aW50MzJfdCByYXNfY291bnRlciBzdG9yZXMgdGhlIHZhbHVlIGluIGFtZGdw
dV9jdHhfcXVlcnkyLg0KSG93IGFib3V0IHJhcyB0ZXN0IHRvb2w/IENhbiB3ZSBnZXQgcmlkIG9m
IGFsbCB0aGUgY2hhb3MgYWJvdXQgdGhlIGNvdW50ZXIncyB0eXBlPw0KDQpUYW8NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gR3VjaHVuIENoZW4NCj4gU2Vu
dDogMjAxOeW5tDjmnIgxNuaXpSAxNToxMA0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBMaSwgRGVu
bmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47IFBhbiwgWGluaHVpDQo+IDxYaW5odWkuUGFuQGFtZC5j
b20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NCj4gQ2M6IENoZW4sIEd1Y2h1biA8
R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBjb3Jy
ZWN0IHJldHVybiB0eXBlIG9mDQo+IGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQNCj4gDQo+
IFRoZSByZXR1cm4gdmFsdWUgdHlwZSBvZiBhbWRncHVfcmFzX3F1ZXJ5X2Vycm9yX2NvdW50IHNo
b3VsZCBiZQ0KPiB1bnNpZ25lZCBsb25nLCBub3QgaW50Lg0KPiANCj4gQ2hhbmdlLUlkOiBJMDEx
NDA2ZDgxYmFkNjlhNjU0MzNiNjM5NjBlMTY5MWM0OTU5YmJjNQ0KPiBTaWduZWQtb2ZmLWJ5OiBH
dWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA2ICsrKy0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMNCj4gaW5kZXggNTBjMTNiMDJkMjM0Li5kZjRiOWFlMzljNWUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTY4Niw3
ICs2ODYsNyBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9jdXJlKHN0cnVjdCBhbWRncHVfZGV2aWNl
DQo+ICphZGV2LCAgfQ0KPiANCj4gIC8qIGdldCB0aGUgdG90YWwgZXJyb3IgY291bnRzIG9uIGFs
bCBJUHMgKi8gLWludA0KPiBhbWRncHVfcmFzX3F1ZXJ5X2Vycm9yX2NvdW50KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPiArdW5zaWduZWQgbG9uZyBhbWRncHVfcmFzX3F1ZXJ5X2Vycm9y
X2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2LA0KPiAgCQlib29sIGlzX2NlKQ0K
PiAgew0KPiAgCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0
KGFkZXYpOyBAQCAtDQo+IDY5NCw3ICs2OTQsNyBAQCBpbnQgYW1kZ3B1X3Jhc19xdWVyeV9lcnJv
cl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldiwNCj4gIAlzdHJ1Y3QgcmFzX2Vy
cl9kYXRhIGRhdGEgPSB7MCwgMH07DQo+IA0KPiAgCWlmICghY29uKQ0KPiAtCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gKwkJcmV0dXJuIDA7DQo+IA0KPiAgCWxpc3RfZm9yX2VhY2hfZW50cnkob2JqLCAm
Y29uLT5oZWFkLCBub2RlKSB7DQo+ICAJCXN0cnVjdCByYXNfcXVlcnlfaWYgaW5mbyA9IHsNCj4g
QEAgLTcwMiw3ICs3MDIsNyBAQCBpbnQgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1
Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAkJfTsNCj4gDQo+ICAJCWlmIChhbWRncHVf
cmFzX2Vycm9yX3F1ZXJ5KGFkZXYsICZpbmZvKSkNCj4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiAr
CQkJcmV0dXJuIDA7DQo+IA0KPiAgCQlkYXRhLmNlX2NvdW50ICs9IGluZm8uY2VfY291bnQ7DQo+
ICAJCWRhdGEudWVfY291bnQgKz0gaW5mby51ZV9jb3VudDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBpbmRleCAyNzY1ZjJkYmIxZTYuLjAyYTUxZTNkZmEx
NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBAQCAt
NDg0LDcgKzQ4NCw3IEBAIGludCBhbWRncHVfcmFzX3JlcXVlc3RfcmVzZXRfb25fYm9vdChzdHJ1
Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgIHZvaWQgYW1kZ3B1X3Jhc19yZXN1bWUoc3RydWN0
IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYpOyAgdm9pZCBhbWRncHVfcmFzX3N1c3BlbmQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiANCj4gLWludCBhbWRncHVfcmFzX3F1ZXJ5X2Vycm9y
X2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiArdW5zaWduZWQgbG9uZyBhbWRn
cHVfcmFzX3F1ZXJ5X2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2LA0K
PiAgCQlib29sIGlzX2NlKTsNCj4gDQo+ICAvKiBlcnJvciBoYW5kbGluZyBmdW5jdGlvbnMgKi8N
Cj4gLS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
