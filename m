Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F1EEB8
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 04:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCD08904A;
	Tue, 30 Apr 2019 02:15:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730089.outbound.protection.outlook.com [40.107.73.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B328904A
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 02:15:37 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3167.namprd12.prod.outlook.com (20.179.80.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 02:15:36 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6%2]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 02:15:36 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Update latest xgmi topology info after each
 device is enumulated
Thread-Topic: [PATCH] drm/amdgpu: Update latest xgmi topology info after each
 device is enumulated
Thread-Index: AQHU/sB7csE7jCxRx069jABn1qApJaZT9lwA
Date: Tue, 30 Apr 2019 02:15:35 +0000
Message-ID: <MN2PR12MB33445F72343C600E4A2C2DC3E43A0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1556565568-31183-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1556565568-31183-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.13.97.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac3dfbd4-b5cd-4147-6f3d-08d6cd11bb51
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3167; 
x-ms-traffictypediagnostic: MN2PR12MB3167:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3167CC3001B6B3FE189139F6E43A0@MN2PR12MB3167.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(189003)(13464003)(110136005)(8676002)(81156014)(316002)(68736007)(53936002)(9686003)(6306002)(73956011)(305945005)(15650500001)(71190400001)(86362001)(8936002)(7696005)(7736002)(53546011)(6506007)(81166006)(476003)(5660300002)(99286004)(76176011)(486006)(71200400001)(52536014)(14444005)(478600001)(97736004)(2501003)(256004)(186003)(2906002)(66946007)(446003)(64756008)(11346002)(66446008)(66476007)(55016002)(966005)(72206003)(14454004)(4326008)(66556008)(6116002)(6436002)(33656002)(3846002)(74316002)(26005)(76116006)(102836004)(6246003)(229853002)(66066001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3167;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 825AFPXqPQiQzSDKe+rgTPrzE/lwo35dhF4wYINrSWf6McWwOTlB2wXr25XUQyTYIeJfmx4TmHxUip26Q/kYf/DkKEL5+jx5Pk6q/P9IJpvr5dLv9RK7xmhRUplb5KMzzWO8zNTi5eEhLyfmqwWwjkOT1ezZ0kBjbxe6FnISCTPP6SvGGdxn5sJ51nE2G3I0dRQ2exgNDO8+mjtujYkOUoOSwxDctmRI/w6LnBCfs1UZuLvKK6BMmXwVQsZYv9y75wppLt8mQVwhYZDHuZ1tn8yBJN5jIR68KnZGHPGMZCu0mSY5SUqWe+7C+ac7AQUL/hgPC5+5fy6RkDzrJuhgdxx2bmcYVjOtA8KDiwwXDbrXQFjyDoconlQi7buxmFbu4ArAYJbtixzlJzwzoY11Pf3N3sBMFlpYazFmsGYoNDA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3dfbd4-b5cd-4147-6f3d-08d6cd11bb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 02:15:35.9177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKX82QZp5rFE4Ri+5lF/1XCdNXkC+TLFzMXz0qXGUzE=;
 b=5NppTuPKP8AQPiD9TLbjHCqYlEtlXyZpttNRaBEZfqthLX20ikYAi7rgJMT7Q9/XiKeRYjLe78J+DXOyVHNFs7FqZrO4dKwP3Z6Yg3sK069RFhGbuQe1v1e63oJgUpyym3kfgXrP0fpYxX7pdE0HakzFdqYre7TLpcsCw9srom0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIExpdSwNCj4gU2hhb3l1bg0KPiBTZW50OiAyMDE5
5bm0NOaciDMw5pelIDM6MjANCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBMaXUsIFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZGdwdTogVXBkYXRlIGxhdGVzdCB4Z21pIHRvcG9sb2d5IGluZm8gYWZ0ZXIgZWFj
aA0KPiBkZXZpY2UgaXMgZW51bXVsYXRlZA0KPiANCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWls
XQ0KPiANCj4gQWRqdXN0IHRoZSBzZXF1ZW5jZSBvZiBzZXQvZ2V0IHhnbWkgdG9wb2xvZ3ksIHNv
IGRyaXZlciBjYW4gaGF2ZSB0aGUgbGF0ZXN0DQo+IFhHTUkgdG9wb2xvZ3kgaW5mbyBmb3IgZnV0
dXJlIHVzYWdlDQo+IA0KPiBDaGFuZ2UtSWQ6IEk2Mjc4MTRmODI0NTlhNmM5YzNkNzI0NjlmODEz
MDk0ODhiMmE5MTMzDQo+IFNpZ25lZC1vZmYtYnk6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBhbWQu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMg
fCAzMg0KPiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jDQo+IGluZGV4IDA0ZGZjOGIuLmU0OGU5Mzkg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYw0KPiBAQCAt
MzAxLDMwICszMDEsNDEgQEAgaW50IGFtZGdwdV94Z21pX2FkZF9kZXZpY2Uoc3RydWN0DQo+IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgICAgICAgbGlzdF9hZGRfdGFpbCgmYWRldi0+Z21jLnhn
bWkuaGVhZCwgJmhpdmUtPmRldmljZV9saXN0KTsNCj4gICAgICAgICBsaXN0X2Zvcl9lYWNoX2Vu
dHJ5KGVudHJ5LCAmaGl2ZS0+ZGV2aWNlX2xpc3QsIGhlYWQpDQo+ICAgICAgICAgICAgICAgICB0
b3BfaW5mby0+bm9kZXNbY291bnQrK10ubm9kZV9pZCA9IGVudHJ5LT5ub2RlX2lkOw0KPiArICAg
ICAgIHRvcF9pbmZvLT5udW1fbm9kZXMgPSBjb3VudDsNCj4gICAgICAgICBoaXZlLT5udW1iZXJf
ZGV2aWNlcyA9IGNvdW50Ow0KPiANCj4gLSAgICAgICAvKiBFYWNoIHBzcCBuZWVkIHRvIGdldCB0
aGUgbGF0ZXN0IHRvcG9sb2d5ICovDQo+ICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBf
YWRldiwgJmhpdmUtPmRldmljZV9saXN0LCBnbWMueGdtaS5oZWFkKSB7DQo+IC0gICAgICAgICAg
ICAgICByZXQgPSBwc3BfeGdtaV9nZXRfdG9wb2xvZ3lfaW5mbygmdG1wX2FkZXYtPnBzcCwgY291
bnQsDQo+IHRvcF9pbmZvKTsNCj4gKyAgICAgICAgICAgICAgIC8qIHVwZGF0ZSBub2RlIGxpc3Qg
Zm9yIG90aGVyIGRldmljZSBpbiB0aGUgaGl2ZSAqLw0KPiArICAgICAgICAgICAgICAgaWYgKHRt
cF9hZGV2ICE9IGFkZXYpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdG9wX2luZm8gPSAm
dG1wX2FkZXYtPnBzcC54Z21pX2NvbnRleHQudG9wX2luZm87DQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHRvcF9pbmZvLT5ub2Rlc1tjb3VudCAtIDFdLm5vZGVfaWQgPSBhZGV2LT5nbWMueGdt
aS5ub2RlX2lkOw0KPiArICAgICAgICAgICAgICAgICAgICAgICB0b3BfaW5mby0+bnVtX25vZGVz
ID0gY291bnQ7DQo+ICsgICAgICAgICAgICAgICB9DQo+ICsgICAgICAgICAgICAgICByZXQgPSBh
bWRncHVfeGdtaV91cGRhdGVfdG9wb2xvZ3koaGl2ZSwgdG1wX2FkZXYpOw0KPiArICAgICAgICAg
ICAgICAgaWYgKHJldCkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBleGl0Ow0KPiAr
ICAgICAgIH0NCj4gKw0KPiArICAgICAgIC8qIGdldCBsYXRlc3QgdG9wb2xvZ3kgaW5mbyBmb3Ig
ZWFjaCBkZXZpY2UgZnJvbSBwc3AgKi8NCj4gKyAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHRt
cF9hZGV2LCAmaGl2ZS0+ZGV2aWNlX2xpc3QsIGdtYy54Z21pLmhlYWQpIHsNCj4gKyAgICAgICAg
ICAgICAgIHJldCA9IHBzcF94Z21pX2dldF90b3BvbG9neV9pbmZvKCZ0bXBfYWRldi0+cHNwLCBj
b3VudCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdG1wX2FkZXYtPnBzcC54
Z21pX2NvbnRleHQudG9wX2luZm8pOw0KPiAgICAgICAgICAgICAgICAgaWYgKHJldCkgew0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKHRtcF9hZGV2LT5kZXYsDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIlhHTUk6IEdldCB0b3BvbG9neSBmYWlsdXJlIG9uIGRl
dmljZSAlbGx4LCBoaXZlICVsbHgsIHJldCAlZCIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdG1wX2FkZXYtPmdtYy54Z21pLm5vZGVfaWQsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdG1wX2FkZXYtPmdtYy54Z21pLmhpdmVfaWQsIHJldCk7DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qIFRvIGRvIDogY29udGludWUgd2l0aCBzb21lIG5vZGUgZmFp
bGVkIG9yIGRpc2FibGUgdGhlIHdob2xlDQo+IGhpdmUgKi8NCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXhpdDsNCj4gICAg
ICAgICAgICAgICAgIH0NCj4gICAgICAgICB9DQo+IA0KPiAtICAgICAgIGxpc3RfZm9yX2VhY2hf
ZW50cnkodG1wX2FkZXYsICZoaXZlLT5kZXZpY2VfbGlzdCwgZ21jLnhnbWkuaGVhZCkgew0KPiAt
ICAgICAgICAgICAgICAgcmV0ID0gYW1kZ3B1X3hnbWlfdXBkYXRlX3RvcG9sb2d5KGhpdmUsIHRt
cF9hZGV2KTsNCj4gLSAgICAgICAgICAgICAgIGlmIChyZXQpDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPiAtICAgICAgIH0NCj4gLQ0KPiAgICAgICAgIGlmICghcmV0KQ0KPiAg
ICAgICAgICAgICAgICAgcmV0ID0gYW1kZ3B1X3hnbWlfc3lzZnNfYWRkX2Rldl9pbmZvKGFkZXYs
IGhpdmUpOw0KPiANCj4gKw0KPiArICAgICAgIG11dGV4X3VubG9jaygmaGl2ZS0+aGl2ZV9sb2Nr
KTsNCj4gK2V4aXQ6DQo+ICAgICAgICAgaWYgKCFyZXQpDQo+ICAgICAgICAgICAgICAgICBkZXZf
aW5mbyhhZGV2LT5kZXYsICJYR01JOiBBZGQgbm9kZSAlZCwgaGl2ZSAweCVsbHguXG4iLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgYWRldi0+Z21jLnhnbWkucGh5c2ljYWxfbm9kZV9pZCwg
YWRldi0+Z21jLnhnbWkuaGl2ZV9pZCk7DQo+IEBAIC0zMzMsOSArMzQ0LDYgQEAgaW50IGFtZGdw
dV94Z21pX2FkZF9kZXZpY2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYpDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGFkZXYtPmdtYy54Z21pLnBoeXNpY2FsX25vZGVfaWQsIGFkZXYt
PmdtYy54Z21pLmhpdmVfaWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCk7DQo+IA0K
PiAtDQo+IC0gICAgICAgbXV0ZXhfdW5sb2NrKCZoaXZlLT5oaXZlX2xvY2spOw0KPiAtZXhpdDoN
Cj4gICAgICAgICByZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gLS0NCj4gMi43LjQNCj4gDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZngg
bWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
