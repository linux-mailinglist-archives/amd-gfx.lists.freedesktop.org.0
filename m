Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C83D2F9
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 18:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9542689157;
	Tue, 11 Jun 2019 16:51:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC1889157
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 16:51:47 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1712.namprd12.prod.outlook.com (10.175.55.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 11 Jun 2019 16:51:43 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1987.010; Tue, 11 Jun 2019
 16:51:43 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM
Thread-Topic: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM
Thread-Index: AQHVH5lHYnsypzm1aE+u6WgpA3XupaaWdaiAgAA3BYA=
Date: Tue, 11 Jun 2019 16:51:42 +0000
Message-ID: <0d91df20-2bad-d629-ba21-a3d454d35e97@amd.com>
References: <20190610143157.26752-1-tom.stdenis@amd.com>
 <91bb2355-949f-43a3-67e6-fb752de86b5c@gmail.com>
In-Reply-To: <91bb2355-949f-43a3-67e6-fb752de86b5c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:405:3b::26) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b55d6e0-603d-4703-978f-08d6ee8d1486
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1712; 
x-ms-traffictypediagnostic: MWHPR12MB1712:
x-microsoft-antispam-prvs: <MWHPR12MB17122C497A75636561D5D7F4F7ED0@MWHPR12MB1712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(376002)(39860400002)(346002)(199004)(189003)(99286004)(102836004)(486006)(66946007)(71190400001)(68736007)(73956011)(71200400001)(186003)(476003)(52116002)(11346002)(446003)(6512007)(6486002)(229853002)(5660300002)(26005)(66066001)(66476007)(256004)(66446008)(66556008)(64756008)(76176011)(386003)(2616005)(6506007)(2906002)(6116002)(3846002)(14454004)(6246003)(53546011)(110136005)(25786009)(36756003)(31696002)(316002)(31686004)(72206003)(53936002)(305945005)(7736002)(86362001)(2501003)(478600001)(8936002)(6436002)(8676002)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1712;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6NdN60Hdvkrt0D7dHoQxEjN62W6W4lsmZpEdNocpAkACUBsRE2EAreT8zM/ztiG2EuRnK8y8FhXaC9rMGn4MeD1Clv11gkQSTPu4XrO57q/fPhxZnWn1OdItxsk/13FMGPdJOfOiSNV+0DAnJyvT7ApWRLpo6kpeC/X8UZPFM4d1sCXeQO8sUgYMoVbvPd8PiLTMQqqT3aHoKlCrMiTIF3mD+2UzKtLESTnYX3xKoUT5LZuCr33lE31612/SxgGExTuJ1BnUvqYeSm5E/md1vWuMy5WE+Sl2g0l/spJC4mmlpuqFRzFVragRbeuqPeAV3zAgx52inzl1ET+1D0KYgGIajpozSrOi8wtsswuy5jnjMyW4Tu3VSFJdqHMTSTv5JbSdPeTP6ASXuENVGHr1wrQ+u1XdWh6+tBn8FWHqBrQ=
Content-ID: <A7F8A2E60668144DB85D1A4E750B5F1C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b55d6e0-603d-4703-978f-08d6ee8d1486
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 16:51:42.8984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poI7yQ0xBEMp2z82Qb2v66A0GO53r0kQFe5oef93NYI=;
 b=cG3hQYAyiaxeCe/a+1A1vs7n9USEKNm7muNoh+ZFjPaYYy0w9YfEy+LaUfdm37HLdUXta0y/AG+k6yFdiGbS8qsNzx0nSpswHHW5qdYevO1PUAYMQSWF22NNnN5kOfmoAIlwSVOx0oTx2jqbY+3826czaViCE6x2rZ31j+AFw4E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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

DQpPbiAyMDE5LTA2LTExIDk6MzQgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gQW0g
MTAuMDYuMTkgdW0gMTY6MzIgc2NocmllYiBTdERlbmlzLCBUb206DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgMTcgKysrKysrKysrKysr
LS0tLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdnJhbV9tZ3IuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMNCj4+IGluZGV4IDhhZWEyZjIxYjIwMi4uNzBiNGE1YTk3ZWQyIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+PiBAQCAt
Mjc2LDcgKzI3Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgDQo+
PiB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX21t
X25vZGUgKm5vZGVzOw0KPj4gwqDCoMKgwqDCoCBlbnVtIGRybV9tbV9pbnNlcnRfbW9kZSBtb2Rl
Ow0KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGxwZm4sIG51bV9ub2RlcywgcGFnZXNfcGVy
X25vZGUsIHBhZ2VzX2xlZnQ7DQo+PiAtwqDCoMKgIHVpbnQ2NF90IHVzYWdlID0gMCwgdmlzX3Vz
YWdlID0gMDsNCj4+ICvCoMKgwqAgdWludDY0X3QgdmlzX3VzYWdlID0gMDsNCj4+IMKgwqDCoMKg
wqAgdW5zaWduZWQgaTsNCj4+IMKgwqDCoMKgwqAgaW50IHI7DQo+PiDCoCBAQCAtMjg0LDYgKzI4
NCwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IA0KPj4gdHRtX21l
bV90eXBlX21hbmFnZXIgKm1hbiwNCj4+IMKgwqDCoMKgwqAgaWYgKCFscGZuKQ0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGxwZm4gPSBtYW4tPnNpemU7DQo+PiDCoCArwqDCoMKgIC8qIGJhaWwgb3V0
IHF1aWNrbHkgaWYgdGhlcmUncyBsaWtlbHkgbm90IGVub3VnaCBWUkFNIGZvciB0aGlzIA0KPj4g
Qk8gKi8NCj4+ICvCoMKgwqAgYXRvbWljNjRfYWRkKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJ
RlQsICZtZ3ItPnVzYWdlKTsNCj4+ICvCoMKgwqAgaWYgKGF0b21pYzY0X3JlYWQoJm1nci0+dXNh
Z2UpID4gYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGF0b21p
YzY0X3N1YihtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51c2FnZSk7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9TUEM7DQo+PiArwqDCoMKgIH0NCj4NCj4gVGhhdCdz
IG5vdCAxMDAlIGNvcnJlY3QgSUlSQy4gU2VlIFRUTSBleHBlY3RzIGEgcmV0dXJuIHZhbHVlIG9m
IDAsIGJ1dCANCj4gbWVtLT5ub2RlIHRvIGJlIE5VTEwgd2hlbiBhbGxvY2F0aW9uIGZhaWxzLg0K
DQoNCll1cCwgdGhlIG5vZGUgY3JlYXRpb24gcmV0dXJucyAtRU5PU1BDIHdoaWNoIHRoaXMgZnVu
Y3Rpb24gdGhlbiANCnRyYW5zbGF0ZXMgdG8gMC7CoCBJJ2xsIHN1Ym1pdCBhIHYyIGluIGEgbWlu
dXRlIG9uY2UgSSBwYXNzIGEgcGlnbGl0IHRlc3QgOi0pDQoNCg0KVG9tDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
