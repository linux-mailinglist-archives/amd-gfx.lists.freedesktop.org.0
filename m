Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D504C68665
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 11:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4638984F;
	Mon, 15 Jul 2019 09:34:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D468984F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:34:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu+ve9+HWCDe0YqGcs3seTWbOZwh96nx6eZZJhL4D7r+yMZ6tp++LJVzcj4WdY3Tz2qIwijnBMT3wiU6hhPelO6sjsWK4VOL4ALhBaYWanhDpsYXFIZA9GGoYFtAESw9dN90pXpVtvY75c20h/7BwPHnL6uxjQHNI83Hp31bOKcX7kB0pER5NlrLfFpL7Sdb/w/SSj/2dEupD6KYlPLqg0IzfUa59mGdTmaondCzoXSxxfoFIGZ78JkUYaQO/n/OEvfYQGsu5kR/XIjr0TpSikiNfcy1qPd5916EFcKaSfPnZt0J6K/5ELpWIS+2vKngNcteyoEeNjYYJ7ZE6WQvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUicnWqEP5BVGOn5KNg7N3GHhk3zPl8BRiRsINAkodc=;
 b=jccdgjuqQAQjJjzW/GDu/jHTF+k+Rwwxg4TO0Ug1kUncWfUtS5m4aspnwIdCeRDNY1MoVcBD7O6AThsFKQ2B7c3eBdfpIdQVbp8a23Kh60LOxl8GVoEETFj9abHdL9M4B74iy9H/LQeflpqj3r0ZBm2icqLWVGirYEMypy9UtYLYDpjwz1CMeP58TinyVuJEc14JpJM59iTLUMLcKthRQyrNqvbrrl3tPf4S/kPpdJHK244I8LS95z6On2kZHG5mSS8/ilzvpZ5bHpChYMMRoQSpIqnhIb1POfMxqe7kcD2REhsxVieBm6r7CPTU1zBchckuu3kNsTM+iXsh/B995Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4159.namprd12.prod.outlook.com (52.135.50.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Mon, 15 Jul 2019 09:34:55 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::78b4:3df5:c92a:e02a]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::78b4:3df5:c92a:e02a%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 09:34:55 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Topic: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Index: AQHVNwIC8YI0Xjw0H02CS/7Sp4MSRKbD2JCAgAdrA7CAAC5ngIAAAL4A
Date: Mon, 15 Jul 2019 09:34:55 +0000
Message-ID: <MN2PR12MB2975EA6482B987399797B0328FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
 <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
 <MN2PR12MB297593776F81FE032B2145218FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <550628f4-eb76-23aa-bc33-e9841e6d017b@amd.com>
