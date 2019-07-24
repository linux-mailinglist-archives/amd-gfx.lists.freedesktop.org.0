Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E267286D
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 08:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C126E452;
	Wed, 24 Jul 2019 06:43:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730082.outbound.protection.outlook.com [40.107.73.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F896E452
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 06:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYhfyR8/xCRabljeK+DsLOu9l0bRkV/M/7SXWoBnqfupvk14n0N8uLBa3zLE8Pb4cbSbgfnZq/tMy7hbR4fP6YbiywL1i1Lo27+NnqIPc7E0KdlHbbKGzT3CVwZ98n+RsPWLTUT44GHxNBgeREUhb28wUYAZA7Jyak1IMiwSM0fdJSIb5ftsk6OKCPyeu7xhy2EVXlxOXf7bxTBnxJtFzvqpq5tiROHqJ5qzw9mTEFOX+tNI0C2/lSTBqPW3nSPTWWDwubzIp2sJZR9ofdyLgIVyPTefw+dam31nR34bc8+2Owg1oU7dySguSfRJ/2cxUfnbgiwnTihdrvM0G7qnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEyWQU2iyteXWXfi6piGPRRA08xKqqw929i0tWqq0tY=;
 b=IsZ1DRSRVSc9QOX7vkIA2K351YSUYLGh0s+/6CFoDxxElQ+QjQr0RPUkIU94GE32pb8sM2bHVYrPWctQiLHk4qfk3nYcza5hfsyF4YFwMHjmVqSdRDWqbtq8jEfekiPiIowB0qURwbH13jgW1ybObQYXDWH+8TTbNkl2DJWks1DLfkx2tr5I8wgxQlx11mYKXZimuQHKA0Qegq6C0rDZSTTnijYjxBWoYSuEsZzy+od/831XyiNzoT+KECjsdUCYP7vi69le93+Qcrs7QXV6VJfNZ0JRHd2fl4bfRnyA0qfKqmdvjoxtKgGByUkwz3qxxtEM2Fi5Sn8PWCJ2sTpWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3021.namprd12.prod.outlook.com (20.178.240.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 06:43:49 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 06:43:48 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 9/9] drm/amdgpu/powerplay/vega120: only use
 PrepareMp1ForUnload for mode1 reset
Thread-Topic: [PATCH 9/9] drm/amdgpu/powerplay/vega120: only use
 PrepareMp1ForUnload for mode1 reset
Thread-Index: AQHVQdy8Ke7WNvzQvkS1wSbIxNuU56bZUDAg
Date: Wed, 24 Jul 2019 06:43:48 +0000
Message-ID: <MN2PR12MB3344084F5EE7187A7FC93A8AE4C60@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
 <20190724050012.31398-9-alexander.deucher@amd.com>
In-Reply-To: <20190724050012.31398-9-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c446bd4b-cec2-499c-d77f-08d710024891
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3021; 
x-ms-traffictypediagnostic: MN2PR12MB3021:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3021B6ABB4D50F4DA604672EE4C60@MN2PR12MB3021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(13464003)(189003)(199004)(2906002)(99286004)(68736007)(7696005)(71200400001)(81166006)(186003)(71190400001)(8676002)(102836004)(25786009)(76116006)(66066001)(3846002)(74316002)(14454004)(4326008)(86362001)(9686003)(6306002)(446003)(33656002)(55016002)(7736002)(5660300002)(6116002)(76176011)(305945005)(81156014)(14444005)(19627235002)(2501003)(256004)(6436002)(476003)(478600001)(53546011)(26005)(66946007)(52536014)(8936002)(229853002)(66446008)(64756008)(66556008)(66476007)(486006)(53936002)(110136005)(316002)(6246003)(6506007)(966005)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3021;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PisGDTeu8RG0gQePW8o+TCXs+/emPRagniLwzOlk4cbOZSSOU0ZJ1cwr8rkq3YUjyLXhMuHAHYi8TZv4hCeSCRMbre5OF4xOXFbZVAcFHMUhffLOqEVA83LyJmcDHnOiugPRo/pXiGD0XAj+gl0r8QP1mdEhjHNhWzsdhaqxmZM/VTBacmJeCfEJUTf3c/EJtU14QoY8Krr96Zh7slexl1Y1BE0aJwnEpqpZQgpd63qSwPMXUlfNd7+GWjuMxJz3TBEi8iHxkBkMkN1S2wxSGdOsBq4uEcFIFgbXC3UnJh6961DaBLVI4T4vnkA9u5Dafe8yqiSxmhvsemOE7TmhcWRjOTz2OHyr7gEMuACd3+Ja7ZoEvN5msW1Zn4clAKIUkaPNJg4rG6XjcKA1zzKed3RweXrFEzYg9rAu85zgGY8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c446bd4b-cec2-499c-d77f-08d710024891
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 06:43:48.9091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEyWQU2iyteXWXfi6piGPRRA08xKqqw929i0tWqq0tY=;
 b=LA2JDVzVKLDArj93o4SWFiJ7G1jbmU8BrYAA7cX1q3m2Kf1RtHGvKjjcXp4fwziCTOfuCeiX1k0a7b4xtLK+BCV2Mrz3rig9O+SRuStdGITJHoa17p0TuSuG6R9d5Le8JsOUHmFvr9IeZcHXqO6fk+UT6wJNbTDFPjwl7XEajLU=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2gxIC0gNjogUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoN
ClBhdGNoNyAtIDk6IEkgdGhpbmsgc3VzcGVuZCBuZWVkcyBhbHNvIGJlIHRha2VuIGludG8gY29u
c2lkZXJhdGlvbiBhcyB2ZWdhMjBfcG93ZXJfb2ZmX2FzaWMoKSBpcyBhbHNvIG9uIHRoZSBzdXNw
ZW5kIHBhdGguDQogICAgICAgICAgICAgICAgICAgIFRoYXQgbWVhbnMgZXZlbiBpZiB0aGUgZGVm
YXVsdCBhc2ljIG1ldGhvZCBpcyBiYWNvLCB5b3UgbWF5IHN0aWxsIG5lZWQgdXNpbmcgUHJlcGFy
ZU1wMUZvclVubG9hZCgpIGZvciBzdXNwZW5kIGNhc2UuDQoNCkJUVyB0aGVyZSBpcyB0eXBvIGZv
ciBwYXRjaDkgaGVhZGVyLiBUaGUgInZlZ2ExMjAiIHNob3VsZCBiZSAidmVnYTIwIi4NCg0KUmVn
YXJkcywNCkV2YW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdm
eCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFs
ZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjQsIDIwMTkgMTowMCBQTQ0K
PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhh
bmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDkvOV0g
ZHJtL2FtZGdwdS9wb3dlcnBsYXkvdmVnYTEyMDogb25seSB1c2UNCj4gUHJlcGFyZU1wMUZvclVu
bG9hZCBmb3IgbW9kZTEgcmVzZXQNCj4gDQo+IFVzZSBQcmVwYXJlTXAxRm9yVW5sb2FkIGZvciBt
b2RlMSByZXNldCBhbmQgUHJlcGFyZU1wMUZvclNodXRkb3duDQo+IGZvciBiYWNvIHJlc2V0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPg0KPiAtLS0NCj4gIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3
bWdyLmMgfCAxOA0KPiArKysrKysrKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMNCj4gaW5kZXggZTE2ZDY2
NTQ2OTJmLi5jM2QyYjMyZjBiNjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jDQo+IEBAIC0zNzU2LDYgKzM3NTYsNyBA
QCBzdGF0aWMgaW50IHZlZ2EyMF9kaXNhYmxlX2RwbV90YXNrcyhzdHJ1Y3QNCj4gcHBfaHdtZ3Ig
Kmh3bWdyKSAgc3RhdGljIGludCB2ZWdhMjBfcG93ZXJfb2ZmX2FzaWMoc3RydWN0IHBwX2h3bWdy
DQo+ICpod21ncikgIHsNCj4gIAlzdHJ1Y3QgdmVnYTIwX2h3bWdyICpkYXRhID0gKHN0cnVjdCB2
ZWdhMjBfaHdtZ3IgKikoaHdtZ3ItDQo+ID5iYWNrZW5kKTsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IGh3bWdyLT5hZGV2Ow0KPiAgCWludCByZXN1bHQ7DQo+IA0KPiAgCXJlc3Vs
dCA9IHZlZ2EyMF9kaXNhYmxlX2RwbV90YXNrcyhod21ncik7IEBAIC0zNzY0LDEwICszNzY1LDE5
DQo+IEBAIHN0YXRpYyBpbnQgdmVnYTIwX3Bvd2VyX29mZl9hc2ljKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IpDQo+ICAJCQkpOw0KPiAgCWRhdGEtPndhdGVyX21hcmtzX2JpdG1hcCAmPSB+KFdhdGVy
TWFya3NMb2FkZWQpOw0KPiANCj4gLQlQUF9BU1NFUlRfV0lUSF9DT0RFKChyZXN1bHQgPSBzbXVt
X3NlbmRfbXNnX3RvX3NtYyhod21nciwNCj4gLQkJCVBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5s
b2FkKSkgPT0gMCwNCj4gLQkJCSJbUHJlcGFyZU1wMUZvclVubG9hZF0gRmFpbGVkISIsDQo+IC0J
CQlyZXR1cm4gcmVzdWx0KTsNCj4gKwlpZiAoYW1kZ3B1X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYp
ID09DQo+IEFNRF9SRVNFVF9NRVRIT0RfTU9ERTEpIHsNCj4gKwkJUFBfQVNTRVJUX1dJVEhfQ09E
RSgocmVzdWx0ID0NCj4gKwkJCQkgICAgIHNtdW1fc2VuZF9tc2dfdG9fc21jKGh3bWdyLA0KPiAr
DQo+IFBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwNCj4gKwkJCQkgICAgIltQ
cmVwYXJlTXAxRm9yVW5sb2FkXSBGYWlsZWQhIiwNCj4gKwkJCQkgICAgcmV0dXJuIHJlc3VsdCk7
DQo+ICsJfSBlbHNlIHsNCj4gKwkJUFBfQVNTRVJUX1dJVEhfQ09ERSgocmVzdWx0ID0NCj4gKwkJ
CQkgICAgIHNtdW1fc2VuZF9tc2dfdG9fc21jKGh3bWdyLA0KPiArDQo+IFBQU01DX01TR19QcmVw
YXJlTXAxRm9yU2h1dGRvd24pKSA9PSAwLA0KPiArCQkJCSAgICAiW1ByZXBhcmVNcDFGb3JVbmxv
YWRdIEZhaWxlZCEiLA0KPiArCQkJCSAgICByZXR1cm4gcmVzdWx0KTsNCj4gKwl9DQo+IA0KPiAg
CXJldHVybiByZXN1bHQ7DQo+ICB9DQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
