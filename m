Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DFADA93
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 15:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E160D89C8F;
	Mon,  9 Sep 2019 13:58:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C28A89C8F
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 13:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAgBDHY6DEsL67XVnoKBG61sCyPC1qR/VBlte86BhKC1C8AjKYvvgc1Nq3K+h4g6pDt5yjQEmTsu2AlLerBli/PuodJ4dwzl57yr4yuX3UhcJqE3MyLOzBxe+xTWa0h5dGm0fkVFKHCOdAYa71K8+8B7r+BPTEjUK1LLV4OB7+GdXq7NOMEctmCXyk9NlXwcVFesRQhkVhodDy9CCkLLhkJ/FPkphutwPbLimQ8odBvsFLkaYQ7VXAKPtNZWZJrXxk9xRTKtQ1NLsofPp7gv3fMKSxNeDOx60wym+GTJkiXJF0YHsIlZi9h6S2MeTYAjXb8l6uimUb3DU+zyjsVfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvQMPXY9xP6YWdKa8PvvfQx7Jq4/1BapAd57EHLtoM8=;
 b=BL5LNz39II5BbnrEQmArHlvc/PF/kGVYPryTa0MxKomde6JyBEzet1koWgI9LV+k5FbDhdJecKyqZjDxxPnDINj9aBr9pgI4XkP3G1BNytYjwxOkT+eKiC9yJkZDch7r1cpccGCwY8unUdbANLl4jl50juTIM/7Nz0YXyPSV3YDcZp3P9DzB6gE8VEXuX1MTCKQbcCzWKK/COIe0UWQGAxnsWx7hrfsdfHOWYji7ehnQSzgWfIA66KV/ikoUPzNDhc3lGh87Bc5zIbhUZh+/QgkRLDG3f6R1sVw3fUOsnFnE9xcYmTag4aZy4aqnICMA2GrtNGKPtbR3w2s8QzqHYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1677.namprd12.prod.outlook.com (10.172.56.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Mon, 9 Sep 2019 13:58:04 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::d1d4:fdff:728e:833b]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::d1d4:fdff:728e:833b%4]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 13:58:04 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Topic: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Index: AQHVYzHR2h3CIi5T9ECYFDcNflD/YKcb88AAgAdTBICAACAHgA==
Date: Mon, 9 Sep 2019 13:58:03 +0000
Message-ID: <4ebc27be-a403-0a0b-e9ff-4e5e18c5417c@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <20190904150230.13885-10-christian.koenig@amd.com>
 <844c2c90-8be4-df05-9df9-c9c9cde9b186@amd.com>
 <db73b357-b7e4-f818-e57c-234a45f7c5cb@gmail.com>
In-Reply-To: <db73b357-b7e4-f818-e57c-234a45f7c5cb@gmail.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15)
 To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41aef974-9605-4749-1a1f-08d7352dbbc8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1677; 
