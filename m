Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC741CF167
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2020 11:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC9C6E0CC;
	Tue, 12 May 2020 09:20:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6F76E0CC;
 Tue, 12 May 2020 09:20:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21170407-1500050 for multiple; Tue, 12 May 2020 10:19:57 +0100
MIME-Version: 1.0
In-Reply-To: <20200512090847.GF206103@phenom.ffwll.local>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
 <20200512085944.222637-3-daniel.vetter@ffwll.ch>
 <158927426244.15653.14406159524439944950@build.alporthouse.com>
 <20200512090847.GF206103@phenom.ffwll.local>
Subject: Re: [RFC 02/17] dma-fence: basic lockdep annotations
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <158927519651.15653.17392305363363808831@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 12 May 2020 10:19:56 +0100
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Christian König <christian.koenig@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTA1LTEyIDEwOjA4OjQ3KQo+IE9uIFR1ZSwgTWF5
IDEyLCAyMDIwIGF0IDEwOjA0OjIyQU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1
b3RpbmcgRGFuaWVsIFZldHRlciAoMjAyMC0wNS0xMiAwOTo1OToyOSkKPiA+ID4gRGVzaWduIGlz
IHNpbWlsYXIgdG8gdGhlIGxvY2tkZXAgYW5ub3RhdGlvbnMgZm9yIHdvcmtlcnMsIGJ1dCB3aXRo
Cj4gPiA+IHNvbWUgdHdpc3RzOgo+ID4gPiAKPiA+ID4gLSBXZSB1c2UgYSByZWFkLWxvY2sgZm9y
IHRoZSBleGVjdXRpb24vd29ya2VyL2NvbXBsZXRpb24gc2lkZSwgc28gdGhhdAo+ID4gPiAgIHRo
aXMgZXhwbGljaXQgYW5ub3RhdGlvbiBjYW4gYmUgbW9yZSBsaWJlcmFsbHkgc3ByaW5rbGVkIGFy
b3VuZC4KPiA+ID4gICBXaXRoIHJlYWQgbG9ja3MgbG9ja2RlcCBpc24ndCBnb2luZyB0byBjb21w
bGFpbiBpZiB0aGUgcmVhZC1zaWRlCj4gPiA+ICAgaXNuJ3QgbmVzdGVkIHRoZSBzYW1lIHdheSB1
bmRlciBhbGwgY2lyY3Vtc3RhbmNlcywgc28gQUJCQSBkZWFkbG9ja3MKPiA+ID4gICBhcmUgb2su
IFdoaWNoIHRoZXkgYXJlLCBzaW5jZSB0aGlzIGlzIGFuIGFubm90YXRpb24gb25seS4KPiA+ID4g
Cj4gPiA+IC0gV2UncmUgdXNpbmcgbm9uLXJlY3Vyc2l2ZSBsb2NrZGVwIHJlYWQgbG9jayBtb2Rl
LCBzaW5jZSBpbiByZWN1cnNpdmUKPiA+ID4gICByZWFkIGxvY2sgbW9kZSBsb2NrZGVwIGRvZXMg
bm90IGNhdGNoIHJlYWQgc2lkZSBoYXphcmRzLiBBbmQgd2UKPiA+ID4gICBfdmVyeV8gbXVjaCB3
YW50IHJlYWQgc2lkZSBoYXphcmRzIHRvIGJlIGNhdWdodC4gRm9yIGZ1bGwgZGV0YWlscyBvZgo+
ID4gPiAgIHRoaXMgbGltaXRhdGlvbiBzZWUKPiA+ID4gCj4gPiA+ICAgY29tbWl0IGU5MTQ5ODU4
OTc0NjA2NWUzYWU5NWQ5YTAwYjA2OGU1MjVlZWMzNGYKPiA+ID4gICBBdXRob3I6IFBldGVyIFpp
amxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiA+ID4gICBEYXRlOiAgIFdlZCBBdWcgMjMg
MTM6MTM6MTEgMjAxNyArMDIwMAo+ID4gPiAKPiA+ID4gICAgICAgbG9ja2luZy9sb2NrZGVwL3Nl
bGZ0ZXN0czogQWRkIG1peGVkIHJlYWQtd3JpdGUgQUJCQSB0ZXN0cwo+ID4gPiAKPiA+ID4gLSBU
byBhbGxvdyBuZXN0aW5nIG9mIHRoZSByZWFkLXNpZGUgZXhwbGljaXQgYW5ub3RhdGlvbnMgd2Ug
ZXhwbGljaXRseQo+ID4gPiAgIGtlZXAgdHJhY2sgb2YgdGhlIG5lc3RpbmcuIGxvY2tfaXNfaGVs
ZCgpIGFsbG93cyB1cyB0byBkbyB0aGF0Lgo+ID4gPiAKPiA+ID4gLSBUaGUgd2FpdC1zaWRlIGFu
bm90YXRpb24gaXMgYSB3cml0ZSBsb2NrLCBhbmQgZW50aXJlbHkgZG9uZSB3aXRoaW4KPiA+ID4g
ICBkbWFfZmVuY2Vfd2FpdCgpIGZvciBldmVyeW9uZSBieSBkZWZhdWx0Lgo+ID4gPiAKPiA+ID4g
LSBUbyBiZSBhYmxlIHRvIGZyZWVseSBhbm5vdGF0ZSBoZWxwZXIgZnVuY3Rpb25zIEkgd2FudCB0
byBtYWtlIGl0IG9rCj4gPiA+ICAgdG8gY2FsbCBkbWFfZmVuY2VfYmVnaW4vZW5kX3NpZ25hbGxp
bmcgZnJvbSBzb2Z0L2hhcmRpcnEgY29udGV4dC4KPiA+ID4gICBGaXJzdCBhdHRlbXB0IHdhcyB1
c2luZyB0aGUgaGFyZGlycSBsb2NraW5nIGNvbnRleHQgZm9yIHRoZSB3cml0ZQo+ID4gPiAgIHNp
ZGUgaW4gbG9ja2RlcCwgYnV0IHRoaXMgZm9yY2VzIGFsbCBub3JtYWwgc3BpbmxvY2tzIG5lc3Rl
ZCB3aXRoaW4KPiA+ID4gICBkbWFfZmVuY2VfYmVnaW4vZW5kX3NpZ25hbGxpbmcgdG8gYmUgc3Bp
bmxvY2tzLiBUaGF0IGJvbGxvY2tzLgo+ID4gPiAKPiA+ID4gICBUaGUgYXBwcm9hY2ggbm93IGlz
IHRvIHNpbXBsZSBjaGVjayBpbl9hdG9taWMoKSwgYW5kIGZvciB0aGVzZSBjYXNlcwo+ID4gPiAg
IGVudGlyZWx5IHJlbHkgb24gdGhlIG1pZ2h0X3NsZWVwKCkgY2hlY2sgaW4gZG1hX2ZlbmNlX3dh
aXQoKS4gVGhhdAo+ID4gPiAgIHdpbGwgY2F0Y2ggYW55IHdyb25nIG5lc3RpbmcgYWdhaW5zdCBz
cGlubG9ja3MgZnJvbSBzb2Z0L2hhcmRpcnEKPiA+ID4gICBjb250ZXh0cy4KPiA+ID4gCj4gPiA+
IFRoZSBpZGVhIGhlcmUgaXMgdGhhdCBldmVyeSBjb2RlIHBhdGggdGhhdCdzIGNyaXRpY2FsIGZv
ciBldmVudHVhbGx5Cj4gPiA+IHNpZ25hbGxpbmcgYSBkbWFfZmVuY2Ugc2hvdWxkIGJlIGFubm90
YXRlZCB3aXRoCj4gPiA+IGRtYV9mZW5jZV9iZWdpbi9lbmRfc2lnbmFsbGluZy4gVGhlIGFubm90
YXRpb24gaWRlYWxseSBzdGFydHMgcmlnaHQKPiA+ID4gYWZ0ZXIgYSBkbWFfZmVuY2UgaXMgcHVi
bGlzaGVkIChhZGRlZCB0byBhIGRtYV9yZXN2LCBleHBvc2VkIGFzIGEKPiA+ID4gc3luY19maWxl
IGZkLCBhdHRhY2hlZCB0byBhIGRybV9zeW5jb2JqIGZkLCBvciBhbnl0aGluZyBlbHNlIHRoYXQK
PiA+ID4gbWFrZXMgdGhlIGRtYV9mZW5jZSB2aXNpYmxlIHRvIG90aGVyIGtlcm5lbCB0aHJlYWRz
KSwgdXAgdG8gYW5kCj4gPiA+IGluY2x1ZGluZyB0aGUgZG1hX2ZlbmNlX3dhaXQoKS4gRXhhbXBs
ZXMgYXJlIGlycSBoYW5kbGVycywgdGhlCj4gPiA+IHNjaGVkdWxlciBydCB0aHJlYWRzLCB0aGUg
dGFpbCBvZiBleGVjYnVmIChhZnRlciB0aGUgY29ycmVzcG9uZGluZwo+ID4gPiBmZW5jZXMgYXJl
IHZpc2libGUpLCBhbnkgd29ya2VycyB0aGF0IGVuZCB1cCBzaWduYWxsaW5nIGRtYV9mZW5jZXMg
YW5kCj4gPiA+IHJlYWxseSBhbnl0aGluZyBlbHNlLiBOb3QgYW5ub3RhdGVkIHNob3VsZCBiZSBj
b2RlIHBhdGhzIHRoYXQgb25seQo+ID4gPiBjb21wbGV0ZSBmZW5jZXMgb3Bwb3J0dW5pc3RpY2Fs
bHkgYXMgdGhlIGdwdSBwcm9ncmVzc2VzLCBsaWtlIGUuZy4KPiA+ID4gc2hyaW5rZXIvZXZpY3Rp
b24gY29kZS4KPiA+ID4gCj4gPiA+IFRoZSBtYWluIGNsYXNzIG9mIGRlYWRsb2NrcyB0aGlzIGlz
IHN1cHBvc2VkIHRvIGNhdGNoIGFyZToKPiA+ID4gCj4gPiA+IFRocmVhZCBBOgo+ID4gPiAKPiA+
ID4gICAgICAgICBtdXRleF9sb2NrKEEpOwo+ID4gPiAgICAgICAgIG11dGV4X3VubG9jayhBKTsK
PiA+ID4gCj4gPiA+ICAgICAgICAgZG1hX2ZlbmNlX3NpZ25hbCgpOwo+ID4gPiAKPiA+ID4gVGhy
ZWFkIEI6Cj4gPiA+IAo+ID4gPiAgICAgICAgIG11dGV4X2xvY2soQSk7Cj4gPiA+ICAgICAgICAg
ZG1hX2ZlbmNlX3dhaXQoKTsKPiA+ID4gICAgICAgICBtdXRleF91bmxvY2soQSk7Cj4gPiA+IAo+
ID4gPiBUaHJlYWQgQiBpcyBibG9ja2VkIG9uIEEgc2lnbmFsbGluZyB0aGUgZmVuY2UsIGJ1dCBB
IG5ldmVyIGdldHMgYXJvdW5kCj4gPiA+IHRvIHRoYXQgYmVjYXVzZSBpdCBjYW5ub3QgYWNxdWly
ZSB0aGUgbG9jayBBLgo+ID4gPiAKPiA+ID4gTm90ZSB0aGF0IGRtYV9mZW5jZV93YWl0KCkgaXMg
YWxsb3dlZCB0byBiZSBuZXN0ZWQgd2l0aGluCj4gPiA+IGRtYV9mZW5jZV9iZWdpbi9lbmRfc2ln
bmFsbGluZyBzZWN0aW9ucy4gVG8gYWxsb3cgdGhpcyB0byBoYXBwZW4gdGhlCj4gPiA+IHJlYWQg
bG9jayBuZWVkcyB0byBiZSB1cGdyYWRlZCB0byBhIHdyaXRlIGxvY2ssIHdoaWNoIG1lYW5zIHRo
YXQgYW55Cj4gPiA+IG90aGVyIGxvY2sgaXMgYWNxdWlyZWQgYmV0d2VlbiB0aGUgZG1hX2ZlbmNl
X2JlZ2luX3NpZ25hbGxpbmcoKSBjYWxsIGFuZAo+ID4gPiB0aGUgY2FsbCB0byBkbWFfZmVuY2Vf
d2FpdCgpLCBhbmQgc3RpbGwgaGVsZCwgdGhpcyB3aWxsIHJlc3VsdCBpbiBhbgo+ID4gPiBpbW1l
ZGlhdGUgbG9ja2RlcCBjb21wbGFpbnQuIFRoZSBvbmx5IG90aGVyIG9wdGlvbiB3b3VsZCBiZSB0
byBub3QKPiA+ID4gYW5ub3RhdGUgc3VjaCBjYWxscywgZGVmZWF0aW5nIHRoZSBwb2ludC4gVGhl
cmVmb3JlIHRoZXNlIGFubm90YXRpb25zCj4gPiA+IGNhbm5vdCBiZSBzcHJpbmtsZWQgb3ZlciB0
aGUgY29kZSBlbnRpcmVseSBtaW5kbGVzcyB0byBhdm9pZCBmYWxzZQo+ID4gPiBwb3NpdGl2ZXMu
Cj4gPiA+IAo+ID4gPiB2MjogaGFuZGxlIHNvZnQvaGFyZGlycSBjdHggYmV0dGVyIGFnYWluc3Qg
d3JpdGUgc2lkZSBhbmQgZG9udCBmb3JnZXQKPiA+ID4gRVhQT1JUX1NZTUJPTCwgZHJpdmVycyBj
YW4ndCB1c2UgdGhpcyBvdGhlcndpc2UuCj4gPiA+IAo+ID4gPiBDYzogbGludXgtbWVkaWFAdmdl
ci5rZXJuZWwub3JnCj4gPiA+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiA+
ID4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCj4gPiA+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiA+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pgo+ID4gPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgfCA1MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2xpbnV4L2Rt
YS1mZW5jZS5oICAgfCAxMiArKysrKysrKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjUgaW5z
ZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwo+ID4gPiBpbmRleCA2ODAyMTI1
MzQ5ZmIuLmQ1YzBmZDJlZmM3MCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2Rt
YS1mZW5jZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwo+ID4gPiBA
QCAtMTEwLDYgKzExMCw1MiBAQCB1NjQgZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2ModW5zaWduZWQg
bnVtKQo+ID4gPiAgfQo+ID4gPiAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfY29udGV4dF9hbGxv
Yyk7Cj4gPiA+ICAKPiA+ID4gKyNpZmRlZiBDT05GSUdfTE9DS0RFUAo+ID4gPiArc3RydWN0IGxv
Y2tkZXBfbWFwICAgICBkbWFfZmVuY2VfbG9ja2RlcF9tYXAgPSB7Cj4gPiA+ICsgICAgICAgLm5h
bWUgPSAiZG1hX2ZlbmNlX21hcCIKPiA+ID4gK307Cj4gPiAKPiA+IE5vdCBhbm90aGVyIGZhbHNl
IGdsb2JhbCBzaGFyaW5nIGxvY2ttYXAuCj4gCj4gSXQncyBhIGdsb2JhbCBjb250cmFjdCwgaXQg
bmVlZHMgYSBnbG9iYWwgbG9ja2RlcCBtYXAuIEFuZCB5ZXMgYSBiaWcKPiByZWFzb24gZm9yIHRo
ZSBtb3RpdmF0aW9uIGhlcmUgaXMgdGhhdCBpOTE1LWdlbSBoYXMgYSB0cmVtZW5kb3VzIHVyZ2Ug
dG8KPiBqdXN0IHJlZGVmaW5lIGFsbCB0aGVzZSBnbG9iYWwgbG9ja3MgdG8gZml0IHRvIHNvbWUg
bG9jYWwgaW50ZXJwcmV0YXRpb24KPiBvZiB3aGF0J3MgZ29pbmcgb24uCgpObywgeW91IGNhbiBi
dWlsZCB0aGUgZ2xvYmFsIGNvbnRyYWN0IG91dCBvZiB0aGUgYWN0dWFsIGNvbnRyYWN0cwpiZXR3
ZWVuIGZlbmNlIGRyaXZlcnMuIElmIHlvdSBpbnRyb2R1Y2UgYSBzdHJ1Y3QgbG9ja2RlcF9tYXAg
Km1hcCBpbnRvCnRoZSBmZW5jZV9vcHMgKHNvIHRoZSBmZW5jZV9vcHMgY2FuIHJlbWFpbiBjb25z
dCksIHlvdSBnYWluIGNvcnJlY3RuZXNzCmF0IHRoZSBjb3N0IG9mIGhhdmluZyB0byBydW4gdGhy
b3VnaCBhbGwgcG9zc2libGUgaW50ZXJhY3Rpb25zIG9uY2UuCllvdSBjYW4gYWxzbyB0aGVuIGRv
IGlmIG9wcy0+bG9ja21hcCA/OiAmZ2xvYmFsX2ZlbmNlX2xvY2ttYXAgZm9yCnBpZWNlbWVhbCBj
b252ZXJzaW9uIG9mIGRyaXZlcnMgdGhhdCBkbyBub3QgYWxyZWFkeSB1c2UgbG9ja21hcHMgZm9y
CmNvbnRyYWN0IGVuZm9yY2VtZW50IG9mIHRoZWlyIGZlbmNlIHdhaXRzLgotQ2hyaXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
