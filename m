Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706558FDBD
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 10:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB38892BB;
	Fri, 16 Aug 2019 08:24:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710057.outbound.protection.outlook.com [40.107.71.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A485892BB
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 08:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jM8pLDGbkAXnWCLq7N13DJQFc/b9kapnZqSsbybx4XvJNs+XPLLAS3Jpc47ZT8yWG2zDhoD+GIeaWrNmh48tC+eQ/2QwlIvgxHONd9726MA2EerP1QgdxJKPIfbyZNy0oUFIywnP9ALJN9tJUigdDnE1xvjR2mYlOj2Ii5oU6Z3Pgx1lE11jCnsA1dz78yE5yFM+caVdy5AYCjHPyF9lW0XZZIX81p1/4GVSqFcV8OFl1KBYZ6M2dhAwwC5+zC/YMhoOtiBF7nZ+GdH+9yE9zpIPWh2UbCcCyvACvtv8/pp3Fb3Y7ooTu29rYruRmOtstashlQJWYwAn5vq6ErdfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgPVt2N9SdUIXLcKyf7uHA+2/7Zvr5Xc37yBoZMPKug=;
 b=LGHDhwjI8Foebah2Z4wx1F0AWk+nbdoRH6+O9grLusqsWx/MCNdMJWz8HtY/h3g4wPaqqRF3598uL4L04zD7x5l4z5Dj/YO+K704TyX04RN8c47zXD3HexpandlGG5SQiu5zt60icQJix6WKCsVp18URIYErJjGkv8EybvM1/c6/8I72Z41CwDFAjvJvmbW02Kh06ZlW++ZC2i9G+h1IP08fE5zCIFSneFllqu9eZ+FGsL7IWujNPs2jDGgo9wc9pyTpGdoAHVytBbLuxXImV3SaFzF2KNn93d1tmO0FqbjA+bd49j4sOvrAeUarCnf3R82VhXtM6ZYWFnX1R1rp1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3247.namprd12.prod.outlook.com (20.179.81.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 16 Aug 2019 08:24:34 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 08:24:34 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Wang, Kevin(Yang)"
 <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/amd/powerplay: expose supported clock domains
 only through sysfs
Thread-Topic: [PATCH 2/4] drm/amd/powerplay: expose supported clock domains
 only through sysfs
Thread-Index: AQHVU/kG0ZSe+gOnY02kPCV5gat+5Kb9XAglgAALDYCAAAkCgA==
Date: Fri, 16 Aug 2019 08:24:34 +0000
Message-ID: <cf5092ae-0e0b-5b86-871a-088ea8fd543b@amd.com>
References: <20190816060807.11922-1-evan.quan@amd.com>
 <20190816060807.11922-2-evan.quan@amd.com>
 <MN2PR12MB329617CB0EF329673FB44F77A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
 <MN2PR12MB3344559C0257D2BB3DB68832E4AF0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344559C0257D2BB3DB68832E4AF0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0043.apcprd04.prod.outlook.com
 (2603:1096:202:14::11) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86119d44-9aa6-445f-68ac-08d722232b38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3247; 
x-ms-traffictypediagnostic: MN2PR12MB3247:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3247AFB72D71AC511B6DF5C1A2AF0@MN2PR12MB3247.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(52314003)(189003)(199004)(66446008)(256004)(3846002)(71190400001)(71200400001)(6116002)(790700001)(478600001)(5660300002)(6306002)(6512007)(31686004)(2501003)(66066001)(14444005)(54896002)(25786009)(8936002)(6246003)(53936002)(31696002)(7736002)(52116002)(76176011)(14454004)(26005)(236005)(102836004)(53546011)(6506007)(386003)(966005)(606006)(486006)(446003)(8676002)(476003)(2616005)(99286004)(11346002)(229853002)(36756003)(186003)(81156014)(6436002)(6486002)(66946007)(110136005)(2906002)(316002)(64756008)(66556008)(81166006)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3247;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a8cZW/WBpIhBm4ooUiLeFShjisClMQ/sbCNXSZIz0M7SQyiAjgTr9kTAjUpy5JGoKoGvxo4saODRJEcQIvX1hNsgcaDxHsJ4iJ2d4pPzqY7WE1rqYm4JOTa/L2F+Omyhq39TMzj2yo0nxFth3ipOcL/PnCzK49yfhghvQxlw4J6bONPOOS2QKFX8AE11WrK4JXIb1TaE4URZW9lrOFANKtR+LwtGPvTuFw95wLLN8wCyu0+s5zyypJf36D9hdxuU9J6dS3AfveJ01ltj07OMui1QxBBc0BaXYr05ndaDcrtXe2DWC5LAF9f/qE97s63RF+J4T6D1k7r/Q0zO9Egpb3/ZIJzz06RevmLVVbr0plDrKNORlfp0Fe+pjreO4pKtijXrF6L4+s0CoGFnFThhkozTtX1xgwqcNYHEBhzzFkk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86119d44-9aa6-445f-68ac-08d722232b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 08:24:34.5298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SIQw8FvdAegc1XRBegDs/Jz9gV3F9D9i7Dc/gQ1XR55gN5JHHqxoTea6AlpOJBwa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgPVt2N9SdUIXLcKyf7uHA+2/7Zvr5Xc37yBoZMPKug=;
 b=Dc+ytizbpTVArhlyHPgrHzfWBE+lf8XypCnbGkVaGfUu4SLZ+a16xqo7xHoQZLuHc7ovFSyhTmGV73uaPCF5XLV4JoPmemPOtMTZ6NTKlwq2N+cq8My14mF8gksJm88EHOlisqedn41Uz74k/Qe70Eq4nnT2hG7iMDXsYrfUw0k=
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
Content-Type: multipart/mixed; boundary="===============0918225658=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0918225658==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_cf5092ae0e0b5b86871a088ea8fd543bamdcom_"

--_000_cf5092ae0e0b5b86871a088ea8fd543bamdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

c3VyZSwgaSBrbm93LCBJIGZlZWwgdGhpcyBpcyBub3QgYSBnb29kIHdheSB0byBkbyBjb2RlIHdo
ZW4gb3RoZXIgYXNpY3MgaGF2ZSBzaW1pbGFyIHByb2JsZW1zLg0Kd2UnZCBiZXR0ZXIgYWRkIGEg
aGVscGVyIGZ1bmN0aW9uIHRvIGNoZWNrIHdoaWNoIHN5c2ZzIGludGVyZmFjZSBpcyBzdXBwb3J0
ZWQgZm9yIGVhY2ggYXNpYy4NCm9yIG1vdmUgdGhlc2Ugc3lzZnMgaW50ZXJmYWNlIHRvIGFzaWMg
ZmlsZSB0byBjcmVhdGUuDQoNCmFueXdheSwgd2UgY2FuIG9wdGltaXplIHRoaXMgbG9naWMgbGF0
ZXIuDQpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT48bWFpbHRv
OmtldmluMS53YW5nQGFtZC5jb20+DQoNCkJlc3QgUmVnYXJkcywNCktldmluDQoNCk9uIDgvMTYv
MTkgMzo1MiBQTSwgUXVhbiwgRXZhbiB3cm90ZToNCkJhc2NpYWxseSwgd2Ugc2hvdWxkIG5vdCBl
eHBvc2UgdGhlIHN5c2ZzIGludGVyZmFjZSBmb3IgdGhvc2UgZmVhdHVyZXMgbm90IHN1cHBvcnRl
ZCBieSB0aGUgQVNJQy4NCkFzLCB0aGVyZSBhcmUgc29tZSB0b29scy90ZXN0cyB3aGljaCBqdWRn
ZXMgd2hldGhlciB0aGUgZmVhdHVyZSBpcyBzdXBwb3J0ZWQgYnkgdGhlIGV4aXN0ZW5jZSBvZiB0
aGUgZmlsZS4NClRoaXMgY2FuIGZpeCBzb21lIHRlc3QgZmFpbHVyZSBpbiByb2NtIHRlc3Qgc3Vp
dC4NCg0KUmVnYXJkcywNCkV2YW4NCkZyb206IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2Fu
Z0BhbWQuY29tPjxtYWlsdG86S2V2aW4xLldhbmdAYW1kLmNvbT4NClNlbnQ6IEZyaWRheSwgQXVn
dXN0IDE2LCAyMDE5IDM6MTYgUE0NClRvOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT48
bWFpbHRvOkV2YW4uUXVhbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8
bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KU3ViamVjdDogUmU6IFtQQVRD
SCAyLzRdIGRybS9hbWQvcG93ZXJwbGF5OiBleHBvc2Ugc3VwcG9ydGVkIGNsb2NrIGRvbWFpbnMg
b25seSB0aHJvdWdoIHN5c2ZzDQoNCkkgZG9uJ3QgcmVjb21tZW5kIGl0LiBXaGF0J3MgdGhlIHBy
b2JsZW0gaWYgd2Uga2VlcCBpdCB0aGUgd2F5IGl0IGlzPw0KbWF5YmUgb3RoZXIgYXNpYyBhbHNv
IGhhcyBzYW1lIHByb2JsZW1zLCBpZiBkbyBpdCwgdGhlIG90aGVyIGFzaWMgc2hvdWxkICBhZGQg
YSBjb25kaXRpb24gaW4gdGhlcmUgdG9vLg0KZWc6IG5hdmkxMCBkb24ndCBzdXBwb3J0IHNlbnNv
ciBvZiAgInBwX2RwbV9wY2llIi4NCg0KQmVzdCBSZWdhcmRzLA0KS2V2aW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPG1haWx0bzphbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPj4gb24gYmVoYWxmIG9mIEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb208bWFpbHRv
OmV2YW4ucXVhbkBhbWQuY29tPj4NClNlbnQ6IEZyaWRheSwgQXVndXN0IDE2LCAyMDE5IDI6MDgg
UE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+IDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Pg0KQ2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVh
bkBhbWQuY29tPG1haWx0bzpFdmFuLlF1YW5AYW1kLmNvbT4+DQpTdWJqZWN0OiBbUEFUQ0ggMi80
XSBkcm0vYW1kL3Bvd2VycGxheTogZXhwb3NlIHN1cHBvcnRlZCBjbG9jayBkb21haW5zIG9ubHkg
dGhyb3VnaCBzeXNmcw0KDQpEbyBub3QgZXhwb3NlIHRob3NlIHVuc3VwcG9ydGVkIGNsb2NrIGRv
bWFpbnMgdGhyb3VnaCBzeXNmcyBvbg0KQXJjdHVydXMuDQoNCkNoYW5nZS1JZDogSTUyNmU3YmQ0
NTdmZGNkOGM3OWQ0NTgxYmI5Yjc3ZTVjYjU3ZjU4NDQNClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVh
biA8ZXZhbi5xdWFuQGFtZC5jb208bWFpbHRvOmV2YW4ucXVhbkBhbWQuY29tPj4NCi0tLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwgMjYgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQppbmRleCBjNTY0
MmJlOWI0NGIuLjdhY2NmMmM3ZjhjZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcG0uYw0KQEAgLTI4NzksMTAgKzI4NzksMTIgQEAgaW50IGFtZGdwdV9wbV9zeXNmc19pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KICAgICAgICAgICAgICAgICAgICAgICAgIERS
TV9FUlJPUigiZmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBwcF9kcG1fc29jY2xrXG4iKTsN
CiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KICAgICAgICAgICAgICAgICB9
DQotICAgICAgICAgICAgICAgcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRl
dl9hdHRyX3BwX2RwbV9kY2VmY2xrKTsNCi0gICAgICAgICAgICAgICBpZiAocmV0KSB7DQotICAg
ICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoImZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZp
bGUgcHBfZHBtX2RjZWZjbGtcbiIpOw0KLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsNCisgICAgICAgICAgICAgICBpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMp
IHsNCisgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2
LT5kZXYsICZkZXZfYXR0cl9wcF9kcG1fZGNlZmNsayk7DQorICAgICAgICAgICAgICAgICAgICAg
ICBpZiAocmV0KSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigi
ZmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBwcF9kcG1fZGNlZmNsa1xuIik7DQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQorICAgICAgICAgICAgICAgICAg
ICAgICB9DQogICAgICAgICAgICAgICAgIH0NCiAgICAgICAgIH0NCiAgICAgICAgIGlmIChhZGV2
LT5hc2ljX3R5cGUgPj0gQ0hJUF9WRUdBMjApIHsNCkBAIC0yODkyLDEwICsyODk0LDEyIEBAIGlu
dCBhbWRncHVfcG1fc3lzZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KICAgICAgICAgICAgICAgICB9DQogICAg
ICAgICB9DQotICAgICAgIHJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5kZXYsICZkZXZf
YXR0cl9wcF9kcG1fcGNpZSk7DQotICAgICAgIGlmIChyZXQpIHsNCi0gICAgICAgICAgICAgICBE
Uk1fRVJST1IoImZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgcHBfZHBtX3BjaWVcbiIpOw0K
LSAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQorICAgICAgIGlmIChhZGV2LT5hc2ljX3R5cGUg
IT0gQ0hJUF9BUkNUVVJVUykgew0KKyAgICAgICAgICAgICAgIHJldCA9IGRldmljZV9jcmVhdGVf
ZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9wcF9kcG1fcGNpZSk7DQorICAgICAgICAgICAgICAg
aWYgKHJldCkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJmYWlsZWQgdG8g
Y3JlYXRlIGRldmljZSBmaWxlIHBwX2RwbV9wY2llXG4iKTsNCisgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQorICAgICAgICAgICAgICAgfQ0KICAgICAgICAgfQ0KICAgICAgICAg
cmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX3NjbGtfb2Qp
Ow0KICAgICAgICAgaWYgKHJldCkgew0KQEAgLTI5OTksOSArMzAwMywxMSBAQCB2b2lkIGFtZGdw
dV9wbV9zeXNmc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KICAgICAgICAgZGV2
aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9tY2xrKTsNCiAgICAg
ICAgIGlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9WRUdBMTApIHsNCiAgICAgICAgICAgICAg
ICAgZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9zb2NjbGsp
Ow0KLSAgICAgICAgICAgICAgIGRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0
cl9wcF9kcG1fZGNlZmNsayk7DQorICAgICAgICAgICAgICAgaWYgKGFkZXYtPmFzaWNfdHlwZSAh
PSBDSElQX0FSQ1RVUlVTKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3JlbW92ZV9m
aWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9kY2VmY2xrKTsNCiAgICAgICAgIH0NCi0g
ICAgICAgZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9wY2ll
KTsNCisgICAgICAgaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTKQ0KKyAgICAg
ICAgICAgICAgIGRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9wcF9kcG1f
cGNpZSk7DQogICAgICAgICBpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfVkVHQTIwKQ0KICAg
ICAgICAgICAgICAgICBkZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfcHBf
ZHBtX2ZjbGspOw0KICAgICAgICAgZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9h
dHRyX3BwX3NjbGtfb2QpOw0KLS0NCjIuMjIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPG1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4N
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0K

--_000_cf5092ae0e0b5b86871a088ea8fd543bamdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <ADF75E79D9DDFF4FB867BF680F3E5E53@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPHA+c3VyZSwgaSBrbm93LCBJIGZlZWwgdGhpcyBpcyBub3Qg
YSBnb29kIHdheSB0byBkbyBjb2RlIHdoZW4gb3RoZXIgYXNpY3MgaGF2ZSBzaW1pbGFyIHByb2Js
ZW1zLjxicj4NCndlJ2QgYmV0dGVyIGFkZCBhIGhlbHBlciBmdW5jdGlvbiB0byBjaGVjayB3aGlj
aCBzeXNmcyBpbnRlcmZhY2UgaXMgc3VwcG9ydGVkIGZvciBlYWNoIGFzaWMuPGJyPg0Kb3IgbW92
ZSB0aGVzZSBzeXNmcyBpbnRlcmZhY2UgdG8gYXNpYyBmaWxlIHRvIGNyZWF0ZS48YnI+DQo8L3A+
DQo8cD5hbnl3YXksIHdlIGNhbiBvcHRpbWl6ZSB0aGlzIGxvZ2ljIGxhdGVyLjxicj4NClJldmll
d2VkLWJ5OiBLZXZpbiBXYW5nIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzprZXZpbjEud2FuZ0BhbWQuY29tIj4NCiZsdDtrZXZpbjEud2FuZ0BhbWQuY29tJmd0
OzwvYT48YnI+DQo8YnI+DQpCZXN0IFJlZ2FyZHMsPGJyPg0KS2V2aW48YnI+DQo8L3A+DQo8ZGl2
IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDgvMTYvMTkgMzo1MiBQTSwgUXVhbiwgRXZhbiB3
cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpNTjJQ
UjEyTUIzMzQ0NTU5QzAyNTdEMkJCM0RCNjg4MzJFNEFGMEBNTjJQUjEyTUIzMzQ0Lm5hbXByZDEy
LnByb2Qub3V0bG9vay5jb20iPg0KPG1ldGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNy
b3NvZnQgV29yZCAxNSAoZmlsdGVyZWQNCiAgICAgICAgbWVkaXVtKSI+DQo8IS0tW2lmICFtc29d
PjxzdHlsZT52XDoqIHtiZWhhdmlvcjp1cmwoI2RlZmF1bHQjVk1MKTt9DQpvXDoqIHtiZWhhdmlv
cjp1cmwoI2RlZmF1bHQjVk1MKTt9DQp3XDoqIHtiZWhhdmlvcjp1cmwoI2RlZmF1bHQjVk1MKTt9
DQouc2hhcGUge2JlaGF2aW9yOnVybCgjZGVmYXVsdCNWTUwpO30NCjwvc3R5bGU+PCFbZW5kaWZd
LS0+PHN0eWxlPjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9u
dC1mYW1pbHk6U2ltU3VuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQt
ZmFjZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUg
NCA2IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2Ut
MToyIDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OlNpbVN1
bjsNCglwYW5vc2UtMToyIDEgNiAwIDMgMSAxIDEgMSAxO30NCi8qIFN0eWxlIERlZmluaXRpb25z
ICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjow
aW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1m
YW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0K
CXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6cHVycGxlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRl
cmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBsaS5tc29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXtt
c28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJbWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4w
MDAxcHQ7DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1z
ZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUyMA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBs
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0
O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQt
c2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0K
CW1hcmdpbjoxLjBpbiAxLjI1aW4gMS4waW4gMS4yNWluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7
cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4N
CjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48
IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0
PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5
b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPkJhc2NpYWxseSwgd2Ugc2hvdWxkIG5vdCBleHBvc2UgdGhlIHN5c2Zz
IGludGVyZmFjZSBmb3IgdGhvc2UgZmVhdHVyZXMgbm90IHN1cHBvcnRlZCBieSB0aGUgQVNJQy48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkFzLCB0aGVyZSBhcmUgc29tZSB0
b29scy90ZXN0cyB3aGljaCBqdWRnZXMgd2hldGhlciB0aGUgZmVhdHVyZSBpcyBzdXBwb3J0ZWQg
YnkgdGhlIGV4aXN0ZW5jZSBvZiB0aGUgZmlsZS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPlRoaXMgY2FuIGZpeCBzb21lIHRlc3QgZmFpbHVyZSBpbiByb2NtIHRlc3Qgc3Vp
dC48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UmVnYXJkcyw8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPkV2YW48bzpwPjwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpu
b25lO2JvcmRlci1sZWZ0OnNvbGlkIGJsdWUgMS41cHQ7cGFkZGluZzowaW4NCiAgICAgICAgICAw
aW4gMGluIDQuMHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9w
OnNvbGlkICNFMUUxRTENCiAgICAgICAgICAgICAgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGlu
IDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj5Gcm9tOjwvYj4gV2FuZywgS2V2aW4oWWFu
ZykgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOktldmluMS5X
YW5nQGFtZC5jb20iPg0KJmx0O0tldmluMS5XYW5nQGFtZC5jb20mZ3Q7PC9hPiA8YnI+DQo8Yj5T
ZW50OjwvYj4gRnJpZGF5LCBBdWd1c3QgMTYsIDIwMTkgMzoxNiBQTTxicj4NCjxiPlRvOjwvYj4g
UXVhbiwgRXZhbiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86
RXZhbi5RdWFuQGFtZC5jb20iPg0KJmx0O0V2YW4uUXVhbkBhbWQuY29tJmd0OzwvYT47IDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyI+DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwvYT48YnI+
DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtQQVRDSCAyLzRdIGRybS9hbWQvcG93ZXJwbGF5OiBleHBv
c2Ugc3VwcG9ydGVkIGNsb2NrIGRvbWFpbnMgb25seSB0aHJvdWdoIHN5c2ZzPG86cD48L286cD48
L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286
cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkkgZG9uJ3QgcmVjb21tZW5kIGl0LiBXaGF0J3MgdGhlIHBy
b2JsZW0gaWYgd2Uga2VlcCBpdCB0aGUgd2F5IGl0IGlzPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTIuMHB0O2NvbG9yOmJsYWNrIj5tYXliZSBvdGhlciBhc2ljIGFsc28gaGFzIHNhbWUgcHJv
YmxlbXMsIGlmIGRvIGl0LCB0aGUgb3RoZXIgYXNpYyBzaG91bGQmbmJzcDsgYWRkIGEgY29uZGl0
aW9uIGluIHRoZXJlIHRvby48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+ZWc6IG5hdmkxMCBkb24ndCBzdXBwb3J0IHNlbnNvciBvZiZuYnNwOyAmcXVvdDtwcF9k
cG1fcGNpZSZxdW90Oy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFj
ayI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkJl
c3QgUmVnYXJkcyw8YnI+DQpLZXZpbjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRp
diBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXIiIGFsaWduPSJjZW50
ZXIiPg0KPGhyIHdpZHRoPSI5OCUiIHNpemU9IjIiIGFsaWduPSJjZW50ZXIiPg0KPC9kaXY+DQo8
ZGl2IGlkPSJkaXZScGx5RndkTXNnIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0
eWxlPSJjb2xvcjpibGFjayI+RnJvbTo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFj
ayI+IGFtZC1nZnggJmx0OzxhIGhyZWY9Im1haWx0bzphbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPmFtZC1nZngtYm91bmNlc0BsaXN0
cy5mcmVlZGVza3RvcC5vcmc8L2E+Jmd0OyBvbiBiZWhhbGYgb2YgRXZhbiBRdWFuICZsdDs8YSBo
cmVmPSJtYWlsdG86ZXZhbi5xdWFuQGFtZC5jb20iIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+ZXZh
bi5xdWFuQGFtZC5jb208L2E+Jmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiBGcmlkYXksIEF1Z3VzdCAx
NiwgMjAxOSAyOjA4IFBNPGJyPg0KPGI+VG86PC9iPiA8YSBocmVmPSJtYWlsdG86YW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmciIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+DQphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzwvYT4gJmx0OzxhIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5hbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzwvYT4mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBRdWFuLCBFdmFuICZsdDs8YSBo
cmVmPSJtYWlsdG86RXZhbi5RdWFuQGFtZC5jb20iIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+RXZh
bi5RdWFuQGFtZC5jb208L2E+Jmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBbUEFUQ0ggMi80XSBk
cm0vYW1kL3Bvd2VycGxheTogZXhwb3NlIHN1cHBvcnRlZCBjbG9jayBkb21haW5zIG9ubHkgdGhy
b3VnaCBzeXNmczwvc3Bhbj4NCjxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxkaXY+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+RG8gbm90IGV4cG9zZSB0aG9zZSB1bnN1cHBvcnRlZCBj
bG9jayBkb21haW5zIHRocm91Z2ggc3lzZnMgb248YnI+DQpBcmN0dXJ1cy48YnI+DQo8YnI+DQpD
aGFuZ2UtSWQ6IEk1MjZlN2JkNDU3ZmRjZDhjNzlkNDU4MWJiOWI3N2U1Y2I1N2Y1ODQ0PGJyPg0K
U2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuICZsdDs8YSBocmVmPSJtYWlsdG86ZXZhbi5xdWFuQGFt
ZC5jb20iIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+ZXZhbi5xdWFuQGFtZC5jb208L2E+Jmd0Ozxi
cj4NCi0tLTxicj4NCiZuYnNwO2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5j
IHwgMjYgJiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0Mzsm
IzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzstLS0tLS0tLS0tPGJyPg0KJm5ic3A7MSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoJiM0MzspLCAxMCBkZWxldGlvbnMoLSk8YnI+DQo8YnI+
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYzxicj4NCmluZGV4IGM1NjQyYmU5
YjQ0Yi4uN2FjY2YyYzdmOGNkIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbS5jPGJyPg0KJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BtLmM8YnI+DQpAQCAtMjg3OSwxMCAmIzQzOzI4NzksMTIgQEAg
aW50IGFtZGdwdV9wbV9zeXNmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTxicj4N
CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkIHRv
IGNyZWF0ZSBkZXZpY2UgZmlsZSBwcF9kcG1fc29jY2xrXG4mcXVvdDspOzxicj4NCiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gcmV0Ozxicj4NCiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPg0KLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyByZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0mZ3Q7ZGV2LCAmYW1wO2Rldl9hdHRyX3Bw
X2RwbV9kY2VmY2xrKTs8YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChyZXQp
IHs8YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IERSTV9FUlJPUigmcXVvdDtmYWlsZWQgdG8gY3Jl
YXRlIGRldmljZSBmaWxlIHBwX2RwbV9kY2VmY2xrXG4mcXVvdDspOzxicj4NCi0mbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgcmV0dXJuIHJldDs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBpZiAoYWRldi0mZ3Q7YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpIHs8YnI+DQomIzQzOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyByZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0mZ3Q7ZGV2LCAm
YW1wO2Rldl9hdHRyX3BwX2RwbV9kY2VmY2xrKTs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBpZiAocmV0KSB7PGJyPg0KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgRFJNX0VSUk9SKCZxdW90O2ZhaWxlZCB0
byBjcmVhdGUgZGV2aWNlIGZpbGUgcHBfZHBtX2RjZWZjbGtcbiZxdW90Oyk7PGJyPg0KJiM0Mzsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgcmV0dXJuIHJldDs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPg0K
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4NCiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoYWRldi0mZ3Q7YXNpY190
eXBlICZndDs9IENISVBfVkVHQTIwKSB7PGJyPg0KQEAgLTI4OTIsMTAgJiM0MzsyODk0LDEyIEBA
IGludCBhbWRncHVfcG1fc3lzZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik8YnI+
DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIHJldDs8YnI+DQombmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4NCiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPg0KLSZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyByZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0mZ3Q7ZGV2
LCAmYW1wO2Rldl9hdHRyX3BwX2RwbV9wY2llKTs8YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGlmIChyZXQpIHs8YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IERSTV9FUlJPUigmcXVvdDtmYWlsZWQgdG8gY3JlYXRlIGRldmljZSBmaWxlIHBwX2RwbV9w
Y2llXG4mcXVvdDspOzxicj4NCi0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIHJl
dDs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoYWRl
di0mZ3Q7YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpIHs8YnI+DQomIzQzOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyByZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0mZ3Q7ZGV2LCAm
YW1wO2Rldl9hdHRyX3BwX2RwbV9wY2llKTs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBpZiAocmV0KSB7PGJyPg0KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgRFJNX0VSUk9S
KCZxdW90O2ZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgcHBfZHBtX3BjaWVcbiZxdW90Oyk7
PGJyPg0KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIHJldDs8YnI+DQomIzQzOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtJmd0O2Rl
diwgJmFtcDtkZXZfYXR0cl9wcF9zY2xrX29kKTs8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKHJldCkgezxicj4NCkBAIC0yOTk5LDkgJiM0
MzszMDAzLDExIEBAIHZvaWQgYW1kZ3B1X3BtX3N5c2ZzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IGRldmljZV9yZW1vdmVfZmlsZShhZGV2LSZndDtkZXYsICZhbXA7ZGV2X2F0dHJfcHBf
ZHBtX21jbGspOzxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBpZiAoYWRldi0mZ3Q7YXNpY190eXBlICZndDs9IENISVBfVkVHQTEwKSB7PGJyPg0K
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGRldmljZV9yZW1vdmVfZmls
ZShhZGV2LSZndDtkZXYsICZhbXA7ZGV2X2F0dHJfcHBfZHBtX3NvY2Nsayk7PGJyPg0KLSZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBkZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0mZ3Q7ZGV2LCAm
YW1wO2Rldl9hdHRyX3BwX2RwbV9kY2VmY2xrKTs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBpZiAoYWRldi0mZ3Q7YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpPGJyPg0K
JiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtJmd0O2Rldiwg
JmFtcDtkZXZfYXR0cl9wcF9kcG1fZGNlZmNsayk7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGRldmljZV9yZW1vdmVfZmlsZShhZGV2LSZndDtkZXYsICZhbXA7ZGV2
X2F0dHJfcHBfZHBtX3BjaWUpOzxicj4NCiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IGlmIChhZGV2LSZndDthc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUyk8YnI+DQom
IzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBkZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0m
Z3Q7ZGV2LCAmYW1wO2Rldl9hdHRyX3BwX2RwbV9wY2llKTs8YnI+DQombmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGFkZXYtJmd0O2FzaWNfdHlwZSAm
Z3Q7PSBDSElQX1ZFR0EyMCk8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtJmd0O2RldiwgJmFtcDtkZXZfYXR0cl9wcF9k
cG1fZmNsayk7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IGRldmljZV9yZW1vdmVfZmlsZShhZGV2LSZndDtkZXYsICZhbXA7ZGV2X2F0dHJfcHBf
c2Nsa19vZCk7PGJyPg0KLS0gPGJyPg0KMi4yMi4wPGJyPg0KPGJyPg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQphbWQtZ2Z4IG1haWxpbmcgbGlz
dDxicj4NCjxhIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyIgbW96
LWRvLW5vdC1zZW5kPSJ0cnVlIj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwvYT48YnI+
DQo8YSBocmVmPSJodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngiIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4PC9hPjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2JvZHk+DQo8L2h0bWw+
DQo=

--_000_cf5092ae0e0b5b86871a088ea8fd543bamdcom_--

--===============0918225658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0918225658==--