x-ms-traffictypediagnostic: MWHPR12MB1677:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1677719A0F83DF7AB69F1D54E6B70@MWHPR12MB1677.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(189003)(199004)(6512007)(26005)(11346002)(102836004)(7736002)(256004)(186003)(53936002)(386003)(316002)(3846002)(36756003)(14444005)(6506007)(5660300002)(6486002)(305945005)(2616005)(53546011)(110136005)(486006)(2906002)(476003)(14454004)(446003)(478600001)(6116002)(76176011)(66946007)(66476007)(66556008)(64756008)(66446008)(6436002)(71200400001)(66066001)(71190400001)(8936002)(81156014)(25786009)(6246003)(8676002)(2501003)(31696002)(86362001)(66574012)(81166006)(52116002)(229853002)(31686004)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1677;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vubua8lOdeXrdc+MXuWGyl9SlffJ4hV5YqE93mj+ZnJqZl60OR4WFoYLfipUvCCrHI2fTquKTTwJry7bw0oDiQP/twe5apDiW/qsdqZX043/whyeQRMmAj46vNR3THgBHAJGYKU7S7rdZVDcxH/a9zLgV1AL2mtQHNEFul5goWYjTrS1yGct132F6Jej/ncvlmX40Jsc9K8rObTvZIscmwUIV8nPEqs96vpZlV+aAR/VeMzkACzxA61+Bp4qarHfmfJx0ag0WGAZuaUZhwkNB8e43qGrocm3FvWlKAaNlZDo6cDZWJsU7WvFbx8qFEFzQUuTEAl8AkRozELn3n/qe0FWEEDQBs5htVOsQiMoB85yre/oGeRKC8m6SpGdzOxwqH3fPn1ZKJCgTL4/jSQaIOpNfcU5leKDVdoly5d6S0w=
Content-ID: <2420625777A3A54AB69637F5CA4F9AE0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aef974-9605-4749-1a1f-08d7352dbbc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 13:58:03.9057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5p/s4LY+CHKZwnlcLOA50UF0YRsCj2E4Xo3nSG0RZQdKGCoA6w36QrYm3aFV2pF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1677
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvQMPXY9xP6YWdKa8PvvfQx7Jq4/1BapAd57EHLtoM8=;
 b=q9r/EaUejTgPyql3Vl0Zzs6EweiTqsKac7NUYljL6y/Jc35e305Bf0E6EtxE2JkbInEls5STF9C6IbwRvq6MRjTYyVon+r7W24xhjaGk3Y6l1B9VTzZ9G2O3T/XSfQH/PbiVzuO5C59rRvO8wppTUDZb50a6mMKs1TOPHpknM/Q=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDktMDkgODowMyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBB
