Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D247A2CD6
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 04:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038FF6E0EF;
	Fri, 30 Aug 2019 02:26:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720073.outbound.protection.outlook.com [40.107.72.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FFA6E0EF
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 02:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRh1QZEsE/EKW+z657U2ttUaaP2cgxR+19gBa23+ykdqfSSIUlEtBT3bbch+EB7mkULWut6ygBfN0LPJR1TKInfzF0S+n615VOQKvGOQ6woueNkfY4a5pmTob5jQ/kOIYjRJPgWpshmUviY0cVfxc/xozRmWL5/LUQZplkfSeL0uLKVmJuzYUlee3VBNP5s8+0BsaPxr5ZQx2fG4npouBXc2wDA+zHm2hzg+u4BMK2FvHULB59riWM9JbhSP4W7DQUOdgdyvIVBQaHNONUtKL6zAFARCW572hm3PapyZQZQoj74fZxHwUadweygJMv0DnEjceO7k0Y0fK9KU4OIqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKOq6ohLgezzPraMF++C0LFQuVhF9ZkhSUJBWbJ+iHQ=;
 b=idytnKvRNMcVyGLV0t1TGK28L8Ylp8fa5+Z9wgMVAa6z4Wr5s9zKX32QU/GfKgq7+lihL+HAYr6OG3CBOrGSkZYIDWwLp9Eoa5qK8NEuqaZ+/Pcfqxwr3Z84i13+7vs6hnZdf2MKOFn3QaIptpJboFRdrfRwMvwfphx+DMcGuX8+OgyJrrmdO20s/6/z8tT7tQpklLHWKyHDV3TZ1XCS4NsnVOtLif9qNDLs/7NoX+2+fl2GGQN93yDRCEe4uMCiLc5UcQy8roYFffIXtBQrc+A2OqE/z361qPkIVEFz9aNIrBMAaoGT+oD6ZjZXiMu4bTkdSUv68nBh/xtEtioEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3567.namprd12.prod.outlook.com (20.178.242.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 02:26:05 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 02:26:05 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init/fini (v3)
Thread-Topic: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init/fini (v3)
Thread-Index: AQHVXm327Pe/BAUam0+oOLwy/FQxv6cS90jw
Date: Fri, 30 Aug 2019 02:26:05 +0000
Message-ID: <MN2PR12MB3054D78502910A57F2FE6B39B0BD0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69418c06-2c0b-41f5-20b0-08d72cf16918
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3567; 
x-ms-traffictypediagnostic: MN2PR12MB3567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35679D2A233668632E428FE9B0BD0@MN2PR12MB3567.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(13464003)(189003)(199004)(71200400001)(2501003)(102836004)(26005)(316002)(186003)(14444005)(256004)(2906002)(229853002)(8676002)(81166006)(81156014)(478600001)(25786009)(7736002)(6636002)(3846002)(8936002)(110136005)(52536014)(6436002)(74316002)(305945005)(55016002)(5660300002)(4326008)(486006)(66066001)(476003)(11346002)(53936002)(6246003)(446003)(66446008)(71190400001)(86362001)(6506007)(53546011)(66946007)(76116006)(76176011)(99286004)(9686003)(66476007)(64756008)(66556008)(14454004)(33656002)(6116002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3567;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gIA/2bICKJV44my8D/lUepIpCCxNssU02aCWwKgWxIgLSKV4A214oRl7i9mlID6JyxO/p89ieMtGM95Ksgfy8SaPsNDjkNcQ1Kse6fdDo2JobrQ3UVDIkx0p1jXAAa0FfPUVtbZlSoZWBhUeRQ2E9v1Vam1Thz5tMM4A7JyPj1xHrSRHMZhRwUGPa7yerbFKROEboxbHmwwkvpgE/Mxz7cN/qbry8ZvThzSwBYtWmriNVisFT7P85/2eXZzbOftr+VXzX/Iz4zeQTaj4atFfdvIGju5ZyBS5wSaOt8nw9KDJibax/yfkj6E68gcYvc75hOssyZhVjL6k7oxzUGse6C2VOhjRDSA1URTSzyaosqoN/rl3qxkIqflK9TkONT+2h0xHsYj4krxcVp2zAtyKM3YjbdZvzFCL4KWcMuVTDSk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69418c06-2c0b-41f5-20b0-08d72cf16918
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 02:26:05.5835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3Grh5kI6pcMIeDEApZUoQxgmcdXQF6T0ZBNUfLSA8JuM9/eXsUU7fxbryb3oXtF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3567
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKOq6ohLgezzPraMF++C0LFQuVhF9ZkhSUJBWbJ+iHQ=;
 b=4d40IXQBTpvI+X5dkQjgfOWOq4K7k6mQHix0GpBS7Vys1LwEvDT7SbFUdoQ5jLUwjcIacDJQhpRRAV8UXxpwYq9UNM5cbQoxyWsPvP15DKYXTICXx90x/4Qjqt4T7Dvx9XZihNnZnYm/GBAAypfIfpf0dPeyuZ0LvRQ9YP+R7C4=
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
SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDI55pelIDIxOjMwDQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyDQo+
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5j
b20+OyBDaGVuLA0KPiBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQo+IENjOiBaaGFuZywg
SGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMS83XSBk
cm0vYW1kZ3B1OiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIGRvIGNvbW1vbg0KPiByYXNfbGF0ZV9p
bml0L2ZpbmkgKHYzKQ0KPiANCj4gSW4gbGF0ZV9pbml0IGZvciByYXMsIHRoZSBoZWxwZXIgZnVu
Y3Rpb24gd2lsbCBiZSB1c2VkIHRvIDEpLiBkaXNhYmxlIHJhcyBmZWF0dXJlDQo+IGlmIHRoZSBJ
UCBibG9jayBpcyBtYXNrZWQgYXMgZGlzYWJsZWQgMikuIHNlbmQgZW5hYmxlIGZlYXR1cmUgY29t
bWFuZCBpZiB0aGUNCj4gaXAgYmxvY2sgd2FzIG1hc2tlZCBhcyBlbmFibGVkIDMpLiBjcmVhdGUg
ZGVidWdmcy9zeXNmcyBub2RlIHBlciBJUCBibG9jayA0KS4NCj4gcmVnaXN0ZXIgaW50ZXJydXB0
IGhhbmRsZXINCj4gDQo+IHYyOiBjaGVjayBpaF9pbmZvLmNiIHRvIGRlY2lkZSBhZGQgaW50ZXJy
dXB0IGhhbmRsZXIgb3Igbm90DQo+IA0KPiB2MzogYWRkIHJhc19sYXRlX2ZpbmkgZm9yIGNsZWFu
dXAgYWxsIHRoZSByYXMgZnMgbm9kZSBhbmQgcmVtb3ZlIGludGVycnVwdA0KPiBoYW5kbGVyDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNzIN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8ICA3ICsrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzkg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYw0KPiBpbmRleCAyMzBmN2U2Li4yYjkzMGZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IEBAIC0xNTY0LDYgKzE1NjQsNzggQEAgaW50IGFtZGdw
dV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gIAlyZXR1cm4gLUVJTlZB
TDsNCj4gIH0NCj4gDQo+ICsvKiBoZWxwZXIgZnVuY3Rpb24gdG8gaGFuZGxlIGNvbW1vbiBzdHVm
ZiBpbiBpcCBsYXRlIGluaXQgcGhhc2UgKi8gaW50DQo+ICthbWRncHVfcmFzX2xhdGVfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKwkJCSBzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAq
cmFzX2Jsb2NrLA0KPiArCQkJIHN0cnVjdCByYXNfZnNfaWYgKmZzX2luZm8sDQo+ICsJCQkgc3Ry
dWN0IHJhc19paF9pZiAqaWhfaW5mbykNCj4gK3sNCj4gKwlpbnQgcjsNCj4gKw0KPiArCS8qIGRp
c2FibGUgUkFTIGZlYXR1cmUgcGVyIElQIGJsb2NrIGlmIGl0IGlzIG5vdCBzdXBwb3J0ZWQgKi8N
Cj4gKwlpZiAoIWFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIHJhc19ibG9jay0+YmxvY2sp
KSB7DQo+ICsJCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChhZGV2LCByYXNfYmxv
Y2ssIDApOw0KPiArCQlyZXR1cm4gMDsNCj4gKwl9DQo+ICsNCj4gKwlyID0gYW1kZ3B1X3Jhc19m
ZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsIHJhc19ibG9jaywgMSk7DQo+ICsJaWYgKHIpIHsN
Cj4gKwkJaWYgKHIgPT0gLUVBR0FJTikgew0KPiArCQkJLyogcmVxdWVzdCBncHUgcmVzZXQuIHdp
bGwgcnVuIGFnYWluICovDQo+ICsJCQlhbWRncHVfcmFzX3JlcXVlc3RfcmVzZXRfb25fYm9vdChh
ZGV2LA0KPiArCQkJCQlyYXNfYmxvY2stPmJsb2NrKTsNCj4gKwkJCXJldHVybiAwOw0KPiArCQl9
IGVsc2UgaWYgKGFkZXYtPmluX3N1c3BlbmQgfHwgYWRldi0+aW5fZ3B1X3Jlc2V0KSB7DQo+ICsJ
CQkvKiBpbiByZXN1bWUgcGhhc2UsIGlmIGZhaWwgdG8gZW5hYmxlIHJhcywNCj4gKwkJCSAqIGNs
ZWFuIHVwIGFsbCByYXMgZnMgbm9kZXMsIGFuZCBkaXNhYmxlIHJhcyAqLw0KPiArCQkJZ290byBj
bGVhbnVwOw0KPiArCQl9IGVsc2UNCj4gKwkJCXJldHVybiByOw0KPiArCX0NCj4gKw0KPiArCS8q
IGluIHJlc3VtZSBwaGFzZSwgbm8gbmVlZCB0byBjcmVhdGUgcmFzIGZzIG5vZGUgKi8NCj4gKwlp
ZiAoYWRldi0+aW5fc3VzcGVuZCB8fCBhZGV2LT5pbl9ncHVfcmVzZXQpDQo+ICsJCXJldHVybiAw
Ow0KPiArDQo+ICsJaWYoaWhfaW5mby0+Y2IpIHsNCltUYW9dIG5lZWQgYSBzcGFjZSBiZXR3ZWVu
ICJpZiIgYW5kICIoIg0KDQo+ICsJCXIgPSBhbWRncHVfcmFzX2ludGVycnVwdF9hZGRfaGFuZGxl
cihhZGV2LCBpaF9pbmZvKTsNCj4gKwkJaWYgKHIpDQo+ICsJCQlnb3RvIGludGVycnVwdDsNCj4g
Kwl9DQo+ICsNCj4gKwlhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKGFkZXYsIGZzX2luZm8pOw0K
PiArDQo+ICsJciA9IGFtZGdwdV9yYXNfc3lzZnNfY3JlYXRlKGFkZXYsIGZzX2luZm8pOw0KPiAr
CWlmIChyKQ0KPiArCQlnb3RvIHN5c2ZzOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICtjbGVhbnVw
Og0KPiArCWFtZGdwdV9yYXNfc3lzZnNfcmVtb3ZlKGFkZXYsIHJhc19ibG9jayk7DQo+ICtzeXNm
czoNCj4gKwlhbWRncHVfcmFzX2RlYnVnZnNfcmVtb3ZlKGFkZXYsIHJhc19ibG9jayk7DQo+ICsJ
aWYgKGloX2luZm8tPmNiKQ0KPiArCQlhbWRncHVfcmFzX2ludGVycnVwdF9yZW1vdmVfaGFuZGxl
cihhZGV2LCBpaF9pbmZvKTsNCj4gK2ludGVycnVwdDoNCj4gKwlhbWRncHVfcmFzX2ZlYXR1cmVf
ZW5hYmxlKGFkZXYsIHJhc19ibG9jaywgMCk7DQo+ICsJcmV0dXJuIHI7DQo+ICt9DQo+ICsNCj4g
Ky8qIGhlbHBlciBmdW5jdGlvbiB0byByZW1vdmUgcmFzIGZzIG5vZGUgYW5kIGludGVycnVwdCBo
YW5kbGVyICovIHZvaWQNCj4gK2FtZGdwdV9yYXNfbGF0ZV9maW5pKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KPiArCQkJICBzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2Jsb2NrLA0KPiAr
CQkJICBzdHJ1Y3QgcmFzX2loX2lmICppaF9pbmZvKQ0KPiArew0KPiArCWlmICghcmFzX2Jsb2Nr
IHx8ICFpaF9pbmZvKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlhbWRncHVfcmFzX3N5c2ZzX3Jl
bW92ZShhZGV2LCByYXNfYmxvY2spOw0KPiArCWFtZGdwdV9yYXNfZGVidWdmc19yZW1vdmUoYWRl
diwgcmFzX2Jsb2NrKTsNCj4gKwlpZiAoaWhfaW5mby0+Y2IpDQo+ICsgICAgICAgICAgICAgICAg
YW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRldiwgaWhfaW5mbyk7DQo+ICsJ
YW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShhZGV2LCByYXNfYmxvY2ssIDApOyB9DQo+ICsNCj4g
IC8qIGRvIHNvbWUgaW5pdCB3b3JrIGFmdGVyIElQIGxhdGUgaW5pdCBhcyBkZXBlbmRlbmNlLg0K
PiAgICogYW5kIGl0IHJ1bnMgaW4gcmVzdW1lL2dwdSByZXNldC9ib290aW5nIHVwIGNhc2VzLg0K
PiAgICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gaW5k
ZXggNmM3NmJiMi4uNjZiNzE1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuaA0KPiBAQCAtNTY2LDYgKzU2NiwxMyBAQCBhbWRncHVfcmFzX2Vycm9yX3RvX3Rh
KGVudW0NCj4gYW1kZ3B1X3Jhc19lcnJvcl90eXBlIGVycm9yKSB7ICBpbnQgYW1kZ3B1X3Jhc19p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2KTsgIGludCBhbWRncHVfcmFzX2Zpbmko
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOyAgaW50DQo+IGFtZGdwdV9yYXNfcHJlX2Zpbmko
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAraW50IGFtZGdwdV9yYXNfbGF0ZV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiArCQkJIHN0cnVjdCByYXNfY29tbW9uX2lm
ICpyYXNfYmxvY2ssDQo+ICsJCQkgc3RydWN0IHJhc19mc19pZiAqZnNfaW5mbywNCj4gKwkJCSBz
dHJ1Y3QgcmFzX2loX2lmICppaF9pbmZvKTsNCj4gK3ZvaWQgYW1kZ3B1X3Jhc19sYXRlX2Zpbmko
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsJCQkgIHN0cnVjdCByYXNfY29tbW9uX2lm
ICpyYXNfYmxvY2ssDQo+ICsJCQkgIHN0cnVjdCByYXNfaWhfaWYgKmloX2luZm8pOw0KPiANCj4g
IGludCBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LA0KPiAgCQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqaGVhZCwgYm9vbCBlbmFibGUpOw0KPiAtLQ0K
PiAyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
