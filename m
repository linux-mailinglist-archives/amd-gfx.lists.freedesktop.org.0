Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1E1AA3AC
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Apr 2020 15:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B786E9C1;
	Wed, 15 Apr 2020 13:17:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 15 Apr 2020 09:46:08 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC2E6E29E
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Apr 2020 09:46:07 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-26-3LtwRS6zPnGStZcChf9l-A-1; Wed, 15 Apr 2020 10:39:30 +0100
X-MC-Unique: 3LtwRS6zPnGStZcChf9l-A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 15 Apr 2020 10:39:30 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 15 Apr 2020 10:39:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Alex Deucher <alexdeucher@gmail.com>,
 Bernard Zhao <bernard@vivo.com>
Subject: RE: [PATCH] Optimized division operation to shift operation
Thread-Topic: [PATCH] Optimized division operation to shift operation
Thread-Index: AQHWEvuQwS1rXduVrE2yfaZDBTuKn6h57U6g
Date: Wed, 15 Apr 2020 09:39:29 +0000
Message-ID: <e891ca9944774cbdba577982f0bc7738@AcuMS.aculab.com>
References: <1586864113-30682-1-git-send-email-bernard@vivo.com>
 <CADnq5_Phca3L-HGOQz0DPBoARHgwcJRK_a7-WmeFMPkrPWeOeg@mail.gmail.com>
 <87lfmx5h72.fsf@intel.com> <b5ffc6b7-bfa5-0827-a267-4e8c20027982@amd.com>
In-Reply-To: <b5ffc6b7-bfa5-0827-a267-4e8c20027982@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-Mailman-Approved-At: Wed, 15 Apr 2020 13:17:14 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Sierra <alex.sierra@amd.com>, David Airlie <airlied@linux.ie>,
 Oak Zeng <Oak.Zeng@amd.com>, LKML <linux-kernel@vger.kernel.org>, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>,
 "kernel@vivo.com" <kernel@vivo.com>, Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Kent
 Russell <kent.russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZw0KPiBTZW50OiAxNSBBcHJpbCAyMDIwIDA4OjU3DQo+IEFt
IDE1LjA0LjIwIHVtIDA5OjQxIHNjaHJpZWIgSmFuaSBOaWt1bGE6DQo+ID4gT24gVHVlLCAxNCBB
cHIgMjAyMCwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOg0KPiA+
PiBPbiBUdWUsIEFwciAxNCwgMjAyMCBhdCA5OjA1IEFNIEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2
aXZvLmNvbT4gd3JvdGU6DQo+ID4+PiBPbiBzb21lIHByb2Nlc3NvcnMsIHRoZSAvIG9wZXJhdGUg
d2lsbCBjYWxsIHRoZSBjb21waWxlcmBzIGRpdiBsaWIsDQo+ID4+PiB3aGljaCBpcyBsb3cgZWZm
aWNpZW50LCBXZSBjYW4gcmVwbGFjZSB0aGUgLyBvcGVyYXRpb24gd2l0aCBzaGlmdCwNCj4gPj4+
IHNvIHRoYXQgd2UgY2FuIHJlcGxhY2UgdGhlIGNhbGwgb2YgdGhlIGRpdmlzaW9uIGxpYnJhcnkg
d2l0aCBvbmUNCj4gPj4+IHNoaWZ0IGFzc2VtYmx5IGluc3RydWN0aW9uLg0KPiA+IFRoaXMgd2Fz
IGFwcGxpZWQgYWxyZWFkeSwgYW5kIGl0J3Mgbm90IGluIGEgZHJpdmVyIEkgbG9vayBhZnRlci4u
LiBidXQNCj4gPiB0byBtZSB0aGlzIGZlZWxzIGxpa2Ugc29tZXRoaW5nIHRoYXQgcmVhbGx5IHNo
b3VsZCBiZQ0KPiA+IGp1c3RpZmllZC4gVXNpbmcgPj4gaW5zdGVhZCBvZiAvIGZvciBtdWx0aXBs
ZXMgb2YgMiBkaXZpc2lvbiBtYXR0ZXJlZCAyMA0KPiA+IHllYXJzIGFnbywgSSdkIGJlIHN1cnBy
aXNlZCBpZiBpdCBzdGlsbCBkaWQgb24gbW9kZXJuIGNvbXBpbGVycy4NCj4gDQo+IEkgaGF2ZSBz
aW1pbGFyIHdvcnJpZXMsIGVzcGVjaWFsbHkgc2luY2Ugd2UgcmVwbGFjZSB0aGUgIi8gKDQgKiAy
KSIgd2l0aA0KPiAiPj4gMyIgaXQncyBtYWtpbmcgdGhlIGNvZGUganVzdCBhIGJpdCBsZXNzIHJl
YWRhYmxlLg0KPiANCj4gQW5kIHRoYXQgdGhlIGNvZGUgcnVucyBleGFjdGx5IG9uY2Ugd2hpbGUg
bG9hZGluZyB0aGUgZHJpdmVyIGFuZCBwdXNoaW5nDQo+IHRoZSBmaXJtd2FyZSBpbnRvIHRoZSBo
YXJkd2FyZS4gU28gcGVyZm9ybWFuY2UgaXMgY29tcGxldGVseSBpcnJlbGV2YW50DQo+IGhlcmUu
DQoNCkZvcmNlIHRoZSBkaXZpc2lvbiB0byBiZSB1bnNpZ25lZCBhbmQgdGhlIGNvbXBpbGVyIHdp
bGwgdXNlIGEgc2hpZnQuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNp
ZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsN
ClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngK
