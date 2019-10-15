Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48EAD771F
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 15:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35F16E260;
	Tue, 15 Oct 2019 13:11:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 386 seconds by postgrey-1.36 at gabe;
 Tue, 15 Oct 2019 10:55:05 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2536E34C
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 10:55:05 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-4-OcvsGto7M5O-CokwjfVoxg-1;
 Tue, 15 Oct 2019 11:48:35 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 15 Oct 2019 11:48:35 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 15 Oct 2019 11:48:35 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, "S, Shirish" <sshankar@amd.com>
Subject: RE: AMDGPU and 16B stack alignment
Thread-Topic: AMDGPU and 16B stack alignment
Thread-Index: AQHVgyjgGlq8x7ABFEya7CGn/JANAKdbg66A
Date: Tue, 15 Oct 2019 10:48:35 +0000
Message-ID: <309b52a1c174410f8c6c14fe69c32e51@AcuMS.aculab.com>
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
In-Reply-To: <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: OcvsGto7M5O-CokwjfVoxg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Tue, 15 Oct 2019 13:11:05 +0000
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Matthias Kaehlcke <mka@google.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, 
 Shirish" <Shirish.S@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "yshuiv7@gmail.com" <yshuiv7@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAxNSBPY3RvYmVyIDIwMTkgMDg6MTkNCj4gDQo+
IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDk6MDggQU0gUywgU2hpcmlzaCA8c3NoYW5rYXJAYW1k
LmNvbT4gd3JvdGU6DQo+ID4gT24gMTAvMTUvMjAxOSAzOjUyIEFNLCBOaWNrIERlc2F1bG5pZXJz
IHdyb3RlOg0KPiANCj4gPiBNeSBnY2MgYnVpbGQgZmFpbHMgd2l0aCBiZWxvdyBlcnJvcnM6DQo+
ID4NCj4gPiBkY25fY2FsY3MuYzoxOjA6IGVycm9yOiAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFy
eT0zIGlzIG5vdCBiZXR3ZWVuIDQgYW5kIDEyDQo+ID4NCj4gPiBkY25fY2FsY19tYXRoLmM6MTow
OiBlcnJvcjogLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MyBpcyBub3QgYmV0d2VlbiA0IGFu
ZCAxMg0KPiA+DQo+ID4gV2hpbGUgR1BGIG9ic2VydmVkIG9uIGNsYW5nIGJ1aWxkcyBzZWVtIHRv
IGJlIGZpeGVkLg0KPiANCj4gT2ssIHNvIGl0IHNlZW1zIHRoYXQgZ2NjIGluc2lzdHMgb24gaGF2
aW5nIGF0IGxlYXN0IDJeNCBieXRlcyBzdGFjaw0KPiBhbGlnbm1lbnQgd2hlbg0KPiBTU0UgaXMg
ZW5hYmxlZCBvbiB4ODYtNjQsIGJ1dCBkb2VzIG5vdCBhY3R1YWxseSByZWx5IG9uIHRoYXQgZm9y
DQo+IGNvcnJlY3Qgb3BlcmF0aW9uDQo+IHVubGVzcyBpdCdzIHVzaW5nIHNzZTIuIFNvIC1tc3Nl
IGFsd2F5cyBoYXMgdG8gYmUgcGFpcmVkIHdpdGgNCj4gIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5k
YXJ5PTMuDQo+IA0KPiBGb3IgY2xhbmcsIGl0IHNvdW5kcyBsaWtlIHRoZSBvcHBvc2l0ZSBpcyB0
cnVlOiB3aGVuIHBhc3NpbmcgMTYgYnl0ZQ0KPiBzdGFjayBhbGlnbm1lbnQNCj4gYW5kIGhhdmlu
ZyBzc2Uvc3NlMiBlbmFibGVkLCBpdCByZXF1aXJlcyB0aGUgaW5jb21pbmcgc3RhY2sgdG8gYmUg
MTYNCj4gYnl0ZSBhbGlnbmVkLA0KPiBidXQgcGFzc2luZyA4IGJ5dGUgYWxpZ25tZW50IG1ha2Vz
IGl0IGRvIHRoZSByaWdodCB0aGluZy4NCj4gDQo+IFNvLCBzaG91bGQgd2UganVzdCBhbHdheXMg
cGFzcyAkKGNhbGwgY2Mtb3B0aW9uLCAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00KQ0KPiB0
byBnZXQgdGhlIGRlc2lyZWQgb3V0Y29tZSBvbiBib3RoPw0KDQpJdCBwcm9iYWJseSB3b24ndCBz
b2x2ZSB0aGUgcHJvYmxlbS4NCllvdSBuZWVkIHRvIGZpbmQgYWxsIHRoZSBhc20gYmxvY2tzIHRo
YXQgY2FsbCBiYWNrIGludG8gQyBhbmQgZW5zdXJlIHRoZXkNCm1haW50YWluIHRoZSByZXF1aXJl
ZCBzdGFjayBhbGlnbm1lbnQuDQpUaGlzIG1pZ2h0IGJlIHBvc3NpYmxlIGluIHRoZSBrZXJuZWws
IGJ1dCBpcyBhbG1vc3QgaW1wb3NzaWJsZSBpbiB1c2Vyc3BhY2UuDQoNCklTVFIgdGhhdCBnY2Mg
YXJiaXRyYXJpbHkgY2hhbmdlZCB0aGUgc3RhY2sgYWxpZ25tZW50IGZvciBpMzg2IGEgZmV3IHll
YXJzIGFnby4NCldoaWxlIGl0IGhlbHBlZCBjb2RlIGdlbmVyYXRpb24gaXQgYnJva2UgYSBsb3Qg
b2YgdGhpbmdzLg0KSSBjYW4ndCByZW1lbWJlciB0aGUgY29ycmVjdCBzZXQgb2Ygb3B0aW9ucyB0
byBnZXQgdGhlIHN0YWNrIGFsaWdubWVudA0KY29kZSBhZGRlZCBvbmx5IHdoZXJlIGl0IHdhcyBu
ZWVkZWQgKGdlbmVyYXRlcyBhIGRvdWJsZSAlYnAgZnJhbWUpLg0KDQoJRGF2aWQNCg0KLQ0KUmVn
aXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRv
biBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
