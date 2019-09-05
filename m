Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0EAA55E
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 16:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C2B6E0FB;
	Thu,  5 Sep 2019 14:03:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EF26E0D2
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 14:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAF1tc5YklPoNizGBG76ETw0mf7cVGjg0u7+tbOUntNk28cZqE/BBkKqNzCNiZB9pRFg/Tnjyf/804mmAJlb/WbR3W5LpTJVWO04LMg7h1Wz8WSJ0VdAUcbPuvYFvnbJAqNGQhEhPYC/ko/YFkqDuADV9GgPxJC/JkLwBoCy6q6QpVtMwr5urSCEC7b8rjizooSA8KDTOP1xLvBm1MGnKuxjZvKs3/mQTAsWEX8Oss1DL5qZq5vb1C0WNJdMQAxnRsRAlIQ5aZcAK+gtKTTJzkE9v/koMPb8jAR/ME7lxoeiJ6czuI6+tHTq+v7Za+wzRvbMzmbrCndqrQucoKOp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZA4Zs0YzYwId55cyTZLP0IFGIctoYePJKrEU40zTv4=;
 b=DUwogugwXOgIK8+1lCs4786mOpl7EuyY8RvVrVolw1Pcr2csxtjTE5QdzofcRCEkHJT+D9WiAMtVaoHqYsL0vmqd51Q3L7ORKLSfab9LoSB/0NDvpwSdwa6PxgbNj6aAP49WllRVOJ6siYwPTg3v3lKvo4vAGgq6ct94xJ07I7LN+m53wQqrTjtAgSom2Hjdi7JqOWru58Q+te4dw6C2ykkTJjIFeHfvhqED7BDGhGAz1lBkUKelbGDuqKIP7ej+YyNkF4qZBTL119SAF0buhC9/oepxo3zqU1qFjR1giNBF/1uH1PB/1JlhjPfsjJyW1KiZS6duI7OXnM09JMdzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1405.namprd12.prod.outlook.com (10.169.206.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 14:03:25 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::d1d4:fdff:728e:833b]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::d1d4:fdff:728e:833b%4]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 14:03:24 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/amdgpu: Disable retry faults in VMID0
Thread-Topic: [PATCH 1/1] drm/amdgpu: Disable retry faults in VMID0
Thread-Index: AQHVY3jVRndyicN57kSyNNfIH3Ofq6cdHmkA
Date: Thu, 5 Sep 2019 14:03:24 +0000
Message-ID: <1eaaaa3d-5862-6315-4b6c-bafeac975301@amd.com>
References: <20190904233053.9767-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190904233053.9767-1-Felix.Kuehling@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::34) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c8d49fa-b1a7-4332-375e-08d73209d170
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1405; 
x-ms-traffictypediagnostic: MWHPR12MB1405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1405511AEB6CCAD6061846A1E6BB0@MWHPR12MB1405.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6246003)(6486002)(86362001)(66066001)(81166006)(81156014)(476003)(8676002)(36756003)(486006)(186003)(2906002)(256004)(8936002)(7736002)(305945005)(31696002)(478600001)(53936002)(71190400001)(25786009)(71200400001)(4326008)(5660300002)(2501003)(31686004)(6116002)(3846002)(11346002)(110136005)(316002)(6512007)(229853002)(6436002)(6506007)(99286004)(53546011)(76176011)(102836004)(386003)(52116002)(446003)(66446008)(66946007)(14454004)(64756008)(66476007)(66556008)(2616005)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1405;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V6iylXyY01ElFgJT/6WfQTlYROXtz3HW9I9vrXHRAq9l9AHTXq3ZSEM5+ex0kNzfkoYvI6x/zNiuvTc0ezQevNldNq/Cb24R9v6KZCNFQ47E8mtps5l9ztF8Fu3oscPI4umc6PgclmCfCf5X6X48zOTMFPC9z/IHs1d0GNtN7yLXppTOMR6Rqv2v9YuS9UU0IgVuHSUmhuijM6cml3S9PzGpMS+w8x1GbSzKfqeL12JiVUUXPIcUw4nuVG4GhP070y+n/lMgHgLBoCI4iTgXkcv/lFPXRTjqbWvAzJWClpH+0pD38k7mkNAj0TwYuk9TM9oJ11r8DPYr6mhCKuHMdiO6UMJqLQ0QeIbOp/XHh3uiZIYKrcVJvsPcffdMSyEI143FQs9cBARi6u7hUaWO6WGREollT7QBRjnASMWjt/Y=
Content-ID: <9B35D67BE68DED44A370BEC48F6AC1EB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8d49fa-b1a7-4332-375e-08d73209d170
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 14:03:24.8510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIjuG9QjTeMos/y7JuAnaDQdqWAIH4q6sJIcNeTocXyMrWDjXzU6fGfyh/A/Zrx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZA4Zs0YzYwId55cyTZLP0IFGIctoYePJKrEU40zTv4=;
 b=HHZMNdVfvDgnIKXiaMuMfTYGz0qay98JCBL4XREG0wFnCsZoxZ9j11EtdSFlZPThh/F1a8F2f0cUkWtVxlrUmkQBcM9W6LhB0Dl1N6FTM2PF93JH+dg4RkWrTL1RgijQwIgT7PJaHZmTbiRGMqqk8fDc4+0ebQeVfaosdvHlo6M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Vk1JRDAgaW5pdCBwYXRoIHdhcyBtaXNzZWQgd2hlbiBlbmFibGluZyBhbWRncHVfbm9yZXRyeSBv
