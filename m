Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8DE0FA1
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Oct 2019 03:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F716E943;
	Wed, 23 Oct 2019 01:24:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500586E943
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 01:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKnZHNgrsKd3jRAWnUHqfkJLfNSD3AJK1DGlqg3m6dRPxPjwN2ZH9pTeGuysjywLqLGMkDNe+IOrwowffPIBuxm2m4mXSX+YMooJ+92sm2ZftAG1tudbJwMa5kpAxNdlcum93zjAA1Su9qPecIGOqv6XbPmc1HPT067MTiM6FqoCE8gN4DiWCFKrNaktfpL3UEl9Gq6/Im+6ryLhqGrOS2XIsJAxiRKQbMu5m4AzgDlN+72vhZ7ll6hnlnOle/WIWrQn4RmH300PDfaMQFScaTq+1jjlZvHPBHqpVfBqCndD0YfbGSmzmYuoHcSjxLteb33w4CcgEcHkE1aAJjXRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDP08rtwOn9SUkUkVhUG+0C5s5WmLA2kKHs4U1THJY8=;
 b=FF37dHEviDyMpSd/ag1bhI+32tKGz5Pr6Wa3sT0MaCf8zKvsm58dDB6W0x6Eur8DKeErgpypYX5tC6npEhMZGcjWl318m9wf5cbUfjfFnM7l9SzAdJf6JNqxCHf0ABy9TUJiuDcRotyrhKtv38S1tiQQnhNOQww1oUEBeRTreA24VcxCrhrfnKmLlC/qKY34/OW7Rqe2ydHpGyxkcW0bkDyYC2ij6Xe9mjutuu2pl7suhwtZK/MoTrNNfTfCncKmDTAAlFoUpO5tKeNTB5Nex1dz+rDPGNiMydIJ9zlq5Ze6/Rua3qQ5KlkiZNExZAocRHa+tbTXUY/rj8r9mYkcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2597.namprd12.prod.outlook.com (20.176.254.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 23 Oct 2019 01:24:07 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 01:24:07 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Topic: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Index: AQHVhfWbSLeAiGCd9EKnIRhe+GTWP6dkVmBwgAJo+ACAALOIAA==
Date: Wed, 23 Oct 2019 01:24:06 +0000
Message-ID: <BYAPR12MB2806118F74D10CE12023C97DF16B0@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
 <1571431711-30149-5-git-send-email-andrey.grodzovsky@amd.com>
 <BYAPR12MB2806716EFABC7A26DD9DABD5F1690@BYAPR12MB2806.namprd12.prod.outlook.com>
 <236963ac-d383-209b-ba63-258fabf9bb02@amd.com>
In-Reply-To: <236963ac-d383-209b-ba63-258fabf9bb02@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eea1db33-b960-4b19-607b-08d75757b2fd
x-ms-traffictypediagnostic: BYAPR12MB2597:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2597EEAAAC0BBD8B62574A2AF16B0@BYAPR12MB2597.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(199004)(189003)(13464003)(99286004)(478600001)(81156014)(86362001)(186003)(6506007)(53546011)(102836004)(4326008)(25786009)(52536014)(26005)(5660300002)(229853002)(6436002)(8936002)(8676002)(33656002)(305945005)(561944003)(66066001)(7736002)(74316002)(81166006)(14454004)(476003)(110136005)(11346002)(316002)(256004)(55016002)(486006)(54906003)(6116002)(7696005)(71190400001)(71200400001)(76116006)(2501003)(6246003)(3846002)(2906002)(9686003)(66556008)(66946007)(66476007)(446003)(76176011)(64756008)(66446008)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2597;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ly/bP5Q0B8HPgzdn4SQ5o7utx/PBz/VZax4hMmPSeAe6tOiygDWyMjH5Kd1BHTILA9M3zLTfKhZxHMyn7gpHqLOhVWcsvg6CD2iAaiNgpaAugnTSeFdrYVEhHHi1n40586PbylzJSBIh9qMCbLF0HrVkPcRGw+xWqDqFqlFLd6kdVR0k7+NUe4yNMCu+wIHtzBP90TPaak5u+1Ibe7oGhH9lSkh8lKkta33IDXVYAQFdDouYebQAhyt9SCDkpMOdPx7wfbvjEfccs+rXH2vqSqbjvUNmpAbB8HqBh1fkkvTAC0cmESvXy03Xy4nfQeXgEdKIaM58DmO7fJxebtwyG+c+jHWCrGt/6GxfPdoKVQlFBklutqYtC7XCvRB/DXdGwTiEhxfB6VbDUJJW/BujjqrpD6rEn5bdayMNYxACMpA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea1db33-b960-4b19-607b-08d75757b2fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 01:24:06.2341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCDDXcfxilpeOY368B0HnckUUgmEke9TaOqnUgdZLjGvKjQHe6tYdTRc6cBjrvTIpGF9ATLYYFaQvVKodiVWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2597
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDP08rtwOn9SUkUkVhUG+0C5s5WmLA2kKHs4U1THJY8=;
 b=tq0Wqu3AEOWYzpKxqNQrSu00x6fYGy+dRGb4NoQHQW3mo0tCI5x87perOzkjvYp7NBA3LwEfXhLh2ZHOMiaOmDpwoh4EYQa6MYuXyQHSZD0S4oysAaj4MlHQre53S6z8CR9ccdSeuN4XAeQgzaQyB0cgG7GOcBhdBqfuPNhe9AQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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

SGkgQW5kcmV5LA0KDQpObywgSSBkb24ndCB3YW50IHRvIHNlZSBhbWRncHVfcmFzX3JlY292ZXJ5
X2luaXQgYmVpbmcgY2FsbGVkIGF0IGRpZmZlcmVudCBwbGFjZXMuDQpJZiBjYWxsaW5nIGFtZGdw
dV9yYXNfcmVjb3ZlcnlfaW5pdCBhcyBtdWNoIGVhcmx5IGFzIHdlIGNhbiBpcyBub3QgZG9hYmxl
LCBkdWUgdG8gYXJjdHVydXMgaTJjIGNvZGUgcmVhZHkgdGltZWxpbmUsIEkgYW0gZmluZSB3aXRo
IHRoaXMgcGF0Y2guDQoNClJlZ2FyZHMsDQpHdWNodW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNv
bT4gDQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDIyLCAyMDE5IDEwOjMzIFBNDQpUbzogQ2hlbiwg
R3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRl
ciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IG5vcmVwbHktY29uZmx1ZW5jZUBhbWQuY29t
OyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggNC80
XSBkcm0vYW1kZ3B1OiBNb3ZlIGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdCB0byBhZnRlciBTTVUg
cmVhZHkuDQoNCkkgYW0gd2VsbCBhd2FyZSB0aGF0IHdlIHdhbnQgdG8gZG8gaXQgQVNBUCwgYnV0
IHdoYXQgaXMgeW91ciBzdWdnZXN0aW9uIGZvciB0aGUgQXJjdHVydXMgdXNlIGNhc2Ugd2hlcmUg
d2UgaGF2ZSB0byBkbyBpdCBBRlRFUiBTTVUgaXMgdXAgYW5kIHJ1bm5pbmcgPyBEbyB5b3Ugd2Fu
dCB0byBjYWxsIGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdCBpbiB0d28gZGlmZmVyZW50IHBsYWNl
cyBkZXBlbmRpbmcgaWYgdGhpcyBpcyBWZWdhIDIwIG9yIEFyY3R1cnVzID8gVGhpcyB3aWxsIG92
ZXIgY29tcGxpY2F0ZSBhbiBhbHJlYWR5IGNvbXBsaWNhdGVkIGluaXQgc2VxdWVuY2Ugb2YgUkFT
Lg0KDQpBbmRyZXkNCg0KT24gMTAvMjAvMTkgOTo1MSBQTSwgQ2hlbiwgR3VjaHVuIHdyb3RlOg0K
PiBJIGRvbid0IHRoaW5rIHBvc3Rwb25lIFJBUyByZWNvdmVyeSBpbml0IGlzIG5vdCBvbmUgcmVh
c29uYWJsZSBwcm9wb3NhbC4gV2hhdCB3ZSBkbyBpbiByZWNvdmVyeSBpbml0IGlzIHRvIHJlYWQg
dGhlIHJldGlyZWQgcGFnZSBpZiB0aGVyZSBpcywgYW5kIHJldGlyZSBjb3JyZXNwb25kaW5nIG1l
bW9yeSwgdGhpcyB3aWxsIG1ha2Ugc3VyZSB0aGVzZSBwYWdlcyBhcmUgcmVzZXJ2ZWQgd2VsbCBi
ZWZvcmUgc2V0dGluZyB1cCBtZW1vcnkgbWFuYWdlciBhbmQgcmVzZXJ2aW5nIG90aGVyIG1lbW9y
eSBibG9ja3MsIGl0IHdpbGwgYmUgc2FmZS4NCj4NCj4gUmVnYXJkcywNCj4gR3VjaHVuDQo+DQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJleSBHcm9kem92c2t5IDxh
bmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgT2N0b2JlciAxOSwg
MjAxOSA0OjQ5IEFNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
Q2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgWmhvdTEsIFRhbyANCj4gPFRhby5a
aG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPjsgDQo+IG5vcmVwbHktY29uZmx1ZW5jZUBhbWQuY29tOyBRdWFuLCBFdmFuIDxFdmFuLlF1
YW5AYW1kLmNvbT47IA0KPiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFt
ZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCA0LzRdIGRybS9hbWRncHU6IE1vdmUgYW1kZ3B1X3Jh
c19yZWNvdmVyeV9pbml0IHRvIGFmdGVyIFNNVSByZWFkeS4NCj4NCj4gRm9yIEFyY3R1cnVzIHRo
ZSBJMkMgdHJhZmZpYyBpcyBkb25lIHRocm91Z2ggU01VIHRhYmxlcyBhbmQgc28gd2UgbXVzdCBw
b3N0cG9uZSBSQVMgcmVjb3ZlcnkgaW5pdCB0byBhZnRlciB0aGV5IGFyZSByZWFkeSB3aGljaCBp
cyBpbiBhbWRncHVfZGV2aWNlX2lwX2h3X2luaXRfcGhhc2UyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMTMgKysrKysr
KysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICB8
IDExIC0tLS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMNCj4gaW5kZXggMTdjZmRhZi4uYzQwZTlhNSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBAQCAtMTg1MCw2ICsxODUwLDE5
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KPiAgIAlpZiAocikNCj4gICAJCWdvdG8gaW5pdF9mYWlsZWQ7DQo+ICAgDQo+ICsJ
LyoNCj4gKwkgKiByZXRpcmVkIHBhZ2VzIHdpbGwgYmUgbG9hZGVkIGZyb20gZWVwcm9tIGFuZCBy
ZXNlcnZlZCBoZXJlLA0KPiArCSAqIGl0IHNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgYW1kZ3B1X2Rl
dmljZV9pcF9od19pbml0X3BoYXNlMiAgc2luY2UNCj4gKwkgKiBmb3Igc29tZSBBU0lDcyB0aGUg
UkFTIEVFUFJPTSBjb2RlIHJlbGllcyBvbiBTTVUgZnVsbHkgZnVuY3Rpb25pbmcNCj4gKwkgKiBm
b3IgSTJDIGNvbW11bmljYXRpb24gd2hpY2ggb25seSB0cnVlIGF0IHRoaXMgcG9pbnQuDQo+ICsJ
ICogcmVjb3ZlcnlfaW5pdCBtYXkgZmFpbCwgYnV0IGl0IGNhbiBmcmVlIGFsbCByZXNvdXJjZXMg
YWxsb2NhdGVkIGJ5DQo+ICsJICogaXRzZWxmIGFuZCBpdHMgZmFpbHVyZSBzaG91bGQgbm90IHN0
b3AgYW1kZ3B1IGluaXQgcHJvY2Vzcy4NCj4gKwkgKg0KPiArCSAqIE5vdGU6IHRoZW9yZXRpY2Fs
bHksIHRoaXMgc2hvdWxkIGJlIGNhbGxlZCBiZWZvcmUgYWxsIHZyYW0gYWxsb2NhdGlvbnMNCj4g
KwkgKiB0byBwcm90ZWN0IHJldGlyZWQgcGFnZSBmcm9tIGFidXNpbmcNCj4gKwkgKi8NCj4gKwlh
bWRncHVfcmFzX3JlY292ZXJ5X2luaXQoYWRldik7DQo+ICsNCj4gICAJaWYgKGFkZXYtPmdtYy54
Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpDQo+ICAgCQlhbWRncHVfeGdtaV9hZGRfZGV2aWNl
KGFkZXYpOw0KPiAgIAlhbWRncHVfYW1ka2ZkX2RldmljZV9pbml0KGFkZXYpOw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBpbmRleCAyZTg1YTUxLi4xMDQ1
YzNmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IEBA
IC0xNzIxLDE3ICsxNzIxLDYgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikgIA0KPiAjZW5kaWYNCj4gICANCj4gICAJLyoNCj4gLQkgKiByZXRpcmVkIHBh
Z2VzIHdpbGwgYmUgbG9hZGVkIGZyb20gZWVwcm9tIGFuZCByZXNlcnZlZCBoZXJlLA0KPiAtCSAq
IGl0IHNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgdHRtIGluaXQgc2luY2UgbmV3IGJvIG1heSBiZSBj
cmVhdGVkLA0KPiAtCSAqIHJlY292ZXJ5X2luaXQgbWF5IGZhaWwsIGJ1dCBpdCBjYW4gZnJlZSBh
bGwgcmVzb3VyY2VzIGFsbG9jYXRlZCBieQ0KPiAtCSAqIGl0c2VsZiBhbmQgaXRzIGZhaWx1cmUg
c2hvdWxkIG5vdCBzdG9wIGFtZGdwdSBpbml0IHByb2Nlc3MuDQo+IC0JICoNCj4gLQkgKiBOb3Rl
OiB0aGVvcmV0aWNhbGx5LCB0aGlzIHNob3VsZCBiZSBjYWxsZWQgYmVmb3JlIGFsbCB2cmFtIGFs
bG9jYXRpb25zDQo+IC0JICogdG8gcHJvdGVjdCByZXRpcmVkIHBhZ2UgZnJvbSBhYnVzaW5nDQo+
IC0JICovDQo+IC0JYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KGFkZXYpOw0KPiAtDQo+IC0JLyoN
Cj4gICAJICpUaGUgcmVzZXJ2ZWQgdnJhbSBmb3IgZmlybXdhcmUgbXVzdCBiZSBwaW5uZWQgdG8g
dGhlIHNwZWNpZmllZA0KPiAgIAkgKnBsYWNlIG9uIHRoZSBWUkFNLCBzbyByZXNlcnZlIGl0IGVh
cmx5Lg0KPiAgIAkgKi8NCj4gLS0NCj4gMi43LjQNCj4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
