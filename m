Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE639E35F
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 10:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078BC89428;
	Tue, 27 Aug 2019 08:57:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052F489428
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 08:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md4GGADYKoIzli/oXGEGVr0yW9fOZhg/sR+mz7O0QZyPSjUBqNyfLaLPG/QO6JLGRSw/wb9I/nGf77z4/wdK/XFqND+7Ywrd5koPLGcRAgFZQ/4rfOdqTHgiykawz4eV7ITrJwK3CyUoWdiBUNCs4qprykbko0+q7zW7pBBE8bSboAq0uxQJeWFyj5s8thO1bK0t++Pb5ip3VAGnl6PyUtKA8udCorY/v176HCHJ97gqcxbEBjdrWEybOBxVvmNMulWA12ROph6Xj03O50sNHMrsapfdb1CJcsMwZqqx98hfPXGlvGTNBXRy2OdgVU2+tKaTpGRbGCSoaj2zSKJV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv+6FDfohQt8McKZNP0S8kOGBSGKRtm+j5uowJe6kYo=;
 b=dKpHuNC7CvtA+zkz3xjjPTdFbyPVoXwrkhwDoZwJP5spQzN5JPiCDwlQkK2/Q6Vgzf3e0+Xth2Pfyt8HLYjwsa1QemFk+k+RIiPnzrh3ZnU+3tV8h8Tl+T6DYHnJ1QF/+np0SoDMLBYK7iqJW7z0qdaV2tEWugRKjTflQ9jFcIKe6QcwujHWqSJeKZHM2DNaKpzqeMsiTGEYpPGKkZtTojS4uuZyg5NxpLRQhV9BmNdLThgn39aK5vKGoR4wRuFi3iQYgiJpZJMl3yguW6j4ekVEAyWjJMxS63FpPzj5qQltCt1N7K0OVfTXCUxhVdJ+CjzQA1iJrBbAUDhCzQLOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5SPR00MB111.namprd12.prod.outlook.com (10.174.247.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 08:57:17 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 08:57:17 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/amdgpu: Support new arcturus mtype
Thread-Topic: [PATCH 2/4] drm/amdgpu: Support new arcturus mtype
Thread-Index: AQHVXGL/O83PMR2yvUe9oFgpRT2QzqcOsg4A
Date: Tue, 27 Aug 2019 08:57:17 +0000
Message-ID: <5267cb07-9700-7d03-01c6-ba88b3f37821@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
 <20190826230355.25007-2-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-2-Felix.Kuehling@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0236.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::32) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a39d092-15d9-41f5-7e53-08d72acc8ff8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5SPR00MB111; 
x-ms-traffictypediagnostic: DM5SPR00MB111:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5SPR00MB111E7DD87E5D2B82E685D1983A00@DM5SPR00MB111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(71200400001)(71190400001)(6512007)(2501003)(58126008)(8936002)(52116002)(66446008)(66946007)(64756008)(66556008)(66476007)(110136005)(65956001)(65806001)(305945005)(316002)(53936002)(14454004)(8676002)(81156014)(81166006)(36756003)(46003)(478600001)(6246003)(446003)(256004)(76176011)(25786009)(102836004)(486006)(86362001)(31696002)(11346002)(7736002)(6436002)(5660300002)(4326008)(6486002)(386003)(6506007)(31686004)(6116002)(229853002)(2906002)(186003)(476003)(99286004)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5SPR00MB111;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WlM6zAlALVUQHCN+dBDRmBIHDhjPwDUKzoa0iRb3atpxsMQ4Hv63Y+NeqDuVdyZG8ab6DVt7yPf6fTqde/vuc2YeH6uAEJCEr1iuU/dlQ7C66+y7mlxgPlM3DW+UKy1AJ4dGobTExi3sJWAzvbPkaB90KvVvRV06fLS0+2hyp0JBTtSm/LZs9eSbw3DyEUtLyIIiX3b08EfAbnODMGuYX5JseDG1ifgO2a9EtMt7GgJEnaeHDBJCnNugLXrNoUSQF4B95kMVIEbrgolg+HukAWwS6RIVtJVkhI0Zm5hP/vxLrctVi+oWRAOKiHzNzStI23TI4/fb7EqrPRu4E3AyLYFcsJGXGCABm1PBJX6bBr0b31afmU0Ep5WRXAU+LxFlUo4ARDquXrIGp1zKRjOvka6ss2ftYR7rqPNqnEvITp4=
Content-ID: <5D7B31EFFB517E489F7104163AE35FCE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a39d092-15d9-41f5-7e53-08d72acc8ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 08:57:17.5715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ST0Knzsr46fyl57ZPQMDj/BP+0QGW9KgdECgW7S72JQZOExoALg1S2HYGCKuMdf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR00MB111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv+6FDfohQt8McKZNP0S8kOGBSGKRtm+j5uowJe6kYo=;
 b=RM1f7d38t9wwhYLcYpz/p6OHdwpehNEWOLTlTv/ai5Nifr7B1UdY+74jJoRaciYbOO8alYnVQIQiRfWtxgO8QwzB7eJgfgbQ/MUs72yB5++720+aFNvZraxyBOrdAsHssgBsv0eOrkRO82b9pXsQmwQFZho/M2lyFordLKbklPE=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDguMTkgdW0gMDE6MDcgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IEZyb206IE9h
ayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KPg0KPiBBcmN0dXJ1cyByZXB1cnBvc2VkIG10eXBl
IFdDIHRvIFJXLiBNb2RpZnkgZ21jIGZ1bmN0aW9ucw0KPiB0byBzdXBwb3J0IHRoZSBuZXcgbXR5
cGUNCj4NCj4gQ2hhbmdlLUlkOiBJZGMzMzhlNTM4NmE1NzAyMGY0NTI2MjAyNWUyNjY0YWI0YmE5
ZjI5MQ0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgICB8IDMg
KysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVtLmggfCAxICsN
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gaW5kZXggZjc3MTM4YmE0MWY2Li43YWEzNjVjZDhkMWQg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBAQCAtNjAzLDYg
KzYwMyw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRfdm1fcHRlX2ZsYWdzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAljYXNlIEFNREdQVV9WTV9NVFlQRV9XQzoNCj4g
ICAJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQRV9XQyk7DQo+ICAgCQli
cmVhazsNCj4gKwljYXNlIEFNREdQVV9WTV9NVFlQRV9SVzoNCj4gKwkJcHRlX2ZsYWcgfD0gQU1E
R1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX1JXKTsNCj4gKwkJYnJlYWs7DQo+ICAgCWNhc2UgQU1E
R1BVX1ZNX01UWVBFX0NDOg0KPiAgIAkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9WRzEw
KE1UWVBFX0NDKTsNCj4gICAJCWJyZWFrOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
dmVnYTEwX2VudW0uaA0KPiBpbmRleCBjMTRiYTY1YTI0MTUuLmFkZjFiNzU0NjY2ZSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVtLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVtLmgNCj4gQEAgLTEwMzcs
NiArMTAzNyw3IEBAIFRDQ19DQUNIRV9QT0xJQ1lfU1RSRUFNICAgICAgICAgICAgICAgICAgPSAw
eDAwMDAwMDAxLA0KPiAgIHR5cGVkZWYgZW51bSBNVFlQRSB7DQo+ICAgTVRZUEVfTkMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDAsDQo+ICAgTVRZUEVfV0MgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDEsDQo+ICtNVFlQRV9SVyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMSwNCj4gICBNVFlQRV9D
QyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMiwNCj4gICBNVFlQ
RV9VQyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMywNCj4gICB9
IE1UWVBFOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
