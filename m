Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD679AAA7D
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 20:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEE189208;
	Thu,  5 Sep 2019 18:01:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1173E89208
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 18:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbE78yexYYXnpBrObOfb5Er+kyq7K+YdtrzEWNgIUmslZtvENhxk0mIlUcOO1iKdsTnjSYFbIG0eaE3GOQQaH3AJyBUigjmQb/PNocaDtArI1rqS6FOeR0bkqJz2mpRSQhEbzeR7E9CZmCGQ9Xxjd529YxPHwvkTPg9G4/dxQpFiEsxxMpsylvSwm8Bp3Ls9b6cedGe1ffaJW/noAyxlHkdY2LfpGRxly/UaClRtX2c5Fke4iYUPIO8ZTF/8odBqIkCT+z2mbovgLHqCqPF+LIN43bSciJASUksIxKsuMWPoG2hq+HplFIW8VpYMath/slw9K1+pmqFIhMNrDoUKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwRj4wgeFoaBX3hAV1sFFOaMjJwOzsIZ8OW2GNgtfB0=;
 b=MtcODaQ+VfvbLpdwx1sqRRHQGZKuXW/0tqHIUPVYQk6wggCvDUNLyObtjwJzHgsc9mlOkdpqon+ITJkOrtesy1hLVQr5dpKrIdt5mhLqwrIpEc/wtEV2QX5urri/bg0auCui1Ck6B3TBweFAHDt2EDEHg7e/RxluSRRT81zt20PmUSV1V+ck3zD2MQ1UOUzrtbdqEu2F2zdYw1GxUIp3PewMpwL2KLm7cTFRK8bx0Lcrfy455cLogsuxPqxute1ulSEBMJjQri4wFmZleWbIYyjTpPIIUTJITlyIs1p5qSit6TVJefiBYeHSSpkM6BVUlrKP9lGyj9yZ/woSnhI43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 18:01:17 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 18:01:17 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Disable retry faults in VMID0
Thread-Topic: [PATCH 1/1] drm/amdgpu: Disable retry faults in VMID0
Thread-Index: AQHVY3jVRndyicN57kSyNNfIH3Ofq6cd5t+A
Date: Thu, 5 Sep 2019 18:01:17 +0000
Message-ID: <MN2PR12MB33090DAF207C0D9EE5E46776ECBB0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190904233053.9767-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190904233053.9767-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN2PR12MB3309.namprd12.prod.outlook.com
 (15.20.2220.007)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bd33737-7662-47b4-775f-08d7322b0cd2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3408; 
