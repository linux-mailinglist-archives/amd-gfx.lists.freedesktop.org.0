Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A825299C
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Aug 2020 10:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F646E10F;
	Wed, 26 Aug 2020 08:58:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8ADD26E0FB;
 Wed, 26 Aug 2020 08:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8D51F2A6042;
 Wed, 26 Aug 2020 10:58:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QngoY1U8AYpi; Wed, 26 Aug 2020 10:58:18 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id B947A2A6016;
 Wed, 26 Aug 2020 10:58:17 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kArG4-000fey-GD; Wed, 26 Aug 2020 10:58:16 +0200
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: Pekka Paalanen <ppaalanen@gmail.com>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
 <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
 <15b4eb58-a51b-b2fd-f51d-1576d50914cc@amd.com>
 <20200826112423.6a8637a2@eldfell>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <38f0e82c-737a-99f1-8ed5-ea29fa46b95a@daenzer.net>
Date: Wed, 26 Aug 2020 10:58:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826112423.6a8637a2@eldfell>
Content-Language: en-CA
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEExCgpPbiAyMDIwLTA4
LTI2IDEwOjI0IGEubS4sIFBla2thIFBhYWxhbmVuIHdyb3RlOgo+IE9uIFR1ZSwgMjUgQXVnIDIw
MjAgMTI6NTg6MTkgLTA0MDAgIkthemxhdXNrYXMsIE5pY2hvbGFzIgo+IDxuaWNob2xhcy5rYXps
YXVza2FzQGFtZC5jb20+IHdyb3RlOgo+Cj4+IE9uIDIwMjAtMDgtMjIgNTo1OSBhLm0uLCBNaWNo
ZWwgRMOkbnplciB3cm90ZToKPj4+IE9uIDIwMjAtMDgtMjEgODowNyBwLm0uLCBLYXpsYXVza2Fz
LCBOaWNob2xhcyB3cm90ZToKPj4+PiBPbiAyMDIwLTA4LTIxIDEyOjU3IHAubS4sIE1pY2hlbCBE
w6RuemVyIHdyb3RlOgo+Pj4+PiBGcm9tOiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0
LmNvbT4KPj4+Pj4KPj4+Pj4gRG9uJ3QgY2hlY2sgZHJtX2NydGNfc3RhdGU6OmFjdGl2ZSBmb3Ig
dGhpcyBlaXRoZXIsIHBlcgo+Pj4+PiBpdHMgZG9jdW1lbnRhdGlvbiBpbiBpbmNsdWRlL2RybS9k
cm1fY3J0Yy5oOgo+Pj4+Pgo+Pj4+PiAqIEhlbmNlIGRyaXZlcnMgbXVzdCBub3QgY29uc3VsdCBA
YWN0aXZlIGluIHRoZWlyIHZhcmlvdXMgKgo+Pj4+PiAmZHJtX21vZGVfY29uZmlnX2Z1bmNzLmF0
b21pY19jaGVjayBjYWxsYmFjayB0byByZWplY3QgYW4KPj4+Pj4gYXRvbWljICogY29tbWl0Lgo+
Pj4+Pgo+Pj4+PiBUaGUgYXRvbWljIGhlbHBlcnMgZGlzYWJsZSB0aGUgQ1JUQyBhcyBuZWVkZWQg
Zm9yIGRpc2FibGluZwo+Pj4+PiB0aGUgcHJpbWFyeSBwbGFuZS4KPj4+Pj4KPj4+Pj4gVGhpcyBw
cmV2ZW50cyBhdCBsZWFzdCB0aGUgZm9sbG93aW5nIHByb2JsZW1zIGlmIHRoZQo+Pj4+PiBwcmlt
YXJ5IHBsYW5lIGdldHMgZGlzYWJsZWQgKGUuZy4gZHVlIHRvIGRlc3Ryb3lpbmcgdGhlIEZCCj4+
Pj4+IGFzc2lnbmVkIHRvIHRoZSBwcmltYXJ5IHBsYW5lLCBhcyBoYXBwZW5zIGUuZy4gd2l0aCBt
dXR0ZXIKPj4+Pj4gaW4gV2F5bGFuZCBtb2RlKToKPj4+Pj4KPj4+Pj4gKiBUb2dnbGluZyBDUlRD
IGFjdGl2ZSB0byAxIGZhaWxlZCBpZiB0aGUgY3Vyc29yIHBsYW5lIHdhcwo+Pj4+PiBlbmFibGVk
IChlLmcuIHZpYSBsZWdhY3kgRFBNUyBwcm9wZXJ0eSAmIGN1cnNvciBpb2N0bCkuICoKPj4+Pj4g
RW5hYmxpbmcgdGhlIGN1cnNvciBwbGFuZSBmYWlsZWQsIGUuZy4gdmlhIHRoZSBsZWdhY3kKPj4+
Pj4gY3Vyc29yIGlvY3RsLgo+Pj4+Cj4+Pj4gV2UgcHJldmlvdXNseSBoYWQgdGhlIHJlcXVpcmVt
ZW50IHRoYXQgdGhlIHByaW1hcnkgcGxhbmUgbXVzdAo+Pj4+IGJlIGVuYWJsZWQgYnV0IHNvbWUg
dXNlcnNwYWNlIGV4cGVjdHMgdGhhdCB0aGV5IGNhbiBlbmFibGUKPj4+PiBqdXN0IHRoZSBvdmVy
bGF5IHBsYW5lIHdpdGhvdXQgYW55dGhpbmcgZWxzZS4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhlIGNo
cm9tdWl1bW9zIGF0b21pY3Rlc3QgdmFsaWRhdGVzIHRoYXQgdGhpcyB3b3Jrcwo+Pj4+IGFzIHdl
bGw6Cj4+Pj4KPj4+PiBTbyBpcyBEUk0gZ29pbmcgZm9yd2FyZCB0aGVuIHdpdGggdGhlIGV4cGVj
dGF0aW9uIHRoYXQgdGhpcwo+Pj4+IGlzIHdyb25nIGJlaGF2aW9yIGZyb20gdXNlcnNwYWNlPwo+
Pj4+Cj4+Pj4gV2UgcmVxdWlyZSBhdCBsZWFzdCBvbmUgcGxhbmUgdG8gYmUgZW5hYmxlZCB0byBk
aXNwbGF5IGEKPj4+PiBjdXJzb3IsIGJ1dCBpdCBkb2Vzbid0IG5lY2Vzc2FyaWx5IG5lZWQgdG8g
YmUgdGhlIHByaW1hcnkuCj4+Pgo+Pj4gSXQncyBhICJwaWNrIHlvdXIgcG9pc29uIiBzaXR1YXRp
b246Cj4+Pgo+Pj4gMSkgQ3VycmVudGx5IHRoZSBjaGVja3MgYXJlIGludmFsaWQgKGF0b21pY19j
aGVjayBtdXN0IG5vdAo+Pj4gZGVjaWRlIGJhc2VkIG9uIGRybV9jcnRjX3N0YXRlOjphY3RpdmUp
LCBhbmQgaXQncyBlYXN5IGZvcgo+Pj4gbGVnYWN5IEtNUyB1c2Vyc3BhY2UgdG8gYWNjaWRlbnRh
bGx5IGhpdCBlcnJvcnMgdHJ5aW5nIHRvCj4+PiBlbmFibGUvbW92ZSB0aGUgY3Vyc29yIG9yIHN3
aXRjaCBEUE1TIG9mZiDihpIgb24uCj4+Pgo+Pj4gMikgQWNjdXJhdGVseSByZWplY3Rpbmcgb25s
eSBhdG9taWMgc3RhdGVzIHdoZXJlIHRoZSBjdXJzb3IKPj4+IHBsYW5lIGlzIGVuYWJsZWQgYnV0
IGFsbCBvdGhlciBwbGFuZXMgYXJlIG9mZiB3b3VsZCBicmVhayB0aGUKPj4+IEtNUyBoZWxwZXIg
Y29kZSwgd2hpY2ggY2FuIG9ubHkgZGVhbCB3aXRoIHRoZSAiQ1JUQyBvbiAmCj4+PiBwcmltYXJ5
IHBsYW5lIG9mZiBpcyBub3QgYWxsb3dlZCIgY2FzZSBzcGVjaWZpY2FsbHkuCj4+Pgo+Pj4gMykg
VGhpcyBwYXRjaCBhZGRyZXNzZXMgMSkgJiAyKSBidXQgbWF5IGJyZWFrIGV4aXN0aW5nIGF0b21p
Ywo+Pj4gdXNlcnNwYWNlIHdoaWNoIHdhbnRzIHRvIGVuYWJsZSBhbiBvdmVybGF5IHBsYW5lIHdo
aWxlCj4+PiBkaXNhYmxpbmcgdGhlIHByaW1hcnkgcGxhbmUuCj4+Pgo+Pj4KPj4+IEkgZG8gdGhp
bmsgaW4gcHJpbmNpcGxlIGF0b21pYyB1c2Vyc3BhY2UgaXMgZXhwZWN0ZWQgdG8gaGFuZGxlCj4+
PiBjYXNlIDMpIGFuZCBsZWF2ZSB0aGUgcHJpbWFyeSBwbGFuZSBlbmFibGVkLiBIb3dldmVyLCB0
aGlzIGlzCj4+PiBub3QgaWRlYWwgZnJvbSBhbiBlbmVyZ3kgY29uc3VtcHRpb24gUG9WLiBUaGVy
ZWZvcmUsIGhlcmUncwo+Pj4gYW5vdGhlciBpZGVhIGZvciBhIHBvc3NpYmxlIHdheSBvdXQgb2Yg
dGhpcyBxdWFnbWlyZToKPj4+Cj4+PiBhbWRncHVfZG0gZG9lcyBub3QgcmVqZWN0IGFueSBhdG9t
aWMgc3RhdGVzIGJhc2VkIG9uIHdoaWNoCj4+PiBwbGFuZXMgYXJlIGVuYWJsZWQgaW4gaXQuIElm
IHRoZSBjdXJzb3IgcGxhbmUgaXMgZW5hYmxlZCBidXQKPj4+IGFsbCBvdGhlciBwbGFuZXMgYXJl
IG9mZiwgYW1kZ3B1X2RtIGludGVybmFsbHkgZWl0aGVyOgo+Pj4KPj4+IGEpIEVuYWJsZXMgYW4g
b3ZlcmxheSBwbGFuZSBhbmQgbWFrZXMgaXQgaW52aXNpYmxlLCBlLmcuIGJ5Cj4+PiBhc3NpZ25p
bmcgYSBtaW5pbXVtIHNpemUgRkIgd2l0aCBhbHBoYSA9IDAuCj4+Pgo+Pj4gYikgRW5hYmxlcyB0
aGUgcHJpbWFyeSBwbGFuZSBhbmQgYXNzaWducyBhIG1pbmltdW0gc2l6ZSBGQgo+Pj4gKHNjYWxl
ZCB1cCB0byB0aGUgcmVxdWlyZWQgc2l6ZSkgY29udGFpbmluZyBhbGwgYmxhY2ssIHBvc3NpYmx5
Cj4+PiB1c2luZyBjb21wcmVzc2lvbi4gKFRyeWluZyB0byBtaW5pbWl6ZSB0aGUgbWVtb3J5IGJh
bmR3aWR0aCkKPj4+Cj4+Pgo+Pj4gRG9lcyBlaXRoZXIgb2YgdGhlc2Ugc2VlbSBmZWFzaWJsZT8g
SWYgYm90aCBkbywgd2hpY2ggb25lIHdvdWxkCj4+PiBiZSBwcmVmZXJhYmxlPwo+Pgo+PiBJdCdz
IHJlYWxseSB0aGUgc2FtZSBzb2x1dGlvbiBzaW5jZSBEQ04gZG9lc24ndCBtYWtlIGEKPj4gZGlz
dGluY3Rpb24gYmV0d2VlbiBwcmltYXJ5IG9yIG92ZXJsYXkgcGxhbmVzIGluIGhhcmR3YXJlLiBE
Q0UKPj4gZG9lc24ndCBoYXZlIG92ZXJsYXkgcGxhbmVzIGVuYWJsZWQgc28gdGhpcyBpcyBub3Qg
cmVsZXZhbnQKPj4gdGhlcmUuCj4+Cj4+IFRoZSBvbGQgYmVoYXZpb3IgKHByZSA1LjE/KSB3YXMg
dG8gc2lsZW50bHkgYWNjZXB0IHRoZSBjb21taXQKPj4gZXZlbiB0aG91Z2ggdGhlIHNjcmVlbiB3
b3VsZCBiZSBjb21wbGV0ZWx5IGJsYWNrIGluc3RlYWQgb2YKPj4gb3V0cmlnaHQgcmVqZWN0aW5n
IHRoZSBjb21taXQuCj4+Cj4+IEkgYWxtb3N0IHdvbmRlciBpZiB0aGF0IG1ha2VzIG1vcmUgc2Vu
c2UgaW4gdGhlIHNob3J0IHRlcm0gaGVyZQo+PiBzaW5jZSB0aGUgb25seSAidXNlcnNwYWNlIiBh
ZmZlY3RlZCBoZXJlIGlzIElHVC4gV2UnbGwgZmFpbCB0aGUKPj4gQ1JDIGNoZWNrcywgYnV0IG5v
IHVzZXJzcGFjZSBhY3R1YWxseSB0cmllcyB0byBhY3RpdmVseSB1c2UgYQo+PiBjdXJzb3Igd2l0
aCBubyBwcmltYXJ5IHBsYW5lIGVuYWJsZWQgZnJvbSBteSB1bmRlcnN0YW5kaW5nLgo+Cj4gSGks
Cj4KPiBJIGJlbGlldmUgdGhhdCB0aGVyZSBleGlzdHMgdXNlcnNwYWNlIHRoYXQgd2lsbCAqYWNj
aWRlbnRhbGx5Kgo+IGF0dGVtcHQgdG8gdXBkYXRlIHRoZSBjdXJzb3IgcGxhbmUgd2hpbGUgcHJp
bWFyeSBwbGFuZSBvciB3aG9sZQo+IENSVEMgaXMgb2ZmLiBTb21lIHZlcnNpb25zIG9mIE11dHRl
ciBtaWdodCBkbyB0aGF0IG9uIHJhY3kKPiBjb25kaXRpb25zLCBJIHN1c3BlY3QuIFRoZXNlIGFy
ZSBsZWdhY3kgS01TIHVzZXJzLCBub3QgYXRvbWljIEtNUy4KPgo+IEhvd2V2ZXIsIEkgZG8gbm90
IGJlbGlldmUgdGhlcmUgZXhpc3RzIGFueSB1c2Vyc3BhY2UgdGhhdCB3b3VsZAo+IGFjdHVhbGx5
IGV4cGVjdCB0aGUgZGlzcGxheSB0byBzaG93IHRoZSBjdXJzb3IgcGxhbmUgYWxvbmUgd2l0aG91
dAo+IGEgcHJpbWFyeSBwbGFuZS4gVGhlcmVmb3JlIEknZCBiZSBvayB3aXRoIGxlZ2FjeSBjdXJz
b3IgaW9jdGxzCj4gc2lsZW50bHkgc3VjY2VlZGluZy4gQXRvbWljIGNvbW1pdHMgbm90LiBTbyB0
aGUgZGlmZmVyZW5jZSBoYXMgdG8KPiBiZSBpbiB0aGUgdHJhbnNsYXRpb24gZnJvbSBsZWdhY3kg
VUFQSSB0byBrZXJuZWwgaW50ZXJuYWwgYXRvbWljCj4gaW50ZXJmYWNlLgoKVGhpcyB3b3VsZCBi
ZSBteSBjYXNlIDIpIGFib3ZlLCBzbyBzdGlsbCByZXF1aXJlcyBmaWd1cmluZyBvdXQgaG93IHRo
ZQphdG9taWMgS01TIGhlbHBlcnMgc2hvdWxkIGRlYWwgd2l0aCBjb3JuZXIgY2FzZXMgc3VjaCBh
czoKCiogQ1JUQyBvbiwgcHJpbWFyeSBwbGFuZSBvZmYsIG92ZXJsYXkgJiBjdXJzb3IgcGxhbmVz
IG9uCiogUm1GQiBvZiBGQiBhc3NpZ25lZCB0byBvdmVybGF5IHBsYW5lIOKGkiBuZWVkIHRvIGRp
c2FibGUgb3ZlcmxheQpwbGFuZSwgYnV0IGRyaXZlciByZWplY3RzIHRoYXQgKGJlY2F1c2UgaXQg
d291bGQgbGVhdmUgb25seSB0aGUgY3Vyc29yCnBsYW5lIG9uKQoKCi0gLS0gCkVhcnRobGluZyBN
aWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhh
dC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAg
IE1lc2EgYW5kIFggZGV2ZWxvcGVyCi0tLS0tQkVHSU4gUEdQIFNJR05BVFVSRS0tLS0tCgppRjBF
QVJFQ0FCMFdJUVN3bjY4MXZwRkZJWmdKVVJSYWdhK09hdHV5QUFVQ1gwWWtJd0FLQ1JCYWdhK09h
dHV5CkFNV3JBSjlJRE1JajJlR1hFUllEWmZ3cmFPQ0hlYndFOVFDZlIvbk9hb0xHZklPaWk2cjFI
NEpMbjlzcmFGST0KPUQvTFgKLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