bSAwNC4wOS4xOSB1bSAyMjoxMiBzY2hyaWViIFlhbmcsIFBoaWxpcDoNCj4+IFRoaXMgc2VyaWVz
IGxvb2tzIG5pY2UgYW5kIGNsZWFyIGZvciBtZSwgdHdvIHF1ZXN0aW9ucyBlbWJlZGRlZCBiZWxv
dy4NCj4+DQo+PiBBcmUgd2UgZ29pbmcgdG8gdXNlIGRlZGljYXRlZCBzZG1hIHBhZ2UgcXVldWUg
Zm9yIGRpcmVjdCBWTSB1cGRhdGUgcGF0aA0KPj4gZHVyaW5nIGEgZmF1bHQ/DQo+Pg0KPj4gVGhh
bmtzLA0KPj4gUGhpbGlwDQo+Pg0KPj4gT24gMjAxOS0wOS0wNCAxMTowMiBhLm0uLCBDaHJpc3Rp
YW4gS8O2bmlnIHdyb3RlOg0KPj4+IE5leHQgc3RlcCB0b3dhcmRzIEhNTSBzdXBwb3J0LiBGb3Ig
bm93IGp1c3Qgc2lsZW5jZSB0aGUgcmV0cnkgZmF1bHQgYW5kDQo+Pj4gb3B0aW9uYWxseSByZWRp
cmVjdCB0aGUgcmVxdWVzdCB0byB0aGUgZHVtbXkgcGFnZS4NCj4+Pg0KPj4+IHYyOiBtYWtlIHN1
cmUgdGhlIFZNIGlzIG5vdCBkZXN0cm95ZWQgd2hpbGUgd2UgaGFuZGxlIHRoZSBmYXVsdC4NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4NCj4+PiAtLS0NCj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jIHwgNzQgDQo+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+PiDCoMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHzCoCAyICsNCj4+PiDCoMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmPCoCB8wqAgNCArKw0KPj4+IMKg
wqAgMyBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgDQo+Pj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPj4+IGluZGV4IDk1MTYwOGZjMTkyNS4u
NDEwZDg5OTY2YTY2IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMNCj4+PiBAQCAtMzE0MiwzICszMTQyLDc3IEBAIHZvaWQgYW1kZ3B1X3ZtX3NldF90YXNr
X2luZm8oc3RydWN0IGFtZGdwdV92bSANCj4+PiAqdm0pDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQ0KPj4+IMKgwqDCoMKgwqDCoCB9DQo+Pj4gwqDCoCB9DQo+Pj4gKw0KPj4+ICsvKioNCj4+
PiArICogYW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdCAtIGdyYWNlZnVsIGhhbmRsaW5nIG9mIFZNIGZh
dWx0cy4NCj4+PiArICogQGFkZXY6IGFtZGdwdSBkZXZpY2UgcG9pbnRlcg0KPj4+ICsgKiBAcGFz
aWQ6IFBBU0lEIG9mIHRoZSBWTQ0KPj4+ICsgKiBAYWRkcjogQWRkcmVzcyBvZiB0aGUgZmF1bHQN
Cj4+PiArICoNCj4+PiArICogVHJ5IHRvIGdyYWNlZnVsbHkgaGFuZGxlIGEgVk0gZmF1bHQuIFJl
dHVybiB0cnVlIGlmIHRoZSBmYXVsdCB3YXMgDQo+Pj4gaGFuZGxlZCBhbmQNCj4+PiArICogc2hv
dWxkbid0IGJlIHJlcG9ydGVkIGFueSBtb3JlLg0KPj4+ICsgKi8NCj4+PiArYm9vbCBhbWRncHVf
dm1faGFuZGxlX2ZhdWx0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBpbnQg
DQo+Pj4gcGFzaWQsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRf
dCBhZGRyKQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAm
YWRldi0+c2RtYS5pbnN0YW5jZVswXS5wYWdlOw0KPj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9i
byAqcm9vdDsNCj4+PiArwqDCoMKgIHVpbnQ2NF90IHZhbHVlLCBmbGFnczsNCj4+PiArwqDCoMKg
IHN0cnVjdCBhbWRncHVfdm0gKnZtOw0KPj4+ICvCoMKgwqAgbG9uZyByOw0KPj4+ICsNCj4+PiAr
wqDCoMKgIGlmICghcmluZy0+c2NoZWQucmVhZHkpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsNCj4+PiArDQo+Pj4gK8KgwqDCoCBzcGluX2xvY2soJmFkZXYtPnZtX21hbmFnZXIu
cGFzaWRfbG9jayk7DQo+Pj4gK8KgwqDCoCB2bSA9IGlkcl9maW5kKCZhZGV2LT52bV9tYW5hZ2Vy
LnBhc2lkX2lkciwgcGFzaWQpOw0KPj4+ICvCoMKgwqAgaWYgKHZtKQ0KPj4+ICvCoMKgwqDCoMKg
wqDCoCByb290ID0gYW1kZ3B1X2JvX3JlZih2bS0+cm9vdC5iYXNlLmJvKTsNCj4+PiArwqDCoMKg
IGVsc2UNCj4+PiArwqDCoMKgwqDCoMKgwqAgcm9vdCA9IE5VTEw7DQo+Pj4gK8KgwqDCoCBzcGlu
X3VubG9jaygmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrKTsNCj4+PiArDQo+Pj4gK8KgwqDC
oCBpZiAoIXJvb3QpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+PiArDQo+
Pj4gK8KgwqDCoCByID0gYW1kZ3B1X2JvX3Jlc2VydmUocm9vdCwgdHJ1ZSk7DQo+Pj4gK8KgwqDC
oCBpZiAocikNCj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl91bnJlZjsNCj4+PiArDQo+
Pj4gK8KgwqDCoCBzcGluX2xvY2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7DQo+Pj4g
K8KgwqDCoCB2bSA9IGlkcl9maW5kKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwgcGFzaWQp
Ow0KPj4+ICvCoMKgwqAgc3Bpbl91bmxvY2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7
DQo+Pj4gKw0KPj4gSGVyZSBnZXQgdm0gZnJvbSBwYXNpZCBzZWNvbmQgdGltZSwgYW5kIGNoZWNr
IGlmIFBEIGJvIGlzIGNoYW5nZWQsIGlzDQo+PiB0aGlzIHRvIGhhbmRsZSB2bSBmYXVsdCByYWNl
IHdpdGggdm0gZGVzdG9yeT8NCj4gDQo+IFllcywgZXhhY3RseS4NCj4gDQo+Pg0KPj4+ICvCoMKg
wqAgaWYgKCF2bSB8fCB2bS0+cm9vdC5iYXNlLmJvICE9IHJvb3QpDQo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGdvdG8gZXJyb3JfdW5sb2NrOw0KPj4+ICsNCj4+PiArwqDCoMKgIGFkZHIgLz0gQU1ER1BV
X0dQVV9QQUdFX1NJWkU7DQo+Pj4gK8KgwqDCoCBmbGFncyA9IEFNREdQVV9QVEVfVkFMSUQgfCBB
TURHUFVfUFRFX1NOT09QRUQgfA0KPj4+ICvCoMKgwqDCoMKgwqDCoCBBTURHUFVfUFRFX1NZU1RF
TTsNCj4+PiArDQo+Pj4gK8KgwqDCoCBpZiAoYW1kZ3B1X3ZtX2ZhdWx0X3N0b3AgPT0gQU1ER1BV
X1ZNX0ZBVUxUX1NUT1BfTkVWRVIpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgLyogUmVkaXJlY3Qg
dGhlIGFjY2VzcyB0byB0aGUgZHVtbXkgcGFnZSAqLw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB2YWx1
ZSA9IGFkZXYtPmR1bW15X3BhZ2VfYWRkcjsNCj4+PiArwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0g
QU1ER1BVX1BURV9FWEVDVVRBQkxFIHwgQU1ER1BVX1BURV9SRUFEQUJMRSB8DQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgQU1ER1BVX1BURV9XUklURUFCTEU7DQo+Pj4gK8KgwqDCoCB9IGVs
c2Ugew0KPj4+ICvCoMKgwqDCoMKgwqDCoCB2YWx1ZSA9IDA7DQo+Pj4gK8KgwqDCoCB9DQo+Pj4g
Kw0KPj4+ICvCoMKgwqAgciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwg
dHJ1ZSwgTlVMTCwgYWRkciwgYWRkciANCj4+PiArIDEsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzLCB2YWx1ZSwgTlVMTCwgTlVMTCk7DQo+Pj4gK8Kg
wqDCoCBpZiAocikNCj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl91bmxvY2s7DQo+Pj4g
Kw0KPj4gQWZ0ZXIgZmF1bHQgYWRkcmVzcyByZWRpcmVjdCB0byBkdW1teSBwYWdlLCB3aWxsIHRo
ZSBmYXVsdCByZWNvdmVyIGFuZA0KPj4gcmV0cnkgY29udGludWUgdG8gZXhlY3V0ZT8NCj4gDQo+
IFllcywgdGhlIHJlYWQvd3JpdGUgb3BlcmF0aW9uIHdpbGwganVzdCByZXRyeSBhbmQgdXNlIHRo
ZSB2YWx1ZSBmcm9tIHRoZSANCj4gZHVtbXkgcGFnZSBpbnN0ZWFkLg0KPiANCj4+IElzIHRoaXMg
ZGFuZ2Vyb3VzIHRvIHVwZGF0ZSBQVEUgdG8gdXNlIHN5c3RlbQ0KPj4gbWVtb3J5IGFkZHJlc3Mg
MD8NCj4gDQo+IFdoYXQgYXJlIHlvdSB0YWxraW5nIGFib3V0PyBUaGUgZHVtbXkgcGFnZSBpcyBh
IHBhZ2UgYWxsb2NhdGUgYnkgVFRNIA0KPiB3aGVyZSB3ZSByZWRpcmVjdCBmYXVsdHkgYWNjZXNz
ZXMgdG8uDQo+IA0KRm9yIGFtZGdwdV92bV9mYXVsdF9zdG9wIGVxdWFscyB0byBBTURHUFVfVk1f
RkFVTFRfU1RPUF9GSVJTVC9BTFdBWVMgDQpjYXNlLCB2YWx1ZSBpcyAwLCB0aGlzIHdpbGwgcmVk
aXJlY3QgdG8gc3lzdGVtIG1lbW9yeSAwLiBNYXliZSByZWRpcmVjdCANCmlzIG9ubHkgbmVlZGVk
IGZvciBBTURHUFVfVk1fRkFVTFRfU1RPUF9ORVZFUj8NCg0KUmVnYXJkcywNClBoaWxpcA0KDQo+
IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4gDQo+Pg0KPj4+ICvCoMKgwqAgciA9IGFtZGdwdV92
bV91cGRhdGVfcGRlcyhhZGV2LCB2bSwgdHJ1ZSk7DQo+Pj4gKw0KPj4+ICtlcnJvcl91bmxvY2s6
DQo+Pj4gK8KgwqDCoCBhbWRncHVfYm9fdW5yZXNlcnZlKHJvb3QpOw0KPj4+ICvCoMKgwqAgaWYg
KHIgPCAwKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIkNhbid0IGhhbmRsZSBwYWdl
IGZhdWx0ICglbGQpXG4iLCByKTsNCj4+PiArDQo+Pj4gK2Vycm9yX3VucmVmOg0KPj4+ICvCoMKg
wqAgYW1kZ3B1X2JvX3VucmVmKCZyb290KTsNCj4+PiArDQo+Pj4gK8KgwqDCoCByZXR1cm4gZmFs
c2U7DQo+Pj4gK30NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmggDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
aA0KPj4+IGluZGV4IDBhOTdkYzgzOWYzYi4uNGRiYmUxYjZiNDEzIDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4+PiBAQCAtNDEzLDYgKzQxMyw4IEBA
IHZvaWQgYW1kZ3B1X3ZtX2NoZWNrX2NvbXB1dGVfYnVnKHN0cnVjdCANCj4+PiBhbWRncHVfZGV2
aWNlICphZGV2KTsNCj4+PiDCoMKgIHZvaWQgYW1kZ3B1X3ZtX2dldF90YXNrX2luZm8oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2lnbmVkIA0KPj4+IGludCBwYXNpZCwNCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5m
byAqdGFza19pbmZvKTsNCj4+PiArYm9vbCBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBpbnQgDQo+Pj4gcGFzaWQsDQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBhZGRyKTsNCj4+PiDCoMKgIHZvaWQg
YW1kZ3B1X3ZtX3NldF90YXNrX2luZm8oc3RydWN0IGFtZGdwdV92bSAqdm0pOw0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIA0KPj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPj4+IGluZGV4IDlkMTU2NzlkZjZl
MC4uMTVhMWNlNTFiZWZhIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jDQo+Pj4gQEAgLTM1Myw2ICszNTMsMTAgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9j
ZXNzX2ludGVycnVwdChzdHJ1Y3QgDQo+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+PiDCoMKg
wqDCoMKgwqAgfQ0KPj4+IMKgwqDCoMKgwqDCoCAvKiBJZiBpdCdzIHRoZSBmaXJzdCBmYXVsdCBm
b3IgdGhpcyBhZGRyZXNzLCBwcm9jZXNzIGl0IA0KPj4+IG5vcm1hbGx5ICovDQo+Pj4gK8KgwqDC
oCBpZiAocmV0cnlfZmF1bHQgJiYgIWluX2ludGVycnVwdCgpICYmDQo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoYWRldiwgZW50cnktPnBhc2lkLCBhZGRyKSkNCj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7IC8qIFRoaXMgYWxzbyBwcmV2ZW50cyBzZW5kaW5n
IGl0IHRvIEtGRCAqLw0KPj4+ICsNCj4+PiDCoMKgwqDCoMKgwqAgaWYgKCFhbWRncHVfc3Jpb3Zf
dmYoYWRldikpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKiBJc3N1ZSBhIGR1bW15IHJlYWQgdG8gd2FpdCBmb3IgdGhlIHN0YXR1cyBy
ZWdpc3RlciB0bw0KPj4+DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
