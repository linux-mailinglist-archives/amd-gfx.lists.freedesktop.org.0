Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD209E70EE
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Oct 2019 13:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF036E791;
	Mon, 28 Oct 2019 12:07:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051066E791
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Oct 2019 12:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWuK4ian9gZWsAashAotQ5X2f2Wrzs5q4niegKw6peu1k1Zmqz8Nx+Su+sHqiTz1FbUG/vyFPoYUFcBB5wthrbCwxdfy/73IMDuzCwRhgTvXSonzglwnxC9p+mowOFf2vuHbaX5rtLb7JRdsSR/axP088+dscW7RChiqOSzySR0f7ss4rczzOYplXFuzMnqdUPd2RX9gqoS9JmlEIWQhpHzBLaNt23GJHBbH01lrnyTCSrHZ2lN0K45ooFIQudw9SNN+3ZqGtW9tu6uA1iBI50KC8xszv//8iGm3AuNtexmlKCCtQSvEKRWUcp4bTB2GVTLQsC+RmrzERu+JPrIKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/wFt4Bfw2a9UYiFZg6WNxYk9HbzfN7oJZ+yavqWXGU=;
 b=LycOhlX4qQ7cV++DDAupblOej3YrfyaS/AB2zOFQy8T2XnWx/L6+UWDDW+/+BmKVvY5v94E/seQXICyuammh4ndWWNnchYBd6KjBgOxXC9viOBwV3JjirBVOkKvvBcAB121G+vJp15e0sN1GMocgGuV5+XieVeGrY/bl0X/4Zrmx5JTaz6I5Qb4f7L6y9EA2iDyg8MRp9ieAsK3/AAWLFZ+4YtpHJlNdoDweoIrWJEess/LWQJWrXZv+kPq3uyEruNCiPzn3EjqPgkeq3/ZZci/A1DJlN6da4s1h+dyRssFmr2j46I07uivElwMACzd1xdMiARc2qw5qWzsAkvP30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) by
 MN2PR12MB3325.namprd12.prod.outlook.com (20.178.243.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Mon, 28 Oct 2019 12:07:11 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9973:de2e:58b4:282a]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9973:de2e:58b4:282a%7]) with mapi id 15.20.2387.023; Mon, 28 Oct 2019
 12:07:11 +0000
From: "Zhu, Changfeng" <Changfeng.Zhu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: GFX9, GFX10: GRBM requires 1-cycle delay
Thread-Topic: [PATCH] drm/amdgpu: GFX9, GFX10: GRBM requires 1-cycle delay
Thread-Index: AdWLFiQD2YNV3TiXSsGV+9ZQg6UMQgAJgeEAAAQOIoAAeh7fsAASBcOAAAKWd4A=
Date: Mon, 28 Oct 2019 12:07:10 +0000
Message-ID: <MN2PR12MB289635AAE8D9913231145B81FD660@MN2PR12MB2896.namprd12.prod.outlook.com>
References: <MN2PR12MB33095371C6336C43E4F88C43EC650@MN2PR12MB3309.namprd12.prod.outlook.com>
 <MN2PR12MB28967F025FA60291AE745FE6FD650@MN2PR12MB2896.namprd12.prod.outlook.com>
 <b54e3e37-ff15-079f-9b62-be7936836672@amd.com>
 <MN2PR12MB2896E32084545C8EB240BC45FD660@MN2PR12MB2896.namprd12.prod.outlook.com>
 <924c7758-92ed-caf6-8068-ca12d7d77ed7@amd.com>
