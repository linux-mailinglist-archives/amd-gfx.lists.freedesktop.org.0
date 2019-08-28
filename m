Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D8A029E
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A8089A1A;
	Wed, 28 Aug 2019 13:06:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B8F89A1A
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKvKdQ5ildHS5DTchsiKifFAzaIrT5cw8ldYI4sDEDyhzwcgiuQO4m1EaANaIFryYJp7Mvio2dwfW88wahgb1JcK1yCVRW7jHvaPPV3mhdwarAv7XbQw2slFswKPlfOa9WCWyD6KZGjOzj7i1LA5NQQU17weHV3GUo8a7Tdr4AX/XJgACpWSdR6fAftfCLX/5amzQ7+BKA9UyqDKLNx0ZW5FobdROrEz46hEUsYceWDI67sujnPZzWp1J6dizH3ZCclp5fEaP3yTsc6NMUH74QF3bJXstRst6ybkWAJPm3dKKeIu7jQobQeGWGNfWDQuk6LRJ51FpJ2aQU0tujge3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHqH7BVqCfx+Fi7omqhgQTtnay596bir/4Znufak8yc=;
 b=b+2UvyNzRUlWbFID8NiIdZpw/sBc6ui9m0o829UPWvzEJYIgrxMddjN/yi/ojCJi01jDVXKqEQcGiS986ODHjnnzK4VS/iwKqVYLo2lkkSzex76Kc7WSdLf9yshJMGkjwKtgaUV0NtlhfQ4dzpo6GoDiB3uQvWpAQO2U7GMQXHx0P9nK+ULUfPkUlOXABgy5O+q5goxUuYkjiAe3YIqsSi5a6liWN/X84TvJhREFOYTDWQBKJngso51i7TMoDhVd7JZaYCO2Rp/IBsmxh2UUI5DdhNC9Wpz1wBxZBuIrmnu/WGXduKUSUpfkD1rjZjuQhdhGjEIPI+3e5SHpZkfmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1177.namprd12.prod.outlook.com (10.168.233.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 28 Aug 2019 13:06:23 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 13:06:23 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Petr Cvek <petrcvekcz@gmail.com>
Subject: Re: [RFC] AMD polaris MEM_AP_SIZE location (PCI BAR aperture size)
Thread-Topic: [RFC] AMD polaris MEM_AP_SIZE location (PCI BAR aperture size)
Thread-Index: AQHVXZ4ntI7TX8wM40qL7CGYLdT4cKcQh4MA
Date: Wed, 28 Aug 2019 13:06:22 +0000
Message-ID: <b371640b-63d3-1ccd-c334-13a311548e6e@amd.com>
References: <b5ce72c4-850d-1024-354c-2542045b8992@gmail.com>
 <0a40c024-84fb-a726-b69c-f2a5349fc802@gmail.com>
 <22bd05eb-ac42-3157-33a7-26bd77979c36@gmail.com>
In-Reply-To: <22bd05eb-ac42-3157-33a7-26bd77979c36@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0072.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::36) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c50786b-01d5-41b0-a97e-08d72bb8868b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1177; 
x-ms-traffictypediagnostic: DM5PR12MB1177:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR12MB117770277F151A9BC06C25CC83A30@DM5PR12MB1177.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(76176011)(4326008)(229853002)(6246003)(52116002)(65806001)(65956001)(6512007)(81156014)(81166006)(8676002)(31686004)(5660300002)(6436002)(6306002)(86362001)(6486002)(36756003)(66574012)(6116002)(31696002)(25786009)(53936002)(8936002)(99286004)(316002)(966005)(58126008)(305945005)(2906002)(478600001)(66476007)(7736002)(256004)(14454004)(71190400001)(71200400001)(14444005)(66946007)(5024004)(102836004)(6506007)(386003)(186003)(11346002)(2616005)(486006)(6916009)(446003)(46003)(66446008)(64756008)(1411001)(66556008)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1177;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z1GpGl8dK5SV83oHW8mJ9XDDzUZwxyYb9dam7bVFgzlILqyTVIECnEKl91mHJksd2C6MAbxndS7VUA+FU/npEr6Fw8aLtR6rpbnAItk5z9O+NQg6qIncZ+Zbo8MwKN5zOZJAgrVVHtRkxVBuraGbv8b0sPLsEqAMTTz+bAQ8ayjQnIFpJjKiOxJQbBVM31Xv/BnMoRVleS1wd3pCFMl4gP/Oev0YnpczdqiNlvS4Er1fj12Ozs5+FI/tx9HnuY5HHaipWk3nG8/bdpdJTkQ9APSyfO4UzXHKN6cex3WjSzw1FHh2jKJMOudM9NQUTxJQp9SXWXtozFMCtlc9ID0Irn6m+LFVcb5ycAHDUD4Du56ADeCCm9Eylb3XPD/+P6AhYYdOjEN8ebQ0vYPiG3q5+l7FmYb+wC3RwRrQgt8Dlj4=
x-ms-exchange-transport-forked: True
Content-ID: <56F25C79844EF24C920334F4EBBE374A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c50786b-01d5-41b0-a97e-08d72bb8868b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 13:06:23.1799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XxssVKhpvidHW+SAhEN119Sh1MqngPVG7+/0GGL5SIkYUka4k5eu/58MylWkRVk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1177
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHqH7BVqCfx+Fi7omqhgQTtnay596bir/4Znufak8yc=;
 b=15L4zRdeCbt+Ds+chN6HfGKLl3Ef7zxGhCRL8BOVOXh2+WUNTjXDZF+znX1Mj36iwk/QG/3VuvgjcL3MU+UL3YNzI2CnWoGpqcvVpy+CrjridY+38iBB5EJmg1gwcaGwV/nHwi11sFX1TKmIaZ7WoT/DGPgW5aLTzcgnHaGL52I=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiBZZWFoIGJ1dCBzYWRseSBpdCBzZWVtcyBpdCBpcyBwb3NzaWJsZSB0byBvbmx5IGluY3JlYXNl
