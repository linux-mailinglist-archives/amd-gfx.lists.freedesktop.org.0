Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585F18D49
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 17:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A7989458;
	Thu,  9 May 2019 15:45:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092011101.outbound.protection.outlook.com [40.92.11.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F8E89458
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 15:45:52 +0000 (UTC)
Received: from CO1NAM04FT026.eop-NAM04.prod.protection.outlook.com
 (10.152.90.51) by CO1NAM04HT204.eop-NAM04.prod.protection.outlook.com
 (10.152.91.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.15; Thu, 9 May
 2019 15:45:50 +0000
Received: from DM5PR17MB0939.namprd17.prod.outlook.com (10.152.90.53) by
 CO1NAM04FT026.mail.protection.outlook.com (10.152.90.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.15 via Frontend Transport; Thu, 9 May 2019 15:45:50 +0000
Received: from DM5PR17MB0939.namprd17.prod.outlook.com
 ([fe80::d479:5cd3:c1fd:ec64]) by DM5PR17MB0939.namprd17.prod.outlook.com
 ([fe80::d479:5cd3:c1fd:ec64%9]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 15:45:50 +0000
From: William Lewis <minutemaidpark@hotmail.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/amdgpu: add badpages sysfs interafce
Thread-Topic: [PATCH v3] drm/amdgpu: add badpages sysfs interafce
Thread-Index: AQHVBlH0qv0b2km12UytiP4e1Lw0UKZi6d2AgAAGCgA=
Date: Thu, 9 May 2019 15:45:50 +0000
Message-ID: <DM5PR17MB09394F11DA11E4A1CECAF799C8330@DM5PR17MB0939.namprd17.prod.outlook.com>
References: <SN6PR12MB280055871BC84DB8396BDAFB87330@SN6PR12MB2800.namprd12.prod.outlook.com>
 <CADnq5_MF_MQw=4aA2hW_agDhfwcsZX-BrW0TEO2Q7Bh9N2Z+7Q@mail.gmail.com>
In-Reply-To: <CADnq5_MF_MQw=4aA2hW_agDhfwcsZX-BrW0TEO2Q7Bh9N2Z+7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:805:a2::21) To DM5PR17MB0939.namprd17.prod.outlook.com
 (2603:10b6:3:34::15)
x-incomingtopheadermarker: OriginalChecksum:70200BCEEDED9B2B3ADFD1AAC278BC25BB0AEADA673A2E958DAF22D58E15DFEF;
 UpperCasedChecksum:4D129F80E9FCA394E6C4FFAD393D627462A6B3A12FC1AB8256A0D9643ADE49A1;
 SizeAsReceived:7502; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [dXsk+y71yrTyh7oHtC/qX3RZy002IVuB]
x-microsoft-original-message-id: <eb4d340f-c867-601d-808a-40a069fd8976@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:CO1NAM04HT204; 
x-ms-traffictypediagnostic: CO1NAM04HT204:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: f53eUC45nqH4WmtAQcf4rtLSTjfke5NhT3BhqASjEmcBMvr8U7gGsPELaU96VuFIZd9HenOVQv08K6c4Gi1y5ViOr65byn8tnPoKZC+fcoC8JCUI2ZntBpMUHJbzkGpN+8q8YQzyYET/nN2OQlVh5E7sw9b6Ibd96XSTqoU6blPJe8GAf53U78IF6v8eP3Fl
Content-ID: <DAD8D2BAC10F1340AC728CFF3FB2047E@namprd17.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec92cf7-a814-4113-516f-08d6d495691c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 15:45:50.6319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM04HT204
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgtZ70cs6p71SitOWshQSB2Jq4PGGxVlCQX9oI9fzWw=;
 b=EGUBekXgMer7BpOFy7FzRSbwxJndj1o2ihqIqcoG+kcm7s7M9vJekF8igScPRkYwVq/wtSaa5V5I82Jth4E3bdQypJ/uXYIFjZnbNgUpGyxcPqwGQGgaAfbvQtVoMVDK2FJjqMBhD44UwAQnLJNFuQofTorr+nbUerP0mZrtiWSy1J3nFlRzkp8e8sTuf9cjfnaKC4RCwM+TL8QUOOtDzz9AoZdhSREI2J2McrqrvB1g5JbC/OIraI5dkT4oJ682INAvP6b2rC8r3GFb/9mDhut1PWqIi21OZVi67B+9rd2BBnIM19gDm0yHmCBCB4pFEoOGxa2qvLnRLbntrORmrQ==
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

VHlwbyBpbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24uwqAgcy9pbnRlcmFmY2UvaW50ZXJmYWNlLw0K
DQpPbiA1LzkvMTkgMTA6MjQgQU0sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gT24gVGh1LCBNYXkg
OSwgMjAxOSBhdCA2OjMxIEFNIFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+IHdyb3Rl
Og0KPj4gYWRkIGJhZHBhZ2VzIG5vZGUuDQo+PiBpdCB3aWxsIG91dHB1dCBiYWRwYWdlcyBsaXN0
IGluIGZvcm1hdA0KPj4gZ3B1IHBmbiA6IGdwdSBwYWdlIHNpemUgOiBmbGFncw0KPj4NCj4+IGV4
YW1wbGUNCj4+IDB4MDAwMDAwMDAgOiAweDAwMDAxMDAwIDogUg0KPj4gMHgwMDAwMDAwMSA6IDB4
MDAwMDEwMDAgOiBSDQo+PiAweDAwMDAwMDAyIDogMHgwMDAwMTAwMCA6IFINCj4+IDB4MDAwMDAw
MDMgOiAweDAwMDAxMDAwIDogUg0KPj4gMHgwMDAwMDAwNCA6IDB4MDAwMDEwMDAgOiBSDQo+PiAw
eDAwMDAwMDA1IDogMHgwMDAwMTAwMCA6IFINCj4+IDB4MDAwMDAwMDYgOiAweDAwMDAxMDAwIDog
Ug0KPj4gMHgwMDAwMDAwNyA6IDB4MDAwMDEwMDAgOiBQDQo+PiAweDAwMDAwMDA4IDogMHgwMDAw
MTAwMCA6IFANCj4+IDB4MDAwMDAwMDkgOiAweDAwMDAxMDAwIDogUA0KPj4NCj4+IGZsYWdzIGNh
biBiZSBvbmUgb2YgYmVsb3cgY2hhcmFjdGVycw0KPj4gUjogcmVzZXJ2ZWQuDQo+PiBQOiBwZW5k
aW5nIGZvciByZXNlcnZlLg0KPj4gRjogZmFpbGVkIHRvIHJlc2VydmUgZm9yIHNvbWUgcmVhc29u
cy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+
DQo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
DQo+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
IHwgMTQ2ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmggfCAgIDEgKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDE0NyBp
bnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
Yw0KPj4gaW5kZXggYzYwZDVmODEzODAxLi5jOWUyNGY2MDkzOGUgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPj4gQEAgLTkwLDYgKzkwLDEyIEBAIHN0
cnVjdCByYXNfbWFuYWdlciB7DQo+PiAgICAgICAgICBzdHJ1Y3QgcmFzX2Vycl9kYXRhIGVycl9k
YXRhOw0KPj4gICB9Ow0KPj4NCj4+ICtzdHJ1Y3QgcmFzX2JhZHBhZ2Ugew0KPj4gKyAgICAgICB1
bnNpZ25lZCBpbnQgYnA7DQo+PiArICAgICAgIHVuc2lnbmVkIGludCBzaXplOw0KPj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgZmxhZ3M7DQo+PiArfTsNCj4+ICsNCj4+ICAgY29uc3QgY2hhciAqcmFz
X2Vycm9yX3N0cmluZ1tdID0gew0KPj4gICAgICAgICAgIm5vbmUiLA0KPj4gICAgICAgICAgInBh
cml0eSIsDQo+PiBAQCAtNzEwLDYgKzcxNiw3NyBAQCBpbnQgYW1kZ3B1X3Jhc19xdWVyeV9lcnJv
cl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+DQo+PiAgIC8qIHN5c2ZzIGJl
Z2luICovDQo+Pg0KPj4gK3N0YXRpYyBpbnQgYW1kZ3B1X3Jhc19iYWRwYWdlc19yZWFkKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4gKyAgICAgICAgICAgICAgIHN0cnVjdCByYXNfYmFk
cGFnZSAqKmJwcywgdW5zaWduZWQgaW50ICpjb3VudCk7DQo+PiArDQo+PiArc3RhdGljIGNoYXIg
KmFtZGdwdV9yYXNfYmFkcGFnZV9mbGFnc19zdHIodW5zaWduZWQgaW50IGZsYWdzKQ0KPj4gK3sN
Cj4+ICsgICAgICAgc3dpdGNoIChmbGFncykgew0KPj4gKyAgICAgICBjYXNlIDA6DQo+PiArICAg
ICAgICAgICAgICAgcmV0dXJuICJSIjsNCj4+ICsgICAgICAgY2FzZSAxOg0KPj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAiUCI7DQo+PiArICAgICAgIGNhc2UgMjoNCj4+ICsgICAgICAgZGVmYXVs
dDoNCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gIkYiOw0KPj4gKyAgICAgICB9Ow0KPj4gK30N
Cj4+ICsNCj4+ICsvKg0KPj4gKyAqIERPQzogcmFzIHN5c2ZzIGdwdV92cmFtX2JhZF9wYWdlcyBp
bnRlcmZhY2UNCj4+ICsgKg0KPj4gKyAqIEl0IGFsbG93cyB1c2VyIHRvIHJlYWQgdGhlIGJhZCBw
YWdlcyBvZiB2cmFtIG9uIHRoZSBncHUgdGhyb3VnaA0KPj4gKyAqIC9zeXMvY2xhc3MvZHJtL2Nh
cmRbMC8xLzIuLi5dL2RldmljZS9yYXMvZ3B1X3ZyYW1fYmFkX3BhZ2VzDQo+PiArICoNCj4+ICsg
KiBJdCBvdXRwdXRzIG11bHRpcGxlIGxpbmVzLCBhbmQgZWFjaCBsaW5lIHN0YW5kcyBmb3Igb25l
IGdwdSBwYWdlLg0KPj4gKyAqDQo+PiArICogVGhlIGZvcm1hdCBvZiBvbmUgbGluZSBpcyBiZWxv
dywNCj4+ICsgKiBncHUgcGZuIDogZ3B1IHBhZ2Ugc2l6ZSA6IGZsYWdzDQo+PiArICoNCj4+ICsg
KiBncHUgcGZuIGFuZCBncHUgcGFnZSBzaXplIGFyZSBwcmludGVkIGluIGhleCBmb3JtYXQuDQo+
PiArICogZmxhZ3MgY2FuIGJlIG9uZSBvZiBiZWxvdyBjaGFyYWN0ZXIsDQo+PiArICogUjogcmVz
ZXJ2ZWQsIHRoaXMgZ3B1IHBhZ2UgaXMgcmVzZXJ2ZWQgYW5kIG5vdCBhYmxlIHRvIHVzZS4NCj4+
ICsgKiBQOiBwZW5kaW5nIGZvciByZXNlcnZlLCB0aGlzIGdwdSBwYWdlIGlzIG1hcmtlZCBhcyBi
YWQsIHdpbGwgYmUgcmVzZXJ2ZWQNCj4+ICsgKiAgICBpbiBuZXh0IHdpbmRvdyBvZiBwYWdlX3Jl
c2VydmUuDQo+PiArICogRjogdW5hYmxlIHRvIHJlc2VydmUuIHRoaXMgZ3B1IHBhZ2UgY2FuJ3Qg
YmUgcmVzZXJ2ZWQgZHVlIHRvIHNvbWUgcmVhc29ucy4NCj4+ICsgKg0KPj4gKyAqIGV4YW1wbGVz
Og0KPj4gKyAqIDB4MDAwMDAwMDEgOiAweDAwMDAxMDAwIDogUg0KPj4gKyAqIDB4MDAwMDAwMDIg
OiAweDAwMDAxMDAwIDogUA0KPj4gKyAqLw0KPj4gKw0KPj4gK3N0YXRpYyBzc2l6ZV90IGFtZGdw
dV9yYXNfc3lzZnNfYmFkcGFnZXNfcmVhZChzdHJ1Y3QgZmlsZSAqZiwNCj4+ICsgICAgICAgICAg
ICAgICBzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmF0dHIsDQo+
PiArICAgICAgICAgICAgICAgY2hhciAqYnVmLCBsb2ZmX3QgcHBvcywgc2l6ZV90IGNvdW50KQ0K
Pj4gK3sNCj4+ICsgICAgICAgc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9DQo+PiArICAgICAgICAg
ICAgICAgY29udGFpbmVyX29mKGF0dHIsIHN0cnVjdCBhbWRncHVfcmFzLCBiYWRwYWdlc19hdHRy
KTsNCj4+ICsgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBjb24tPmFkZXY7DQo+
PiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBlbGVtZW50X3NpemUgPQ0KPj4gKyAgICAgICAg
ICAgICAgIHNpemVvZigiMHhhYmNkYWJjZCA6IDB4MTIzNDU2NzggOiBSXG4iKSAtIDE7DQo+PiAr
ICAgICAgIHVuc2lnbmVkIGludCBzdGFydCA9IChwcG9zICsgZWxlbWVudF9zaXplIC0gMSkgLyBl
bGVtZW50X3NpemU7DQo+PiArICAgICAgIHVuc2lnbmVkIGludCBlbmQgPSAocHBvcyArIGNvdW50
IC0gMSkgLyBlbGVtZW50X3NpemU7DQo+PiArICAgICAgIHNzaXplX3QgcyA9IDA7DQo+PiArICAg
ICAgIHN0cnVjdCByYXNfYmFkcGFnZSAqYnBzID0gTlVMTDsNCj4+ICsgICAgICAgdW5zaWduZWQg
aW50IGJwc19jb3VudCA9IDA7DQo+PiArDQo+PiArICAgICAgIG1lbXNldChidWYsIDAsIGNvdW50
KTsNCj4+ICsNCj4+ICsgICAgICAgaWYgKGFtZGdwdV9yYXNfYmFkcGFnZXNfcmVhZChhZGV2LCAm
YnBzLCAmYnBzX2NvdW50KSkNCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+
ICsgICAgICAgZm9yICg7IHN0YXJ0IDwgZW5kICYmIHN0YXJ0IDwgYnBzX2NvdW50OyBzdGFydCsr
KQ0KPj4gKyAgICAgICAgICAgICAgIHMgKz0gc2NucHJpbnRmKCZidWZbc10sIGVsZW1lbnRfc2l6
ZSArIDEsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIweCUwOHggOiAweCUw
OHggOiAlMXNcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJwc1tzdGFy
dF0uYnAsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJwc1tzdGFydF0uc2l6
ZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X3Jhc19iYWRwYWdl
X2ZsYWdzX3N0cihicHNbc3RhcnRdLmZsYWdzKSk7DQo+PiArDQo+PiArICAgICAgIGtmcmVlKGJw
cyk7DQo+PiArDQo+PiArICAgICAgIHJldHVybiBzOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGlj
IHNzaXplX3QgYW1kZ3B1X3Jhc19zeXNmc19mZWF0dXJlc19yZWFkKHN0cnVjdCBkZXZpY2UgKmRl
diwNCj4+ICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNo
YXIgKmJ1ZikNCj4+ICAgew0KPj4gQEAgLTc1MCw5ICs4MjcsMTQgQEAgc3RhdGljIGludCBhbWRn
cHVfcmFzX3N5c2ZzX2NyZWF0ZV9mZWF0dXJlX25vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpDQo+PiAgICAgICAgICAgICAgICAgICZjb24tPmZlYXR1cmVzX2F0dHIuYXR0ciwNCj4+ICAg
ICAgICAgICAgICAgICAgTlVMTA0KPj4gICAgICAgICAgfTsNCj4+ICsgICAgICAgc3RydWN0IGJp
bl9hdHRyaWJ1dGUgKmJpbl9hdHRyc1tdID0gew0KPj4gKyAgICAgICAgICAgICAgICZjb24tPmJh
ZHBhZ2VzX2F0dHIsDQo+PiArICAgICAgICAgICAgICAgTlVMTA0KPj4gKyAgICAgICB9Ow0KPj4g
ICAgICAgICAgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBncm91cCA9IHsNCj4+ICAgICAgICAgICAg
ICAgICAgLm5hbWUgPSAicmFzIiwNCj4+ICAgICAgICAgICAgICAgICAgLmF0dHJzID0gYXR0cnMs
DQo+PiArICAgICAgICAgICAgICAgLmJpbl9hdHRycyA9IGJpbl9hdHRycywNCj4+ICAgICAgICAg
IH07DQo+Pg0KPj4gICAgICAgICAgY29uLT5mZWF0dXJlc19hdHRyID0gKHN0cnVjdCBkZXZpY2Vf
YXR0cmlidXRlKSB7DQo+PiBAQCAtNzYyLDcgKzg0NCwxOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9y
YXNfc3lzZnNfY3JlYXRlX2ZlYXR1cmVfbm9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4+ICAgICAgICAgICAgICAgICAgfSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAuc2hv
dyA9IGFtZGdwdV9yYXNfc3lzZnNfZmVhdHVyZXNfcmVhZCwNCj4+ICAgICAgICAgIH07DQo+PiAr
DQo+PiArICAgICAgIGNvbi0+YmFkcGFnZXNfYXR0ciA9IChzdHJ1Y3QgYmluX2F0dHJpYnV0ZSkg
ew0KPj4gKyAgICAgICAgICAgICAgIC5hdHRyID0gew0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgLm5hbWUgPSAiZ3B1X3ZyYW1fYmFkX3BhZ2VzIiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIC5tb2RlID0gU19JUlVHTywNCj4+ICsgICAgICAgICAgICAgICB9LA0KPj4gKyAgICAgICAg
ICAgICAgIC5zaXplID0gMCwNCj4+ICsgICAgICAgICAgICAgICAucHJpdmF0ZSA9IE5VTEwsDQo+
PiArICAgICAgICAgICAgICAgLnJlYWQgPSBhbWRncHVfcmFzX3N5c2ZzX2JhZHBhZ2VzX3JlYWQs
DQo+PiArICAgICAgIH07DQo+PiArDQo+PiAgICAgICAgICBzeXNmc19hdHRyX2luaXQoYXR0cnNb
MF0pOw0KPj4gKyAgICAgICBzeXNmc19iaW5fYXR0cl9pbml0KGJpbl9hdHRyc1swXSk7DQo+Pg0K
Pj4gICAgICAgICAgcmV0dXJuIHN5c2ZzX2NyZWF0ZV9ncm91cCgmYWRldi0+ZGV2LT5rb2JqLCAm
Z3JvdXApOw0KPj4gICB9DQo+PiBAQCAtNzc0LDkgKzg2OCwxNCBAQCBzdGF0aWMgaW50IGFtZGdw
dV9yYXNfc3lzZnNfcmVtb3ZlX2ZlYXR1cmVfbm9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikNCj4+ICAgICAgICAgICAgICAgICAgJmNvbi0+ZmVhdHVyZXNfYXR0ci5hdHRyLA0KPj4gICAg
ICAgICAgICAgICAgICBOVUxMDQo+PiAgICAgICAgICB9Ow0KPj4gKyAgICAgICBzdHJ1Y3QgYmlu
X2F0dHJpYnV0ZSAqYmluX2F0dHJzW10gPSB7DQo+PiArICAgICAgICAgICAgICAgJmNvbi0+YmFk
cGFnZXNfYXR0ciwNCj4+ICsgICAgICAgICAgICAgICBOVUxMDQo+PiArICAgICAgIH07DQo+PiAg
ICAgICAgICBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIGdyb3VwID0gew0KPj4gICAgICAgICAgICAg
ICAgICAubmFtZSA9ICJyYXMiLA0KPj4gICAgICAgICAgICAgICAgICAuYXR0cnMgPSBhdHRycywN
Cj4+ICsgICAgICAgICAgICAgICAuYmluX2F0dHJzID0gYmluX2F0dHJzLA0KPj4gICAgICAgICAg
fTsNCj4+DQo+PiAgICAgICAgICBzeXNmc19yZW1vdmVfZ3JvdXAoJmFkZXYtPmRldi0+a29iaiwg
Jmdyb3VwKTsNCj4+IEBAIC0xMTA4LDYgKzEyMDcsNTMgQEAgc3RhdGljIGludCBhbWRncHVfcmFz
X2ludGVycnVwdF9yZW1vdmVfYWxsKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gICAv
KiBpaCBlbmQgKi8NCj4+DQo+PiAgIC8qIHJlY292ZXJ5IGJlZ2luICovDQo+PiArDQo+PiArLyog
cmV0dXJuIDAgb24gc3VjY2Vzcy4NCj4+ICsgKiBjYWxsZXIgbmVlZCBmcmVlIGJwcy4NCj4+ICsg
Ki8NCj4+ICtzdGF0aWMgaW50IGFtZGdwdV9yYXNfYmFkcGFnZXNfcmVhZChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwNCj4+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgcmFzX2JhZHBhZ2UgKipi
cHMsIHVuc2lnbmVkIGludCAqY291bnQpDQo+PiArew0KPj4gKyAgICAgICBzdHJ1Y3QgYW1kZ3B1
X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsNCj4+ICsgICAgICAgc3Ry
dWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICpkYXRhOw0KPj4gKyAgICAgICBpbnQgaSA9IDA7DQo+
PiArICAgICAgIGludCByZXQgPSAwOw0KPj4gKw0KPj4gKyAgICAgICBpZiAoIWNvbiB8fCAhY29u
LT5laF9kYXRhIHx8ICFicHMgfHwgIWNvdW50KQ0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPj4gKw0KPj4gKyAgICAgICBtdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2sp
Ow0KPj4gKyAgICAgICBkYXRhID0gY29uLT5laF9kYXRhOw0KPj4gKyAgICAgICBpZiAoIWRhdGEg
fHwgZGF0YS0+Y291bnQgPT0gMCkgew0KPj4gKyAgICAgICAgICAgICAgICpicHMgPSBOVUxMOw0K
Pj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICAgICB9DQo+PiArDQo+PiArICAg
ICAgICpicHMgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2JhZHBhZ2UpICogZGF0YS0+Y291
bnQsIEdGUF9LRVJORUwpOw0KPj4gKyAgICAgICBpZiAoISpicHMpIHsNCj4+ICsgICAgICAgICAg
ICAgICByZXQgPSAtRU5PTUVNOw0KPj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAg
ICAgICB9DQo+PiArDQo+PiArICAgICAgIGZvciAoOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgew0K
Pj4gKyAgICAgICAgICAgICAgICgqYnBzKVtpXSA9IChzdHJ1Y3QgcmFzX2JhZHBhZ2Upew0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgLmJwID0gZGF0YS0+YnBzW2ldLmJwLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgLnNpemUgPSBBTURHUFVfR1BVX1BBR0VfU0laRSwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIC5mbGFncyA9IDAsDQo+PiArICAgICAgICAgICAgICAgfTsNCj4+
ICsNCj4+ICsgICAgICAgICAgICAgICBpZiAoZGF0YS0+bGFzdF9yZXNlcnZlZCA8PSBpKQ0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgKCpicHMpW2ldLmZsYWdzID0gMTsNCj4+ICsgICAgICAg
ICAgICAgICBlbHNlIGlmIChkYXRhLT5icHNbaV0uYm8gPT0gTlVMTCkNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICgqYnBzKVtpXS5mbGFncyA9IDI7DQo+PiArICAgICAgIH0NCj4+ICsNCj4+
ICsgICAgICAgKmNvdW50ID0gZGF0YS0+Y291bnQ7DQo+PiArb3V0Og0KPj4gKyAgICAgICBtdXRl
eF91bmxvY2soJmNvbi0+cmVjb3ZlcnlfbG9jayk7DQo+PiArICAgICAgIHJldHVybiByZXQ7DQo+
PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2RvX3JlY292ZXJ5KHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykNCj4+ICAgew0KPj4gICAgICAgICAgc3RydWN0IGFtZGdwdV9y
YXMgKnJhcyA9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+PiBp
bmRleCAwNjVjNjZiYWY5NDcuLmUyZGZmMDBiOGQxYyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+PiBAQCAtOTMsNiArOTMsNyBAQCBzdHJ1Y3QgYW1k
Z3B1X3JhcyB7DQo+PiAgICAgICAgICBzdHJ1Y3QgZGVudHJ5ICplbnQ7DQo+PiAgICAgICAgICAv
KiBzeXNmcyAqLw0KPj4gICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZmVhdHVyZXNf
YXR0cjsNCj4+ICsgICAgICAgc3RydWN0IGJpbl9hdHRyaWJ1dGUgYmFkcGFnZXNfYXR0cjsNCj4+
ICAgICAgICAgIC8qIGJsb2NrIGFycmF5ICovDQo+PiAgICAgICAgICBzdHJ1Y3QgcmFzX21hbmFn
ZXIgKm9ianM7DQo+Pg0KPj4gLS0NCj4+IDIuMTcuMQ0KPj4NCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbmFtMDQuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVk
ZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0Mw
MSU3QyU3Q2FlNjlmMGQ0YjBkZjQ5ZjU3NmUwMDhkNmQ0OTI2YzljJTdDODRkZjllN2ZlOWY2NDBh
ZmI0MzVhYWFhYWFhYWFhYWElN0MxJTdDMCU3QzYzNjkzMDEyMjY3NzczNzAwNiZhbXA7c2RhdGE9
MmtJWHZVSFFmTjRHJTJCSjBiN0ZxWDRBMXg3cVh5VElsdjNXTUVyWFV0cGdZJTNEJmFtcDtyZXNl
cnZlZD0wDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IGh0dHBzOi8vbmFtMDQuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUy
RmFtZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3QyU3Q2FlNjlmMGQ0YjBkZjQ5ZjU3NmUwMDhkNmQ0
OTI2YzljJTdDODRkZjllN2ZlOWY2NDBhZmI0MzVhYWFhYWFhYWFhYWElN0MxJTdDMCU3QzYzNjkz
MDEyMjY3Nzc0NzAxNyZhbXA7c2RhdGE9RXZmcnQ2cFMlMkIzbUVHRjdqSDZQQ3prYzBZOFVBcnNl
WTRHSnVocjcwMlJzJTNEJmFtcDtyZXNlcnZlZD0wDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
