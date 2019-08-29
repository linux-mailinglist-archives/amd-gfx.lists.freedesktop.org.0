Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7718A0FBE
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 04:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DC889F08;
	Thu, 29 Aug 2019 02:59:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CA089F08
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 02:59:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXur7Bvhc1z3RQ/icVZLTT4VX9zSz1JmjtmVbJJZ1kgmkdP2jN2wUbP9+9tnHOBQIul/4MBDCybd5iDBwqp1xWsCCN3dhVw+NUEx96u/MbKGNIORhVKAlUUHANtiuviIU89HpFas/EXci+yLQAt6HP8N9NuMYsdJOE7Do6HDBJCVX5/SqNhNNZd8kp9js7v/6nXGq2MymyOrtSFFNd40uPYGUEFQw7kPgyqNSpik/biVYwVCqKBY9RKL5FsAXzktV8RSkZ0b99LmMeL77tcBuxVvwiBGsLFFRmzb0B4mQ1IXdF66x+eqTQYaoj39MJbtmOnPxI9jGBSovBdFP6I4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xC+k0kdAQ9MXxO1WVmaHYqYognYIBEx+VeJN6ISXCI=;
 b=iF2G8aLIQ4sPAtomTQQNUB4UxFF2oyXEzW6AiVxe60npe+LUQdIOSN+t97CzeVtkfGD5bHNmM709+4IIabrS4OclWJU3V0tn9BIOQ0N1QhuDN0iplbTLKoR0M/GgRZKOU7ZHeHCFzeD+AAn8RC1+H7izHvyb57YD2vo+CXsV1Au+IyqNeX8x5jPjDrOA2Fg4S/0iYNeSeEYNZPWfNgLf1d9lJa+AqYCGUq2/q1THtU1RlQ/HfZH+xZGRfxkzgQnYEH0i54ooCu7SF37SRn/8LsWsDLE7ts/yj8ndI/5u+FlkhTXq2nfuXrNUaGkoEWv6iiAQJX2/DSRqd/i1lqqGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3343.namprd12.prod.outlook.com (20.178.240.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 02:59:04 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 02:59:04 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init
Thread-Topic: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init
Thread-Index: AQHVXaD73ZpTMHTbk0STcwXK0KWMBacRbnyA
Date: Thu, 29 Aug 2019 02:59:04 +0000
Message-ID: <MN2PR12MB305488AF7BE5CD29B8E6E152B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b1edeaf-ad05-471a-5354-08d72c2cda37
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3343; 
x-ms-traffictypediagnostic: MN2PR12MB3343:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33438D572FD72915296DA83DB0A20@MN2PR12MB3343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(189003)(199004)(13464003)(8936002)(66946007)(14454004)(11346002)(5660300002)(14444005)(6436002)(110136005)(33656002)(316002)(229853002)(478600001)(52536014)(256004)(53546011)(64756008)(7736002)(6506007)(53936002)(6116002)(66556008)(66446008)(3846002)(76116006)(66066001)(99286004)(74316002)(6246003)(76176011)(6636002)(2906002)(486006)(26005)(102836004)(476003)(305945005)(9686003)(71190400001)(81166006)(186003)(2501003)(8676002)(446003)(86362001)(55016002)(4326008)(81156014)(71200400001)(7696005)(66476007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3343;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j5O+eSL3hab5T7fbdfjytAxZsc3F/RHJjYBqBnIrxvWGzne8Nfx2dgZaQpESu8pI2bFyaI5zSgMrFnU0hBvpWeir3W8o5d2RWtvXGW3Z9Ky1wvY1CcpLJLP9kKGztuDAEPllMBG5usj86nVMlK6gZVkaK8AwfY7m+rtyFGBIcDwgqPrSOe0xdvnbLFUUNsm271dHAmYr7a8xGlX6oB6UYypc91kpp9/rX9D1y6AEcKsdeW/9cAP9XyirffpLpNtF+nu57zUBeg5mAaHBs9J9EfRRK5TgvkixfvAVjafja8u7SN3CBW8mgdSSUuWUjCz33aW/wtoW/1PLZk/LioI/A4EpU7ec9GLq0/5ardgYdqTxrP1i4yB4waWsZ/uSNYX2GXeGgruClLR05yxhD0P/UeiHhU3Upz3l+GwzqIX725Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1edeaf-ad05-471a-5354-08d72c2cda37
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 02:59:04.6027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMi3Xhzuj45Efo+6dQgcS5gEi/eWI2hOZJuUrE8myHfadGECamnVA6Y6wVKLx4wO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xC+k0kdAQ9MXxO1WVmaHYqYognYIBEx+VeJN6ISXCI=;
 b=qnNypI2tLROHpIDsMwTs+aA5njncgJprOVZg3/WxrGxj75KYnzK7KxShGUpqQ3Dy0e+pzAE+J4AOiu+1mZGtyt0dninPY+I3reTa8Zp4qLdmZc9q3FG3xePIXu2c8Oc468iILGGzeiQKeUGKib6vDZJb4vm3odTXnuVAbqVsml8=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGF3a2luZyBaaGFuZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDI45pelIDIxOjAzDQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhvdTEsIFRhbyA8VGFvLlpob3Ux
QGFtZC5jb20+Ow0KPiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+DQo+IENjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggMS83XSBkcm0vYW1kZ3B1OiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIGRvIGNv
bW1vbg0KPiByYXNfbGF0ZV9pbml0DQo+IA0KPiBJbiBsYXRlX2luaXQgZm9yIHJhcywgdGhlIGhl
bHBlciBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgdG8gMSkuIGRpc2FibGUgcmFzIGZlYXR1cmUNCj4g
aWYgdGhlIElQIGJsb2NrIGlzIG1hc2tlZCBhcyBkaXNhYmxlZCAyKS4gc2VuZCBlbmFibGUgZmVh
dHVyZSBjb21tYW5kIGlmIHRoZQ0KPiBpcCBibG9jayB3YXMgbWFza2VkIGFzIGVuYWJsZWQgMyku
IGNyZWF0ZSBkZWJ1Z2ZzL3N5c2ZzIG5vZGUgcGVyIElQIGJsb2NrIDQpLg0KPiByZWdpc3RlciBp
bnRlcnJ1cHQgaGFuZGxlcg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYyB8IDU3DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCAgNCArKysNCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBpbmRleCAyMzBmN2U2Li4yYzMyZjk5IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IEBAIC0xNTY0LDYgKzE1
NjQsNjMgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4gIAlyZXR1cm4gLUVJTlZBTDsNCj4gIH0NCj4gDQo+ICsvKiBoZWxwZXIgZnVuY3Rpb24gdG8g
aGFuZGxlIGNvbW1vbiBzdHVmZiBpbiBpcCBsYXRlIGluaXQgcGhhc2UgKi8gaW50DQo+ICthbWRn
cHVfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKwkJCSBzdHJ1
Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2Jsb2NrLA0KPiArCQkJIHN0cnVjdCByYXNfZnNfaWYgKmZz
X2luZm8sDQo+ICsJCQkgc3RydWN0IHJhc19paF9pZiAqaWhfaW5mbykNCj4gK3sNCj4gKwlpbnQg
cjsNCj4gKw0KPiArCS8qIGRpc2FibGUgUkFTIGZlYXR1cmUgcGVyIElQIGJsb2NrIGlmIGl0IGlz
IG5vdCBzdXBwb3J0ZWQgKi8NCj4gKwlpZiAoIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYs
IHJhc19ibG9jay0+YmxvY2spKSB7DQo+ICsJCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25f
Ym9vdChhZGV2LCByYXNfYmxvY2ssIDApOw0KPiArCQlyZXR1cm4gMDsNCj4gKwl9DQo+ICsNCj4g
KwlyID0gYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsIHJhc19ibG9jaywg
MSk7DQo+ICsJaWYgKHIpIHsNCj4gKwkJaWYgKHIgPT0gLUVBR0FJTikgew0KPiArCQkJLyogcmVx
dWVzdCBncHUgcmVzZXQuIHdpbGwgcnVuIGFnYWluICovDQo+ICsJCQlhbWRncHVfcmFzX3JlcXVl
c3RfcmVzZXRfb25fYm9vdChhZGV2LA0KPiArCQkJCQlyYXNfYmxvY2stPmJsb2NrKTsNCj4gKwkJ
CXJldHVybiAwOw0KPiArCQl9DQo+ICsJCS8qIGluIHJlc3VtZSBwaGFzZSwgaWYgZmFpbCB0byBl
bmFibGUgcmFzLA0KPiArCQkgKiBjbGVhbiB1cCBhbGwgcmFzIGZzIG5vZGVzLCBhbmQgZGlzYWJs
ZSByYXMgKi8NCj4gKwkJaWYgKGFkZXYtPmluX3N1c3BlbmQpDQo+ICsJCQlnb3RvIGNsZWFudXA7
DQo+ICsJfQ0KPiArDQo+ICsJLyogaW4gcmVzdW1lIHBoYXNlLCBubyBuZWVkIHRvIGNyZWF0ZSBy
YXMgZnMgbm9kZSAqLw0KPiArCWlmIChhZGV2LT5pbl9zdXNwZW5kKQ0KPiArCQlyZXR1cm4gMDsN
Cj4gKw0KPiArCWlmIChyYXNfYmxvY2stPmJsb2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX1VNQyB8
fA0KPiArCSAgICByYXNfYmxvY2stPmJsb2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX1NETUEgfHwN
Cj4gKwkgICAgcmFzX2Jsb2NrLT5ibG9jayA9PSBBTURHUFVfUkFTX0JMT0NLX19HRlgpIHsNCltU
YW9dIHdlIGNhbiBzZXQgaWhfaW5mbyB0byBOVUxMIGlmIGEgcmFzIGJsb2NrIGhhcyBubyBpbnRl
cnJ1cHQgYW5kIGNoYW5nZSB0aGUgY29uZGl0aW9uIHRvICJpZiAoaWhfaW5mbykiDQoNCj4gKwkJ
ciA9IGFtZGdwdV9yYXNfaW50ZXJydXB0X2FkZF9oYW5kbGVyKGFkZXYsIGloX2luZm8pOw0KPiAr
CQlpZiAocikNCj4gKwkJCWdvdG8gaW50ZXJydXB0Ow0KPiArCX0NCj4gKw0KPiArCWFtZGdwdV9y
YXNfZGVidWdmc19jcmVhdGUoYWRldiwgZnNfaW5mbyk7DQo+ICsNCj4gKwlyID0gYW1kZ3B1X3Jh
c19zeXNmc19jcmVhdGUoYWRldiwgZnNfaW5mbyk7DQo+ICsJaWYgKHIpDQo+ICsJCWdvdG8gc3lz
ZnM7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK2NsZWFudXA6DQo+ICsJYW1kZ3B1X3Jhc19zeXNm
c19yZW1vdmUoYWRldiwgcmFzX2Jsb2NrKTsNCj4gK3N5c2ZzOg0KPiArCWFtZGdwdV9yYXNfZGVi
dWdmc19yZW1vdmUoYWRldiwgcmFzX2Jsb2NrKTsNCj4gKwlhbWRncHVfcmFzX2ludGVycnVwdF9y
ZW1vdmVfaGFuZGxlcihhZGV2LCBpaF9pbmZvKTsNCltUYW9dIGxhY2sgb2YgaWYgY29uZGl0aW9u
DQoNCj4gK2ludGVycnVwdDoNCj4gKwlhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlKGFkZXYsIHJh
c19ibG9jaywgMCk7DQo+ICsJcmV0dXJuIHI7DQo+ICt9DQo+ICsNCj4gIC8qIGRvIHNvbWUgaW5p
dCB3b3JrIGFmdGVyIElQIGxhdGUgaW5pdCBhcyBkZXBlbmRlbmNlLg0KPiAgICogYW5kIGl0IHJ1
bnMgaW4gcmVzdW1lL2dwdSByZXNldC9ib290aW5nIHVwIGNhc2VzLg0KPiAgICovDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gaW5kZXggNmM3NmJiMi4uNTIx
Mjk2MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBA
QCAtNTY2LDYgKzU2NiwxMCBAQCBhbWRncHVfcmFzX2Vycm9yX3RvX3RhKGVudW0NCj4gYW1kZ3B1
X3Jhc19lcnJvcl90eXBlIGVycm9yKSB7ICBpbnQgYW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlDQo+ICphZGV2KTsgIGludCBhbWRncHVfcmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOyAgaW50DQo+IGFtZGdwdV9yYXNfcHJlX2Zpbmkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOw0KPiAraW50IGFtZGdwdV9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LA0KPiArCQkJIHN0cnVjdCByYXNfY29tbW9uX2lmICpyYXNfYmxvY2ssDQo+
ICsJCQkgc3RydWN0IHJhc19mc19pZiAqZnNfaW5mbywNCj4gKwkJCSBzdHJ1Y3QgcmFzX2loX2lm
ICppaF9pbmZvKTsNCj4gDQo+ICBpbnQgYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAkJc3RydWN0IHJhc19jb21tb25faWYgKmhlYWQsIGJv
b2wgZW5hYmxlKTsNCj4gLS0NCj4gMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