x-ms-traffictypediagnostic: MN2PR12MB3408:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB340854EA9BD21192259E719EECBB0@MN2PR12MB3408.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(199004)(189003)(9686003)(7696005)(6436002)(99286004)(476003)(11346002)(7736002)(486006)(2906002)(305945005)(26005)(186003)(74316002)(14454004)(6246003)(53936002)(478600001)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(55016002)(33656002)(229853002)(71200400001)(316002)(6636002)(71190400001)(3846002)(256004)(4326008)(6862004)(446003)(6116002)(25786009)(52536014)(8936002)(76176011)(66066001)(8676002)(6506007)(81166006)(81156014)(86362001)(102836004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3408;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /6/I+tuHCwYxk1q686lvhAeNM77zShtY02EGKY9tv7DiLTgXPB9BnwX9mnwx74OVJzp6n6TWG9xqAOJCcNFF+Qx3W1tKx+Q0v1cpkPoiQ9hHs/UzZtQwVt3qxM3xohKkwLUCtvzlVOLlqkCIctTxRwQuTjjVbMgu8TIv5TGmfy32r+jauC0FIJl6EYoHT2lq68EoX9PwpeyUT+WPnAO3Rjlh/5D5eZtFQi4t4fy9tkgK7kXx8KNP+7LGwJRCKdUBuTjQag0yQh2N7zYxZxFZN3uRscrWCaKLNVVG07jp+pUD8vMoU+J+JnGbYEeJ9U9yzYDEUIxh0vnz5HcD7EtSzJYhtnL0g674acY3xOKzbLCBOURu+HU2uoIH1yCQtQZXEiRZCYa+t9AAxng5Ng8EA99ECQ2tqjA5FZuSwpnWRfo=
Content-ID: <106CE6794A69EE44AB6DCD0F0F07FC32@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd33737-7662-47b4-775f-08d7322b0cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 18:01:17.4387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3zFU1WVKuMSj6HhMLAcpXcXl0M75Ffu7LG4damjzI5M+vtAlIsE2d0fKSv+EhbFRRCNarRNH/cLGjeNt98zDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3408
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwRj4wgeFoaBX3hAV1sFFOaMjJwOzsIZ8OW2GNgtfB0=;
 b=M7JiW3dvB5xYfrprP9nkw+qjGRhg2h/ROATXMfTK/f8WMqtfObzPhhpsvzn9HheDF+yyRdW4Tvtuh3seCrXQJyBgOycDHchOb3+uubSY2CuZ0EkfesFDagD4qhmr0fwtd3Cl17fX079xr8VyanhJs8ilGjyWIBoPbsS17sgJO+E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDc6MzE6MTFBTSArMDgwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IFRoZXJlIGlzIG5vIHBvaW50IHJldHJ5aW5nIHBhZ2UgZmF1bHRzIGluIFZNSUQw
LiBUaG9zZSBmYXVsdHMgYXJlCj4gYWx3YXlzIGZhdGFsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZl
bGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgoKVGhhbmtzISBJIGhhdmUgdmVy
aWZpZWQgaXQgaW4gbXkgcGxhdGZvcm0uCgpSZXZpZXdlZC1hbmQtVGVzdGVkLWJ5OiBIdWFuZyBS
dWkgPHJheS5odWFuZ0BhbWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4aHViX3YxXzAuYyB8IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
aHViX3YyXzAuYyB8IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFf
MC5jICB8IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jICB8
IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jICB8IDIgKysK
PiAgNSBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jCj4gaW5kZXggNmNlMzdjZTc3ZDE0Li45ZWM0Mjk3ZTYx
ZTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMKPiBAQCAt
MTc4LDYgKzE3OCw4IEBAIHN0YXRpYyB2b2lkIGdmeGh1Yl92MV8wX2VuYWJsZV9zeXN0ZW1fZG9t
YWluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAJdG1wID0gUlJFRzMyX1NPQzE1KEdD
LCAwLCBtbVZNX0NPTlRFWFQwX0NOVEwpOwo+ICAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZN
X0NPTlRFWFQwX0NOVEwsIEVOQUJMRV9DT05URVhULCAxKTsKPiAgCXRtcCA9IFJFR19TRVRfRklF
TEQodG1wLCBWTV9DT05URVhUMF9DTlRMLCBQQUdFX1RBQkxFX0RFUFRILCAwKTsKPiArCXRtcCA9
IFJFR19TRVRfRklFTEQodG1wLCBWTV9DT05URVhUMF9DTlRMLAo+ICsJCQkgICAgUkVUUllfUEVS
TUlTU0lPTl9PUl9JTlZBTElEX1BBR0VfRkFVTFQsIDApOwo+ICAJV1JFRzMyX1NPQzE1KEdDLCAw
LCBtbVZNX0NPTlRFWFQwX0NOVEwsIHRtcCk7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhodWJfdjJfMC5jCj4gaW5kZXggOGI3ODlmNzUwYjcyLi5hOTIzODczNWQzNjEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMKPiBAQCAtMTY2
LDYgKzE2Niw4IEBAIHN0YXRpYyB2b2lkIGdmeGh1Yl92Ml8wX2VuYWJsZV9zeXN0ZW1fZG9tYWlu
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAJdG1wID0gUlJFRzMyX1NPQzE1KEdDLCAw
LCBtbUdDVk1fQ09OVEVYVDBfQ05UTCk7Cj4gIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgR0NW
TV9DT05URVhUMF9DTlRMLCBFTkFCTEVfQ09OVEVYVCwgMSk7Cj4gIAl0bXAgPSBSRUdfU0VUX0ZJ
RUxEKHRtcCwgR0NWTV9DT05URVhUMF9DTlRMLCBQQUdFX1RBQkxFX0RFUFRILCAwKTsKPiArCXRt
cCA9IFJFR19TRVRfRklFTEQodG1wLCBHQ1ZNX0NPTlRFWFQwX0NOVEwsCj4gKwkJCSAgICBSRVRS
WV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwgMCk7Cj4gIAlXUkVHMzJfU09DMTUo
R0MsIDAsIG1tR0NWTV9DT05URVhUMF9DTlRMLCB0bXApOwo+ICB9Cj4gIAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKPiBpbmRleCBiOWQ2YzBiZmE1OTQuLjRjN2U4YzY0
YTk0ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8w
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKPiBAQCAt
MjA3LDYgKzIwNyw4IEBAIHN0YXRpYyB2b2lkIG1taHViX3YxXzBfZW5hYmxlX3N5c3RlbV9kb21h
aW4oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIAl0bXAgPSBSUkVHMzJfU09DMTUoTU1I
VUIsIDAsIG1tVk1fQ09OVEVYVDBfQ05UTCk7Cj4gIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwg
Vk1fQ09OVEVYVDBfQ05UTCwgRU5BQkxFX0NPTlRFWFQsIDEpOwo+ICAJdG1wID0gUkVHX1NFVF9G
SUVMRCh0bXAsIFZNX0NPTlRFWFQwX0NOVEwsIFBBR0VfVEFCTEVfREVQVEgsIDApOwo+ICsJdG1w
ID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNX0NPTlRFWFQwX0NOVEwsCj4gKwkJCSAgICBSRVRSWV9Q
RVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwgMCk7Cj4gIAlXUkVHMzJfU09DMTUoTU1I
VUIsIDAsIG1tVk1fQ09OVEVYVDBfQ05UTCwgdG1wKTsKPiAgfQo+ICAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbW1odWJfdjJfMC5jCj4gaW5kZXggMzU0MmMyMDNjM2M4Li44NmVkOGNiOTE1
YTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jCj4gQEAgLTE1
Miw2ICsxNTIsOCBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92Ml8wX2VuYWJsZV9zeXN0ZW1fZG9tYWlu
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAJdG1wID0gUlJFRzMyX1NPQzE1KE1NSFVC
LCAwLCBtbU1NVk1fQ09OVEVYVDBfQ05UTCk7Cj4gIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwg
TU1WTV9DT05URVhUMF9DTlRMLCBFTkFCTEVfQ09OVEVYVCwgMSk7Cj4gIAl0bXAgPSBSRUdfU0VU
X0ZJRUxEKHRtcCwgTU1WTV9DT05URVhUMF9DTlRMLCBQQUdFX1RBQkxFX0RFUFRILCAwKTsKPiAr
CXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBNTVZNX0NPTlRFWFQwX0NOVEwsCj4gKwkJCSAgICBS
RVRSWV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwgMCk7Cj4gIAlXUkVHMzJfU09D
MTUoTU1IVUIsIDAsIG1tTU1WTV9DT05URVhUMF9DTlRMLCB0bXApOwo+ICB9Cj4gIAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMKPiBpbmRleCAwY2Y3ZWY0NGI0YjUuLjY1
Nzk3MGY5ZWJmYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1
Yl92OV80LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMK
PiBAQCAtMjQwLDYgKzI0MCw4IEBAIHN0YXRpYyB2b2lkIG1taHViX3Y5XzRfZW5hYmxlX3N5c3Rl
bV9kb21haW4oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gIAkJCQkgIGh1YmlkICogTU1I
VUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VUKTsKPiAgCXRtcCA9IFJFR19TRVRfRklFTEQodG1w
LCBWTUwyVkMwX1ZNX0NPTlRFWFQwX0NOVEwsIEVOQUJMRV9DT05URVhULCAxKTsKPiAgCXRtcCA9
IFJFR19TRVRfRklFTEQodG1wLCBWTUwyVkMwX1ZNX0NPTlRFWFQwX0NOVEwsIFBBR0VfVEFCTEVf
REVQVEgsIDApOwo+ICsJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNTDJWQzBfVk1fQ09OVEVY
VDBfQ05UTCwKPiArCQkJICAgIFJFVFJZX1BFUk1JU1NJT05fT1JfSU5WQUxJRF9QQUdFX0ZBVUxU
LCAwKTsKPiAgCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsIG1tVk1MMlZDMF9WTV9DT05U
RVhUMF9DTlRMLAo+ICAJCQkgICAgaHViaWQgKiBNTUhVQl9JTlNUQU5DRV9SRUdJU1RFUl9PRkZT
RVQsIHRtcCk7Cj4gIH0KPiAtLSAKPiAyLjE3LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
