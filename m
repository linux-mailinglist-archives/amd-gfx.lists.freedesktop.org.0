Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0002ADDE0
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 19:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223EE89C1F;
	Mon,  9 Sep 2019 17:15:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F3289C18
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 17:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq8fjakzQKFZHwuyJO5lVgNI1XxbIGrGcGFKoJPSNizCoVLRxJp3VNsOTF1k48YGoMQOilumqGLGKE8ylzQQhU7ne9BMK92+DdwZkYJADNdvQx0IuwDXXIxLcm9T4mFJHl1ar6NqHllL3epEu+l4Ho9FUPvZeJRDp2Zvq/zE/r/2kowVuPYFZfKSHpRz2LHIRqehQKfwrKVoBXHYktmFXBuXC12uqtxOaGpho3YlrVpcedi6VQXRH+49bi238SR6v6qVu5bYfAKdHFc7kmzrc3YKwdWW5R9Bh7JsoMS7M/3Y/bDRB2H/nenAa1QFRIKLIn0a/KOrFzhcLEqY954CWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr1KJxRix7UhZb/ST5wsV+nzhrgQuaNUbehLVNj2T4A=;
 b=GnpXIp208XWwStDWLN7BJ8/jXCkthm3CXnvEMWOabSJC8/8x8SyfBV9s32r3WnHPbLVcF4p/DKxK4uo8crYwnBFXbbknkTNggBkW2cpb0yc2wm4ZypFJhMtYJpCovp8p7eYMlMlk7+H6U+RohI5kxGSgUD/v7bk1dLLam+gprLUN8t7sH26vMZOvNkr+etMNcNsZKCvFhz4xEziLPFKSZCao6fWt6ey6oCGo1ZlZiHOwtc6W/6V5sOM4ZC/ztiie3z88YtDZnxJ94jPirfRSpjfarwcWcG2eHSRjA3simkswCxltGUo34D7gWJCd3fzT2GPO11U0+Pw1paZPdLNTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1578.namprd12.prod.outlook.com (10.172.39.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 17:15:42 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 17:15:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Topic: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Index: AQHVYzHR2h3CIi5T9ECYFDcNflD/YKcb88AAgAdTBICAACAHgIAANzOA
Date: Mon, 9 Sep 2019 17:15:41 +0000
Message-ID: <f23249c5-4741-56d6-b9ce-5b771bf8a22f@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <20190904150230.13885-10-christian.koenig@amd.com>
 <844c2c90-8be4-df05-9df9-c9c9cde9b186@amd.com>
 <db73b357-b7e4-f818-e57c-234a45f7c5cb@gmail.com>
 <4ebc27be-a403-0a0b-e9ff-4e5e18c5417c@amd.com>
In-Reply-To: <4ebc27be-a403-0a0b-e9ff-4e5e18c5417c@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::32)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49fad930-fa43-4466-9cad-08d735495793
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1578; 
x-ms-traffictypediagnostic: DM5PR12MB1578:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1578F23683052A16630411FF83B70@DM5PR12MB1578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(189003)(199004)(8936002)(66446008)(64756008)(486006)(102836004)(6246003)(66556008)(6436002)(6486002)(229853002)(76176011)(52116002)(6512007)(2906002)(14454004)(86362001)(36756003)(446003)(99286004)(11346002)(53936002)(2616005)(6506007)(81166006)(25786009)(5660300002)(386003)(53546011)(81156014)(476003)(8676002)(14444005)(46003)(31696002)(58126008)(2501003)(7736002)(186003)(478600001)(305945005)(71200400001)(31686004)(110136005)(66946007)(65956001)(256004)(71190400001)(66476007)(66574012)(6116002)(316002)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1578;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zqafGwjQaNWt2Fvd3dWQK6XDRt7hzgXjqJtsFwI2iCcDu+HcsP7YBEXSqT02EKH+LDdny+QRQtL/XWwczYadV6pG83ak+dJCWaps3cI1eB9gH4hlcHSeKTQXZFJs6wWAv2KvNnqCn0CkkF4YiYneTOejhlBNzkXzjmZgMPZFfMx++uoJGcC/3LsHvt1EvAWKqf3yzDYz0FM127aD8IqwQkFIrzFxgxihM4Uxaljp9+8K73Pg3GXQUtS7Ybb2IXBwivFuf2M/7cJojUfsyC9u0LpAOxXplh2uKBe5+ej3ReDpiLOx8pHnz6LM0pNVlL8rPxszKFSyG8PYqm07/LaY0v2t+y7VCyfo1r/ms+qqcVDRoBLYmCq8FgQl1MWrds4WNz9BJa6WQ3CgQQUAXzXBCIk0eeJ0DXJzhwDG1k8dQ6Q=
Content-ID: <76A516DD1A6BC24B9C87870655619F12@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fad930-fa43-4466-9cad-08d735495793
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 17:15:41.6929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/4Bkxh3EjRKHcY6nFMPtXY87gFAcKCQapMkNt739xBq0u7yOH1WANzS5UBPFy4O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr1KJxRix7UhZb/ST5wsV+nzhrgQuaNUbehLVNj2T4A=;
 b=gUYr5fuMGIklSpLJvN9o8E3370eigDNjVeaAQdFDDe+iwX2cWYDmaG1pjVxIWqO/RLC+vqynMQj2vyZBQmmANDMe7hsHWJ4+S47qys04pN5MlDcITWqznPPR6u+z34cj5TnrZxviO341VSX2sHs3twXlZhDrZycZMGNG0j0eafE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

