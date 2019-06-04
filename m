Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C96234CDA
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 18:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4789A5D;
	Tue,  4 Jun 2019 16:08:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680061.outbound.protection.outlook.com [40.107.68.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFBA89A5D
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 16:08:30 +0000 (UTC)
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB4014.namprd12.prod.outlook.com (10.255.239.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 16:08:28 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6%6]) with mapi id 15.20.1965.011; Tue, 4 Jun 2019
 16:08:28 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Jerry.Zhang@amd.com" <Jerry.Zhang@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>
Subject: RE: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce
 3.0 (V2)
Thread-Topic: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce
 3.0 (V2)
Thread-Index: AQHVGrCKNaLukVC8cU2vhafasL6Ul6aLVjuAgABUNQA=
Date: Tue, 4 Jun 2019 16:08:28 +0000
Message-ID: <MN2PR12MB3248A52640FA122A55F4E4D4F2150@MN2PR12MB3248.namprd12.prod.outlook.com>
References: <1559637339-2124-1-git-send-email-shirish.s@amd.com>
 <1bcb4a94-313e-168f-18d4-311bd409f13a@gmail.com>
In-Reply-To: <1bcb4a94-313e-168f-18d4-311bd409f13a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [49.206.10.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af725fb7-cbc1-4967-35b0-08d6e906e1c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4014; 
x-ms-traffictypediagnostic: MN2PR12MB4014:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4014723C00519B8930F286B4F2150@MN2PR12MB4014.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(366004)(376002)(396003)(13464003)(189003)(199004)(26005)(81156014)(8676002)(4326008)(81166006)(478600001)(2501003)(110136005)(2906002)(66066001)(86362001)(66574012)(71200400001)(71190400001)(316002)(7696005)(102836004)(53546011)(6246003)(6506007)(55236004)(8936002)(6636002)(76176011)(99286004)(5660300002)(11346002)(53936002)(72206003)(486006)(52536014)(9686003)(476003)(446003)(55016002)(6306002)(25786009)(6436002)(229853002)(68736007)(256004)(14444005)(66946007)(66446008)(64756008)(66556008)(66476007)(33656002)(3846002)(74316002)(6116002)(186003)(76116006)(73956011)(54906003)(305945005)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4014;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bWrGGhN+h/oxXBreG6XU+2kXfh88eL1RjZB0Qy2ZGsGn0DJQQkitezNpcbLjdOAhFGmc8gKUWiGuHXKRtLCYhk/qcrAgbohG2JZjqjURKpg+mEnNekvwLgR6hlo4lSEi7+8WGb63v5cDnF5qpImxkbTzFUSJ2TdlHzA8deUJfyyvlWIfDQz4XEl6YOEpcyYKEY+QEI9dMK897U1p588ATmmFrNuIfxI9VE1f4EeeKMOl+tZXV899ZJzyxtEXmWEEOhLhWP5uPo0n1lzg0OKdZBEchBJlpELu8XB/APXLJrZdk9MOVNn4IYEX0/YD8Y0p/JLLVso0eoC2Y0OXoZf1QRfg4M32ebNLiOJnWIONRV3DF5fJAW7UycxKMfweVjF+eLZHLLVC3SSy7rB3JmnyOGq6VXcaxLxLeFLGqE6lSrg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af725fb7-cbc1-4967-35b0-08d6e906e1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 16:08:28.5178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshankar@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4014
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihXXA9dzihyjw6pThayGXB6e1usAyciFkXU+8Rd+KIA=;
 b=NbkhUIGLI3NpYlMl3qMnTwfZpzn+uHNZQP3e9DCIN32v4eGtUMxd4UZHbdzsAMj80iD4zbSbJjMJtW7vHu6Og9cT4pOwO1nHJG5E3Apurjs7EtEeqt+DtMhjav1wc1lxa0z9TbOy6Rw2Z9OE5bgkcskE6dt32TTcB9Rti+yFA64=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIENocmlzdGlhbi4NCkhhdmUgc2VudCB0aGUgcGF0Y2ggZm9yIHV2ZCAmIHZjbi4NCiho
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzA4NTc1LykNCg0KDQpSZWdh
cmRzLA0KU2hpcmlzaCBTDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaHJp
c3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gDQpTZW50OiBU
dWVzZGF5LCBKdW5lIDQsIDIwMTkgNDozOCBQTQ0KVG86IFMsIFNoaXJpc2ggPFNoaXJpc2guU0Bh
bWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IEplcnJ5LlpoYW5n
QGFtZC5jb207IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+OyBMaXUsIExlbyA8TGVv
LkxpdUBhbWQuY29tPg0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMaSwgQ2hp
bmctc2hpaCAoTG91aXMpIDxDaGluZy1zaGloLkxpQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIXSBkcm0vYW1kZ3B1OiBmaXggcmluZyB0ZXN0IGZhaWx1cmUgaXNzdWUgZHVyaW5nIHMzIGlu
IHZjZSAzLjAgKFYyKQ0KDQpBbSAwNC4wNi4xOSB1bSAxMDozNiBzY2hyaWViIFMsIFNoaXJpc2g6
DQo+IEZyb206IExvdWlzIExpIDxDaGluZy1zaGloLkxpQGFtZC5jb20+DQo+DQo+IFtXaGF0XQ0K
PiB2Y2UgcmluZyB0ZXN0IGZhaWxzIGNvbnNpc3RlbnRseSBkdXJpbmcgcmVzdW1lIGluIHMzIGN5
Y2xlLCBkdWUgdG8gDQo+IG1pc21hdGNoIHJlYWQgJiB3cml0ZSBwb2ludGVycy4NCj4gT24gZGVi
dWcvYW5hbHlzaXMgaXRzIGZvdW5kIHRoYXQgcnB0ciB0byBiZSBjb21wYXJlZCBpcyBub3QgYmVp
bmcgDQo+IGNvcnJlY3RseSB1cGRhdGVkL3JlYWQsIHdoaWNoIGxlYWRzIHRvIHRoaXMgZmFpbHVy
ZS4NCj4gQmVsb3cgaXMgdGhlIGZhaWx1cmUgc2lnbmF0dXJlOg0KPiAJW2RybTphbWRncHVfdmNl
X3JpbmdfdGVzdF9yaW5nXSAqRVJST1IqIGFtZGdwdTogcmluZyAxMiB0ZXN0IGZhaWxlZA0KPiAJ
W2RybTphbWRncHVfZGV2aWNlX2lwX3Jlc3VtZV9waGFzZTJdICpFUlJPUiogcmVzdW1lIG9mIElQ
IGJsb2NrIDx2Y2VfdjNfMD4gZmFpbGVkIC0xMTANCj4gCVtkcm06YW1kZ3B1X2RldmljZV9yZXN1
bWVdICpFUlJPUiogYW1kZ3B1X2RldmljZV9pcF9yZXN1bWUgZmFpbGVkICgtMTEwKS4NCj4NCj4g
W0hvd10NCj4gZmV0Y2ggcnB0ciBhcHByb3ByaWF0ZWx5LCBtZWFuaW5nIG1vdmUgaXRzIHJlYWQg
bG9jYXRpb24gZnVydGhlciBkb3duIA0KPiBpbiB0aGUgY29kZSBmbG93Lg0KPiBXaXRoIHRoaXMg
cGF0Y2ggYXBwbGllZCB0aGUgczMgZmFpbHVyZSBpcyBubyBtb3JlIHNlZW4gZm9yID41ayBzMyAN
Cj4gY3ljbGVzLCB3aGljaCBvdGhlcndpc2UgaXMgcHJldHR5IGNvbnNpc3RlbnQuDQo+DQo+IFYy
OiByZW1vdmUgcmVkdW50YW50IGZldGNoIG9mIHJwdHINCj4NCj4gU2lnbmVkLW9mZi1ieTogTG91
aXMgTGkgPENoaW5nLXNoaWguTGlAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCkNDOiBzdGFibGUuLi4NCg0KV2hvIGRv
ZXMgdGhlIHNhbWUgcGF0Y2ggZm9yIFVWRCBhbmQgVkNOPyBFeGFjdGx5IHRoZSBzYW1lIHRoaW5n
IGlzIHdyb25nIHRoZXJlIGFzIHdlbGwuDQoNCkNocmlzdGlhbi4NCg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgfCA0ICsrKy0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jDQo+IGluZGV4IGMwMjFiMTEuLmY3MTg5ZTIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMNCj4gQEAgLTEw
NzIsNyArMTA3Miw3IEBAIHZvaWQgYW1kZ3B1X3ZjZV9yaW5nX2VtaXRfZmVuY2Uoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCB1NjQgYWRkciwgdTY0IHNlcSwNCj4gICBpbnQgYW1kZ3B1X3ZjZV9y
aW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+ICAgew0KPiAgIAlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7DQo+IC0JdWludDMyX3QgcnB0ciA9
IGFtZGdwdV9yaW5nX2dldF9ycHRyKHJpbmcpOw0KPiArCXVpbnQzMl90IHJwdHI7DQo+ICAgCXVu
c2lnbmVkIGk7DQo+ICAgCWludCByLCB0aW1lb3V0ID0gYWRldi0+dXNlY190aW1lb3V0Ow0KPiAg
IA0KPiBAQCAtMTA4NCw2ICsxMDg0LDggQEAgaW50IGFtZGdwdV92Y2VfcmluZ190ZXN0X3Jpbmco
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPiAgIAlpZiAocikNCj4gICAJCXJldHVybiByOw0K
PiAgIA0KPiArCXJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsNCj4gKw0KPiAgIAlh
bWRncHVfcmluZ193cml0ZShyaW5nLCBWQ0VfQ01EX0VORCk7DQo+ICAgCWFtZGdwdV9yaW5nX2Nv
bW1pdChyaW5nKTsNCj4gICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
