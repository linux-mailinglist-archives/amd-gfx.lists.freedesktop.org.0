Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C788FFE3
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 12:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1F6E2E3;
	Fri, 16 Aug 2019 10:20:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ADE6E2E2
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 10:20:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cM5Kg4bKixLquMGuB4KnCnafgw4jKdg+O83autzo8m48CQCfOikDoGevs3AGiVjm+YfOT1v+6m+sf1le+ILJdKKlp5NQ0bJgbrTzy3YLVz9tAWCNFmyNONct2YrBO9yli5D1HNQzdPXXk46zOYvLtkNyV4TEeNC/6xWnZ8h20egsPHAGV0itRP2DQuwvCSOJQWZrU4wkiZjP8XESq1xEry5N8CvYE/54d1Jj9UTnykqvA6vra++rPHPFjCRXa8jmc8yatEDS8iyt80Hq7JFY4Q6/Cyz2ghsGpMF4vGQXl2jW0bZ0DqtXQ+0ZbLyY9cMwAM0hd/o0eXW32Ck9msguYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgJ/ukkULBSKIyZ8jeuMJW0bMX5+3O7cFgV5geOcxv8=;
 b=R7wJM0TQzhYcRkjezZrK1AQacSprNKOwybn/qD64k7orsYOhgnUmqSVEq1dF59hZzJU4uRLmxCt6LHgwfVvLlRv1AL+tA1KL6H+aFtOFBzGeQyN0OCmnfbNi0pKusDSwzfT2QyV1bBHyJF+erMoT375VzBbdwnd21UPMgAXiy85R9w2Q21Ie3nphwWszFHwclpZP9T7TzjCumJGxlEEqyExHnhFgwhaKN3wsdUHcmggK1YMwLOnM+WDYNjb4FbDeMlwArTJPeVhRll6MGLnGL+QNjfajW8ep+qs0SwTMuVRGSjmVHAvv1uOp5TCCFIWrMjXE/u0NQbjHUhsJoO0NtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.177.126.83) by
 BYAPR12MB2616.namprd12.prod.outlook.com (20.176.255.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 10:20:08 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5%6]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 10:20:08 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH] drm/amdgpu: correct return type of
 amdgpu_ras_query_error_count
Thread-Topic: [PATCH] drm/amdgpu: correct return type of
 amdgpu_ras_query_error_count
Thread-Index: AQHVVAGzUhlXNmKxwECC8szZZyyQN6b9inAAgAAFnLA=
Date: Fri, 16 Aug 2019 10:20:08 +0000
Message-ID: <BYAPR12MB28069641BF3CAEA8F910254CF1AF0@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190816071013.21034-1-guchun.chen@amd.com>
 <MN2PR12MB30540425780469918EB12945B0AF0@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB30540425780469918EB12945B0AF0@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ea47428-1a08-415f-2b6f-08d72233509e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2616; 
x-ms-traffictypediagnostic: BYAPR12MB2616:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB26161A6ADE9D19D56F4BCC32F1AF0@BYAPR12MB2616.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(13464003)(189003)(199004)(11346002)(316002)(81166006)(81156014)(256004)(2501003)(99286004)(7696005)(74316002)(33656002)(14444005)(9686003)(6306002)(6436002)(966005)(305945005)(478600001)(229853002)(53936002)(71190400001)(5660300002)(71200400001)(2906002)(7736002)(102836004)(25786009)(55016002)(110136005)(476003)(6246003)(86362001)(446003)(486006)(66556008)(8676002)(14454004)(66446008)(53546011)(6506007)(66946007)(76116006)(3846002)(52536014)(66476007)(6116002)(8936002)(64756008)(186003)(26005)(6636002)(66066001)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2616;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jCARM1Om6bp/graPvRl8hs4Tb8d1y5b65mDuccF94iOsWHByjUltS+tTepedavh3IxdVel1jy2fepgyYYogPKEaOpZpxp8ZBwpa/fslT9iiHAS34d/2GebE1ebkgkzchnghqQ57fGvrQ7Gl9U1YnHqbvuwYXKYmF7INMx5msxZjEMl3gt79lDDJfr/MESTUcllp/nHaKE/xkjI1s4VHFJsEIi+ORKsqVcy39w3SbsbEUICLM6qDcxXkhkzGrykMoy9Wo+AzbiuaK9s+D8ezfSY9hioVaHwEIp8D0l/iv/7IVaWPHtYI7ccTSUUvp5kc0VNyZV6koWMpddjJs86Rji/Lvc5+3DyF2okvqwFcntLuxXwTfvbeZEsq9LUv9yaeZ8isDJi9GtciA25oF4gJLZyo9pPNlpseh3zRIX7HM4VI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea47428-1a08-415f-2b6f-08d72233509e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 10:20:08.5944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2C6aTbcd4hzIcfNNDGGdF3uwsMWEvM9repSL7DNmzcFuOqOmaBRCRgKqVJ647L+V4W1MptYxLQsANOq5nOT9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgJ/ukkULBSKIyZ8jeuMJW0bMX5+3O7cFgV5geOcxv8=;
 b=nmDHOQMagZieZk0pYyQlp/KvyUEIJW0VihSVdQv3VwRAVJWdfwxKZdNGt3Rd3r1pIZgKT/IB6wtRKBuJ/SHt9UWPfdt96F0Z46sJZxXMFXRmfk3a0v7nvSz07E3Qjx3YiPbj6vaHFKHNsJEH5aTMydR2vfPpUOH4v02vyMUwgP0=
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