IHRoZSBCQVIgc2l6ZSBmcm9tIGl0cyBjdXJyZW50bHkgZGVmYXVsdCAyNTZNQi4NCg0KV2VsbCB0
aGUgc3BlY2lmaWNhdGlvbiBhbGxvd3MgdG8gY2hhbmdlIHRoZSBCQVIgc2l6ZSBmcm9tIDFNQiB1
cCB0byANCnNldmVyYWwgVEIuIFRoZSBrZXkgcG9pbnQgaXMgd2UgdXN1YWxseSB1c2UgaXQgdG8g
aW5jcmVhc2UgdGhlIEJBUiBzaXplLCANCmJ1dCBpdCBpcyBwZXJmZWN0bHkgcG9zc2libGUgdG8g
bWFrZSBpdCBzbWFsbGVyIGFzIHdlbGwuDQoNClRha2UgYSBsb29rIGF0IHRoZSBmdW5jdGlvbiBw
Y2lfcmViYXJfc2V0X3NpemUoKSBmb3IgZXhhbXBsZS4gWW91IHNob3VsZCANCmJlIGFibGUgdG8g
dXNlIHRoaXMgYXMgc29tZXRoaW5nIGxpa2UgcGNpX3JlYmFyX3NldF9zaXplKCZhZGV2LT5wZGV2
LCAwLCANCjYpIHRvIGdldCBhIDY0TUIgQkFSLg0KDQpBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gdHJ5
IHRvIHByb2dyYW0gdGhlIFBDSWUgY29uZmlnIHNwYWNlIHdpdGggdGhlIA0Kc2V0cGNpIGNvbW1h
bmRsaW5lIHRvb2wuDQoNClRoZW4geW91IG5lZWQgdG8gZm9yY2UgYSByZXNjYW4gb2YgdGhlIFBD
SWUgYnVzIHNvIHRoYXQgdGhlIGtlcm5lbCBjYW4gDQphY3R1YWxseSBkZXRlY3QgdGhlIGNoYW5n
ZS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMjguMDguMTkgdW0gMTQ6NDYgc2Nocmll
YiBQZXRyIEN2ZWs6DQo+IERuZSAyOC4gMDguIDE5IHYgMTA6MzEgQ2hyaXN0aWFuIEvDtm5pZyBu
YXBzYWwoYSk6DQo+PiBIaSBQZXRyLA0KPj4NCj4+IHdlbGwgdGhhdCBpcyBpbmRlZWQgYSByYXRo
ZXIgdW51c3VhbCB1c2UgY2FzZS4NCj4+DQo+PiBJJ20gbm90IDEwMCUgc3VyZSBob3cgeW91IGFj
dHVhbGx5IGhhY2tlZCB0aGUgSEQ0NTUwIHRvIGRvIHdoYXQgeW91IHdhbnQgdG8gZG8sIGNhdXNl
IHRoaXMgQVNJQyBnZW5lcmF0aW9uIHNob3VsZG4ndCBzdXBwb3J0IHRoaXMuDQo+IEkgZG9uJ3Qg
cmVtZW1iZXIgY29ycmVjdGx5IGhvdyBleGFjdGx5IEkndmUgbWFuYWdlZCB0byBkbyB0aGF0IGJ1
dCBJIHRoaW5rIHRoZSBwcm9jZXNzIHdhczoNCj4NCj4gSSBjb21wYXJlZCBkaWZmZXJlbnQgQklP
U2VzIGZpcnN0IGFuZCBJIGZvdW5kIGEgY29ycmVsYXRpb24gYmV0d2VlbiBhcGVydHVyZSBzaXpl
cyBpbiB0aGUgUk9NIGltYWdlcyBvZiBvbGRlciAoeDEzMDAvUjUyMCkgZ2VuZXJhdGlvbi4gV2hp
bGUgZG9pbmcgdGhhdCBJJ3ZlIGZvdW5kIG1lbnRpb25zIG9mIE1FTV9BUF9TSVpFIFJPTSBwb3dl
cnVwIHN0cmFwIHJlZ2lzdGVycyAoZnJvbSB4Lm9yZyBkb2N1bWVudHMpIGFuZCBJIHRyaWVkIHRv
IGZsYXNoIHRoZSBzZXR0aW5ncyBvZiBIRDQ1NTAgZnJvbSAyNTZNQiAoZGVmYXVsdCkgZGlyZWN0
bHkgdG8gNjRNQiBhbmQgSSB3YXMgc3VycHJpc2VkIGl0IHdvcmtlZCAoSSd2ZSB0aG91Z2ggaXQg
d2lsbCBiZSBvbmx5IDEyOE1CKS4gSUYgSSBnb29nbGUgdGhlICJNRU1fQVBfU0laRSIgbm93IEkg
Y2FuIGZpbmQgYSBkb2N1bWVudCBbMV0sIHdoaWNoIHNheXMgKHBhZ2UgNTYpIHRoZSBST00gYWRk
cmVzcyBpcyAweDc4IChwYWdlIDU2KSBhbmQgdGhlIHRhYmxlIHNheXMgNjRNQiBpcyBwb3NzaWJs
ZSwgd2hpY2ggYm90aCBtYXRjaCB0aGUgZXhwZXJpbWVudC4NCj4NCj4gT2YgY291cnNlIHRoZSBi
aW9zIGlzIG5vdyBDUkMgYnJva2VuLCBidXQgaXQgZG9lc24ndCBtYXR0ZXIgaW4gbGludXggKHRo
ZSBST00gY29kZSBpcyBqdXN0IHg4NiBhbnl3YXkpLg0KPg0KPiBbMV0gaHR0cHM6Ly9kZXYueGRl
dnMuY29tL2F0dGFjaG1lbnRzL2Rvd25sb2FkLzIzMy9BTURfUlY3MTBfZHNfbmRhXzEuMDFiLnBk
Zg0KPg0KPj4gRm9yIGEgUG9sYXJpcyB5b3UgY2FuIGp1c3QgdXNlIHRoZSBQQ0llIHJlc2l6ZWFi
bGUgQkFSIGV4dGVuc2lvbi4gRm9yIGhvdyB0byB1c2UgaXQgc2VlIHRoZSBwY2lfcmVzaXplX3Jl
c291cmNlKCkgZnVuY3Rpb24gaW4gdGhlIGxpbnV4IGtlcm5lbC4NCj4+DQo+PiBQbGVhc2UgYmUg
YXdhcmUgdGhhdCB3ZSB1c3VhbGx5IHVzZSB0aGUgZnVuY3Rpb24gdG8gaW5jcmVhc2UgdGhlIEJB
UiBzaXplIHRvIGFsbG93IHRoZSBDUFUgdG8gYWNjZXNzIG1vcmUgb2YgdGhlIG9uIGJvYXJkIG1l
bW9yeSwgc28gbWFraW5nIGl0IHNtYWxsZXIgbWlnaHQgYWN0dWFsbHkgbm90IGJlIHRlc3RlZCBh
dCBhbGwuDQo+IFllYWggYnV0IHNhZGx5IGl0IHNlZW1zIGl0IGlzIHBvc3NpYmxlIHRvIG9ubHkg
aW5jcmVhc2UgdGhlIEJBUiBzaXplIGZyb20gaXRzIGN1cnJlbnRseSBkZWZhdWx0IDI1Nk1CLg0K
Pg0KPj4gUmVnYXJkcywNCj4+IENocmlzdGlhbi4NCj4+DQo+Pg0KPj4gQW0gMjcuMDguMTkgdW0g
MDQ6MzYgc2NocmllYiBQZXRyIEN2ZWs6DQo+Pj4gSGVsbG8sDQo+Pj4NCj4+PiBJJ20gdHJ5aW5n
IHRvIHJ1biBBTUQgR1BVcyBpbiB1bnVzdWFsIGNvbmZpZ3VyYXRpb25zLiBJIHdhcyBhYmxlIHRv
IGRlY3JlYXNlIHRoZSBQQ0kgQkFSIHNpemUgaW4gSEQ0NTUwIGJ5IGl0cyBCSU9TIHN0cmFwIGNv
bmZpZ3VyYXRpb24gYW5kIGNoYW5nZSBpdCB0byA2NE1CIChhbmQgSSB3YXMgYWJsZSB0byBydW4g
aXQgb24gTUlQUyB2b2NvcmUyIGJvYXJkIDotRCApLiBJcyB0aGVyZSBhIHNpbWlsYXIgY29uZmln
dXJhdGlvbiBsb2NhdGlvbiBmb3IgQU1EIHBvbGFyaXMgMTEvUlggNDYwIEJJT1M/DQo+Pj4NCj4+
PiBQZXRyIEN2ZWsNCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
