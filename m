Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E1A1010
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EDA89F31;
	Thu, 29 Aug 2019 03:52:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720080.outbound.protection.outlook.com [40.107.72.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B429189F31
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dh1TtGf0CEvaTlyu6tXGje9W7qQsBtWf7vlrqplFvCy8MeOrCZacbau10ZwgZTj9frE0Fv/nakFEWmkw0/0gvbFlqAp5pOUkoYStCGLrjk1956ji5jmrtzcV9mz4XcbEUiFBs2ePX+GzuSZx99nNvz9y8Ah59iiZMEts1fkAE62/0vfzMZCTNifPP7FaoKz+4zyLmwuyGqHhTbkUWBjjN1Ac+38XKe3Y7orMH4OG8P7nGnK7aZW4+v/bQ1rFpROMOrxzgO0aAipzcqd1tjaAMe0ChT8k8K7QwSfdFOEjCKpR4xoiL0zI8hnXw6gdWp+v+FpSk/YVbqPfPyMEAHqkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9+5oPoPMg0XF0Rv86C06L3olDisVUcBFKic4FXRWJg=;
 b=d+k4aKGS9sdjwJOfJMXWUOxi+APv8Q0lcHr9/Z/x0NiQ0VNyZ2VXEcjKXPE+EZnoKkyzqtYCp3YwYIjaUUx64ybplsvXLIxAb0AISKKPD+Zg0z78UdnLmCukkwEr50l5j0wq81ifR4EJZoS5561QRecq9cAYrQpc5xqRjC4O2DRHP35INsdFnMt0sykGi0VSYOxchueRYlTfc7ajHdTuCVKcACsBqEJiq6YCEoZl5LekYqTCj7Iym30yfo84/Ta8UjOAGmdIUam9/3l8oGoaaXhi9eTKvXoqQcQmNZjbrFdyrk7KuPwzK9ppZJoEwzFLD9/gc+ZX4qh2UvnoeeckYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3231.namprd12.prod.outlook.com (20.179.83.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 03:52:17 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 03:52:17 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init
Thread-Topic: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init
Thread-Index: AQHVXaD73ZpTMHTbk0STcwXK0KWMBacRbnyAgAAQL0A=
Date: Thu, 29 Aug 2019 03:52:17 +0000
Message-ID: <MN2PR12MB305479DB08A348F173060E23B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <MN2PR12MB305488AF7BE5CD29B8E6E152B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB305488AF7BE5CD29B8E6E152B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba9ae7a5-428f-4a2f-f02e-08d72c34497b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3231; 
x-ms-traffictypediagnostic: MN2PR12MB3231:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB323124164D70E04B006035E2B0A20@MN2PR12MB3231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(13464003)(189003)(199004)(5660300002)(305945005)(3846002)(6116002)(53546011)(6506007)(476003)(53936002)(74316002)(33656002)(71190400001)(6636002)(6246003)(71200400001)(25786009)(14454004)(52536014)(11346002)(9686003)(446003)(6306002)(55016002)(6436002)(86362001)(4326008)(478600001)(7736002)(76176011)(76116006)(14444005)(256004)(26005)(102836004)(81166006)(486006)(2940100002)(8676002)(81156014)(66556008)(110136005)(64756008)(7696005)(66446008)(66476007)(316002)(66946007)(8936002)(99286004)(966005)(229853002)(66066001)(2501003)(186003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3231;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BP8K1maIof3IGQO3mlWaZZZYUZzEueCrVE6jbxf67LFwadoaoWEXJxDk1FhXjCZfkE/1TWfX7L8sUdio2lL6xbN5HvvtJu08NeLmsx9r0KanRnAniChzEAScx2K+6OMxZo2EfIU8uDyWYw8bpe0o1Sw2nmpKRhMez9xpMVuU23ZQK2+EHieKeaG4CKbHp7eYegxN9n+8A1pNaKy02VQz2g4G75IpFAbCoIq8ZCjGFudG/IF85TsZzK2bFQhTcM9diuCm5OEVMnzyEUOj+y+lE1jwV3f5kIC3wIojZDgxgaDUbAQ5zYxwp7/DhAjdPA8kAK6B0rLNyNP/Knzar6CchhP32Y5kpq760K8++pmRVG17In8ftcQ0k7NTr8nccSQbjUMi1lSm05rfkcMCvF3H5oEMlUC6xf3Sv97oTLs7kPc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9ae7a5-428f-4a2f-f02e-08d72c34497b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 03:52:17.7975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o0QY/4lX3ZNcZYoG7tDYjUkywR2BXVgJ3EaTtEcGkWrRG03xuRTqBZInin8AIVHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9+5oPoPMg0XF0Rv86C06L3olDisVUcBFKic4FXRWJg=;
 b=RONSS8SB1+9uqIqsAPYIc9hw+gXvMFc1p+f+vR0whDc6o6ePS64F9IM23KZCHr8rqZURIZt75/VTHACqxLCR2CEoJuqbpcMleauTTVkCqxeWXsXJt4SrBa+TL8IiptUJU+YjXpY4EdP83o/Q09PLHsjAAXnBR9GVs5FlRpS0rm8=
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

QW5vdGhlciB3YXkgaXMgdG8gYWRkIGNoZWNrIGZvciBpaF9pbmZvIGluIGFtZGdwdV9yYXNfaW50
ZXJydXB0X2FkZF9oYW5kbGVyIGFuZCBhbWRncHVfcmFzX2ludGVycnVwdF9yZW1vdmVfaGFuZGxl
ciBkaXJlY3RseS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YN
Cj4gWmhvdTEsIFRhbw0KPiBTZW50OiAyMDE55bm0OOaciDI55pelIDEwOjU5DQo+IFRvOiBaaGFu
ZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFt
ZC5jb20+DQo+IENjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBT
dWJqZWN0OiBSRTogW1BBVENIIDEvN10gZHJtL2FtZGdwdTogYWRkIGhlbHBlciBmdW5jdGlvbiB0
byBkbyBjb21tb24NCj4gcmFzX2xhdGVfaW5pdA0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPg0KPiA+IFNlbnQ6IDIwMTnlubQ45pyIMjjml6UgMjE6MDMNCj4gPiBUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsN
Cj4gPiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQo+ID4g
Q2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+ID4gU3ViamVjdDog
W1BBVENIIDEvN10gZHJtL2FtZGdwdTogYWRkIGhlbHBlciBmdW5jdGlvbiB0byBkbyBjb21tb24N
Cj4gPiByYXNfbGF0ZV9pbml0DQo+ID4NCj4gPiBJbiBsYXRlX2luaXQgZm9yIHJhcywgdGhlIGhl
bHBlciBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgdG8gMSkuIGRpc2FibGUNCj4gPiByYXMgZmVhdHVy
ZSBpZiB0aGUgSVAgYmxvY2sgaXMgbWFza2VkIGFzIGRpc2FibGVkIDIpLiBzZW5kIGVuYWJsZQ0K
PiA+IGZlYXR1cmUgY29tbWFuZCBpZiB0aGUgaXAgYmxvY2sgd2FzIG1hc2tlZCBhcyBlbmFibGVk
IDMpLiBjcmVhdGUNCj4gZGVidWdmcy9zeXNmcyBub2RlIHBlciBJUCBibG9jayA0KS4NCj4gPiBy
ZWdpc3RlciBpbnRlcnJ1cHQgaGFuZGxlcg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA1Nw0KPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaCB8ICA0ICsrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiA+IGlu
ZGV4IDIzMGY3ZTYuLjJjMzJmOTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jDQo+ID4gQEAgLTE1NjQsNiArMTU2NCw2MyBAQCBpbnQgYW1kZ3B1X3Jh
c19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2KQ0KPiA+ICAJcmV0dXJuIC1FSU5W
QUw7DQo+ID4gIH0NCj4gPg0KPiA+ICsvKiBoZWxwZXIgZnVuY3Rpb24gdG8gaGFuZGxlIGNvbW1v
biBzdHVmZiBpbiBpcCBsYXRlIGluaXQgcGhhc2UgKi8NCj4gPiAraW50IGFtZGdwdV9yYXNfbGF0
ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiA+ICsJCQkgc3RydWN0IHJhc19j
b21tb25faWYgKnJhc19ibG9jaywNCj4gPiArCQkJIHN0cnVjdCByYXNfZnNfaWYgKmZzX2luZm8s
DQo+ID4gKwkJCSBzdHJ1Y3QgcmFzX2loX2lmICppaF9pbmZvKQ0KPiA+ICt7DQo+ID4gKwlpbnQg
cjsNCj4gPiArDQo+ID4gKwkvKiBkaXNhYmxlIFJBUyBmZWF0dXJlIHBlciBJUCBibG9jayBpZiBp
dCBpcyBub3Qgc3VwcG9ydGVkICovDQo+ID4gKwlpZiAoIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVk
KGFkZXYsIHJhc19ibG9jay0+YmxvY2spKSB7DQo+ID4gKwkJYW1kZ3B1X3Jhc19mZWF0dXJlX2Vu
YWJsZV9vbl9ib290KGFkZXYsIHJhc19ibG9jaywgMCk7DQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4g
Kwl9DQo+ID4gKw0KPiA+ICsJciA9IGFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChh
ZGV2LCByYXNfYmxvY2ssIDEpOw0KPiA+ICsJaWYgKHIpIHsNCj4gPiArCQlpZiAociA9PSAtRUFH
QUlOKSB7DQo+ID4gKwkJCS8qIHJlcXVlc3QgZ3B1IHJlc2V0LiB3aWxsIHJ1biBhZ2FpbiAqLw0K
PiA+ICsJCQlhbWRncHVfcmFzX3JlcXVlc3RfcmVzZXRfb25fYm9vdChhZGV2LA0KPiA+ICsJCQkJ
CXJhc19ibG9jay0+YmxvY2spOw0KPiA+ICsJCQlyZXR1cm4gMDsNCj4gPiArCQl9DQo+ID4gKwkJ
LyogaW4gcmVzdW1lIHBoYXNlLCBpZiBmYWlsIHRvIGVuYWJsZSByYXMsDQo+ID4gKwkJICogY2xl
YW4gdXAgYWxsIHJhcyBmcyBub2RlcywgYW5kIGRpc2FibGUgcmFzICovDQo+ID4gKwkJaWYgKGFk
ZXYtPmluX3N1c3BlbmQpDQo+ID4gKwkJCWdvdG8gY2xlYW51cDsNCj4gPiArCX0NCj4gPiArDQo+
ID4gKwkvKiBpbiByZXN1bWUgcGhhc2UsIG5vIG5lZWQgdG8gY3JlYXRlIHJhcyBmcyBub2RlICov
DQo+ID4gKwlpZiAoYWRldi0+aW5fc3VzcGVuZCkNCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArDQo+
ID4gKwlpZiAocmFzX2Jsb2NrLT5ibG9jayA9PSBBTURHUFVfUkFTX0JMT0NLX19VTUMgfHwNCj4g
PiArCSAgICByYXNfYmxvY2stPmJsb2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX1NETUEgfHwNCj4g
PiArCSAgICByYXNfYmxvY2stPmJsb2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX0dGWCkgew0KPiBb
VGFvXSB3ZSBjYW4gc2V0IGloX2luZm8gdG8gTlVMTCBpZiBhIHJhcyBibG9jayBoYXMgbm8gaW50
ZXJydXB0IGFuZCBjaGFuZ2UNCj4gdGhlIGNvbmRpdGlvbiB0byAiaWYgKGloX2luZm8pIg0KPiAN
Cj4gPiArCQlyID0gYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfYWRkX2hhbmRsZXIoYWRldiwgaWhfaW5m
byk7DQo+ID4gKwkJaWYgKHIpDQo+ID4gKwkJCWdvdG8gaW50ZXJydXB0Ow0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCWFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGUoYWRldiwgZnNfaW5mbyk7DQo+ID4g
Kw0KPiA+ICsJciA9IGFtZGdwdV9yYXNfc3lzZnNfY3JlYXRlKGFkZXYsIGZzX2luZm8pOw0KPiA+
ICsJaWYgKHIpDQo+ID4gKwkJZ290byBzeXNmczsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4g
PiArY2xlYW51cDoNCj4gPiArCWFtZGdwdV9yYXNfc3lzZnNfcmVtb3ZlKGFkZXYsIHJhc19ibG9j
ayk7DQo+ID4gK3N5c2ZzOg0KPiA+ICsJYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlbW92ZShhZGV2LCBy
YXNfYmxvY2spOw0KPiA+ICsJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRl
diwgaWhfaW5mbyk7DQo+IFtUYW9dIGxhY2sgb2YgaWYgY29uZGl0aW9uDQo+IA0KPiA+ICtpbnRl
cnJ1cHQ6DQo+ID4gKwlhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlKGFkZXYsIHJhc19ibG9jaywg
MCk7DQo+ID4gKwlyZXR1cm4gcjsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgLyogZG8gc29tZSBpbml0
IHdvcmsgYWZ0ZXIgSVAgbGF0ZSBpbml0IGFzIGRlcGVuZGVuY2UuDQo+ID4gICAqIGFuZCBpdCBy
dW5zIGluIHJlc3VtZS9ncHUgcmVzZXQvYm9vdGluZyB1cCBjYXNlcy4NCj4gPiAgICovDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+ID4gaW5kZXggNmM3
NmJiMi4uNTIxMjk2MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgNCj4gPiBAQCAtNTY2LDYgKzU2NiwxMCBAQCBhbWRncHVfcmFzX2Vycm9yX3RvX3Rh
KGVudW0NCj4gYW1kZ3B1X3Jhc19lcnJvcl90eXBlDQo+ID4gZXJyb3IpIHsgIGludCBhbWRncHVf
cmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOyAgaW50DQo+ID4gYW1kZ3B1X3Jh
c19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsgIGludA0KPiA+IGFtZGdwdV9yYXNf
cHJlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiA+ICtpbnQgYW1kZ3B1X3Jh
c19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gKwkJCSBzdHJ1Y3Qg
cmFzX2NvbW1vbl9pZiAqcmFzX2Jsb2NrLA0KPiA+ICsJCQkgc3RydWN0IHJhc19mc19pZiAqZnNf
aW5mbywNCj4gPiArCQkJIHN0cnVjdCByYXNfaWhfaWYgKmloX2luZm8pOw0KPiA+DQo+ID4gIGlu
dCBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
PiA+ICAJCXN0cnVjdCByYXNfY29tbW9uX2lmICpoZWFkLCBib29sIGVuYWJsZSk7DQo+ID4gLS0N
Cj4gPiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