In-Reply-To: <924c7758-92ed-caf6-8068-ca12d7d77ed7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [140.206.195.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 562fedb6-f6e2-49c9-a447-08d75b9f5cdf
x-ms-traffictypediagnostic: MN2PR12MB3325:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3325EF39A819FA03FC79FF09FD660@MN2PR12MB3325.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(189003)(199004)(13464003)(476003)(3846002)(6116002)(52536014)(14454004)(76176011)(7696005)(64756008)(30864003)(66446008)(6506007)(6436002)(446003)(53546011)(8936002)(110136005)(2906002)(11346002)(99286004)(26005)(486006)(102836004)(71200400001)(76116006)(71190400001)(186003)(66556008)(74316002)(5660300002)(2501003)(14444005)(55016002)(256004)(6246003)(305945005)(9686003)(7736002)(86362001)(81156014)(25786009)(8676002)(316002)(81166006)(33656002)(478600001)(4326008)(229853002)(66066001)(54906003)(66476007)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3325;
 H:MN2PR12MB2896.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLRPNuRzanVEDFVkHwJnkLiIlirjnbDXHhTwhshfTOvfSNzTbbUPqdKuPKp337NNxCQZ7tncHmEIpjbPyNltOqIZBQmMfObJZ1k6pHvDQp22x3Wp9aOoVOCNfS/YZwJFdlXnOCjQe3gud7ljVK7qhTRzW1RFwqFdtIMZEtsBQT5mtUjlk3yFkQimNWblH3u967SmEwHbHybnEjmbIL79Vg3F3FGHOXlkqaZ8Y6pQ9/SRiV+uuDmV9FY1BpC/3yOoHu+zmh8JovxhrB5Xbj3m/8sQ/b34L5s625Su3g6m7qco46mqZsKTOU4eAT7pWy88n98wiDoLZiXvrktkwpVximmp0yJmS5LPob8RdWfZE4DZkiNVTvSkprrXxttfPsHDJErasEVS8lpk40fulv7ffGN7CNseEa9vTxJ5+RveR/ITAHoLDqG/ovWnRJBos9h5
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562fedb6-f6e2-49c9-a447-08d75b9f5cdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 12:07:11.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 038/kCvnPo5ADPwXoHvtfa1gLYD+vs6TZROUUXePX8TJyBnIT2lhKrBrwtHzJMEnN6TE02OMLwit/ASlyXwLcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3325
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/wFt4Bfw2a9UYiFZg6WNxYk9HbzfN7oJZ+yavqWXGU=;
 b=CAJnOLE4x1JhnKnSnAIPqxhVJKXN90yjEEPCzGKNjxH5rGtSLKkUmW90APfsk6dAkyYa5oQ3ws0f3GYNKEcdkcw2sCOnKcznqX4/MyIrdYOmKYqv37UZmv7uGUKE/RFwHWV7jUYliGpbALh8r1/ExsihBVpKqKsWVlUwAhouN9c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changfeng.Zhu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pelloux-prayer,
 Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLA0KDQpTaG91bGQgd2UgYWxzbyByZWFsaXplIHRoZSBmdW5jdGlvbiBvZiBn
ZnhfdjlfMF93YWl0X3JlZ19tZW0gaW4gZ2Z4MTAgbGlrZSBnZng5IHNpbmNlIGdmeDEwIGFsc28g
cmVhbGl6ZSB3cml0ZS93YWl0IGNvbW1hbmQgaW4gYSBzaW5nbGUgcGFja2V0IGFmdGVyIENMIzE3
NjEzMDA/DQoNCk9yIHdlIGNhbiBhZGQgZHVtbXkgcmVhZCBpbiBnbWMxMCBieSB1c2luZyBlbWl0
X3dhaXQgbGlrZSBMdWJlbidzIHdheT8NCg0KQlIsDQpDaGFuZ2ZlbmcuIA0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT4gDQpTZW50OiBNb25kYXksIE9jdG9iZXIgMjgsIDIwMTkgNjo0NyBQTQ0KVG86
IFpodSwgQ2hhbmdmZW5nIDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT47IFBlbGxvdXgtcHJheWVyLCBQaWVycmUtZXJpYyA8UGllcnJlLWVyaWMuUGVsbG91
eC1wcmF5ZXJAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgVHVpa292
LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0v
YW1kZ3B1OiBHRlg5LCBHRlgxMDogR1JCTSByZXF1aXJlcyAxLWN5Y2xlIGRlbGF5DQoNCkhpIENo
YW5nZmVuZywNCg0KPiBTbyBob3cgY2FuIHdlIGRlYWwgd2l0aCB0aGUgZmlybXdhcmUgYmV0d2Vl
biBtZWMgdmVyc2lvbig0MDIpIGFuZCBtZWMgdmVyc2lvbig0MjEpPw0KV2VsbCBvZiBoYW5kIEkg
c2VlIG9ubHkgdHdvIG9wdGlvbnM6IEVpdGhlciBwcmludCBhIHdhcm5pbmcgb3IgY29tcGxldGVs
eSByZWplY3QgbG9hZGluZyB0aGUgZHJpdmVyLg0KDQpDb21wbGV0ZWx5IHJlamVjdGluZyBsb2Fk
aW5nIHRoZSBkcml2ZXIgaXMgcHJvYmFibHkgbm90IGEgZ29vZCBpZGVhIGFuZCB0aGUgaXNzdWUg
aXMgYWN0dWFsbHkgZXh0cmVtZWx5IHVubGlrZWx5IHRvIGNhdXNlIGFueSBwcm9ibGVtcy4NCg0K
U28gcHJpbnRpbmcgYSB3YXJuaW5nIHRoYXQgdGhlIHVzZXIgc2hvdWxkIHVwZGF0ZSB0aGVpciBm
aXJtd2FyZSBpcyBwcm9iYWJseSB0aGUgYmVzdCBhcHByb2FjaC4NCg0KUmVnYXJkcywNCkNocmlz
dGlhbi4NCg0KQW0gMjguMTAuMTkgdW0gMDQ6MDEgc2NocmllYiBaaHUsIENoYW5nZmVuZzoNCj4g
SGkgQ2hyaXN0aWFuLA0KPg0KPiBSZS0gdGhhdCB3b24ndCB3b3JrLCB5b3UgY2FuJ3QgYWRkIHRo
aXMgdG8gDQo+IGFtZGdwdV9yaW5nX2VtaXRfcmVnX3dyaXRlX3JlZ193YWl0X2hlbHBlciBvciBi
cmVhayBhbGwgcmVhZCB0cmlnZ2VyZWQgcmVnaXN0ZXJzIChsaWtlIHRoZSBzZW1hcGhvcmUgb25l
cykuDQo+DQo+IERvIHlvdSBtZWFuIHRoYXQgSSBzaG91bGQgdXNlIHJlZ193YWl0IHJlZ2lzdGVy
cyh3YWl0X3JlZ19tZW0pIGxpa2UgTHViZW4gdG8gcmVwbGFjZSByZWFkIHRyaWdnZXJlZCByZWdp
c3RlcnMgZm9yIGFkZGluZyBkdW1teSByZWFkPw0KPg0KPiBSZS1BZGRpdGlvbmFsIHRvIHRoYXQg
aXQgd2lsbCBuZXZlciB3b3JrIG9uIEdGWDksIHNpbmNlIHRoZSBDUCBmaXJtd2FyZSB0aGVyZSB1
c2VzIHRoZSBpbnRlZ3JhdGVkIHdyaXRlL3dhaXQgY29tbWFuZCBhbmQgeW91IGNhbid0IGFkZCBh
biBhZGRpdGlvbmFsIGR1bW15IHJlYWQgdGhlcmUuDQo+DQo+IFllcywgSSBzZWUgdGhlIGludGVn
cmF0ZWQgd3JpdGUvd2FpdCBjb21tYW5kIGFuZCB0aGV5IGFyZSByZWFsaXplZCBpbiBnZnhfdjlf
MF93YWl0X3JlZ19tZW06DQo+IEVtaWx5J3MgcGF0Y2g6DQo+IGRybS9hbWRncHU6IFJlbW92ZSB0
aGUgc3Jpb3YgY2hlY2tpbmcgYW5kIGFkZCBmaXJtd2FyZSBjaGVja2luZyANCj4gZGVjaWRlcyB3
aGVuIHRvIGdvIGludG8gZ2Z4X3Y5XzBfd2FpdF9yZWdfbWVtIGFuZCB3aGVuIGdvIGludG8gYW1k
Z3B1X3JpbmdfZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXRfaGVscGVyLg0KPg0KPiBIb3dldmVyIHRo
ZXJlIGFyZSB0d28gcHJvYmxlbXMgbm93Lg0KPiAxLkJlZm9yZSB0aGUgZndfdmVyc2lvbl9vayBm
dyB2ZXJzaW9uLCB0aGUgY29kZSBnb2VzIGludG8gYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3JpdGVf
cmVnX3dhaXRfaGVscGVyLiBJbiB0aGlzIGNhc2UsIHNob3VsZCBub3Qgd2UgYWRkIGR1bW15IHJl
YWQgaW4gYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXRfaGVscGVyPw0KPiAyLkFm
dGVyIHRoZSBmd192ZXJzaW9uX29rIGZ3IHZlcnNpb24sIHRoZSBjb2RlIGdvZXMgaW50byBnZnhf
djlfMF93YWl0X3JlZ19tZW0uIEhvd2V2ZXIsIGl0IHJlYWxpemVzIHdyaXRlL3dhaXQgY29tbWFu
ZCBpbiBmaXJtd2FyZS4gVGhlbiBob3cgY2FuIHdlIGFkZCB0aGlzIGR1bW15IHJlYWQ/IEFjY29y
ZGluZyB0byBZYW5nLFppbG9uZywgdGhlIENQIGZpcm13YXJlIGhhcyByZWFsaXplZCBkdW1teSBp
biBmaXJtd2FyZSBpbiBDTDoNCj4gVmVnYTIwIENMIzE3NjI0NzAgQDMvMjcvMjAxOQ0KPiBOYXZp
MTAgQ0wjMTc2MTMwMCBAMy8yNS8yMDE5DQo+IEFjY29kcmluZyB0byBDTCMxNzYyNDcwLA0KPiBU
aGUgZmlybXdhcmUgd2hpY2ggcmVhbGl6ZWQgZHVtbXkgcmVhZCBpcyhSYXZlbiBmb3IgZXhhbXBs
ZSk6DQo+IE1lYyB2ZXJzaW9uOg0KPiAjZGVmaW5lIEYzMl9NRUNfVUNPREVfVkVSU0lPTiAiIzQy
MSINCj4gI2RlZmluZSBGMzJfTUVDX0ZFQVRVUkVfVkVSU0lPTiA0Ng0KPiBQZnAgdmVyc2lvbjoN
Cj4gI2RlZmluZSBGMzJfUEZQX1VDT0RFX1ZFUlNJT04gIiMxODMiDQo+ICNkZWZpbmUgRjMyX1BG
UF9GRUFUVVJFX1ZFUlNJT04gNDYNCj4gSW4gRW1pbHkncyBwYXRjaDoNCj4gVGhlIENQIGZpcm13
YXJlIHdoaWNodXNlcyB0aGUgaW50ZWdyYXRlZCB3cml0ZS93YWl0IGNvbW1hbmQgYmVnaW5zIGZy
b20gdmVyc2lvbjoNCj4gKyAgICAgICBjYXNlIENISVBfUkFWRU46DQo+ICsgICAgICAgICAgICAg
ICBpZiAoKGFkZXYtPmdmeC5tZV9md192ZXJzaW9uID49IDB4MDAwMDAwOWMpICYmDQo+ICsgICAg
ICAgICAgICAgICAgICAgKGFkZXYtPmdmeC5tZV9mZWF0dXJlX3ZlcnNpb24gPj0gNDIpICYmDQo+
ICsgICAgICAgICAgICAgICAgICAgKGFkZXYtPmdmeC5wZnBfZndfdmVyc2lvbiA+PSAgMHgwMDAw
MDBiMSgxNzcpKSAmJg0KPiArICAgICAgICAgICAgICAgICAgIChhZGV2LT5nZngucGZwX2ZlYXR1
cmVfdmVyc2lvbiA+PSA0MikpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5t
ZV9md193cml0ZV93YWl0ID0gdHJ1ZTsNCj4gKw0KPiArICAgICAgICAgICAgICAgaWYgKChhZGV2
LT5nZngubWVjX2Z3X3ZlcnNpb24gPj0gIDB4MDAwMDAxOTIoNDAyKSkgJiYNCj4gKyAgICAgICAg
ICAgICAgICAgICAoYWRldi0+Z2Z4Lm1lY19mZWF0dXJlX3ZlcnNpb24gPj0gNDIpKQ0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBhZGV2LT5nZngubWVjX2Z3X3dyaXRlX3dhaXQgPSB0cnVlOw0K
PiArICAgICAgICAgICAgICAgYnJlYWs7DQo+DQo+IFNvIGhvdyBjYW4gd2UgZGVhbCB3aXRoIHRo
ZSBmaXJtd2FyZSBiZXR3ZWVuIG1lYyB2ZXJzaW9uKDQwMikgYW5kIG1lYyB2ZXJzaW9uKDQyMSk/
DQo+IEl0IHdpbGwgcmVhbGl6ZSB3cml0ZS93YWl0IGNvbW1hbmQgaW4gQ1AgZmlybXdhcmUgYnV0
IGl0IGRvZXNuJ3QgaGF2ZSBkdW1teSByZWFkLg0KPg0KPiBCUiwNCj4gQ2hhbmdmZW5nLg0KPg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMjUsIDIw
MTkgMTE6NTQgUE0NCj4gVG86IFpodSwgQ2hhbmdmZW5nIDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+
OyANCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhh
bmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFBlbGxvdXgtcHJheWVyLCANCj4gUGll
cnJlLWVyaWMgPFBpZXJyZS1lcmljLlBlbGxvdXgtcHJheWVyQGFtZC5jb20+OyBIdWFuZywgUmF5
IA0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBUdWlrb3YsIEx1YmVuIDxMdWJlbi5UdWlrb3ZAYW1k
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogR0ZYOSwgR0ZYMTA6IEdS
Qk0gcmVxdWlyZXMgMS1jeWNsZSANCj4gZGVsYXkNCj4NCj4gSGkgQ2hhbmdmZW5nLA0KPg0KPiB0
aGF0IHdvbid0IHdvcmssIHlvdSBjYW4ndCBhZGQgdGhpcyB0byANCj4gYW1kZ3B1X3JpbmdfZW1p
dF9yZWdfd3JpdGVfcmVnX3dhaXRfaGVscGVyIG9yIGJyZWFrIGFsbCByZWFkIHRyaWdnZXJlZCBy
ZWdpc3RlcnMgKGxpa2UgdGhlIHNlbWFwaG9yZSBvbmVzKS4NCj4NCj4gQWRkaXRpb25hbCB0byB0
aGF0IGl0IHdpbGwgbmV2ZXIgd29yayBvbiBHRlg5LCBzaW5jZSB0aGUgQ1AgZmlybXdhcmUgdGhl
cmUgdXNlcyB0aGUgaW50ZWdyYXRlZCB3cml0ZS93YWl0IGNvbW1hbmQgYW5kIHlvdSBjYW4ndCBh
ZGQgYW4gYWRkaXRpb25hbCBkdW1teSByZWFkIHRoZXJlLg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJp
c3RpYW4uDQo+DQo+IEFtIDI1LjEwLjE5IHVtIDE2OjIyIHNjaHJpZWIgWmh1LCBDaGFuZ2Zlbmc6
DQo+PiBJIHRyeSB0byB3cml0ZSBhIHBhdGNoIGJhc2VkIG9uIHRoZSBwYXRjaCBvZiBUdWlrb3Ys
THViZW4uDQo+Pg0KPj4gSW5zcGlyZWQgYnkgTHViZW4saGVyZSBpcyB0aGUgcGF0Y2g6DQo+Pg0K
Pj4gICBGcm9tIDE5ODBkOGYxZWQ0NGZiOWE4NGE1ZWExZjZlMmVkZDJiYzI1YzYyOWEgTW9uIFNl
cCAxNyAwMDowMDowMA0KPj4gMjAwMQ0KPj4gRnJvbTogY2hhbmd6aHUgPENoYW5nZmVuZy5aaHVA
YW1kLmNvbT4NCj4+IERhdGU6IFRodSwgMTAgT2N0IDIwMTkgMTE6MDI6MzMgKzA4MDANCj4+IFN1
YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogYWRkIGR1bW15IHJlYWQgYnkgZW5naW5lcyBmb3Ig
c29tZSBHQ1ZNIHN0YXR1cw0KPj4gICAgcmVnaXN0ZXJzDQo+Pg0KPj4gVGhlIEdSQk0gcmVnaXN0
ZXIgaW50ZXJmYWNlIGlzIG5vdyBjYXBhYmxlIG9mIGJ1cnN0aW5nIDEgY3ljbGUgcGVyIA0KPj4g
cmVnaXN0ZXIgd3ItPndyLCB3ci0+cmQgbXVjaCBmYXN0ZXIgdGhhbiBwcmV2aW91cyBtdXRpY3lj
bGUgcGVyIA0KPj4gdHJhbnNhY3Rpb24gZG9uZSBpbnRlcmZhY2UuICBUaGlzIGhhcyBjYXVzZWQg
YSBwcm9ibGVtIHdoZXJlIHN0YXR1cyANCj4+IHJlZ2lzdGVycyByZXF1aXJpbmcgSFcgdG8gdXBk
YXRlIGhhdmUgYSAxIGN5Y2xlIGRlbGF5LCBkdWUgdG8gdGhlIA0KPj4gcmVnaXN0ZXIgdXBkYXRl
IGhhdmluZyB0byBnbyB0aHJvdWdoIEdSQk0uDQo+Pg0KPj4gU1cgbWF5IG9wZXJhdGUgb24gYW4g
aW5jb3JyZWN0IHZhbHVlIGlmIHRoZXkgd3JpdGUgYSByZWdpc3RlciBhbmQgDQo+PiBpbW1lZGlh
dGVseSBjaGVjayB0aGUgY29ycmVzcG9uZGluZyBzdGF0dXMgcmVnaXN0ZXIuDQo+Pg0KPj4gUmVn
aXN0ZXJzIHJlcXVpcmluZyBIVyB0byBjbGVhciBvciBzZXQgZmllbGRzIG1heSBiZSBkZWxheWVk
IGJ5IDEgY3ljbGUuDQo+PiBGb3IgZXhhbXBsZSwNCj4+DQo+PiAxLiB3cml0ZSBWTV9JTlZBTElE
QVRFX0VORzBfUkVRIG1hc2sgPSA1YSAyLiByZWFkIA0KPj4gVk1fSU5WQUxJREFURV9FTkcwX0FD
S2IgdGlsbCB0aGUgYWNrIGlzIHNhbWUgYXMgdGhlIHJlcXVlc3QgbWFzayA9IDVhDQo+PiAgICAg
ICAJYS4gSFcgd2lsbCByZXNldCBWTV9JTlZBTElEQVRFX0VORzBfQUNLID0gMCB1bnRpbCBpbnZh
bGlkYXRpb24gDQo+PiBpcyBjb21wbGV0ZSAzLiB3cml0ZSBWTV9JTlZBTElEQVRFX0VORzBfUkVR
IG1hc2sgPSA1YSA0LiByZWFkIA0KPj4gVk1fSU5WQUxJREFURV9FTkcwX0FDSyB0aWxsIHRoZSBh
Y2sgaXMgc2FtZSBhcyB0aGUgcmVxdWVzdCBtYXNrID0gNWENCj4+IAlhLiBGaXJzdCByZWFkIG9m
IFZNX0lOVkFMSURBVEVfRU5HMF9BQ0sgPSA1YSBpbnN0ZWFkIG9mIDANCj4+IAliLiBTZWNvbmQg
cmVhZCBvZiBWTV9JTlZBTElEQVRFX0VORzBfQUNLID0gMCBiZWNhdXNlIHRoZSByZW1vdGUgR1JC
TSBoL3cNCj4+IAkgICByZWdpc3RlciB0YWtlcyBvbmUgZXh0cmEgY3ljbGUgdG8gYmUgY2xlYXJl
ZA0KPj4gCWMuIEluIHRoaXMgY2FzZSxTVyB3aWwgc2VlIGEgZmFsc2UgQUNLIGlmIHRoZXkgZXhp
dCBvbiBmaXJzdCByZWFkDQo+Pg0KPj4gQWZmZWN0ZWQgcmVnaXN0ZXJzIChvbmx5IEdDIHZhcmlh
bnQpICB8IFJlY29tbWVuZGVkIER1bW15IFJlYWQNCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+IFZNX0lOVkFM
SURBVEVfRU5HKl9BQ0sJCSAgICAgIHwgIFZNX0lOVkFMSURBVEVfRU5HKl9SRVENCj4+IFZNX0wy
X1NUQVRVUwkJCSAgICAgIHwgIFZNX0wyX1NUQVRVUw0KPj4gVk1fTDJfUFJPVEVDVElPTl9GQVVM
VF9TVEFUVVMJICAgICAgfCAgVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMNCj4+IFZNX0wy
X1BST1RFQ1RJT05fRkFVTFRfQUREUl9ISS9MTzMyICAgfCAgVk1fTDJfUFJPVEVDVElPTl9GQVVM
VF9BRERSX0hJL0xPMzINCj4+IFZNX0wyX0lIX0xPR19CVVNZCQkgICAgICB8ICBWTV9MMl9JSF9M
T0dfQlVTWQ0KPj4gTUNfVk1fTDJfUEVSRkNPVU5URVJfSEkvTE8JICAgICAgfCAgTUNfVk1fTDJf
UEVSRkNPVU5URVJfSEkvTE8NCj4+IEFUQ19MMl9QRVJGQ09VTlRFUl9ISS9MTwkgICAgICB8ICBB
VENfTDJfUEVSRkNPVU5URVJfSEkvTE8NCj4+IEFUQ19MMl9QRVJGQ09VTlRFUjJfSEkvTE8JICAg
ICAgfCAgQVRDX0wyX1BFUkZDT1VOVEVSMl9ISS9MTw0KPj4NCj4+IEl0IGFsc28gbmVlZHMgZHVt
bXkgcmVhZCBieSBlbmdpbmVzIGZvciB0aGVzZSBnYyByZWdpc3RlcnMuDQo+Pg0KPj4gQ2hhbmdl
LUlkOiBJZTAyOGYzN2ViNzg5OTY2ZDQ1OTM5ODRiZDY2MWIyNDhlYmViMWFjMw0KPj4gU2lnbmVk
LW9mZi1ieTogY2hhbmd6aHUgPENoYW5nZmVuZy5aaHVAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYyB8ICA1ICsrKysrDQo+PiAg
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgIHwgIDIgKysNCj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgfCAgMiArKw0KPj4gICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgICB8ICA0ICsrKysNCj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jICAgfCAxOCArKysrKysrKysr
KysrKysrKysNCj4+ICAgIDUgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMNCj4+IGluZGV4IDRi
M2Y1OGRiZjM2Zi4uYzJmYmY2MDg3ZWNmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3JpbmcuYw0KPj4gQEAgLTM5Miw2ICszOTIsMTEgQEAgdm9pZCBhbWRncHVf
cmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdF9oZWxwZXIoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLA0KPj4gICAgCQkJCQkJdWludDMyX3QgcmVmLCB1aW50MzJfdCBtYXNrKQ0KPj4gICAgew0K
Pj4gICAgCWFtZGdwdV9yaW5nX2VtaXRfd3JlZyhyaW5nLCByZWcwLCByZWYpOw0KPj4gKw0KPj4g
KwkvKiB3YWl0IGZvciBhIGN5Y2xlIHRvIHJlc2V0IHZtX2ludl9lbmcwX2FjayAqLw0KPj4gKwlp
ZiAocmluZy0+ZnVuY3MtPnZtaHViID09IEFNREdQVV9HRlhIVUJfMCkNCj4+ICsJCWFtZGdwdV9y
aW5nX2VtaXRfcnJlZyhyaW5nLCByZWcwKTsNCj4+ICsNCj4+ICAgIAlhbWRncHVfcmluZ19lbWl0
X3JlZ193YWl0KHJpbmcsIHJlZzEsIG1hc2ssIG1hc2spOw0KPj4gICAgfQ0KPj4gICAgDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCj4+IGluZGV4IGVmMTk3NWE1
MzIzYS4uMTA0YzQ3NzM0MzE2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jDQo+PiBAQCAtNTE1NSw2ICs1MTU1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
bWRncHVfcmluZ19mdW5jcyBnZnhfdjEwXzBfcmluZ19mdW5jc19nZnggPSB7DQo+PiAgICAJLnBh
dGNoX2NvbmRfZXhlYyA9IGdmeF92MTBfMF9yaW5nX2VtaXRfcGF0Y2hfY29uZF9leGVjLA0KPj4g
ICAgCS5wcmVlbXB0X2liID0gZ2Z4X3YxMF8wX3JpbmdfcHJlZW1wdF9pYiwNCj4+ICAgIAkuZW1p
dF90bXogPSBnZnhfdjEwXzBfcmluZ19lbWl0X3RteiwNCj4+ICsJLmVtaXRfcnJlZyA9IGdmeF92
MTBfMF9yaW5nX2VtaXRfcnJlZywNCj4+ICAgIAkuZW1pdF93cmVnID0gZ2Z4X3YxMF8wX3Jpbmdf
ZW1pdF93cmVnLA0KPj4gICAgCS5lbWl0X3JlZ193YWl0ID0gZ2Z4X3YxMF8wX3JpbmdfZW1pdF9y
ZWdfd2FpdCwNCj4+ICAgIH07DQo+PiBAQCAtNTE4OCw2ICs1MTg5LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyBnZnhfdjEwXzBfcmluZ19mdW5jc19jb21wdXRlID0g
ew0KPj4gICAgCS50ZXN0X2liID0gZ2Z4X3YxMF8wX3JpbmdfdGVzdF9pYiwNCj4+ICAgIAkuaW5z
ZXJ0X25vcCA9IGFtZGdwdV9yaW5nX2luc2VydF9ub3AsDQo+PiAgICAJLnBhZF9pYiA9IGFtZGdw
dV9yaW5nX2dlbmVyaWNfcGFkX2liLA0KPj4gKwkuZW1pdF9ycmVnID0gZ2Z4X3YxMF8wX3Jpbmdf
ZW1pdF9ycmVnLA0KPj4gICAgCS5lbWl0X3dyZWcgPSBnZnhfdjEwXzBfcmluZ19lbWl0X3dyZWcs
DQo+PiAgICAJLmVtaXRfcmVnX3dhaXQgPSBnZnhfdjEwXzBfcmluZ19lbWl0X3JlZ193YWl0LA0K
Pj4gICAgfTsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+IGlu
ZGV4IDJmMDNiZjUzM2Q0MS4uZDAwYjUzZGUwZmRjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4gQEAgLTYyNTMsNiArNjI1Myw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgZ2Z4X3Y5XzBfcmluZ19mdW5jc19nZnggPSB7DQo+
PiAgICAJLmluaXRfY29uZF9leGVjID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X2luaXRfY29uZF9leGVj
LA0KPj4gICAgCS5wYXRjaF9jb25kX2V4ZWMgPSBnZnhfdjlfMF9yaW5nX2VtaXRfcGF0Y2hfY29u
ZF9leGVjLA0KPj4gICAgCS5lbWl0X3RteiA9IGdmeF92OV8wX3JpbmdfZW1pdF90bXosDQo+PiAr
CS5lbWl0X3JyZWcgPSBnZnhfdjlfMF9yaW5nX2VtaXRfcnJlZywNCj4+ICAgIAkuZW1pdF93cmVn
ID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X3dyZWcsDQo+PiAgICAJLmVtaXRfcmVnX3dhaXQgPSBnZnhf
djlfMF9yaW5nX2VtaXRfcmVnX3dhaXQsDQo+PiAgICAJLmVtaXRfcmVnX3dyaXRlX3JlZ193YWl0
ID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdCwNCj4+IEBAIC02Mjg5LDYg
KzYyOTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIGdmeF92OV8w
X3JpbmdfZnVuY3NfY29tcHV0ZSA9IHsNCj4+ICAgIAkuaW5zZXJ0X25vcCA9IGFtZGdwdV9yaW5n
X2luc2VydF9ub3AsDQo+PiAgICAJLnBhZF9pYiA9IGFtZGdwdV9yaW5nX2dlbmVyaWNfcGFkX2li
LA0KPj4gICAgCS5zZXRfcHJpb3JpdHkgPSBnZnhfdjlfMF9yaW5nX3NldF9wcmlvcml0eV9jb21w
dXRlLA0KPj4gKwkuZW1pdF9ycmVnID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X3JyZWcsDQo+PiAgICAJ
LmVtaXRfd3JlZyA9IGdmeF92OV8wX3JpbmdfZW1pdF93cmVnLA0KPj4gICAgCS5lbWl0X3JlZ193
YWl0ID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X3JlZ193YWl0LA0KPj4gICAgCS5lbWl0X3JlZ193cml0
ZV9yZWdfd2FpdCA9IGdmeF92OV8wX3JpbmdfZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXQsDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMNCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMNCj4+IGluZGV4IDNiMDBiY2Ux
NGNmYi4uZGNlNmI2NTFkYTFmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3YxMF8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192MTBfMC5jDQo+PiBAQCAtMzQ2LDYgKzM0NiwxMCBAQCBzdGF0aWMgdWludDY0X3QNCj4+IGdt
Y192MTBfMF9lbWl0X2ZsdXNoX2dwdV90bGIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLA0KPj4g
ICAgDQo+PiAgICAJYW1kZ3B1X3JpbmdfZW1pdF93cmVnKHJpbmcsIGh1Yi0+dm1faW52X2VuZzBf
cmVxICsgZW5nLCByZXEpOw0KPj4gICAgDQo+PiArCS8qIHdhaXQgZm9yIGEgY3ljbGUgdG8gcmVz
ZXQgdm1faW52X2VuZzBfYWNrICovDQo+PiArCWlmIChyaW5nLT5mdW5jcy0+dm1odWIgPT0gQU1E
R1BVX0dGWEhVQl8wKQ0KPj4gKwkJYW1kZ3B1X3JpbmdfZW1pdF9ycmVnKHJpbmcsIGh1Yi0+dm1f
aW52X2VuZzBfcmVxICsgZW5nKTsNCj4+ICsNCj4+ICAgIAkvKiB3YWl0IGZvciB0aGUgaW52YWxp
ZGF0ZSB0byBjb21wbGV0ZSAqLw0KPj4gICAgCWFtZGdwdV9yaW5nX2VtaXRfcmVnX3dhaXQocmlu
ZywgaHViLT52bV9pbnZfZW5nMF9hY2sgKyBlbmcsDQo+PiAgICAJCQkJICAxIDw8IHZtaWQsIDEg
PDwgdm1pZCk7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NV8wLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMNCj4+
IGluZGV4IDM0NjBjMDBmM2VhYS4uYmFhYTMzNDY3ODgyIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jDQo+PiBAQCAtMzgsNiArMzgsNyBAQA0KPj4gICAgI2lu
Y2x1ZGUgIm5hdmkxMF9zZG1hX3BrdF9vcGVuLmgiDQo+PiAgICAjaW5jbHVkZSAibmJpb192Ml8z
LmgiDQo+PiAgICAjaW5jbHVkZSAic2RtYV92NV8wLmgiDQo+PiArI2luY2x1ZGUgIm52ZC5oIg0K
Pj4gICAgDQo+PiAgICBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTBfc2RtYS5iaW4iKTsN
Cj4+ICAgIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9zZG1hMS5iaW4iKTsNCj4+IEBA
IC0xMTQ3LDYgKzExNDgsMjIgQEAgc3RhdGljIHZvaWQgc2RtYV92NV8wX3JpbmdfZW1pdF92bV9m
bHVzaChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+PiAgICAJYW1kZ3B1X2dtY19lbWl0X2Zs
dXNoX2dwdV90bGIocmluZywgdm1pZCwgcGRfYWRkcik7DQo+PiAgICB9DQo+PiAgICANCj4+ICtz
dGF0aWMgdm9pZCBzZG1hX3Y1XzBfcmluZ19lbWl0X3JyZWcoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCANCj4+ICt1aW50MzJfdCByZWcpIHsNCj4+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSByaW5nLT5hZGV2Ow0KPj4gKw0KPj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNL
RVQzKFBBQ0tFVDNfQ09QWV9EQVRBLCA0KSk7DQo+PiArCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IDAgfCAvKiBzcmM6IHJlZ2lzdGVyKi8NCj4+ICsJCQkJKDUgPDwgOCkgfCAgLyogZHN0OiBtZW1v
cnkgKi8NCj4+ICsJCQkJKDEgPDwgMjApKTsgLyogd3JpdGUgY29uZmlybSAqLw0KPj4gKwlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCByZWcpOw0KPj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCAw
KTsNCj4+ICsJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgbG93ZXJfMzJfYml0cyhhZGV2LT53Yi5n
cHVfYWRkciArDQo+PiArCQkJCWFkZXYtPnZpcnQucmVnX3ZhbF9vZmZzICogNCkpOw0KPj4gKwlh
bWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsN
Cj4+ICsJCQkJYWRldi0+dmlydC5yZWdfdmFsX29mZnMgKiA0KSk7DQo+PiArfQ0KPj4gKw0KPj4g
ICAgc3RhdGljIHZvaWQgc2RtYV92NV8wX3JpbmdfZW1pdF93cmVnKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywNCj4+ICAgIAkJCQkgICAgIHVpbnQzMl90IHJlZywgdWludDMyX3QgdmFsKQ0KPj4g
ICAgew0KPj4gQEAgLTE1OTcsNiArMTYxNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X3JpbmdfZnVuY3Mgc2RtYV92NV8wX3JpbmdfZnVuY3MgPSB7DQo+PiAgICAJLnRlc3RfaWIgPSBz
ZG1hX3Y1XzBfcmluZ190ZXN0X2liLA0KPj4gICAgCS5pbnNlcnRfbm9wID0gc2RtYV92NV8wX3Jp
bmdfaW5zZXJ0X25vcCwNCj4+ICAgIAkucGFkX2liID0gc2RtYV92NV8wX3JpbmdfcGFkX2liLA0K
Pj4gKwkuZW1pdF9ycmVnID0gc2RtYV92NV8wX3JpbmdfZW1pdF9ycmVnLA0KPj4gICAgCS5lbWl0
X3dyZWcgPSBzZG1hX3Y1XzBfcmluZ19lbWl0X3dyZWcsDQo+PiAgICAJLmVtaXRfcmVnX3dhaXQg
PSBzZG1hX3Y1XzBfcmluZ19lbWl0X3JlZ193YWl0LA0KPj4gICAgCS5pbml0X2NvbmRfZXhlYyA9
IHNkbWFfdjVfMF9yaW5nX2luaXRfY29uZF9leGVjLA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
