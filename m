Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3AF23A0E3
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Aug 2020 10:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19F689E5A;
	Mon,  3 Aug 2020 08:21:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F936EABB
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 13:34:49 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BJ7Yh2ZhPzKmbx;
 Fri, 31 Jul 2020 15:34:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id IBzzz3yaLkPi; Fri, 31 Jul 2020 15:34:41 +0200 (CEST)
Date: Fri, 31 Jul 2020 15:34:37 +0200
From: =?utf-8?B?UGF3ZcWC?= Gronowski <me@woland.xyz>
To: Matt Coffin <mcoffin13@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix regression in adjusting power
 table/profile
Message-ID: <20200731133437.GA4878@tower>
References: <20200729231106.GA6598@tower>
 <CADnq5_NQ9Oo85cV49+3pcQZTrBBc5HvoV_MQ_-wAmPhuzhq6uA@mail.gmail.com>
 <91bb8e22-9a8d-6b17-f40c-ab7a09a60fa8@gmail.com>
 <20200731003117.GA20523@tower>
 <c18325ea-3fda-74d3-47fc-eb057739b889@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c18325ea-3fda-74d3-47fc-eb057739b889@gmail.com>
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -3.28 / 15.00 / 15.00
X-Rspamd-Queue-Id: C9A0017A4
X-Rspamd-UID: 3a5374
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:56 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGV5IE1hdHQsCgpJIGhhdmUganVzdCB0ZXN0ZWQgdGhlIGFtZC1zdGFnaW5nLWRybS1uZXh0IGJy
YW5jaCAKKGRkNjU0Yzc2ZDZlODU0YWZhZDcxNmRlZDg5OWU0NDA0NzM0YWFhMTApIHdpdGggbXkg
cGF0Y2hlcyByZXZlcnRlZAphbmQgSSBjYW4gcmVwcm9kdWNlIHlvdXIgaXNzdWUgd2l0aDoKCiAg
c3VkbyBzaCAtYyAnZWNobyAicyAwIDMwNSA3NTAiID4gL3N5cy9jbGFzcy9kcm0vY2FyZDAvZGV2
aWNlL3BwX29kX2Nsa192b2x0YWdlJwoKV2hpY2ggbWFrZXMgdGhlIHNoIGhhbmcgd2l0aCAxMDAl
IHVzYWdlLgoKVGhlIGlzc3VlIGRvZXMgbm90IGhhcHBlbiBvbiB0aGUgbWFpbmxpbmUgKGQ4Yjlm
YWVjNTRhZTRiYzJmZmY2OGJjZDBiZWZhOTNhY2U4MjU2Y2UpCmJvdGggd2l0aG91dCBhbmQgd2l0
aCBteSBwYXRjaGVzIHJlYXBwbGllZC4KU28gdGhlIHByb2JsZW0gbXVzdCBiZSByZWxhdGVkIHRv
IHNvbWUgY29tbWl0IHRoYXQgaXMgcHJlc2VudCBpbiB0aGUKYW1kLXN0YWdpbmctZHJtLW5leHQg
YnV0IG5vdCBpbiB0aGUgbWFpbmxpbmUuCgoKUGF3ZcWCIEdyb25vd3NraQoKT24gVGh1LCBKdWwg
MzAsIDIwMjAgYXQgMDY6MzQ6MTRQTSAtMDYwMCwgTWF0dCBDb2ZmaW4gd3JvdGU6Cj4gSGV5IFBh
d2VsLAo+IAo+IEkgZGlkIGNvbmZpcm0gdGhhdCB0aGlzIHBhdGNoICppbnRyb2R1Y2VkKiB0aGUg
aXNzdWUgYm90aCB3aXRoIHRoZQo+IGJpc2VjdCwgYW5kIGJ5IHRlc3RpbmcgcmV2ZXJ0aW5nIGl0
Lgo+IAo+IE5vdywgdGhlcmUncyBhIGxvdCBvZiBmcmFnaWxlIHBpZWNlcyBpbiB0aGUgZHBtIGhh
bmRsaW5nLCBzbyBpdCBjb3VsZCBiZQo+IHRoaXMgcGF0Y2gncyBpbnRlcmFjdGlvbiB3aXRoIHNv
bWV0aGluZyBlbHNlIHRoYXQncyBjYXVzaW5nIGl0IGFuZCBpdAo+IG1heSB3ZWxsIG5vdCBiZSB0
aGUgZmF1bHQgb2YgdGhpcyBjb2RlLCBidXQgdGhpcyBpcyB0aGUgcGF0Y2ggdGhhdAo+IGludHJv
ZHVjZWQgdGhlIGlzc3VlLgo+IAo+IEknbGwgaGF2ZSBzb21lIG1vcmUgdGltZSB0b21vcnJvdyB0
byB0cnkgdG8gZ2V0IGRvd24gdG8gcm9vdCBjYXVzZSBoZXJlLAo+IHNvIG1heWJlIEknbGwgaGF2
ZSBtb3JlIHRvIG9mZmVyIHRoZW4uCj4gCj4gVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLAo+IE1h
dHQKPiAKPiBPbiA3LzMwLzIwIDY6MzEgUE0sIFBhd2XFgiBHcm9ub3dza2kgd3JvdGU6Cj4gPiBI
ZWxsbyBNYXR0LAo+ID4gCj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgdGVzdGluZy4gSXQgc2VlbXMg
dGhhdCBteSBncHUgKFJYIDU3MCkgZG9lcyBub3Qgc3VwcG9ydCB0aGUKPiA+IHZjIHNldHRpbmcg
c28gSSBjYW4gbm90IGV4YWN0bHkgcmVwcm9kdWNlIHRoZSBpc3N1ZS4gSG93ZXZlciBJIGRpZCB0
cmFjZSB0aGUKPiA+IGNvZGUgcGF0aCB0aGUgdGVzdCBjYXNlIHRha2VzIGFuZCBpdCBzZWVtcyB0
byBjb3JyZWN0bHkgcGFzcyB0aHJvdWdoIHRoZSB3aGlsZQo+ID4gbG9vcCB0aGF0IHBhcnNlcyB0
aGUgaW5wdXQgYW5kIGZhaWxzIG9ubHkgaW4gYW1kZ3B1X2RwbV9vZG5fZWRpdF9kcG1fdGFibGUu
Cj4gPiBUaGUgJ3BhcmFtZXRlcicgYXJyYXkgaXMgcG9wdWxhdGVkIHRoZSBzYW1lIHdheSBhcyB0
aGUgb3JpZ2luYWwgY29kZSBkaWQuIFNpbmNlCj4gPiB0aGUgYW1kZ3B1X2RwbV9vZG5fZWRpdF9k
cG1fdGFibGUgaXMgcmVhY2hlZCwgSSB0aGluayB0aGF0IHlvdXIgcHJvYmxlbSBpcwo+ID4gdW5m
b3J0dW5hdGVseSBjYXVzZWQgYnkgc29tZXRoaW5nIGVsc2UuCj4gPiAKPiA+IAo+ID4gUGF3ZcWC
IEdyb25vd3NraQo+ID4gCj4gPiBPbiBUaHUsIEp1bCAzMCwgMjAyMCBhdCAwODo0OTo0MUFNIC0w
NjAwLCBNYXR0IENvZmZpbiB3cm90ZToKPiA+PiBIZWxsbyBhbGwsIEkganVzdCBkaWQgc29tZSB0
ZXN0aW5nIHdpdGggdGhpcyBhcHBsaWVkLCBhbmQgd2hpbGUgaXQgbm8KPiA+PiBsb25nZXIgcmV0
dXJucyAtRUlOVkFMLCBydW5uaW5nIGBzdWRvIHNoIC1jICdlY2hvICJ2YyAyIDIxNTAgMTE5NSIg
Pgo+ID4+IC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9wcF9vZF9jbGtfdm9sdGFnZSdgIHJl
c3VsdHMgaW4gYHNoYCBzcGlraW5nCj4gPj4gdG8sIGFuZCBzdGF5aW5nIGF0IDEwMCUgQ1BVIHVz
YWdlLCB3aXRoIG5vIGluZGljYXRpbmcgaW5mb3JtYXRpb24gaW4KPiA+PiBgZG1lc2dgIGZyb20g
dGhlIGtlcm5lbC4KPiA+Pgo+ID4+IEl0IGFwcGVhcmVkIHRvIHdvcmsgYXQgbGVhc3QgT05DRSwg
YnV0IHBvdGVudGlhbGx5IG5vdCBhZnRlci4KPiA+Pgo+ID4+IFRoaXMgaXMgbm90IHVuaXF1ZSB0
byBOYXZpLCBhbmQgY2F1c2VkIHRoZSBwcm9ibGVtIG9uIGEgUE9MQVJJUzEwIGNhcmQKPiA+PiBh
cyB3ZWxsLgo+ID4+Cj4gPj4gU29ycnkgZm9yIHRoZSBiYWQgbmV3cywgYW5kIHRoYW5rcyBmb3Ig
YW55IGluc2lnaHQgeW91IG1heSBoYXZlLAo+ID4+IE1hdHQgQ29mZmluCj4gPj4KPiA+PiBPbiA3
LzI5LzIwIDg6NTMgUE0sIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+Pj4gT24gV2VkLCBKdWwgMjks
IDIwMjAgYXQgMTA6MjAgUE0gUGF3ZcWCIEdyb25vd3NraSA8bWVAd29sYW5kLnh5ej4gd3JvdGU6
Cj4gPj4+Pgo+ID4+Pj4gUmVncmVzc2lvbiB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgMzhlMGM4
OWExOWZkCj4gPj4+PiAoImRybS9hbWRncHU6IEZpeCBOVUxMIGRlcmVmZXJlbmNlIGluIGRwbSBz
eXNmcyBoYW5kbGVycyIpIHdoaWNoCj4gPj4+PiBtYWRlIHRoZSBzZXRfcHBfb2RfY2xrX3ZvbHRh
Z2UgYW5kIHNldF9wcF9wb3dlcl9wcm9maWxlX21vZGUgcmV0dXJuCj4gPj4+PiAtRUlOVkFMIGZv
ciBwcmV2aW91c2x5IHZhbGlkIGlucHV0LiBUaGlzIHdhcyBjYXVzZWQgYnkgYW4gZW1wdHkKPiA+
Pj4+IHN0cmluZyAoc3RhcnRpbmcgYXQgdGhlIFwwIGNoYXJhY3RlcikgYmVpbmcgcGFzc2VkIHRv
IHRoZSBrc3RydG9sLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhd2XFgiBHcm9ub3dz
a2kgPG1lQHdvbGFuZC54eXo+Cj4gPj4+Cj4gPj4+IEFwcGxpZWQuICBUaGFua3MhCj4gPj4+Cj4g
Pj4+IEFsZXgKPiA+Pj4KPiA+Pj4+IC0tLQo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wbS5jIHwgOSArKysrKysrLS0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbS5jCj4gPj4+PiBpbmRleCBlYmI4YTI4ZmYwMDIuLmNiZjYyM2Zm
MDNiZCAxMDA2NDQKPiA+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbS5jCj4gPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0u
Ywo+ID4+Pj4gQEAgLTc3OCwxMiArNzc4LDE0IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9zZXRf
cHBfb2RfY2xrX3ZvbHRhZ2Uoc3RydWN0IGRldmljZSAqZGV2LAo+ID4+Pj4gICAgICAgICAgICAg
ICAgIHRtcF9zdHIrKzsKPiA+Pj4+ICAgICAgICAgd2hpbGUgKGlzc3BhY2UoKisrdG1wX3N0cikp
Owo+ID4+Pj4KPiA+Pj4+IC0gICAgICAgd2hpbGUgKChzdWJfc3RyID0gc3Ryc2VwKCZ0bXBfc3Ry
LCBkZWxpbWl0ZXIpKSAhPSBOVUxMKSB7Cj4gPj4+PiArICAgICAgIHdoaWxlICgoc3ViX3N0ciA9
IHN0cnNlcCgmdG1wX3N0ciwgZGVsaW1pdGVyKSkgJiYgKnN1Yl9zdHIpIHsKPiA+Pj4+ICAgICAg
ICAgICAgICAgICByZXQgPSBrc3RydG9sKHN1Yl9zdHIsIDAsICZwYXJhbWV0ZXJbcGFyYW1ldGVy
X3NpemVdKTsKPiA+Pj4+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4+PiAgICAgICAgICAgICAgICAgcGFy
YW1ldGVyX3NpemUrKzsKPiA+Pj4+Cj4gPj4+PiArICAgICAgICAgICAgICAgaWYgKCF0bXBfc3Ry
KQo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4+PiAgICAgICAgICAg
ICAgICAgd2hpbGUgKGlzc3BhY2UoKnRtcF9zdHIpKQo+ID4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgdG1wX3N0cisrOwo+ID4+Pj4gICAgICAgICB9Cj4gPj4+PiBAQCAtMTYzNSwxMSArMTYz
NywxNCBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X3BwX3Bvd2VyX3Byb2ZpbGVfbW9kZShz
dHJ1Y3QgZGV2aWNlICpkZXYsCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBpKys7Cj4g
Pj4+PiAgICAgICAgICAgICAgICAgbWVtY3B5KGJ1Zl9jcHksIGJ1ZiwgY291bnQtaSk7Cj4gPj4+
PiAgICAgICAgICAgICAgICAgdG1wX3N0ciA9IGJ1Zl9jcHk7Cj4gPj4+PiAtICAgICAgICAgICAg
ICAgd2hpbGUgKChzdWJfc3RyID0gc3Ryc2VwKCZ0bXBfc3RyLCBkZWxpbWl0ZXIpKSAhPSBOVUxM
KSB7Cj4gPj4+PiArICAgICAgICAgICAgICAgd2hpbGUgKChzdWJfc3RyID0gc3Ryc2VwKCZ0bXBf
c3RyLCBkZWxpbWl0ZXIpKSAmJiAqc3ViX3N0cikgewo+ID4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0ga3N0cnRvbChzdWJfc3RyLCAwLCAmcGFyYW1ldGVyW3BhcmFtZXRlcl9zaXpl
XSk7Cj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhcmFtZXRlcl9zaXplKys7Cj4gPj4+PiArCj4gPj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoIXRtcF9zdHIpCj4gPj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgd2hpbGUg
KGlzc3BhY2UoKnRtcF9zdHIpKQo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0bXBfc3RyKys7Cj4gPj4+PiAgICAgICAgICAgICAgICAgfQo+ID4+Pj4gLS0KPiA+Pj4+IDIu
MjUuMQo+ID4+Pj4KPiA+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4+Pj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4+PiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiA+Pj4KPiA+Pgo+ID4gCj4gPiAKPiA+IAo+
IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
