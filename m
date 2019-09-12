Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A4B1369
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 19:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD236EDDD;
	Thu, 12 Sep 2019 17:22:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4536EDDD
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 17:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfVLB1+Ch+abQzqXynR/HMPVvFO7rDbwDVUwPG0noyY5+G7l3CZn37ia/Uq7C/VNs/J2JbbloSyjpjC+sFQbsp06bzd59Gv2jzL277jaFcFEEYni/UBoiD2GifYmIuhDxBRmZ7ExRYNMRKjcESUsjdp7xEmVVggkgOh031EVyKZVkjypICAgrRICD6QCwZPLLXMGq4z5O42DUff+8t0K/yVtnj3NpHRguSSiIQvGU/St7a1rgm0zoYqW4dzLnvtziqrNwLA6E/TNMACL4HMP8a2xyhdFpjzal7hxBt6okV16G635zjsvOXdugeX+ZhLX0+Isr3aoaxeafzUFp/LSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV+eAFi2PF2QKeX2E83xzJr4ZuugIlDPlVKvNY2wSTE=;
 b=CQ8y+10BWv80Mp/wGkUwId99NPbSLT6Mm5kQwDBnCKMueoUtTflXOFPcOFdu3QiJcdEk7O6KUstAdLF7bjB61fz0uKbBEoadwJ+Oly8atUxk+u+tkT0gDY68tZPmo0qm6H12D2dGrWEvE3Ev8ctXo1KuSaL85exCoLunpS9JNu94y5LkRF7vMS9wQtEVIczzXRlGoTSnsj7tkQ0+wA89PMAsO2/CuOmrcbL2vHg/CiMuD9Bt73Njs9GS+hYpuJUV3f9cwa6WhZ4GZXARnVYPptPqfiQg9GTFLijzrZuyl8vhhOTw4Wb19wfNgGHc8hwP/5/LcuQMem1XdRHKpz6kMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0054.namprd12.prod.outlook.com (10.172.77.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 17:22:33 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2263.016; Thu, 12 Sep
 2019 17:22:33 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Pierre-Loup A.
 Griffais" <pgriffais@valvesoftware.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Create plane rotation property
Thread-Topic: [PATCH] drm/amd/display: Create plane rotation property
Thread-Index: AQHVaYmso+SbINt3Jkq27wann6eki6coRHgAgAAFxYA=
Date: Thu, 12 Sep 2019 17:22:33 +0000
Message-ID: <907ff2ce-e273-1ea0-a17b-522745756164@amd.com>
References: <20190912164404.12725-1-pgriffais@valvesoftware.com>
 <b781b06d-a52f-0291-b0df-d90b81a66c84@amd.com>
In-Reply-To: <b781b06d-a52f-0291-b0df-d90b81a66c84@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e7cf822-f4de-4cff-b573-08d737a5cc01
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0054; 
x-ms-traffictypediagnostic: CY4PR1201MB0054:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0054A8F0D6486B848E1A09028CB00@CY4PR1201MB0054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(189003)(199004)(446003)(14454004)(6506007)(386003)(11346002)(6246003)(53546011)(26005)(66476007)(66556008)(76176011)(8936002)(2616005)(31686004)(64756008)(186003)(66446008)(66946007)(102836004)(2906002)(52116002)(53936002)(256004)(58126008)(486006)(71200400001)(8676002)(305945005)(65956001)(66066001)(5660300002)(99286004)(6512007)(2501003)(478600001)(25786009)(4326008)(65806001)(81166006)(81156014)(6436002)(6486002)(476003)(229853002)(316002)(110136005)(31696002)(6116002)(54906003)(36756003)(3846002)(71190400001)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0054;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DbjxKaywhRS6qSEOt1DpafGMS4vnTx2Z5JUUV06pXt6WThGqcoql8eRUgyznbRvPkiU7yF7+QEhKq0u5v447Iw0AX4zPJ7GdmJUokanGpt4KXkfaJAYjLue5crgIbq9argG90mDCLjGbSrIGeqX0eixhmF6W7p0iIjN5psKBu8+ye5ktLNmVwqNcUr8SwLEe5mZ10cwvhBlhyV5kT2Ul6jFX/i8/8GGf0kLLL6Tjvx0yPaZQB3dy7aE+Tw7hEE+2oV3EZypuyyfXMSVlKHoV+4E0+wBpgieevr6eJCOHu7u3KbQ84nhmSCX63uTNTObpyZY6daxGHEr2GeE3vf1ymCBUrq7uufrmwSw1ovMT2tyoOg2LE+QmOLmD6H0wpqesK5r7QJxJy1JERKW4EdStw9d5oBebuGRWwAdIB6MalHQ=
Content-ID: <8C2EDF978AE159449BC8619EA1DBB397@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7cf822-f4de-4cff-b573-08d737a5cc01
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 17:22:33.0618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuS3uzME1iqsMMQ7KO2FZgUX2CAiapekRo/r8YrnwpsqWyDvry0kykrbIhLQz8yqFzyuPP9pgsbYvzFHPGc5eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV+eAFi2PF2QKeX2E83xzJr4ZuugIlDPlVKvNY2wSTE=;
 b=XhyY6j3GCW3GISpcRNHqDw5K0qlj9AjsFLmuYDeiH2QZlT1VOGgie/uI8+uASR8TtoYQno5j2jmpKzmNViWwRdimnSaFu6bH9VL0i5c4iBftnHQ3hlE/MA2K3uimw4E0JglwZlrC+oz4zQz/gDKWRrTy7eKrtfXjkkdI+vL2QLY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMiAxOjAxIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOg0KPiBP
biAyMDE5LTA5LTEyIDEyOjQ0IHAubS4sIFBpZXJyZS1Mb3VwIEEuIEdyaWZmYWlzIHdyb3RlOg0K
Pj4gSXQncyBvdGhlcndpc2UgcHJvcGVybHkgc3VwcG9ydGVkLCBqdXN0IG5lZWRzIGV4cG9zaW5n
IHRvIHVzZXJzcGFjZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUtTG91cCBBLiBHcmlm
ZmFpcyA8cGdyaWZmYWlzQHZhbHZlc29mdHdhcmUuY29tPg0KPiBJIGtub3cgSUdUIGhhcyBzb21l
IHRlc3RzIGZvciBwbGFuZSByb3RhdGlvbiwgZG8geW91IGhhcHBlbiB0byBrbm93IHdoYXQgDQo+
IHRlc3RzIHBhc3Mgb3IgZmFpbCB3aGVuIGV4cG9zaW5nIHRoaXM/DQo+IA0KPiBJIHRoaW5rIERD
TjEgKFJhdmVuKSBzaG91bGQgd29yayBhcyBleHBlY3RlZCBidXQgSSdkIGJlIGNvbmNlcm5lZCBh
Ym91dCANCj4gRENFIG9yIERDTjIuIEkgdGhpbmsgd2UgaGF2ZSBoYWQgc29tZSBjdXJzb3IgYnVn
cyBpbiB0aGUgcGFzdCB3aXRoIA0KPiBjdXJzb3Igcm90YXRpb24gYnV0IHRoZXkgbWlnaHQgb25s
eSBiZSBleHBvc2VkIHdoZW4gdXNlZCBpbiBjb25qdW5jdGlvbiANCj4gd2l0aCBvdmVybGF5IHBs
YW5lcy4NCj4gDQoNCldpbmRvd3MgZ3V5cyBoYWQgYSBmaXggKGluIERDKSBmb3IgY3Vyc29yIHdp
dGggSFcgcm90YXRpb24gb24gRENOIGEgZmV3DQp3ZWVrcyBhZ28uIFRoYXQgbWlnaHQgaGF2ZSBm
aXhlZCB0aGVzZSBpc3N1ZXMuDQoNCldlIHNob3VsZCBzdGlsbCBtYWtlIHN1cmUgd2UgY2FuIHBh
c3MgSUdUIHRlc3RzIHRoYXQgZG8gcm90YXRpb24uDQoNCkhvdyBkaWQgeW91IHRlc3Q/IFdlc3Rv
bj8NCg0KSGFycnkNCg0KPiBJJ2QganVzdCBsaWtlIHRvIG1ha2Ugc3VyZSB0aGVyZSdzIHN1aXRh
YmxlIHRlc3RpbmcgYXQgbGVhc3QgaWYgd2UncmUgDQo+IGdvaW5nIHRvIGV4cG9zZSB0aGlzIHRv
IHVzZXJzcGFjZS4NCj4gDQo+IE5pY2hvbGFzIEthemxhdXNrYXMNCj4gDQo+PiAtLS0NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDggKysr
KysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4g
aW5kZXggNDViZTdhMjEzMmJiLi4zNzcyNzYzYzY0NDkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+PiBAQCAtNDY4
MCw2ICs0NjgwLDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1fcGxhbmVfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sDQo+PiAgIAl1aW50MzJfdCBmb3JtYXRzWzMyXTsNCj4+
ICAgCWludCBudW1fZm9ybWF0czsNCj4+ICAgCWludCByZXMgPSAtRVBFUk07DQo+PiArCXVuc2ln
bmVkIGludCBzdXBwb3J0ZWRfcm90YXRpb25zOw0KPj4gICANCj4+ICAgCW51bV9mb3JtYXRzID0g
Z2V0X3BsYW5lX2Zvcm1hdHMocGxhbmUsIHBsYW5lX2NhcCwgZm9ybWF0cywNCj4+ICAgCQkJCQlB
UlJBWV9TSVpFKGZvcm1hdHMpKTsNCj4+IEBAIC00NzExLDYgKzQ3MTIsMTMgQEAgc3RhdGljIGlu
dCBhbWRncHVfZG1fcGxhbmVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0s
DQo+PiAgIAkJCURSTV9DT0xPUl9ZQ0JDUl9CVDcwOSwgRFJNX0NPTE9SX1lDQkNSX0xJTUlURURf
UkFOR0UpOw0KPj4gICAJfQ0KPj4gICANCj4+ICsJc3VwcG9ydGVkX3JvdGF0aW9ucyA9DQo+PiAr
CQlEUk1fTU9ERV9ST1RBVEVfMCB8IERSTV9NT0RFX1JPVEFURV85MCB8DQo+PiArCQlEUk1fTU9E
RV9ST1RBVEVfMTgwIHwgRFJNX01PREVfUk9UQVRFXzI3MDsNCj4+ICsNCj4+ICsJZHJtX3BsYW5l
X2NyZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0eShwbGFuZSwgRFJNX01PREVfUk9UQVRFXzAsDQo+PiAr
CQkJCQkgICBzdXBwb3J0ZWRfcm90YXRpb25zKTsNCj4+ICsNCj4+ICAgCWRybV9wbGFuZV9oZWxw
ZXJfYWRkKHBsYW5lLCAmZG1fcGxhbmVfaGVscGVyX2Z1bmNzKTsNCj4+ICAgDQo+PiAgIAkvKiBD
cmVhdGUgKHJlc2V0KSB0aGUgcGxhbmUgc3RhdGUgKi8NCj4+DQo+IA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