QW0gMDkuMDkuMTkgdW0gMTU6NTggc2NocmllYiBZYW5nLCBQaGlsaXA6DQo+DQo+IE9uIDIwMTkt
MDktMDkgODowMyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4gQW0gMDQuMDkuMTkg
dW0gMjI6MTIgc2NocmllYiBZYW5nLCBQaGlsaXA6DQo+Pj4gVGhpcyBzZXJpZXMgbG9va3Mgbmlj
ZSBhbmQgY2xlYXIgZm9yIG1lLCB0d28gcXVlc3Rpb25zIGVtYmVkZGVkIGJlbG93Lg0KPj4+DQo+
Pj4gQXJlIHdlIGdvaW5nIHRvIHVzZSBkZWRpY2F0ZWQgc2RtYSBwYWdlIHF1ZXVlIGZvciBkaXJl
Y3QgVk0gdXBkYXRlIHBhdGgNCj4+PiBkdXJpbmcgYSBmYXVsdD8NCj4+Pg0KPj4+IFRoYW5rcywN
Cj4+PiBQaGlsaXANCj4+Pg0KPj4+IE9uIDIwMTktMDktMDQgMTE6MDIgYS5tLiwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToNCj4+Pj4gTmV4dCBzdGVwIHRvd2FyZHMgSE1NIHN1cHBvcnQuIEZvciBu
b3cganVzdCBzaWxlbmNlIHRoZSByZXRyeSBmYXVsdCBhbmQNCj4+Pj4gb3B0aW9uYWxseSByZWRp
cmVjdCB0aGUgcmVxdWVzdCB0byB0aGUgZHVtbXkgcGFnZS4NCj4+Pj4NCj4+Pj4gdjI6IG1ha2Ug
c3VyZSB0aGUgVk0gaXMgbm90IGRlc3Ryb3llZCB3aGlsZSB3ZSBoYW5kbGUgdGhlIGZhdWx0Lg0K
Pj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyB8IDc0DQo+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHzCoCAyICsN
Cj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuY8KgIHzCoCA0
ICsrDQo+Pj4+ICDCoMKgIDMgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0K
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMN
Cj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPj4+PiBpbmRl
eCA5NTE2MDhmYzE5MjUuLjQxMGQ4OTk2NmE2NiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4+Pj4gQEAgLTMxNDIsMyArMzE0Miw3NyBAQCB2b2lk
IGFtZGdwdV92bV9zZXRfdGFza19pbmZvKHN0cnVjdCBhbWRncHVfdm0NCj4+Pj4gKnZtKQ0KPj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+PiAgwqDCoMKgwqDCoMKgIH0NCj4+Pj4gIMKg
wqAgfQ0KPj4+PiArDQo+Pj4+ICsvKioNCj4+Pj4gKyAqIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQg
LSBncmFjZWZ1bCBoYW5kbGluZyBvZiBWTSBmYXVsdHMuDQo+Pj4+ICsgKiBAYWRldjogYW1kZ3B1
IGRldmljZSBwb2ludGVyDQo+Pj4+ICsgKiBAcGFzaWQ6IFBBU0lEIG9mIHRoZSBWTQ0KPj4+PiAr
ICogQGFkZHI6IEFkZHJlc3Mgb2YgdGhlIGZhdWx0DQo+Pj4+ICsgKg0KPj4+PiArICogVHJ5IHRv
IGdyYWNlZnVsbHkgaGFuZGxlIGEgVk0gZmF1bHQuIFJldHVybiB0cnVlIGlmIHRoZSBmYXVsdCB3
YXMNCj4+Pj4gaGFuZGxlZCBhbmQNCj4+Pj4gKyAqIHNob3VsZG4ndCBiZSByZXBvcnRlZCBhbnkg
bW9yZS4NCj4+Pj4gKyAqLw0KPj4+PiArYm9vbCBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBpbnQNCj4+Pj4gcGFzaWQsDQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgYWRkcikNCj4+Pj4gK3sNCj4+
Pj4gK8KgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAmYWRldi0+c2RtYS5pbnN0YW5j
ZVswXS5wYWdlOw0KPj4+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKnJvb3Q7DQo+Pj4+ICvC
oMKgwqAgdWludDY0X3QgdmFsdWUsIGZsYWdzOw0KPj4+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVf
dm0gKnZtOw0KPj4+PiArwqDCoMKgIGxvbmcgcjsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGlmICgh
cmluZy0+c2NoZWQucmVhZHkpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+
Pj4+ICsNCj4+Pj4gK8KgwqDCoCBzcGluX2xvY2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9j
ayk7DQo+Pj4+ICvCoMKgwqAgdm0gPSBpZHJfZmluZCgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9p
ZHIsIHBhc2lkKTsNCj4+Pj4gK8KgwqDCoCBpZiAodm0pDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBy
b290ID0gYW1kZ3B1X2JvX3JlZih2bS0+cm9vdC5iYXNlLmJvKTsNCj4+Pj4gK8KgwqDCoCBlbHNl
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByb290ID0gTlVMTDsNCj4+Pj4gK8KgwqDCoCBzcGluX3Vu
bG9jaygmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrKTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKg
IGlmICghcm9vdCkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+Pj4gKw0K
Pj4+PiArwqDCoMKgIHIgPSBhbWRncHVfYm9fcmVzZXJ2ZShyb290LCB0cnVlKTsNCj4+Pj4gK8Kg
wqDCoCBpZiAocikNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfdW5yZWY7DQo+Pj4+
ICsNCj4+Pj4gK8KgwqDCoCBzcGluX2xvY2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7
DQo+Pj4+ICvCoMKgwqAgdm0gPSBpZHJfZmluZCgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIs
IHBhc2lkKTsNCj4+Pj4gK8KgwqDCoCBzcGluX3VubG9jaygmYWRldi0+dm1fbWFuYWdlci5wYXNp
ZF9sb2NrKTsNCj4+Pj4gKw0KPj4+IEhlcmUgZ2V0IHZtIGZyb20gcGFzaWQgc2Vjb25kIHRpbWUs
IGFuZCBjaGVjayBpZiBQRCBibyBpcyBjaGFuZ2VkLCBpcw0KPj4+IHRoaXMgdG8gaGFuZGxlIHZt
IGZhdWx0IHJhY2Ugd2l0aCB2bSBkZXN0b3J5Pw0KPj4gWWVzLCBleGFjdGx5Lg0KPj4NCj4+Pj4g
K8KgwqDCoCBpZiAoIXZtIHx8IHZtLT5yb290LmJhc2UuYm8gIT0gcm9vdCkNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGdvdG8gZXJyb3JfdW5sb2NrOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgYWRkciAv
PSBBTURHUFVfR1BVX1BBR0VfU0laRTsNCj4+Pj4gK8KgwqDCoCBmbGFncyA9IEFNREdQVV9QVEVf
VkFMSUQgfCBBTURHUFVfUFRFX1NOT09QRUQgfA0KPj4+PiArwqDCoMKgwqDCoMKgwqAgQU1ER1BV
X1BURV9TWVNURU07DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBpZiAoYW1kZ3B1X3ZtX2ZhdWx0X3N0
b3AgPT0gQU1ER1BVX1ZNX0ZBVUxUX1NUT1BfTkVWRVIpIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IC8qIFJlZGlyZWN0IHRoZSBhY2Nlc3MgdG8gdGhlIGR1bW15IHBhZ2UgKi8NCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHZhbHVlID0gYWRldi0+ZHVtbXlfcGFnZV9hZGRyOw0KPj4+PiArwqDCoMKgwqDC
oMKgwqAgZmxhZ3MgfD0gQU1ER1BVX1BURV9FWEVDVVRBQkxFIHwgQU1ER1BVX1BURV9SRUFEQUJM
RSB8DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFNREdQVV9QVEVfV1JJVEVBQkxFOw0K
Pj4+PiArwqDCoMKgIH0gZWxzZSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWx1ZSA9IDA7DQo+
Pj4+ICvCoMKgwqAgfQ0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgciA9IGFtZGdwdV92bV9ib191cGRh
dGVfbWFwcGluZyhhZGV2LCB2bSwgdHJ1ZSwgTlVMTCwgYWRkciwgYWRkcg0KPj4+PiArIDEsDQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncywgdmFsdWUs
IE5VTEwsIE5VTEwpOw0KPj4+PiArwqDCoMKgIGlmIChyKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
Z290byBlcnJvcl91bmxvY2s7DQo+Pj4+ICsNCj4+PiBBZnRlciBmYXVsdCBhZGRyZXNzIHJlZGly
ZWN0IHRvIGR1bW15IHBhZ2UsIHdpbGwgdGhlIGZhdWx0IHJlY292ZXIgYW5kDQo+Pj4gcmV0cnkg
Y29udGludWUgdG8gZXhlY3V0ZT8NCj4+IFllcywgdGhlIHJlYWQvd3JpdGUgb3BlcmF0aW9uIHdp
bGwganVzdCByZXRyeSBhbmQgdXNlIHRoZSB2YWx1ZSBmcm9tIHRoZQ0KPj4gZHVtbXkgcGFnZSBp
bnN0ZWFkLg0KPj4NCj4+PiBJcyB0aGlzIGRhbmdlcm91cyB0byB1cGRhdGUgUFRFIHRvIHVzZSBz
eXN0ZW0NCj4+PiBtZW1vcnkgYWRkcmVzcyAwPw0KPj4gV2hhdCBhcmUgeW91IHRhbGtpbmcgYWJv
dXQ/IFRoZSBkdW1teSBwYWdlIGlzIGEgcGFnZSBhbGxvY2F0ZSBieSBUVE0NCj4+IHdoZXJlIHdl
IHJlZGlyZWN0IGZhdWx0eSBhY2Nlc3NlcyB0by4NCj4+DQo+IEZvciBhbWRncHVfdm1fZmF1bHRf
c3RvcCBlcXVhbHMgdG8gQU1ER1BVX1ZNX0ZBVUxUX1NUT1BfRklSU1QvQUxXQVlTDQo+IGNhc2Us
IHZhbHVlIGlzIDAsIHRoaXMgd2lsbCByZWRpcmVjdCB0byBzeXN0ZW0gbWVtb3J5IDAuIE1heWJl
IHJlZGlyZWN0DQo+IGlzIG9ubHkgbmVlZGVkIGZvciBBTURHUFVfVk1fRkFVTFRfU1RPUF9ORVZF
Uj8NCg0KVGhlIHZhbHVlIDAgZG9lc24ndCByZWRpcmVjdCB0byBzeXN0ZW0gbWVtb3J5LCBpdCBy
ZXN1bHRzIGluIGEgc2lsZW5jZSANCnJldHJ5IHdoZW4gbmVpdGhlciB0aGUgUiBub3IgdGhlIFcg
Yml0IGlzIHNldCBpbiBhIFBURS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBSZWdh
cmRzLA0KPiBQaGlsaXANCj4NCj4+IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+PiAr
wqDCoMKgIHIgPSBhbWRncHVfdm1fdXBkYXRlX3BkZXMoYWRldiwgdm0sIHRydWUpOw0KPj4+PiAr
DQo+Pj4+ICtlcnJvcl91bmxvY2s6DQo+Pj4+ICvCoMKgwqAgYW1kZ3B1X2JvX3VucmVzZXJ2ZShy
b290KTsNCj4+Pj4gK8KgwqDCoCBpZiAociA8IDApDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1f
RVJST1IoIkNhbid0IGhhbmRsZSBwYWdlIGZhdWx0ICglbGQpXG4iLCByKTsNCj4+Pj4gKw0KPj4+
PiArZXJyb3JfdW5yZWY6DQo+Pj4+ICvCoMKgwqAgYW1kZ3B1X2JvX3VucmVmKCZyb290KTsNCj4+
Pj4gKw0KPj4+PiArwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+Pj4gK30NCj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+Pj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4+Pj4gaW5kZXggMGE5N2RjODM5ZjNi
Li40ZGJiZTFiNmI0MTMgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5oDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5oDQo+Pj4+IEBAIC00MTMsNiArNDEzLDggQEAgdm9pZCBhbWRncHVfdm1fY2hlY2tf
Y29tcHV0ZV9idWcoc3RydWN0DQo+Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPj4+PiAgwqDC
oCB2b2lkIGFtZGdwdV92bV9nZXRfdGFza19pbmZvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1bnNpZ25lZA0KPj4+PiBpbnQgcGFzaWQsDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyAqdGFza19pbmZvKTsNCj4+
Pj4gK2Jvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdW5zaWduZWQgaW50DQo+Pj4+IHBhc2lkLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVpbnQ2NF90IGFkZHIpOw0KPj4+PiAgwqDCoCB2b2lkIGFtZGdwdV92bV9zZXRf
dGFza19pbmZvKHN0cnVjdCBhbWRncHVfdm0gKnZtKTsNCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+Pj4+IGluZGV4IDlkMTU2NzlkZjZlMC4uMTVhMWNlNTFi
ZWZhIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+
Pj4gQEAgLTM1Myw2ICszNTMsMTAgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX2ludGVy
cnVwdChzdHJ1Y3QNCj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+Pj4gIMKgwqDCoMKgwqDC
oCB9DQo+Pj4+ICDCoMKgwqDCoMKgwqAgLyogSWYgaXQncyB0aGUgZmlyc3QgZmF1bHQgZm9yIHRo
aXMgYWRkcmVzcywgcHJvY2VzcyBpdA0KPj4+PiBub3JtYWxseSAqLw0KPj4+PiArwqDCoMKgIGlm
IChyZXRyeV9mYXVsdCAmJiAhaW5faW50ZXJydXB0KCkgJiYNCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoYWRldiwgZW50cnktPnBhc2lkLCBhZGRyKSkNCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAxOyAvKiBUaGlzIGFsc28gcHJldmVudHMgc2VuZGluZyBp
dCB0byBLRkQgKi8NCj4+Pj4gKw0KPj4+PiAgwqDCoMKgwqDCoMKgIGlmICghYW1kZ3B1X3NyaW92
X3ZmKGFkZXYpKSB7DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIElzc3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0IGZvciB0aGUgc3Rh
dHVzIHJlZ2lzdGVyIHRvDQo+Pj4+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