cHRpb24uIEdvb2QgDQpjYXRjaCBhbmQgZml4Lg0KDQpSZXZpZXdlZC1ieTogUGhpbGlwIFlhbmcg
PHBoaWxpcC55YW5nQGFtZC5jb20+DQoNCk9uIDIwMTktMDktMDQgNzozMSBwLm0uLCBLdWVobGlu
ZywgRmVsaXggd3JvdGU6DQo+IFRoZXJlIGlzIG5vIHBvaW50IHJldHJ5aW5nIHBhZ2UgZmF1bHRz
IGluIFZNSUQwLiBUaG9zZSBmYXVsdHMgYXJlDQo+IGFsd2F5cyBmYXRhbC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jIHwgMiArKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMgfCAyICsrDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jICB8IDIgKysNCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgIHwgMiArKw0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYyAgfCAyICsrDQo+ICAgNSBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4aHViX3YxXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1
Yl92MV8wLmMNCj4gaW5kZXggNmNlMzdjZTc3ZDE0Li45ZWM0Mjk3ZTYxZTUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYw0KPiBAQCAtMTc4LDYgKzE3OCw4
IEBAIHN0YXRpYyB2b2lkIGdmeGh1Yl92MV8wX2VuYWJsZV9zeXN0ZW1fZG9tYWluKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAl0bXAgPSBSUkVHMzJfU09DMTUoR0MsIDAsIG1tVk1f
Q09OVEVYVDBfQ05UTCk7DQo+ICAgCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9DT05URVhU
MF9DTlRMLCBFTkFCTEVfQ09OVEVYVCwgMSk7DQo+ICAgCXRtcCA9IFJFR19TRVRfRklFTEQodG1w
LCBWTV9DT05URVhUMF9DTlRMLCBQQUdFX1RBQkxFX0RFUFRILCAwKTsNCj4gKwl0bXAgPSBSRUdf
U0VUX0ZJRUxEKHRtcCwgVk1fQ09OVEVYVDBfQ05UTCwNCj4gKwkJCSAgICBSRVRSWV9QRVJNSVNT
SU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwgMCk7DQo+ICAgCVdSRUczMl9TT0MxNShHQywgMCwg
bW1WTV9DT05URVhUMF9DTlRMLCB0bXApOw0KPiAgIH0NCj4gICANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhodWJfdjJfMC5jDQo+IGluZGV4IDhiNzg5Zjc1MGI3Mi4uYTkyMzg3MzVk
MzYxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjJf
MC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMNCj4g
QEAgLTE2Niw2ICsxNjYsOCBAQCBzdGF0aWMgdm9pZCBnZnhodWJfdjJfMF9lbmFibGVfc3lzdGVt
X2RvbWFpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJdG1wID0gUlJFRzMyX1NP
QzE1KEdDLCAwLCBtbUdDVk1fQ09OVEVYVDBfQ05UTCk7DQo+ICAgCXRtcCA9IFJFR19TRVRfRklF
TEQodG1wLCBHQ1ZNX0NPTlRFWFQwX0NOVEwsIEVOQUJMRV9DT05URVhULCAxKTsNCj4gICAJdG1w
ID0gUkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fQ09OVEVYVDBfQ05UTCwgUEFHRV9UQUJMRV9ERVBU
SCwgMCk7DQo+ICsJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fQ09OVEVYVDBfQ05UTCwN
Cj4gKwkJCSAgICBSRVRSWV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwgMCk7DQo+
ICAgCVdSRUczMl9TT0MxNShHQywgMCwgbW1HQ1ZNX0NPTlRFWFQwX0NOVEwsIHRtcCk7DQo+ICAg
fQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJf
djFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jDQo+IGluZGV4
IGI5ZDZjMGJmYTU5NC4uNGM3ZThjNjRhOTRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbW1odWJfdjFfMC5jDQo+IEBAIC0yMDcsNiArMjA3LDggQEAgc3RhdGljIHZvaWQgbW1o
dWJfdjFfMF9lbmFibGVfc3lzdGVtX2RvbWFpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4gICAJdG1wID0gUlJFRzMyX1NPQzE1KE1NSFVCLCAwLCBtbVZNX0NPTlRFWFQwX0NOVEwpOw0K
PiAgIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fQ09OVEVYVDBfQ05UTCwgRU5BQkxFX0NP
TlRFWFQsIDEpOw0KPiAgIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fQ09OVEVYVDBfQ05U
TCwgUEFHRV9UQUJMRV9ERVBUSCwgMCk7DQo+ICsJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZN
X0NPTlRFWFQwX0NOVEwsDQo+ICsJCQkgICAgUkVUUllfUEVSTUlTU0lPTl9PUl9JTlZBTElEX1BB
R0VfRkFVTFQsIDApOw0KPiAgIAlXUkVHMzJfU09DMTUoTU1IVUIsIDAsIG1tVk1fQ09OVEVYVDBf
Q05UTCwgdG1wKTsNCj4gICB9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1
Yl92Ml8wLmMNCj4gaW5kZXggMzU0MmMyMDNjM2M4Li44NmVkOGNiOTE1YTggMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMNCj4gQEAgLTE1Miw2ICsxNTIsOCBA
QCBzdGF0aWMgdm9pZCBtbWh1Yl92Ml8wX2VuYWJsZV9zeXN0ZW1fZG9tYWluKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQ0KPiAgIAl0bXAgPSBSUkVHMzJfU09DMTUoTU1IVUIsIDAsIG1tTU1W
TV9DT05URVhUMF9DTlRMKTsNCj4gICAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIE1NVk1fQ09O
VEVYVDBfQ05UTCwgRU5BQkxFX0NPTlRFWFQsIDEpOw0KPiAgIAl0bXAgPSBSRUdfU0VUX0ZJRUxE
KHRtcCwgTU1WTV9DT05URVhUMF9DTlRMLCBQQUdFX1RBQkxFX0RFUFRILCAwKTsNCj4gKwl0bXAg
PSBSRUdfU0VUX0ZJRUxEKHRtcCwgTU1WTV9DT05URVhUMF9DTlRMLA0KPiArCQkJICAgIFJFVFJZ
X1BFUk1JU1NJT05fT1JfSU5WQUxJRF9QQUdFX0ZBVUxULCAwKTsNCj4gICAJV1JFRzMyX1NPQzE1
KE1NSFVCLCAwLCBtbU1NVk1fQ09OVEVYVDBfQ05UTCwgdG1wKTsNCj4gICB9DQo+ICAgDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMNCj4gaW5kZXggMGNmN2VmNDRiNGI1
Li42NTc5NzBmOWViZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21taHViX3Y5XzQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
OV80LmMNCj4gQEAgLTI0MCw2ICsyNDAsOCBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92OV80X2VuYWJs
ZV9zeXN0ZW1fZG9tYWluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJCQkgIGh1
YmlkICogTU1IVUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VUKTsNCj4gICAJdG1wID0gUkVHX1NF
VF9GSUVMRCh0bXAsIFZNTDJWQzBfVk1fQ09OVEVYVDBfQ05UTCwgRU5BQkxFX0NPTlRFWFQsIDEp
Ow0KPiAgIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1MMlZDMF9WTV9DT05URVhUMF9DTlRM
LCBQQUdFX1RBQkxFX0RFUFRILCAwKTsNCj4gKwl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1M
MlZDMF9WTV9DT05URVhUMF9DTlRMLA0KPiArCQkJICAgIFJFVFJZX1BFUk1JU1NJT05fT1JfSU5W
QUxJRF9QQUdFX0ZBVUxULCAwKTsNCj4gICAJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwg
bW1WTUwyVkMwX1ZNX0NPTlRFWFQwX0NOVEwsDQo+ICAgCQkJICAgIGh1YmlkICogTU1IVUJfSU5T
VEFOQ0VfUkVHSVNURVJfT0ZGU0VULCB0bXApOw0KPiAgIH0NCj4gDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
