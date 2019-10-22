Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE2E067C
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 16:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9D76E82C;
	Tue, 22 Oct 2019 14:33:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740085.outbound.protection.outlook.com [40.107.74.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B3A6E82C
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 14:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkQHT8CiaM4PY8cbE6ZwZS2OmnOd4lyfkVj3XMK+VMhvDZWxdftxWT1Bht0/fDyUCq26J5/URm2R3NjlDC8mPhDFiS6Ar5b/ktDhVD6alBS8/uRrDLklSsneQ99HUI3ffB4fWwknKZaAa6cSIGKhZTRHB5EGncZq19g125YbKbbADXICvraC4UUWnYPdVKVHtLSawIJi/1ZPYXdZxuSrFrFzMfKpCSXRZ3rbLRpoh1oHLn3iH2p5/kzfXUxU0ikM91lMzjHxPjv5hGfwkjAWqt1WblGRJ8VjjkHBprnqhaZEH2q90HGKbHjefHzBwiD+m6+qk+GDdhASns5F5lwaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEzqeQA7DoUOQEVgZBqzEVvNj+ydUjfLUyW62zyB6vo=;
 b=RBGgizLjCDBmrO0wLmXibJEVZ3Q+oYNYqYYV8x+mNwPNEJ5kH2emv2bODG2F/pWaFad1Psc+4qc42TrUjlxmSfkoNMXIlj+UdjXLhC53lSzPRGNvgNeBzWgqiRPzSWFMZzSbFyh4dyRio6aAsvWB18BzPe8+MoxtIanZntVbT17u/hzoviwVEoi6zdKp752oNfHv2Uaeii3a+fpvEzzfeWYSL6CUJHhQsfjIjDnc7gG4k7r14thsir75Gw5+lY/A3idpZFfkku6gFwkmGDh9dURaw1LDorr5/jHneRYs/i/RIyhD47iz6010a74PtVaUkWzdehjocLwor3/yKa0nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1952.namprd12.prod.outlook.com (10.175.56.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.21; Tue, 22 Oct 2019 14:33:12 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 14:33:12 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Topic: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Index: AQHVhfWbRo7uEKkCj0WnBEt1jfFPhKdkWBmAgAJnO4A=
Date: Tue, 22 Oct 2019 14:33:12 +0000
Message-ID: <236963ac-d383-209b-ba63-258fabf9bb02@amd.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
 <1571431711-30149-5-git-send-email-andrey.grodzovsky@amd.com>
 <BYAPR12MB2806716EFABC7A26DD9DABD5F1690@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2806716EFABC7A26DD9DABD5F1690@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 331192bd-2118-400f-5f4a-08d756fcc3fe
x-ms-traffictypediagnostic: MWHPR12MB1952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1952E90A27201A52AE9ADCF5EA680@MWHPR12MB1952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(13464003)(199004)(189003)(81156014)(102836004)(316002)(81166006)(305945005)(476003)(7736002)(14454004)(2501003)(25786009)(6486002)(110136005)(54906003)(5660300002)(486006)(11346002)(186003)(2616005)(8676002)(52116002)(446003)(76176011)(386003)(53546011)(6506007)(6246003)(31686004)(26005)(31696002)(6116002)(478600001)(66066001)(256004)(6512007)(86362001)(8936002)(3846002)(561944003)(66946007)(99286004)(14444005)(66446008)(6436002)(66476007)(64756008)(4326008)(66556008)(2906002)(229853002)(71200400001)(71190400001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1952;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FyWLEtMaYS+BcbJKbBrsvUU4KzA7fe2lhN6xhirwjzEiotrboK2UvpMxW8jDtNtOPYStZR3APkdV+OlRrwG/i+b4w9r8eeEjAXtk/jY+ii4hQMlGF+JuPkc5/hicBU+et8vdZ/cwEj0wbpfMdM8EgyusaSNyQprDfeRwR5JDIKiGiv/oBDsjxJVyvokxsAadiZEVlU/hTmyKZzS57/rHdlBzZ5yqZlcIeChIm8i6I6DlfTlp3QxmsSN9MkTyW1gDTrxSN0Fam79qcNSYW1OuOOfhSEosjeTdH2XtKA5mO8aGZQ913+EQkYZHGQ3UoVzbtsmM8p84r33HBubjC7Ew/YNr93Qj+sQMNLeja42pJxZ0B9jkrNUNi/MUAMarsWBeCYpTsHN20rwSzopnb96FmU68N9UcZjbnb8t4Fqp10SHTD+Z4/t/Ue2j6+1jOxJy5
Content-ID: <06F5EB549716E242BA633D4B47F85238@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331192bd-2118-400f-5f4a-08d756fcc3fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 14:33:12.0407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgnh5BGMirhOhZISqeEJrA3CQmLKb2TP6y9NAF/Cjpu/quDXFJpO/PW8ZVboruTX4+EykhDMyViExcF0V4nmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEzqeQA7DoUOQEVgZBqzEVvNj+ydUjfLUyW62zyB6vo=;
 b=Ja3vgZeROtmnQRfxWN7OUyjVIQ97MMuThRiQc8WS/Oa2yAyGTVn3cwgBBjNX8kpUi3jjYkYrwW2PHH/MHlvmUo0JpURTYTWHKte/h6ih/92ueHlGDixED9k3s+Q0o/mLdl0+lPcoX1HiLDwYEofu0ARmToll67ZKOGVRwCWDVXc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "noreply-confluence@amd.com" <noreply-confluence@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBhbSB3ZWxsIGF3YXJlIHRoYXQgd2Ugd2FudCB0byBkbyBpdCBBU0FQLCBidXQgd2hhdCBpcyB5
b3VyIHN1Z2dlc3Rpb24gDQpmb3IgdGhlIEFyY3R1cnVzIHVzZSBjYXNlIHdoZXJlIHdlIGhhdmUg
dG8gZG8gaXQgQUZURVIgU01VIGlzIHVwIGFuZCANCnJ1bm5pbmcgPyBEbyB5b3Ugd2FudCB0byBj
YWxsIGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdCBpbiB0d28gZGlmZmVyZW50IA0KcGxhY2VzIGRl
cGVuZGluZyBpZiB0aGlzIGlzIFZlZ2EgMjAgb3IgQXJjdHVydXMgPyBUaGlzIHdpbGwgb3ZlciAN
CmNvbXBsaWNhdGUgYW4gYWxyZWFkeSBjb21wbGljYXRlZCBpbml0IHNlcXVlbmNlIG9mIFJBUy4N
Cg0KQW5kcmV5DQoNCk9uIDEwLzIwLzE5IDk6NTEgUE0sIENoZW4sIEd1Y2h1biB3cm90ZToNCj4g
SSBkb24ndCB0aGluayBwb3N0cG9uZSBSQVMgcmVjb3ZlcnkgaW5pdCBpcyBub3Qgb25lIHJlYXNv
bmFibGUgcHJvcG9zYWwuIFdoYXQgd2UgZG8gaW4gcmVjb3ZlcnkgaW5pdCBpcyB0byByZWFkIHRo
ZSByZXRpcmVkIHBhZ2UgaWYgdGhlcmUgaXMsIGFuZCByZXRpcmUgY29ycmVzcG9uZGluZyBtZW1v
cnksIHRoaXMgd2lsbCBtYWtlIHN1cmUgdGhlc2UgcGFnZXMgYXJlIHJlc2VydmVkIHdlbGwgYmVm
b3JlIHNldHRpbmcgdXAgbWVtb3J5IG1hbmFnZXIgYW5kIHJlc2VydmluZyBvdGhlciBtZW1vcnkg
YmxvY2tzLCBpdCB3aWxsIGJlIHNhZmUuDQo+DQo+IFJlZ2FyZHMsDQo+IEd1Y2h1bg0KPg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5k
cmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIE9jdG9iZXIgMTksIDIw
MTkgNDo0OSBBTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IENo
ZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBh
bWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
bm9yZXBseS1jb25mbHVlbmNlQGFtZC5jb207IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29t
PjsgR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggNC80XSBkcm0vYW1kZ3B1OiBNb3ZlIGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5p
dCB0byBhZnRlciBTTVUgcmVhZHkuDQo+DQo+IEZvciBBcmN0dXJ1cyB0aGUgSTJDIHRyYWZmaWMg
aXMgZG9uZSB0aHJvdWdoIFNNVSB0YWJsZXMgYW5kIHNvIHdlIG11c3QgcG9zdHBvbmUgUkFTIHJl
Y292ZXJ5IGluaXQgdG8gYWZ0ZXIgdGhleSBhcmUgcmVhZHkgd2hpY2ggaXMgaW4gYW1kZ3B1X2Rl
dmljZV9pcF9od19pbml0X3BoYXNlMi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6
b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEzICsrKysrKysrKysrKysNCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgfCAxMSAtLS0tLS0tLS0t
LQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gaW5k
ZXggMTdjZmRhZi4uYzQwZTlhNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYw0KPiBAQCAtMTg1MCw2ICsxODUwLDE5IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2RldmljZV9pcF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAlpZiAo
cikNCj4gICAJCWdvdG8gaW5pdF9mYWlsZWQ7DQo+ICAgDQo+ICsJLyoNCj4gKwkgKiByZXRpcmVk
IHBhZ2VzIHdpbGwgYmUgbG9hZGVkIGZyb20gZWVwcm9tIGFuZCByZXNlcnZlZCBoZXJlLA0KPiAr
CSAqIGl0IHNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgYW1kZ3B1X2RldmljZV9pcF9od19pbml0X3Bo
YXNlMiAgc2luY2UNCj4gKwkgKiBmb3Igc29tZSBBU0lDcyB0aGUgUkFTIEVFUFJPTSBjb2RlIHJl
bGllcyBvbiBTTVUgZnVsbHkgZnVuY3Rpb25pbmcNCj4gKwkgKiBmb3IgSTJDIGNvbW11bmljYXRp
b24gd2hpY2ggb25seSB0cnVlIGF0IHRoaXMgcG9pbnQuDQo+ICsJICogcmVjb3ZlcnlfaW5pdCBt
YXkgZmFpbCwgYnV0IGl0IGNhbiBmcmVlIGFsbCByZXNvdXJjZXMgYWxsb2NhdGVkIGJ5DQo+ICsJ
ICogaXRzZWxmIGFuZCBpdHMgZmFpbHVyZSBzaG91bGQgbm90IHN0b3AgYW1kZ3B1IGluaXQgcHJv
Y2Vzcy4NCj4gKwkgKg0KPiArCSAqIE5vdGU6IHRoZW9yZXRpY2FsbHksIHRoaXMgc2hvdWxkIGJl
IGNhbGxlZCBiZWZvcmUgYWxsIHZyYW0gYWxsb2NhdGlvbnMNCj4gKwkgKiB0byBwcm90ZWN0IHJl
dGlyZWQgcGFnZSBmcm9tIGFidXNpbmcNCj4gKwkgKi8NCj4gKwlhbWRncHVfcmFzX3JlY292ZXJ5
X2luaXQoYWRldik7DQo+ICsNCj4gICAJaWYgKGFkZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9u
b2RlcyA+IDEpDQo+ICAgCQlhbWRncHVfeGdtaV9hZGRfZGV2aWNlKGFkZXYpOw0KPiAgIAlhbWRn
cHVfYW1ka2ZkX2RldmljZV9pbml0KGFkZXYpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jDQo+IGluZGV4IDJlODVhNTEuLjEwNDVjM2YgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gQEAgLTE3MjEsMTcgKzE3MjEsNiBAQCBp
bnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgI2VuZGlmDQo+
ICAgDQo+ICAgCS8qDQo+IC0JICogcmV0aXJlZCBwYWdlcyB3aWxsIGJlIGxvYWRlZCBmcm9tIGVl
cHJvbSBhbmQgcmVzZXJ2ZWQgaGVyZSwNCj4gLQkgKiBpdCBzaG91bGQgYmUgY2FsbGVkIGFmdGVy
IHR0bSBpbml0IHNpbmNlIG5ldyBibyBtYXkgYmUgY3JlYXRlZCwNCj4gLQkgKiByZWNvdmVyeV9p
bml0IG1heSBmYWlsLCBidXQgaXQgY2FuIGZyZWUgYWxsIHJlc291cmNlcyBhbGxvY2F0ZWQgYnkN
Cj4gLQkgKiBpdHNlbGYgYW5kIGl0cyBmYWlsdXJlIHNob3VsZCBub3Qgc3RvcCBhbWRncHUgaW5p
dCBwcm9jZXNzLg0KPiAtCSAqDQo+IC0JICogTm90ZTogdGhlb3JldGljYWxseSwgdGhpcyBzaG91
bGQgYmUgY2FsbGVkIGJlZm9yZSBhbGwgdnJhbSBhbGxvY2F0aW9ucw0KPiAtCSAqIHRvIHByb3Rl
Y3QgcmV0aXJlZCBwYWdlIGZyb20gYWJ1c2luZw0KPiAtCSAqLw0KPiAtCWFtZGdwdV9yYXNfcmVj
b3ZlcnlfaW5pdChhZGV2KTsNCj4gLQ0KPiAtCS8qDQo+ICAgCSAqVGhlIHJlc2VydmVkIHZyYW0g
Zm9yIGZpcm13YXJlIG11c3QgYmUgcGlubmVkIHRvIHRoZSBzcGVjaWZpZWQNCj4gICAJICpwbGFj
ZSBvbiB0aGUgVlJBTSwgc28gcmVzZXJ2ZSBpdCBlYXJseS4NCj4gICAJICovDQo+IC0tDQo+IDIu
Ny40DQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