In-Reply-To: <550628f4-eb76-23aa-bc33-e9841e6d017b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 771a8482-c3c5-456f-eda5-08d70907b264
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4159; 
x-ms-traffictypediagnostic: MN2PR12MB4159:
x-microsoft-antispam-prvs: <MN2PR12MB415971FF106519AA67622D9E8FCF0@MN2PR12MB4159.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(13464003)(189003)(199004)(71190400001)(446003)(11346002)(476003)(71200400001)(486006)(14454004)(66066001)(74316002)(99286004)(305945005)(7736002)(33656002)(9686003)(55016002)(66946007)(66476007)(66556008)(64756008)(66446008)(53546011)(6506007)(7696005)(76176011)(52536014)(3846002)(6116002)(229853002)(478600001)(4326008)(6436002)(26005)(76116006)(102836004)(6636002)(2906002)(68736007)(25786009)(186003)(86362001)(316002)(110136005)(53936002)(8676002)(8936002)(81156014)(81166006)(14444005)(256004)(6246003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4159;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3bqaEMh6YuN5FNFdm1nVLEiB8IcHsxuQ6CRXKQS9/VEI7VpldOWTthJ9hA+Jnie+IgiblKo68o6jsB3HGVMIxX9Xd3axjo1/2N0EbDIC3pigjSTsc44BjAhMFL0J876XzBKrMtxXKYZjvfNkUlXodm0usngY2aq0+4IRR3oxn/0N8XBg4M6D1htFIX7l9vn3OBzSTTkZIBqjdRYyz97ccYNNH0mMQNENXyB1g19ZaG9ztIhVvmEQsiR9MI8UsotydXspw86bGpq1cBLX8CmAP4i2UJZGus/zC+zyGDIBEzt7t1NlD7oAtB1AfRuKhteIQiybZSpmCqW2Lkcutw0nGlA+L7Usum93Cxzkr7SZmqN1vn25pDa03iVgwnoAOGr1LmVQ7a10A3T7Y4S+3Dq4KPQHB39LH+NZJDw1+0uLQ0s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771a8482-c3c5-456f-eda5-08d70907b264
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 09:34:55.7834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUicnWqEP5BVGOn5KNg7N3GHhk3zPl8BRiRsINAkodc=;
 b=Cb2T7c3LBpt6EIeycn+pMz70E7//5/dVIJvGvbs+EQYL8kp6eXDSyTWI0kvNkgfM1AR/RCiaQAlJEGP8nwqd5G52UkXUJ0NWK4AVrq+eWC4IWE91Wtun76qNFvcgmdDK0Cmjy15Qr2VKar44sPV7UWD+Mh+OBrvQ5pjQ1vViK44=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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

SGkgQ2hyaXN0aWFuLA0KICAgIEFzIGhhcyB0aGlzIGJlaGF2aW9yLCB3aGVuIHRlc3QgdnVsa2Fu
IGN0cyBhbGxvY2F0aW9uIHRlc3QsIGl0IHdpbGwgZXhoYXVzdGluZyB0aGUgbWVtb3J5LCBhbmQg
Y2F1c2Ugb3V0IG9mIG1lbW9yeS4gRG8geW91IHRoaW5rIHdlIGRvbid0IG5lZWQgdG8gZml4IGl0
Pw0KDQpCZXN0IHdpc2hlcw0KRW1pbHkgRGVuZw0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+RnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj5T
ZW50OiBNb25kYXksIEp1bHkgMTUsIDIwMTkgNTozMSBQTQ0KPlRvOiBEZW5nLCBFbWlseSA8RW1p
bHkuRGVuZ0BhbWQuY29tPjsgWmhvdSwgRGF2aWQoQ2h1bk1pbmcpDQo+PERhdmlkMS5aaG91QGFt
ZC5jb20+DQo+Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL3R0bTogRml4IHRoZSBtZW1vcnkgZGVsYXkgZnJlZSBpc3N1ZQ0KPg0KPkhp
IGd1eXMsDQo+DQo+PiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBhYm91dCB0aGlzPyBGb3Ig
cGVyIHZtIGJvLCBpdCBzZWVtcyBhbHdheXMNCj5kZWxheSB0byBmcmVlIHRoZSB0dG0gYm8uDQo+
WWVhaCwgYW5kIHRoYXQgaXMgY29ycmVjdCBiZWhhdmlvci4NCj4NCj5TaW5jZSB3ZSBkb24ndCBr
bm93IHdobyBpcyB1c2luZyBhIHBlci12bSBCTyB3ZSBuZWVkIHRvIHdhaXQgZm9yIGFsbA0KPmNv
bW1hbmQgc3VibWlzc2lvbnMgaW4gZmxpZ2h0IHdoZW4gaXQgaXMgZnJlZWQuDQo+DQo+Rm9yIHRo
aXMgd2UgY29weSB0aGUgY3VycmVudCBzdGF0ZSBvZiB0aGUgc2hhcmVkIHJlc2VydmF0aW9uIG9i
amVjdCBpbnRvIHRoZQ0KPnByaXZhdGUgb25lIGluIHR0bV9ib19pbmRpdmlkdWFsaXplX3Jlc3Yu
DQo+DQo+UmVnYXJkcywNCj5DaHJpc3RpYW4uDQo+DQo+QW0gMTUuMDcuMTkgdW0gMDg6NDkgc2No
cmllYiBEZW5nLCBFbWlseToNCj4+IEhpIERhdmlkLA0KPj4gICAgICAgWW91IGFyZSByaWdodCwg
aXQgd2lsbCBjb3B5IHBlci12bSByZXN2Lg0KPj4gICAgICAgQnV0IGN1cnJlbnRseSwgaXQgc3Rp
bGwgaGFzIHRoZSBkZWxheSBmcmVlIGlzc3VlIHdoaWNoIG5vbiBwZXIgdm0gYm8gZG9lc24ndA0K
Pmhhcy4gTWF5YmUgaXQgYWxyZWFkeSBoYXMgbmV3IGZlbmNlcyBhcHBlbmQgdG8gdGhpcyByZXN2
IG9iamVjdCBiZWZvcmUgY29weS4NCj4+DQo+PiBIaSBDaHJpc3RpYW4sDQo+PiAgICAgIERvIHlv
dSBoYXZlIGFueSBzdWdnZXN0aW9uIGFib3V0IHRoaXM/IEZvciBwZXIgdm0gYm8sIGl0IHNlZW1z
IGFsd2F5cw0KPmRlbGF5IHRvIGZyZWUgdGhlIHR0bSBiby4NCj4+DQo+PiBCZXN0IHdpc2hlcw0K
Pj4gRW1pbHkgRGVuZw0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJvbTog
WmhvdSwgRGF2aWQoQ2h1bk1pbmcpIDxEYXZpZDEuWmhvdUBhbWQuY29tPg0KPj4+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAxMCwgMjAxOSA5OjI4IFBNDQo+Pj4gVG86IERlbmcsIEVtaWx5IDxFbWls
eS5EZW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IEZpeCB0aGUgbWVtb3J5IGRlbGF5IGZyZWUgaXNzdWUN
Cj4+Pg0KPj4+IEl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0aGF0IGZyZWVpbmcgQk8gc3RpbGwgdXNl
cyBwZXItdm0gcmVzdi4NCj4+Pg0KPj4+IEkgcmVtZW1iZXIgd2hlbiBCTyBpcyBpbiByZWxlYXNl
IGxpc3QsIGl0cyByZXN2IHdpbGwgYmUgZnJvbSBwZXItdm0gcmVzdiBjb3B5Lg0KPj4+IENvdWxk
IHlvdSBjaGVjayBpdD8NCj4+Pg0KPj4+IC1EYXZpZA0KPj4+DQo+Pj4g5ZyoIDIwMTkvNy8xMCAx
NzoyOSwgRW1pbHkgRGVuZyDlhpnpgZM6DQo+Pj4+IEZvciB2dWxrYW4gY3RzIGFsbG9jYXRpb24g
dGVzdCBjYXNlcywgdGhleSB3aWxsIGNyZWF0ZSBhIHNlcmllcyBvZg0KPj4+PiBib3MsIGFuZCB0
aGVuIGZyZWUgdGhlbS4gQXMgaXQgaGFzIGxvdHMgb2YgYWxsb2N0aW9uIHRlc3QgY2FzZXMgd2l0
aA0KPj4+PiB0aGUgc2FtZSB2bSwgYXMgcGVyIHZtIGJvIGZlYXR1cmUgZW5hYmxlLCBhbGwgb2Yg
dGhvc2UgYm9zJyByZXN2IGFyZQ0KPj4+PiB0aGUgc2FtZS4gQnV0IHRoZSBibyBmcmVlIGlzIHF1
aXRlIHNsb3csIGFzIHRoZXkgdXNlIHRoZSBzYW1lIHJlc3YNCj4+Pj4gb2JqZWN0LCBmb3IgZXZl
cnkgdGltZSwgZnJlZSBhIGJvLCBpdCB3aWxsIGNoZWNrIHRoZSByZXN2IHdoZXRoZXINCj4+Pj4g
c2lnbmFsLCBpZiBpdCBzaWduYWwsIHRoZW4gd2lsbCBmcmVlIGl0LiBCdXQgYXMgdGhlIHRlc3Qg
Y2FzZXMgd2lsbA0KPj4+PiBjb250aW51ZSB0byBjcmVhdGUgYm8sIGFuZCB0aGUgcmVzdiBmZW5j
ZSBpcyBpbmNyZWFzaW5nLiBTbyB0aGUgZnJlZQ0KPj4+PiBpcyBtb3JlDQo+Pj4gc2xvd2VyIHRo
YW4gY3JlYXRpbmcuIEl0IHdpbGwgY2F1c2UgbWVtb3J5IGV4aGF1c3RpbmcuDQo+Pj4+IE1ldGhv
ZDoNCj4+Pj4gV2hlbiB0aGUgcmVzdiBzaWduYWwsIHJlbGVhc2UgYWxsIHRoZSBib3Mgd2hpY2gg
YXJlIHVzZSB0aGUgc2FtZQ0KPj4+PiByZXN2IG9iamVjdC4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYw0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgaW5kZXggZjlhM2Q0Yy4u
NTdlYzU5YiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0K
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+Pj4+IEBAIC01NDMsNiAr
NTQzLDcgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdA0KPj4+IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywNCj4+Pj4gICAgew0KPj4+PiAgICAJc3RydWN0IHR0bV9ib19nbG9i
YWwgKmdsb2IgPSBiby0+YmRldi0+Z2xvYjsNCj4+Pj4gICAgCXN0cnVjdCByZXNlcnZhdGlvbl9v
YmplY3QgKnJlc3Y7DQo+Pj4+ICsJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpyZXN2X2JvLCAq
cmVzdl9ib19uZXh0Ow0KPj4+PiAgICAJaW50IHJldDsNCj4+Pj4NCj4+Pj4gICAgCWlmICh1bmxp
a2VseShsaXN0X2VtcHR5KCZiby0+ZGRlc3Ryb3kpKSkNCj4+Pj4gQEAgLTU2NiwxMCArNTY3LDE0
IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QNCj4+PiB0dG1fYnVmZmVy
X29iamVjdCAqYm8sDQo+Pj4+ICAgIAkJCQkJCQkgICBpbnRlcnJ1cHRpYmxlLA0KPj4+PiAgICAJ
CQkJCQkJICAgMzAgKiBIWik7DQo+Pj4+DQo+Pj4+IC0JCWlmIChscmV0IDwgMCkNCj4+Pj4gKwkJ
aWYgKGxyZXQgPCAwKSB7DQo+Pj4+ICsJCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2Jv
X3JlbGVhc2VfbGlzdCk7DQo+Pj4+ICAgIAkJCXJldHVybiBscmV0Ow0KPj4+PiAtCQllbHNlIGlm
IChscmV0ID09IDApDQo+Pj4+ICsJCX0NCj4+Pj4gKwkJZWxzZSBpZiAobHJldCA9PSAwKSB7DQo+
Pj4+ICsJCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+
Pj4+ICAgIAkJCXJldHVybiAtRUJVU1k7DQo+Pj4+ICsJCX0NCj4+Pj4NCj4+Pj4gICAgCQlzcGlu
X2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4gICAgCQlpZiAodW5sb2NrX3Jlc3YgJiYgIWtj
bF9yZXNlcnZhdGlvbl9vYmplY3RfdHJ5bG9jayhiby0+cmVzdikpDQo+Pj4geyBAQA0KPj4+PiAt
NTgyLDYgKzU4Nyw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QNCj4+
Pj4gdHRtX2J1ZmZlcl9vYmplY3QNCj4+PiAqYm8sDQo+Pj4+ICAgIAkJCSAqIGhlcmUuDQo+Pj4+
ICAgIAkJCSAqLw0KPj4+PiAgICAJCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+
PiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+
PiAgICAJCQlyZXR1cm4gMDsNCj4+Pj4gICAgCQl9DQo+Pj4+ICAgIAkJcmV0ID0gMDsNCj4+Pj4g
QEAgLTU5MSwxNSArNTk3LDI5IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1
Y3QNCj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+Pj4+ICAgIAkJaWYgKHVubG9ja19yZXN2
KQ0KPj4+PiAgICAJCQlrY2xfcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhiby0+cmVzdik7DQo+
Pj4+ICAgIAkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4gKwkJa3JlZl9wdXQo
JmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+PiAgICAJCXJldHVybiBy
ZXQ7DQo+Pj4+ICAgIAl9DQo+Pj4+DQo+Pj4+ICAgIAl0dG1fYm9fZGVsX2Zyb21fbHJ1KGJvKTsN
Cj4+Pj4gICAgCWxpc3RfZGVsX2luaXQoJmJvLT5kZGVzdHJveSk7DQo+Pj4+ICAgIAlrcmVmX3B1
dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlZl9idWcpOw0KPj4+PiAtDQo+Pj4+ICAgIAlzcGlu
X3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+PiAgICAJdHRtX2JvX2NsZWFudXBfbWVtdHlw
ZV91c2UoYm8pOw0KPj4+PiArCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFz
ZV9saXN0KTsNCj4+Pj4gKw0KPj4+PiArCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+
PiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShyZXN2X2JvLCByZXN2X2JvX25leHQsICZiby0+
YmRldi0NCj4+Pj4gZGRlc3Ryb3ksIGRkZXN0cm95KSB7DQo+Pj4+ICsJCWlmIChyZXN2X2JvLT5y
ZXN2ID09IGJvLT5yZXN2KSB7DQo+Pj4+ICsJCQl0dG1fYm9fZGVsX2Zyb21fbHJ1KHJlc3ZfYm8p
Ow0KPj4+PiArCQkJbGlzdF9kZWxfaW5pdCgmcmVzdl9iby0+ZGRlc3Ryb3kpOw0KPj4+PiArCQkJ
c3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4gKwkJCXR0bV9ib19jbGVhbnVwX21l
bXR5cGVfdXNlKHJlc3ZfYm8pOw0KPj4+PiArCQkJa3JlZl9wdXQoJnJlc3ZfYm8tPmxpc3Rfa3Jl
ZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4+ICsJCQlzcGluX2xvY2soJmdsb2ItPmxydV9s
b2NrKTsNCj4+Pj4gKwkJfQ0KPj4+PiArCX0NCj4+Pj4gKwlzcGluX3VubG9jaygmZ2xvYi0+bHJ1
X2xvY2spOw0KPj4+Pg0KPj4+PiAgICAJaWYgKHVubG9ja19yZXN2KQ0KPj4+PiAgICAJCWtjbF9y
ZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5yZXN2KTsNCj4+Pj4gQEAgLTYzOSw5ICs2NTks
OCBAQCBzdGF0aWMgYm9vbCB0dG1fYm9fZGVsYXllZF9kZWxldGUoc3RydWN0DQo+Pj4gdHRtX2Jv
X2RldmljZSAqYmRldiwgYm9vbCByZW1vdmVfYWxsKQ0KPj4+PiAgICAJCQl0dG1fYm9fY2xlYW51
cF9yZWZzKGJvLCBmYWxzZSwgIXJlbW92ZV9hbGwsIHRydWUpOw0KPj4+PiAgICAJCX0gZWxzZSB7
DQo+Pj4+ICAgIAkJCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4+ICsJCQlrcmVm
X3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4+ICAgIAkJfQ0K
Pj4+PiAtDQo+Pj4+IC0JCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9s
aXN0KTsNCj4+Pj4gICAgCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4gICAgCX0N
Cj4+Pj4gICAgCWxpc3Rfc3BsaWNlX3RhaWwoJnJlbW92ZWQsICZiZGV2LT5kZGVzdHJveSk7DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