SW4gcmFzIHVuaXQgdGVzdCB0b29sLCB3ZSBoYXZlIGFscmVhZHkgdXNlZCAidW5zaWduZWQgbG9u
ZyIgdG8gcmVjb3JkIHRoZSBjZSBhbmQgdWUgZXJyb3IgY291bnQuDQoNClJlZ2FyZHMsDQpHdWNo
dW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFpob3UxLCBUYW8gPFRhby5a
aG91MUBhbWQuY29tPiANClNlbnQ6IEZyaWRheSwgQXVndXN0IDE2LCAyMDE5IDU6NTkgUE0NClRv
OiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IExpLCBE
ZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNv
bT4NCkNjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQpTdWJqZWN0OiBSRTog
W1BBVENIXSBkcm0vYW1kZ3B1OiBjb3JyZWN0IHJldHVybiB0eXBlIG9mIGFtZGdwdV9yYXNfcXVl
cnlfZXJyb3JfY291bnQNCg0KVGhlIGNoYW5nZSBpcyByZWFzb25hYmxlLCBidXQgSSBhbHNvIGNo
ZWNrIHRoZSBmdW5jdGlvbidzIGNhbGxlciwgYSB1aW50MzJfdCByYXNfY291bnRlciBzdG9yZXMg
dGhlIHZhbHVlIGluIGFtZGdwdV9jdHhfcXVlcnkyLg0KSG93IGFib3V0IHJhcyB0ZXN0IHRvb2w/
IENhbiB3ZSBnZXQgcmlkIG9mIGFsbCB0aGUgY2hhb3MgYWJvdXQgdGhlIGNvdW50ZXIncyB0eXBl
Pw0KDQpUYW8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+
IEd1Y2h1biBDaGVuDQo+IFNlbnQ6IDIwMTnlubQ45pyIMTbml6UgMTU6MTANCj4gVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyANCj4gPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT47IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgUGFuLCBYaW5odWkg
DQo+IDxYaW5odWkuUGFuQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4N
Cj4gQ2M6IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIXSBkcm0vYW1kZ3B1OiBjb3JyZWN0IHJldHVybiB0eXBlIG9mIA0KPiBhbWRncHVfcmFzX3F1
ZXJ5X2Vycm9yX2NvdW50DQo+IA0KPiBUaGUgcmV0dXJuIHZhbHVlIHR5cGUgb2YgYW1kZ3B1X3Jh
c19xdWVyeV9lcnJvcl9jb3VudCBzaG91bGQgYmUgDQo+IHVuc2lnbmVkIGxvbmcsIG5vdCBpbnQu
DQo+IA0KPiBDaGFuZ2UtSWQ6IEkwMTE0MDZkODFiYWQ2OWE2NTQzM2I2Mzk2MGUxNjkxYzQ5NTli
YmM1DQo+IFNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDYgKysr
LS0tIA0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCAyICstDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gaW5kZXggNTBjMTNi
MDJkMjM0Li5kZjRiOWFlMzljNWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMNCj4gQEAgLTY4Niw3ICs2ODYsNyBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9j
dXJlKHN0cnVjdCBhbWRncHVfZGV2aWNlIA0KPiAqYWRldiwgIH0NCj4gDQo+ICAvKiBnZXQgdGhl
IHRvdGFsIGVycm9yIGNvdW50cyBvbiBhbGwgSVBzICovIC1pbnQgDQo+IGFtZGdwdV9yYXNfcXVl
cnlfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICt1bnNpZ25lZCBs
b25nIGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4g
KmFkZXYsDQo+ICAJCWJvb2wgaXNfY2UpDQo+ICB7DQo+ICAJc3RydWN0IGFtZGdwdV9yYXMgKmNv
biA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7IEBAIC0NCj4gNjk0LDcgKzY5NCw3IEBA
IGludCBhbWRncHVfcmFzX3F1ZXJ5X2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlIA0K
PiAqYWRldiwNCj4gIAlzdHJ1Y3QgcmFzX2Vycl9kYXRhIGRhdGEgPSB7MCwgMH07DQo+IA0KPiAg
CWlmICghY29uKQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJcmV0dXJuIDA7DQo+IA0KPiAg
CWxpc3RfZm9yX2VhY2hfZW50cnkob2JqLCAmY29uLT5oZWFkLCBub2RlKSB7DQo+ICAJCXN0cnVj
dCByYXNfcXVlcnlfaWYgaW5mbyA9IHsNCj4gQEAgLTcwMiw3ICs3MDIsNyBAQCBpbnQgYW1kZ3B1
X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4g
IAkJfTsNCj4gDQo+ICAJCWlmIChhbWRncHVfcmFzX2Vycm9yX3F1ZXJ5KGFkZXYsICZpbmZvKSkN
Cj4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiArCQkJcmV0dXJuIDA7DQo+IA0KPiAgCQlkYXRhLmNl
X2NvdW50ICs9IGluZm8uY2VfY291bnQ7DQo+ICAJCWRhdGEudWVfY291bnQgKz0gaW5mby51ZV9j
b3VudDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBpbmRl
eCAyNzY1ZjJkYmIxZTYuLjAyYTUxZTNkZmExNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBAQCAtNDg0LDcgKzQ4NCw3IEBAIGludCBhbWRncHVfcmFz
X3JlcXVlc3RfcmVzZXRfb25fYm9vdChzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgIHZv
aWQgYW1kZ3B1X3Jhc19yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgDQo+ICphZGV2KTsgIHZv
aWQgYW1kZ3B1X3Jhc19zdXNwZW5kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gDQo+
IC1pbnQgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwNCj4gK3Vuc2lnbmVkIGxvbmcgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1
Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldiwNCj4gIAkJYm9vbCBpc19jZSk7DQo+IA0KPiAgLyog
ZXJyb3IgaGFuZGxpbmcgZnVuY3Rpb25zICovDQo+IC0tDQo+IDIuMTcuMQ0KPiANCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
