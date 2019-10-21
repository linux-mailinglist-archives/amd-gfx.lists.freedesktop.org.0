Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB71DED77
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 15:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7546E0BF;
	Mon, 21 Oct 2019 13:24:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF536E0BF
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 13:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBfETN3NiylmHYhrWrhAlLC9TPB7we7xuAUl60agN5tflFT06Vbp9uWCxZkQdRG7uONGVKingrsN6LgzOcdHCWjnOwG14TyLlLTNxNI1/g2B/d/CiiEqtjv98Qx+yr/jTJHV55SZSpdVfEcsK6um9GXog7zSGbNy9YqvlAuhneFRBC2WOKxUFetjE5zHvxCPcI4IDF1vaYCLE15owg8AV4EtSr455KRCbpZb/I9yj7iM5I0MayaRfTss2y2j3LucQ85ivh/LWyC0iI12uaYTZp13nkfaef5T9kxu97DTqUPoTAIeJe5ePvWP3vOlOZFg9JXZGn1JwJ13j7sXtgBzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLb0PZcCI0MR7+nkIV9RsqlMOD1zcDrwAgw10X8Mp9s=;
 b=C84Tz54npYs0yqEPtpILEapwZ9rVXPxlmgNGPa2i/BEoekJieh7jfC4gzHABNNjNNifhxrpqvbyCEg7/K0xa16gk7FfwOlleD1pl63HczlOzAayPzhjCGxEQHAnwpft/c0Q2cNb5EdR5L4uanrfHP97TfxtCWRMKNc9jcG/418TQj1HMPFzxlGCGGUxCmXjV9kzOjbtZ0EbWxRzPzPPQMumhpB1/dMKAJOHi7LDYINFttQXItAsGcjQmVyFRC7mROt0+Nj59JQFqWmtbB/2ta86d/iZOaAy2WQoYaRIFJ+WncQGBjEROCntUXlvOwCbWYbTBwtK6ZijcEXnZKwVWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1410.namprd12.prod.outlook.com (10.168.225.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Mon, 21 Oct 2019 13:24:15 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Mon, 21 Oct
 2019 13:24:15 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Topic: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Index: AQHVhfWbvfNNVjo3+ESljqkEYlWnI6dlGazg
Date: Mon, 21 Oct 2019 13:24:15 +0000
Message-ID: <BN6PR12MB18099B077B0BF6996BD1A0ADF7690@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
 <1571431711-30149-5-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1571431711-30149-5-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e40f1e35-8571-487e-1c74-08d75629f80c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1410:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1410A8A6C61D86BF2FAB0CACF7690@BN6PR12MB1410.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(13464003)(305945005)(7736002)(6116002)(3846002)(74316002)(6246003)(4326008)(7696005)(99286004)(71200400001)(76176011)(71190400001)(110136005)(54906003)(316002)(6436002)(9686003)(229853002)(55016002)(2906002)(25786009)(478600001)(81156014)(81166006)(8676002)(8936002)(86362001)(446003)(14454004)(33656002)(52536014)(5660300002)(6506007)(53546011)(102836004)(26005)(14444005)(256004)(2501003)(66066001)(486006)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(11346002)(476003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1410;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 04s+fP+su/ZzRKEdi3CtmTWix4mb/gLkBNbtOpQf/ZQXP6AHoNJuCTcupP6hmFAlLCtI0fDGDNYY9s7iwxHw8Qv0h80Zti8jEf6ZqcjFMLx0INbGecVIa446Jlu9rXODImKetDcIdOr7PPrQwLJ94ch7bWhxk1sZUYk9VQ8QPUWrABIhxB7ZWe8xUKR4UjfnVfCp13thWawUKo3mlKKN2CAO/9DQ1UgcUO2iA87BRaNkTGp2l3L2xd/J0uGVVQyIL+fZmlddS8o7qbzeB0qS4ErUPTvQR/hC/3YetczgIB4fmZYWl4NsLyEBxWJ8toaYJsWYs4roBFDQtdLwQUmc2OPM3c6hoCmOpkN3wx7IIrqRkTMln+ZDyLnBQfvRZ4PVio7XuRyL9CrgTISIRC7Xai+ulr9tSIGSTazfAozmYOK03vYQ4d02C6oG1TGwIY0L
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40f1e35-8571-487e-1c74-08d75629f80c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 13:24:15.0466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WJwKylO7KQfNZelCqRXl9bTBjRWfOCRpJDS4MtjuV4zIxtcjlNsFr+LqeyQAd2TyPdjR8Scl/SsCs3esdCHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLb0PZcCI0MR7+nkIV9RsqlMOD1zcDrwAgw10X8Mp9s=;
 b=zWBYc29Efpuh5joRJUgE7mF3Swjhlcrk8udQi9xEHxRLSXsdlfW6j/Z7h58LBiwrtbZiM+Rb1mU0giCUtawYNCarKR+GGLjeZK9rnoRPJ/sgmBvs+v8pFtWAnBsBZQ0F5GiWIXV60TxHWVZdZYiqB8IZVg5Q4vwy96dJPwkvavA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>,
 "noreply-confluence@amd.com" <noreply-confluence@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFuZHJleSBHcm9kem92c2t5IDxh
bmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxOCwgMjAx
OSA0OjQ5IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENoZW4s
IEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8KPiA8VGFvLlpob3UxQGFt
ZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIKPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IG5vcmVwbHktY29uZmx1ZW5jZUBhbWQuY29tOyBRdWFuLAo+IEV2YW4gPEV2YW4uUXVhbkBhbWQu
Y29tPjsgR3JvZHpvdnNreSwgQW5kcmV5Cj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+Cj4g
U3ViamVjdDogW1BBVENIIDQvNF0gZHJtL2FtZGdwdTogTW92ZSBhbWRncHVfcmFzX3JlY292ZXJ5
X2luaXQgdG8KPiBhZnRlciBTTVUgcmVhZHkuCj4gCj4gRm9yIEFyY3R1cnVzIHRoZSBJMkMgdHJh
ZmZpYyBpcyBkb25lIHRocm91Z2ggU01VIHRhYmxlcyBhbmQgc28gd2UgbXVzdAo+IHBvc3Rwb25l
IFJBUyByZWNvdmVyeSBpbml0IHRvIGFmdGVyIHRoZXkgYXJlIHJlYWR5IHdoaWNoIGlzIGluCj4g
YW1kZ3B1X2RldmljZV9pcF9od19pbml0X3BoYXNlMi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxMyArKysrKysrKysrKysrCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICB8IDExIC0tLS0tLS0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5k
ZXggMTdjZmRhZi4uYzQwZTlhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKPiBAQCAtMTg1MCw2ICsxODUwLDE5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RldmljZV9pcF9pbml0KHN0cnVjdAo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIAlpZiAocikK
PiAgCQlnb3RvIGluaXRfZmFpbGVkOwo+IAo+ICsJLyoKPiArCSAqIHJldGlyZWQgcGFnZXMgd2ls
bCBiZSBsb2FkZWQgZnJvbSBlZXByb20gYW5kIHJlc2VydmVkIGhlcmUsCj4gKwkgKiBpdCBzaG91
bGQgYmUgY2FsbGVkIGFmdGVyIGFtZGdwdV9kZXZpY2VfaXBfaHdfaW5pdF9waGFzZTIgIHNpbmNl
Cj4gKwkgKiBmb3Igc29tZSBBU0lDcyB0aGUgUkFTIEVFUFJPTSBjb2RlIHJlbGllcyBvbiBTTVUg
ZnVsbHkKPiBmdW5jdGlvbmluZwo+ICsJICogZm9yIEkyQyBjb21tdW5pY2F0aW9uIHdoaWNoIG9u
bHkgdHJ1ZSBhdCB0aGlzIHBvaW50Lgo+ICsJICogcmVjb3ZlcnlfaW5pdCBtYXkgZmFpbCwgYnV0
IGl0IGNhbiBmcmVlIGFsbCByZXNvdXJjZXMgYWxsb2NhdGVkIGJ5Cj4gKwkgKiBpdHNlbGYgYW5k
IGl0cyBmYWlsdXJlIHNob3VsZCBub3Qgc3RvcCBhbWRncHUgaW5pdCBwcm9jZXNzLgo+ICsJICoK
PiArCSAqIE5vdGU6IHRoZW9yZXRpY2FsbHksIHRoaXMgc2hvdWxkIGJlIGNhbGxlZCBiZWZvcmUg
YWxsIHZyYW0gYWxsb2NhdGlvbnMKPiArCSAqIHRvIHByb3RlY3QgcmV0aXJlZCBwYWdlIGZyb20g
YWJ1c2luZwo+ICsJICovCj4gKwlhbWRncHVfcmFzX3JlY292ZXJ5X2luaXQoYWRldik7Cj4gKwo+
ICAJaWYgKGFkZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpCj4gIAkJYW1kZ3B1
X3hnbWlfYWRkX2RldmljZShhZGV2KTsKPiAgCWFtZGdwdV9hbWRrZmRfZGV2aWNlX2luaXQoYWRl
dik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gaW5kZXggMmU4
NWE1MS4uMTA0NWMzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMKPiBAQCAtMTcyMSwxNyArMTcyMSw2IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UKPiAqYWRldikgICNlbmRpZgo+IAo+ICAJLyoKPiAtCSAqIHJldGlyZWQgcGFn
ZXMgd2lsbCBiZSBsb2FkZWQgZnJvbSBlZXByb20gYW5kIHJlc2VydmVkIGhlcmUsCj4gLQkgKiBp
dCBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIHR0bSBpbml0IHNpbmNlIG5ldyBibyBtYXkgYmUgY3Jl
YXRlZCwKPiAtCSAqIHJlY292ZXJ5X2luaXQgbWF5IGZhaWwsIGJ1dCBpdCBjYW4gZnJlZSBhbGwg
cmVzb3VyY2VzIGFsbG9jYXRlZCBieQo+IC0JICogaXRzZWxmIGFuZCBpdHMgZmFpbHVyZSBzaG91
bGQgbm90IHN0b3AgYW1kZ3B1IGluaXQgcHJvY2Vzcy4KPiAtCSAqCj4gLQkgKiBOb3RlOiB0aGVv
cmV0aWNhbGx5LCB0aGlzIHNob3VsZCBiZSBjYWxsZWQgYmVmb3JlIGFsbCB2cmFtIGFsbG9jYXRp
b25zCj4gLQkgKiB0byBwcm90ZWN0IHJldGlyZWQgcGFnZSBmcm9tIGFidXNpbmcKPiAtCSAqLwo+
IC0JYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KGFkZXYpOwo+IC0KPiAtCS8qCj4gIAkgKlRoZSBy
ZXNlcnZlZCB2cmFtIGZvciBmaXJtd2FyZSBtdXN0IGJlIHBpbm5lZCB0byB0aGUgc3BlY2lmaWVk
Cj4gIAkgKnBsYWNlIG9uIHRoZSBWUkFNLCBzbyByZXNlcnZlIGl0IGVhcmx5Lgo+ICAJICovCj4g
LS0KPiAyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
