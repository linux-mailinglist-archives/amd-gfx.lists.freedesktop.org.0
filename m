Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402001F6516
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2020 11:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D0D6E8D4;
	Thu, 11 Jun 2020 09:57:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D586E8CC;
 Thu, 11 Jun 2020 09:57:12 +0000 (UTC)
IronPort-SDR: jkY6Zl/9NGn4etqR3iJCOMELuTvFVX0zlHXOOHr1IM7lwz4Awr+cyLIoZX/p16w+/NeZueuBiR
 qD/zKlPlk+KA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 02:57:11 -0700
IronPort-SDR: fAttHnR74Vc0G7NXF9Op1FAl4sCf2jhZj08Dq2so8juCMCP67GjFgBhpqk65ydd8B25zp0YKqW
 Zfik8U0uNOYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; d="scan'208";a="473748086"
Received: from smorse-mobl1.ger.corp.intel.com (HELO [10.252.48.38])
 ([10.252.48.38])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2020 02:57:08 -0700
Subject: Re: [PATCH] dma-fence: basic lockdep annotations
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <20200605132953.899664-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <2b514d05-bf44-645d-6335-81e140e64e57@linux.intel.com>
Date: Thu, 11 Jun 2020 11:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200605132953.899664-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T3AgMDUtMDYtMjAyMCBvbSAxNToyOSBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gRGVzaWduIGlz
IHNpbWlsYXIgdG8gdGhlIGxvY2tkZXAgYW5ub3RhdGlvbnMgZm9yIHdvcmtlcnMsIGJ1dCB3aXRo
Cj4gc29tZSB0d2lzdHM6Cj4KPiAtIFdlIHVzZSBhIHJlYWQtbG9jayBmb3IgdGhlIGV4ZWN1dGlv
bi93b3JrZXIvY29tcGxldGlvbiBzaWRlLCBzbyB0aGF0Cj4gICB0aGlzIGV4cGxpY2l0IGFubm90
YXRpb24gY2FuIGJlIG1vcmUgbGliZXJhbGx5IHNwcmlua2xlZCBhcm91bmQuCj4gICBXaXRoIHJl
YWQgbG9ja3MgbG9ja2RlcCBpc24ndCBnb2luZyB0byBjb21wbGFpbiBpZiB0aGUgcmVhZC1zaWRl
Cj4gICBpc24ndCBuZXN0ZWQgdGhlIHNhbWUgd2F5IHVuZGVyIGFsbCBjaXJjdW1zdGFuY2VzLCBz
byBBQkJBIGRlYWRsb2Nrcwo+ICAgYXJlIG9rLiBXaGljaCB0aGV5IGFyZSwgc2luY2UgdGhpcyBp
cyBhbiBhbm5vdGF0aW9uIG9ubHkuCj4KPiAtIFdlJ3JlIHVzaW5nIG5vbi1yZWN1cnNpdmUgbG9j
a2RlcCByZWFkIGxvY2sgbW9kZSwgc2luY2UgaW4gcmVjdXJzaXZlCj4gICByZWFkIGxvY2sgbW9k
ZSBsb2NrZGVwIGRvZXMgbm90IGNhdGNoIHJlYWQgc2lkZSBoYXphcmRzLiBBbmQgd2UKPiAgIF92
ZXJ5XyBtdWNoIHdhbnQgcmVhZCBzaWRlIGhhemFyZHMgdG8gYmUgY2F1Z2h0LiBGb3IgZnVsbCBk
ZXRhaWxzIG9mCj4gICB0aGlzIGxpbWl0YXRpb24gc2VlCj4KPiAgIGNvbW1pdCBlOTE0OTg1ODk3
NDYwNjVlM2FlOTVkOWEwMGIwNjhlNTI1ZWVjMzRmCj4gICBBdXRob3I6IFBldGVyIFppamxzdHJh
IDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiAgIERhdGU6ICAgV2VkIEF1ZyAyMyAxMzoxMzoxMSAy
MDE3ICswMjAwCj4KPiAgICAgICBsb2NraW5nL2xvY2tkZXAvc2VsZnRlc3RzOiBBZGQgbWl4ZWQg
cmVhZC13cml0ZSBBQkJBIHRlc3RzCj4KPiAtIFRvIGFsbG93IG5lc3Rpbmcgb2YgdGhlIHJlYWQt
c2lkZSBleHBsaWNpdCBhbm5vdGF0aW9ucyB3ZSBleHBsaWNpdGx5Cj4gICBrZWVwIHRyYWNrIG9m
IHRoZSBuZXN0aW5nLiBsb2NrX2lzX2hlbGQoKSBhbGxvd3MgdXMgdG8gZG8gdGhhdC4KPgo+IC0g
VGhlIHdhaXQtc2lkZSBhbm5vdGF0aW9uIGlzIGEgd3JpdGUgbG9jaywgYW5kIGVudGlyZWx5IGRv
bmUgd2l0aGluCj4gICBkbWFfZmVuY2Vfd2FpdCgpIGZvciBldmVyeW9uZSBieSBkZWZhdWx0Lgo+
Cj4gLSBUbyBiZSBhYmxlIHRvIGZyZWVseSBhbm5vdGF0ZSBoZWxwZXIgZnVuY3Rpb25zIEkgd2Fu
dCB0byBtYWtlIGl0IG9rCj4gICB0byBjYWxsIGRtYV9mZW5jZV9iZWdpbi9lbmRfc2lnbmFsbGlu
ZyBmcm9tIHNvZnQvaGFyZGlycSBjb250ZXh0Lgo+ICAgRmlyc3QgYXR0ZW1wdCB3YXMgdXNpbmcg
dGhlIGhhcmRpcnEgbG9ja2luZyBjb250ZXh0IGZvciB0aGUgd3JpdGUKPiAgIHNpZGUgaW4gbG9j
a2RlcCwgYnV0IHRoaXMgZm9yY2VzIGFsbCBub3JtYWwgc3BpbmxvY2tzIG5lc3RlZCB3aXRoaW4K
PiAgIGRtYV9mZW5jZV9iZWdpbi9lbmRfc2lnbmFsbGluZyB0byBiZSBzcGlubG9ja3MuIFRoYXQg
Ym9sbG9ja3MuCj4KPiAgIFRoZSBhcHByb2FjaCBub3cgaXMgdG8gc2ltcGxlIGNoZWNrIGluX2F0
b21pYygpLCBhbmQgZm9yIHRoZXNlIGNhc2VzCj4gICBlbnRpcmVseSByZWx5IG9uIHRoZSBtaWdo
dF9zbGVlcCgpIGNoZWNrIGluIGRtYV9mZW5jZV93YWl0KCkuIFRoYXQKPiAgIHdpbGwgY2F0Y2gg
YW55IHdyb25nIG5lc3RpbmcgYWdhaW5zdCBzcGlubG9ja3MgZnJvbSBzb2Z0L2hhcmRpcnEKPiAg
IGNvbnRleHRzLgo+Cj4gVGhlIGlkZWEgaGVyZSBpcyB0aGF0IGV2ZXJ5IGNvZGUgcGF0aCB0aGF0
J3MgY3JpdGljYWwgZm9yIGV2ZW50dWFsbHkKPiBzaWduYWxsaW5nIGEgZG1hX2ZlbmNlIHNob3Vs
ZCBiZSBhbm5vdGF0ZWQgd2l0aAo+IGRtYV9mZW5jZV9iZWdpbi9lbmRfc2lnbmFsbGluZy4gVGhl
IGFubm90YXRpb24gaWRlYWxseSBzdGFydHMgcmlnaHQKPiBhZnRlciBhIGRtYV9mZW5jZSBpcyBw
dWJsaXNoZWQgKGFkZGVkIHRvIGEgZG1hX3Jlc3YsIGV4cG9zZWQgYXMgYQo+IHN5bmNfZmlsZSBm
ZCwgYXR0YWNoZWQgdG8gYSBkcm1fc3luY29iaiBmZCwgb3IgYW55dGhpbmcgZWxzZSB0aGF0Cj4g
bWFrZXMgdGhlIGRtYV9mZW5jZSB2aXNpYmxlIHRvIG90aGVyIGtlcm5lbCB0aHJlYWRzKSwgdXAg
dG8gYW5kCj4gaW5jbHVkaW5nIHRoZSBkbWFfZmVuY2Vfd2FpdCgpLiBFeGFtcGxlcyBhcmUgaXJx
IGhhbmRsZXJzLCB0aGUKPiBzY2hlZHVsZXIgcnQgdGhyZWFkcywgdGhlIHRhaWwgb2YgZXhlY2J1
ZiAoYWZ0ZXIgdGhlIGNvcnJlc3BvbmRpbmcKPiBmZW5jZXMgYXJlIHZpc2libGUpLCBhbnkgd29y
a2VycyB0aGF0IGVuZCB1cCBzaWduYWxsaW5nIGRtYV9mZW5jZXMgYW5kCj4gcmVhbGx5IGFueXRo
aW5nIGVsc2UuIE5vdCBhbm5vdGF0ZWQgc2hvdWxkIGJlIGNvZGUgcGF0aHMgdGhhdCBvbmx5Cj4g
Y29tcGxldGUgZmVuY2VzIG9wcG9ydHVuaXN0aWNhbGx5IGFzIHRoZSBncHUgcHJvZ3Jlc3Nlcywg
bGlrZSBlLmcuCj4gc2hyaW5rZXIvZXZpY3Rpb24gY29kZS4KPgo+IFRoZSBtYWluIGNsYXNzIG9m
IGRlYWRsb2NrcyB0aGlzIGlzIHN1cHBvc2VkIHRvIGNhdGNoIGFyZToKPgo+IFRocmVhZCBBOgo+
Cj4gCW11dGV4X2xvY2soQSk7Cj4gCW11dGV4X3VubG9jayhBKTsKPgo+IAlkbWFfZmVuY2Vfc2ln
bmFsKCk7Cj4KPiBUaHJlYWQgQjoKPgo+IAltdXRleF9sb2NrKEEpOwo+IAlkbWFfZmVuY2Vfd2Fp
dCgpOwo+IAltdXRleF91bmxvY2soQSk7Cj4KPiBUaHJlYWQgQiBpcyBibG9ja2VkIG9uIEEgc2ln
bmFsbGluZyB0aGUgZmVuY2UsIGJ1dCBBIG5ldmVyIGdldHMgYXJvdW5kCj4gdG8gdGhhdCBiZWNh
dXNlIGl0IGNhbm5vdCBhY3F1aXJlIHRoZSBsb2NrIEEuCj4KPiBOb3RlIHRoYXQgZG1hX2ZlbmNl
X3dhaXQoKSBpcyBhbGxvd2VkIHRvIGJlIG5lc3RlZCB3aXRoaW4KPiBkbWFfZmVuY2VfYmVnaW4v
ZW5kX3NpZ25hbGxpbmcgc2VjdGlvbnMuIFRvIGFsbG93IHRoaXMgdG8gaGFwcGVuIHRoZQo+IHJl
YWQgbG9jayBuZWVkcyB0byBiZSB1cGdyYWRlZCB0byBhIHdyaXRlIGxvY2ssIHdoaWNoIG1lYW5z
IHRoYXQgYW55Cj4gb3RoZXIgbG9jayBpcyBhY3F1aXJlZCBiZXR3ZWVuIHRoZSBkbWFfZmVuY2Vf
YmVnaW5fc2lnbmFsbGluZygpIGNhbGwgYW5kCj4gdGhlIGNhbGwgdG8gZG1hX2ZlbmNlX3dhaXQo
KSwgYW5kIHN0aWxsIGhlbGQsIHRoaXMgd2lsbCByZXN1bHQgaW4gYW4KPiBpbW1lZGlhdGUgbG9j
a2RlcCBjb21wbGFpbnQuIFRoZSBvbmx5IG90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBub3QKPiBh
bm5vdGF0ZSBzdWNoIGNhbGxzLCBkZWZlYXRpbmcgdGhlIHBvaW50LiBUaGVyZWZvcmUgdGhlc2Ug
YW5ub3RhdGlvbnMKPiBjYW5ub3QgYmUgc3ByaW5rbGVkIG92ZXIgdGhlIGNvZGUgZW50aXJlbHkg
bWluZGxlc3MgdG8gYXZvaWQgZmFsc2UKPiBwb3NpdGl2ZXMuCj4KPiBPcmlnaW5hbGx5IEkgaG9w
ZSB0aGF0IHRoZSBjcm9zcy1yZWxlYXNlIGxvY2tkZXAgZXh0ZW5zaW9ucyB3b3VsZAo+IGFsbGV2
aWF0ZSB0aGUgbmVlZCBmb3IgZXhwbGljaXQgYW5ub3RhdGlvbnM6Cj4KPiBodHRwczovL2x3bi5u
ZXQvQXJ0aWNsZXMvNzA5ODQ5Lwo+Cj4gQnV0IHRoZXJlJ3MgYSBmZXcgcmVhc29ucyB3aHkgdGhh
dCdzIG5vdCBhbiBvcHRpb246Cj4KPiAtIEl0J3Mgbm90IGhhcHBlbmluZyBpbiB1cHN0cmVhbSwg
c2luY2UgaXQgZ290IHJldmVydGVkIGR1ZSB0byB0b28KPiAgIG1hbnkgZmFsc2UgcG9zaXRpdmVz
Ogo+Cj4gCWNvbW1pdCBlOTY2ZWFlZWI2MjNmMDk5NzVlZjM2MmMyODY2ZmFlNmY4Njg0NGY5Cj4g
CUF1dGhvcjogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+Cj4gCURhdGU6ICAgVHVlIERl
YyAxMiAxMjozMToxNiAyMDE3ICswMTAwCj4KPiAJICAgIGxvY2tpbmcvbG9ja2RlcDogUmVtb3Zl
IHRoZSBjcm9zcy1yZWxlYXNlIGxvY2tpbmcgY2hlY2tzCj4KPiAJICAgIFRoaXMgY29kZSAoQ09O
RklHX0xPQ0tERVBfQ1JPU1NSRUxFQVNFPXkgYW5kIENPTkZJR19MT0NLREVQX0NPTVBMRVRJT05T
PXkpLAo+IAkgICAgd2hpbGUgaXQgZm91bmQgYSBudW1iZXIgb2Ygb2xkIGJ1Z3MgaW5pdGlhbGx5
LCB3YXMgYWxzbyBjYXVzaW5nIHRvbyBtYW55Cj4gCSAgICBmYWxzZSBwb3NpdGl2ZXMgdGhhdCBj
YXVzZWQgcGVvcGxlIHRvIGRpc2FibGUgbG9ja2RlcCAtIHdoaWNoIGlzIGFyZ3VhYmx5Cj4gCSAg
ICBhIHdvcnNlIG92ZXJhbGwgb3V0Y29tZS4KPgo+IC0gY3Jvc3MtcmVsZWFzZSB1c2VzIHRoZSBj
b21wbGV0ZSgpIGNhbGwgdG8gYW5ub3RhdGUgdGhlIGVuZCBvZgo+ICAgY3JpdGljYWwgc2VjdGlv
bnMsIGZvciBkbWFfZmVuY2UgdGhhdCB3b3VsZCBiZSBkbWFfZmVuY2Vfc2lnbmFsKCkuCj4gICBC
dXQgd2UgZG8gbm90IHdhbnQgYWxsIGRtYV9mZW5jZV9zaWduYWwoKSBjYWxscyB0byBiZSB0cmVh
dGVkIGFzCj4gICBjcml0aWNhbCwgc2luY2UgbWFueSBhcmUgb3Bwb3J0dW5pc3RpYyBjbGVhbnVw
IG9mIGdwdSByZXF1ZXN0cy4gSWYKPiAgIHRoZXNlIGdldCBzdHVjayB0aGVyZSdzIHN0aWxsIHRo
ZSBtYWluIGNvbXBsZXRpb24gaW50ZXJydXB0IGFuZAo+ICAgd29ya2VycyB3aG8gY2FuIHVuYmxv
Y2sgZXZlcnlvbmUuIEF1dG9tYXRpY2FsbHkgYW5ub3RhdGluZyBhbGwKPiAgIGRtYV9mZW5jZV9z
aWduYWwoKSBjYWxscyB3b3VsZCBoZW5jZSBjYXVzZSBmYWxzZSBwb3NpdGl2ZXMuCj4KPiAtIGNy
b3NzLXJlbGVhc2UgaGFkIHNvbWUgZWR1Y2F0ZWQgZ3Vlc3NlcyBmb3Igd2hlbiBhIGNyaXRpY2Fs
IHNlY3Rpb24KPiAgIHN0YXJ0cywgbGlrZSBmcmVzaCBzeXNjYWxsIG9yIGZyZXNoIHdvcmsgY2Fs
bGJhY2suIFRoaXMgd291bGQgYWdhaW4KPiAgIGNhdXNlIGZhbHNlIHBvc2l0aXZlcyB3aXRob3V0
IGV4cGxpY2l0IGFubm90YXRpb25zLCBzaW5jZSBmb3IKPiAgIGRtYV9mZW5jZSB0aGUgY3JpdGlj
YWwgc2VjdGlvbnMgb25seSBzdGFydHMgd2hlbiB3ZSBwdWJsaXNoIGEgZmVuY2UuCj4KPiAtIEZ1
cnRoZXJtb3JlIHRoZXJlIGNhbiBiZSBjYXNlcyB3aGVyZSBhIHRocmVhZCBuZXZlciBkb2VzIGEK
PiAgIGRtYV9mZW5jZV9zaWduYWwsIGJ1dCBpcyBzdGlsbCBjcml0aWNhbCBmb3IgcmVhY2hpbmcg
Y29tcGxldGlvbiBvZgo+ICAgZmVuY2VzLiBPbmUgZXhhbXBsZSB3b3VsZCBiZSBhIHNjaGVkdWxl
ciBrdGhyZWFkIHdoaWNoIHBpY2tzIHVwIGpvYnMKPiAgIGFuZCBwdXNoZXMgdGhlbSBpbnRvIGhh
cmR3YXJlLCB3aGVyZSB0aGUgaW50ZXJydXB0IGhhbmRsZXIgb3IKPiAgIGFub3RoZXIgY29tcGxl
dGlvbiB0aHJlYWQgY2FsbHMgZG1hX2ZlbmNlX3NpZ25hbCgpLiBCdXQgaWYgdGhlCj4gICBzY2hl
ZHVsZXIgdGhyZWFkIGhhbmdzLCB0aGVuIGFsbCB0aGUgZmVuY2VzIGhhbmcsIGhlbmNlIHdlIG5l
ZWQgdG8KPiAgIG1hbnVhbGx5IGFubm90YXRlIGl0LiBjcm9zcy1yZWxlYXNlIGFpbWVkIHRvIHNv
bHZlIHRoaXMgYnkgY2hhaW5pbmcKPiAgIGNyb3NzLXJlbGVhc2UgZGVwZW5kZW5jaWVzLCBidXQg
dGhlIGRlcGVuZGVuY3kgZnJvbSBzY2hlZHVsZXIgdGhyZWFkCj4gICB0byB0aGUgY29tcGxldGlv
biBpbnRlcnJ1cHQgaGFuZGxlciBnb2VzIHRocm91Z2ggaHcgd2hlcmUKPiAgIGNyb3NzLXJlbGVh
c2UgY29kZSBjYW4ndCBvYnNlcnZlIGl0Lgo+Cj4gSW4gc2hvcnQsIHdpdGhvdXQgbWFudWFsIGFu
bm90YXRpb25zIGFuZCBjYXJlZnVsIHJldmlldyBvZiB0aGUgc3RhcnQKPiBhbmQgZW5kIG9mIGNy
aXRpY2FsIHNlY3Rpb25zLCBjcm9zcy1yZWxlc2UgZGVwZW5kZW5jeSB0cmFja2luZyBkb2Vzbid0
Cj4gd29yay4gV2UgbmVlZCBleHBsaWNpdCBhbm5vdGF0aW9ucy4KPgo+IHYyOiBoYW5kbGUgc29m
dC9oYXJkaXJxIGN0eCBiZXR0ZXIgYWdhaW5zdCB3cml0ZSBzaWRlIGFuZCBkb250IGZvcmdldAo+
IEVYUE9SVF9TWU1CT0wsIGRyaXZlcnMgY2FuJ3QgdXNlIHRoaXMgb3RoZXJ3aXNlLgo+Cj4gdjM6
IEtlcm5lbGRvYy4KPgo+IHY0OiBTb21lIHNwZWxsaW5nIGZpeGVzIGZyb20gTWlrYQo+Cj4gdjU6
IEFtZW5kIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gaW4gZGV0YWlsIHdoeSBjcm9zcy1yZWxl
YXNlIGlzbid0Cj4gdGhlIHNvbHV0aW9uLgo+Cj4gQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3Vv
cHBhbGFAaW50ZWwuY29tPgo+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aG9tYXMuaGVsbHN0cm9t
QGludGVsLmNvbT4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IENjOiBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdCB8ICAxMiAr
LQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgICAgICAgICAgfCAxNjEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLmggICAgICAgICAg
ICB8ICAxMiArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDE4MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVm
LnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+IGluZGV4IDYzZGVj
NzZkMWQ4ZC4uMDVkODU2MTMxMTQwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS9kbWEtYnVmLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVm
LnJzdAo+IEBAIC0xMDAsMTEgKzEwMCwxMSBAQCBDUFUgQWNjZXNzIHRvIERNQSBCdWZmZXIgT2Jq
ZWN0cwo+ICAuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ICAgICA6
ZG9jOiBjcHUgYWNjZXNzCj4gIAo+IC1GZW5jZSBQb2xsIFN1cHBvcnQKPiAtfn5+fn5+fn5+fn5+
fn5+fn5+Cj4gK0ltcGxpY2l0IEZlbmNlIFBvbGwgU3VwcG9ydAo+ICt+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPiAgCj4gIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1
Zi5jCj4gLSAgIDpkb2M6IGZlbmNlIHBvbGxpbmcKPiArICAgOmRvYzogaW1wbGljaXQgZmVuY2Ug
cG9sbGluZwo+ICAKPiAgS2VybmVsIEZ1bmN0aW9ucyBhbmQgU3RydWN0dXJlcyBSZWZlcmVuY2UK
PiAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBAQCAtMTMzLDYg
KzEzMywxMiBAQCBETUEgRmVuY2VzCj4gIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2RtYS1idWYv
ZG1hLWZlbmNlLmMKPiAgICAgOmRvYzogRE1BIGZlbmNlcyBvdmVydmlldwo+ICAKPiArRE1BIEZl
bmNlIFNpZ25hbGxpbmcgQW5ub3RhdGlvbnMKPiArfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KPiArCj4gKy4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMK
PiArICAgOmRvYzogZmVuY2Ugc2lnbmFsbGluZyBhbm5vdGF0aW9uCj4gKwo+ICBETUEgRmVuY2Vz
IEZ1bmN0aW9ucyBSZWZlcmVuY2UKPiAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4g
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWZlbmNlLmMKPiBpbmRleCA2NTZlOWFjMmQwMjguLjAwMDViYzAwMjUyOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWZlbmNlLmMKPiBAQCAtMTEwLDYgKzExMCwxNjAgQEAgdTY0IGRtYV9mZW5jZV9j
b250ZXh0X2FsbG9jKHVuc2lnbmVkIG51bSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRtYV9mZW5j
ZV9jb250ZXh0X2FsbG9jKTsKPiAgCj4gKy8qKgo+ICsgKiBET0M6IGZlbmNlIHNpZ25hbGxpbmcg
YW5ub3RhdGlvbgo+ICsgKgo+ICsgKiBQcm92aW5nIGNvcnJlY3RuZXNzIG9mIGFsbCB0aGUga2Vy
bmVsIGNvZGUgYXJvdW5kICZkbWFfZmVuY2UgdGhyb3VnaCBjb2RlCj4gKyAqIHJldmlldyBhbmQg
dGVzdGluZyBpcyB0cmlja3kgZm9yIGEgZmV3IHJlYXNvbnM6Cj4gKyAqCj4gKyAqICogSXQgaXMg
YSBjcm9zcy1kcml2ZXIgY29udHJhY3QsIGFuZCB0aGVyZWZvcmUgYWxsIGRyaXZlcnMgbXVzdCBm
b2xsb3cgdGhlCj4gKyAqICAgc2FtZSBydWxlcyBmb3IgbG9jayBuZXN0aW5nIG9yZGVyLCBjYWxs
aW5nIGNvbnRleHRzIGZvciB2YXJpb3VzIGZ1bmN0aW9ucwo+ICsgKiAgIGFuZCBhbnl0aGluZyBl
bHNlIHNpZ25pZmljYW50IGZvciBpbi1rZXJuZWwgaW50ZXJmYWNlcy4gQnV0IGl0IGlzIGFsc28K
PiArICogICBpbXBvc3NpYmxlIHRvIHRlc3QgYWxsIGRyaXZlcnMgaW4gYSBzaW5nbGUgbWFjaGlu
ZSwgaGVuY2UgYnJ1dGUtZm9yY2UgTiB2cy4KPiArICogICBOIHRlc3Rpbmcgb2YgYWxsIGNvbWJp
bmF0aW9ucyBpcyBpbXBvc3NpYmxlLiBFdmVuIGp1c3QgbGltaXRpbmcgdG8gdGhlCj4gKyAqICAg
cG9zc2libGUgY29tYmluYXRpb25zIGlzIGluZmVhc2libGUuCj4gKyAqCj4gKyAqICogVGhlcmUg
aXMgYW4gZW5vcm1vdXMgYW1vdW50IG9mIGRyaXZlciBjb2RlIGludm9sdmVkLiBGb3IgcmVuZGVy
IGRyaXZlcnMKPiArICogICB0aGVyZSdzIHRoZSB0YWlsIG9mIGNvbW1hbmQgc3VibWlzc2lvbiwg
YWZ0ZXIgZmVuY2VzIGFyZSBwdWJsaXNoZWQsCj4gKyAqICAgc2NoZWR1bGVyIGNvZGUsIGludGVy
cnVwdCBhbmQgd29ya2VycyB0byBwcm9jZXNzIGpvYiBjb21wbGV0aW9uLAo+ICsgKiAgIGFuZCB0
aW1lb3V0LCBncHUgcmVzZXQgYW5kIGdwdSBoYW5nIHJlY292ZXJ5IGNvZGUuIFBsdXMgZm9yIGlu
dGVncmF0aW9uCj4gKyAqICAgd2l0aCBjb3JlIG1tIHdpdGggaGF2ZSAmbW11X25vdGlmaWVyLCBy
ZXNwZWN0aXZlbHkgJm1tdV9pbnRlcnZhbF9ub3RpZmllciwKPiArICogICBhbmQgJnNocmlua2Vy
LiBGb3IgbW9kZXNldHRpbmcgZHJpdmVycyB0aGVyZSdzIHRoZSBjb21taXQgdGFpbCBmdW5jdGlv
bnMKPiArICogICBiZXR3ZWVuIHdoZW4gZmVuY2VzIGZvciBhbiBhdG9taWMgbW9kZXNldCBhcmUg
cHVibGlzaGVkLCBhbmQgd2hlbiB0aGUKPiArICogICBjb3JyZXNwb25kaW5nIHZibGFuayBjb21w
bGV0ZXMsIGluY2x1ZGluZyBhbnkgaW50ZXJydXB0IHByb2Nlc3NpbmcgYW5kCj4gKyAqICAgcmVs
YXRlZCB3b3JrZXJzLiBBdWRpdGluZyBhbGwgdGhhdCBjb2RlLCBhY3Jvc3MgYWxsIGRyaXZlcnMs
IGlzIG5vdAo+ICsgKiAgIGZlYXNpYmxlLgo+ICsgKgo+ICsgKiAqIER1ZSB0byBob3cgbWFueSBv
dGhlciBzdWJzeXN0ZW1zIGFyZSBpbnZvbHZlZCBhbmQgdGhlIGxvY2tpbmcgaGllcmFyY2hpZXMK
PiArICogICB0aGlzIHB1bGxzIGluIHRoZXJlIGlzIGV4dHJlbWVseSB0aGluIHdpZ2dsZS1yb29t
IGZvciBkcml2ZXItc3BlY2lmaWMKPiArICogICBkaWZmZXJlbmNlcy4gJmRtYV9mZW5jZSBpbnRl
cmFjdHMgd2l0aCBhbG1vc3QgYWxsIG9mIHRoZSBjb3JlIG1lbW9yeQo+ICsgKiAgIGhhbmRsaW5n
IHRocm91Z2ggcGFnZSBmYXVsdCBoYW5kbGVycyB2aWEgJmRtYV9yZXN2LCBkbWFfcmVzdl9sb2Nr
KCkgYW5kCj4gKyAqICAgZG1hX3Jlc3ZfdW5sb2NrKCkuIE9uIHRoZSBvdGhlciBzaWRlIGl0IGFs
c28gaW50ZXJhY3RzIHRocm91Z2ggYWxsCj4gKyAqICAgYWxsb2NhdGlvbiBzaXRlcyB0aHJvdWdo
ICZtbXVfbm90aWZpZXIgYW5kICZzaHJpbmtlci4KPiArICoKPiArICogRnVydGhlcm1vcmUgbG9j
a2RlcCBkb2VzIG5vdCBoYW5kbGUgY3Jvc3MtcmVsZWFzZSBkZXBlbmRlbmNpZXMsIHdoaWNoIG1l
YW5zCj4gKyAqIGFueSBkZWFkbG9ja3MgYmV0d2VlbiBkbWFfZmVuY2Vfd2FpdCgpIGFuZCBkbWFf
ZmVuY2Vfc2lnbmFsKCkgY2FuJ3QgYmUgY2F1Z2h0Cj4gKyAqIGF0IHJ1bnRpbWUgd2l0aCBzb21l
IHF1aWNrIHRlc3RpbmcuIFRoZSBzaW1wbGVzdCBleGFtcGxlIGlzIG9uZSB0aHJlYWQKPiArICog
d2FpdGluZyBvbiBhICZkbWFfZmVuY2Ugd2hpbGUgaG9sZGluZyBhIGxvY2s6Ogo+ICsgKgo+ICsg
KiAgICAgbG9jayhBKTsKPiArICogICAgIGRtYV9mZW5jZV93YWl0KEIpOwo+ICsgKiAgICAgdW5s
b2NrKEEpOwo+ICsgKgo+ICsgKiB3aGlsZSB0aGUgb3RoZXIgdGhyZWFkIGlzIHN0dWNrIHRyeWlu
ZyB0byBhY3F1aXJlIHRoZSBzYW1lIGxvY2ssIHdoaWNoCj4gKyAqIHByZXZlbnRzIGl0IGZyb20g
c2lnbmFsbGluZyB0aGUgZmVuY2UgdGhlIHByZXZpb3VzIHRocmVhZCBpcyBzdHVjayB3YWl0aW5n
Cj4gKyAqIG9uOjoKPiArICoKPiArICogICAgIGxvY2soQSk7Cj4gKyAqICAgICB1bmxvY2soQSk7
Cj4gKyAqICAgICBkbWFfZmVuY2Vfc2lnbmFsKEIpOwo+ICsgKgo+ICsgKiBCeSBtYW51YWxseSBh
bm5vdGF0aW5nIGFsbCBjb2RlIHJlbGV2YW50IHRvIHNpZ25hbGxpbmcgYSAmZG1hX2ZlbmNlIHdl
IGNhbgo+ICsgKiB0ZWFjaCBsb2NrZGVwIGFib3V0IHRoZXNlIGRlcGVuZGVuY2llcywgd2hpY2gg
YWxzbyBoZWxwcyB3aXRoIHRoZSB2YWxpZGF0aW9uCj4gKyAqIGhlYWRhY2hlIHNpbmNlIG5vdyBs
b2NrZGVwIGNhbiBjaGVjayBhbGwgdGhlIHJ1bGVzIGZvciB1czo6Cj4gKyAqCj4gKyAqICAgIGNv
b2tpZSA9IGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKCk7Cj4gKyAqICAgIGxvY2soQSk7Cj4g
KyAqICAgIHVubG9jayhBKTsKPiArICogICAgZG1hX2ZlbmNlX3NpZ25hbChCKTsKPiArICogICAg
ZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGNvb2tpZSk7Cj4gKyAqCj4gKyAqIEZvciB1c2luZyBk
bWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpIGFuZCBkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmco
KSB0bwo+ICsgKiBhbm5vdGF0ZSBjcml0aWNhbCBzZWN0aW9ucyB0aGUgZm9sbG93aW5nIHJ1bGVz
IG5lZWQgdG8gYmUgb2JzZXJ2ZWQ6Cj4gKyAqCj4gKyAqICogQWxsIGNvZGUgbmVjZXNzYXJ5IHRv
IGNvbXBsZXRlIGEgJmRtYV9mZW5jZSBtdXN0IGJlIGFubm90YXRlZCwgZnJvbSB0aGUKPiArICog
ICBwb2ludCB3aGVyZSBhIGZlbmNlIGlzIGFjY2Vzc2libGUgdG8gb3RoZXIgdGhyZWFkcywgdG8g
dGhlIHBvaW50IHdoZXJlCj4gKyAqICAgZG1hX2ZlbmNlX3NpZ25hbCgpIGlzIGNhbGxlZC4gVW4t
YW5ub3RhdGVkIGNvZGUgY2FuIGNvbnRhaW4gZGVhZGxvY2sgaXNzdWVzLAo+ICsgKiAgIGFuZCBk
dWUgdG8gdGhlIHZlcnkgc3RyaWN0IHJ1bGVzIGFuZCBtYW55IGNvcm5lciBjYXNlcyBpdCBpcyBp
bmZlYXNpYmxlIHRvCj4gKyAqICAgY2F0Y2ggdGhlc2UganVzdCB3aXRoIHJldmlldyBvciBub3Jt
YWwgc3RyZXNzIHRlc3RpbmcuCj4gKyAqCj4gKyAqICogJnN0cnVjdCBkbWFfcmVzdiBkZXNlcnZl
cyBhIHNwZWNpYWwgbm90ZSwgc2luY2UgdGhlIHJlYWRlcnMgYXJlIG9ubHkKPiArICogICBwcm90
ZWN0ZWQgYnkgcmN1LiBUaGlzIG1lYW5zIHRoZSBzaWduYWxsaW5nIGNyaXRpY2FsIHNlY3Rpb24g
c3RhcnRzIGFzIHNvb24KPiArICogICBhcyB0aGUgbmV3IGZlbmNlcyBhcmUgaW5zdGFsbGVkLCBl
dmVuIGJlZm9yZSBkbWFfcmVzdl91bmxvY2soKSBpcyBjYWxsZWQuCj4gKyAqCj4gKyAqICogVGhl
IG9ubHkgZXhjZXB0aW9uIGFyZSBmYXN0IHBhdGhzIGFuZCBvcHBvcnR1bmlzdGljIHNpZ25hbGxp
bmcgY29kZSwgd2hpY2gKPiArICogICBjYWxscyBkbWFfZmVuY2Vfc2lnbmFsKCkgcHVyZWx5IGFz
IGFuIG9wdGltaXphdGlvbiwgYnV0IGlzIG5vdCByZXF1aXJlZCB0bwo+ICsgKiAgIGd1YXJhbnRl
ZSBjb21wbGV0aW9uIG9mIGEgJmRtYV9mZW5jZS4gVGhlIHVzdWFsIGV4YW1wbGUgaXMgYSB3YWl0
IElPQ1RMCj4gKyAqICAgd2hpY2ggY2FsbHMgZG1hX2ZlbmNlX3NpZ25hbCgpLCB3aGlsZSB0aGUg
bWFuZGF0b3J5IGNvbXBsZXRpb24gcGF0aCBnb2VzCj4gKyAqICAgdGhyb3VnaCBhIGhhcmR3YXJl
IGludGVycnVwdCBhbmQgcG9zc2libGUgam9iIGNvbXBsZXRpb24gd29ya2VyLgo+ICsgKgo+ICsg
KiAqIFRvIGFpZCBjb21wb3NhYmlsaXR5IG9mIGNvZGUsIHRoZSBhbm5vdGF0aW9ucyBjYW4gYmUg
ZnJlZWx5IG5lc3RlZCwgYXMgbG9uZwo+ICsgKiAgIGFzIHRoZSBvdmVyYWxsIGxvY2tpbmcgaGll
cmFyY2h5IGlzIGNvbnNpc3RlbnQuIFRoZSBhbm5vdGF0aW9ucyBhbHNvIHdvcmsKPiArICogICBi
b3RoIGluIGludGVycnVwdCBhbmQgcHJvY2VzcyBjb250ZXh0LiBEdWUgdG8gaW1wbGVtZW50YXRp
b24gZGV0YWlscyB0aGlzCj4gKyAqICAgcmVxdWlyZXMgdGhhdCBjYWxsZXJzIHBhc3MgYW4gb3Bh
cXVlIGNvb2tpZSBmcm9tCj4gKyAqICAgZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcoKSB0byBk
bWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoKS4KPiArICoKPiArICogKiBWYWxpZGF0aW9uIGFnYWlu
c3QgdGhlIGNyb3NzIGRyaXZlciBjb250cmFjdCBpcyBpbXBsZW1lbnRlZCBieSBwcmltaW5nCj4g
KyAqICAgbG9ja2RlcCB3aXRoIHRoZSByZWxldmFudCBoaWVyYXJjaHkgYXQgYm9vdC11cC4gVGhp
cyBtZWFucyBldmVuIGp1c3QKPiArICogICB0ZXN0aW5nIHdpdGggYSBzaW5nbGUgZGV2aWNlIGlz
IGVub3VnaCB0byB2YWxpZGF0ZSBhIGRyaXZlciwgYXQgbGVhc3QgYXMKPiArICogICBmYXIgYXMg
ZGVhZGxvY2tzIHdpdGggZG1hX2ZlbmNlX3dhaXQoKSBhZ2FpbnN0IGRtYV9mZW5jZV9zaWduYWwo
KSBhcmUKPiArICogICBjb25jZXJuZWQuCj4gKyAqLwo+ICsjaWZkZWYgQ09ORklHX0xPQ0tERVAK
PiArc3RydWN0IGxvY2tkZXBfbWFwCWRtYV9mZW5jZV9sb2NrZGVwX21hcCA9IHsKPiArCS5uYW1l
ID0gImRtYV9mZW5jZV9tYXAiCj4gK307Cj4gKwo+ICsvKioKPiArICogZG1hX2ZlbmNlX2JlZ2lu
X3NpZ25hbGxpbmcgLSBiZWdpbiBhIGNyaXRpY2FsIERNQSBmZW5jZSBzaWduYWxsaW5nIHNlY3Rp
b24KPiArICoKPiArICogRHJpdmVycyBzaG91bGQgdXNlIHRoaXMgdG8gYW5ub3RhdGUgdGhlIGJl
Z2lubmluZyBvZiBhbnkgY29kZSBzZWN0aW9uCj4gKyAqIHJlcXVpcmVkIHRvIGV2ZW50dWFsbHkg
Y29tcGxldGUgJmRtYV9mZW5jZSBieSBjYWxsaW5nIGRtYV9mZW5jZV9zaWduYWwoKS4KPiArICoK
PiArICogVGhlIGVuZCBvZiB0aGVzZSBjcml0aWNhbCBzZWN0aW9ucyBhcmUgYW5ub3RhdGVkIHdp
dGgKPiArICogZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKCkuCj4gKyAqCj4gKyAqIFJldHVybnM6
Cj4gKyAqCj4gKyAqIE9wYXF1ZSBjb29raWUgbmVlZGVkIGJ5IHRoZSBpbXBsZW1lbnRhdGlvbiwg
d2hpY2ggbmVlZHMgdG8gYmUgcGFzc2VkIHRvCj4gKyAqIGRtYV9mZW5jZV9lbmRfc2lnbmFsbGlu
ZygpLgo+ICsgKi8KPiArYm9vbCBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZyh2b2lkKQo+ICt7
Cj4gKwkvKiBleHBsaWNpdGx5IG5lc3RpbmcgLi4uICovCj4gKwlpZiAobG9ja19pc19oZWxkX3R5
cGUoJmRtYV9mZW5jZV9sb2NrZGVwX21hcCwgMSkpCj4gKwkJcmV0dXJuIHRydWU7Cj4gKwo+ICsJ
LyogcmVseSBvbiBtaWdodF9zbGVlcCBjaGVjayBmb3Igc29mdC9oYXJkaXJxIGxvY2tzICovCj4g
KwlpZiAoaW5fYXRvbWljKCkpCj4gKwkJcmV0dXJuIHRydWU7Cj4gKwo+ICsJLyogLi4uIGFuZCBu
b24tcmVjdXJzaXZlIHJlYWRsb2NrICovCj4gKwlsb2NrX2FjcXVpcmUoJmRtYV9mZW5jZV9sb2Nr
ZGVwX21hcCwgMCwgMCwgMSwgMSwgTlVMTCwgX1JFVF9JUF8pOwo+ICsKPiArCXJldHVybiBmYWxz
ZTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKTsKPiAr
Cj4gKy8qKgo+ICsgKiBkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcgLSBlbmQgYSBjcml0aWNhbCBE
TUEgZmVuY2Ugc2lnbmFsbGluZyBzZWN0aW9uCj4gKyAqCj4gKyAqIENsb3NlcyBhIGNyaXRpY2Fs
IHNlY3Rpb24gYW5ub3RhdGlvbiBvcGVuZWQgYnkgZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmco
KS4KPiArICovCj4gK3ZvaWQgZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGJvb2wgY29va2llKQo+
ICt7Cj4gKwlpZiAoY29va2llKQo+ICsJCXJldHVybjsKPiArCj4gKwlsb2NrX3JlbGVhc2UoJmRt
YV9mZW5jZV9sb2NrZGVwX21hcCwgX1JFVF9JUF8pOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZG1h
X2ZlbmNlX2VuZF9zaWduYWxsaW5nKTsKPiArCj4gK3ZvaWQgX19kbWFfZmVuY2VfbWlnaHRfd2Fp
dCh2b2lkKQo+ICt7Cj4gKwlib29sIHRtcDsKPiArCj4gKwl0bXAgPSBsb2NrX2lzX2hlbGRfdHlw
ZSgmZG1hX2ZlbmNlX2xvY2tkZXBfbWFwLCAxKTsKPiArCWlmICh0bXApCj4gKwkJbG9ja19yZWxl
YXNlKCZkbWFfZmVuY2VfbG9ja2RlcF9tYXAsIF9USElTX0lQXyk7Cj4gKwlsb2NrX21hcF9hY3F1
aXJlKCZkbWFfZmVuY2VfbG9ja2RlcF9tYXApOwo+ICsJbG9ja19tYXBfcmVsZWFzZSgmZG1hX2Zl
bmNlX2xvY2tkZXBfbWFwKTsKPiArCWlmICh0bXApCj4gKwkJbG9ja19hY3F1aXJlKCZkbWFfZmVu
Y2VfbG9ja2RlcF9tYXAsIDAsIDAsIDEsIDEsIE5VTEwsIF9USElTX0lQXyk7Cj4gK30KPiArI2Vu
ZGlmCj4gKwo+ICsKPiAgLyoqCj4gICAqIGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkIC0gc2lnbmFs
IGNvbXBsZXRpb24gb2YgYSBmZW5jZQo+ICAgKiBAZmVuY2U6IHRoZSBmZW5jZSB0byBzaWduYWwK
PiBAQCAtMTcwLDE0ICszMjQsMTkgQEAgaW50IGRtYV9mZW5jZV9zaWduYWwoc3RydWN0IGRtYV9m
ZW5jZSAqZmVuY2UpCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIAlpbnQgcmV0Owo+
ICsJYm9vbCB0bXA7Cj4gIAo+ICAJaWYgKCFmZW5jZSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAg
Cj4gKwl0bXAgPSBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZygpOwo+ICsKPiAgCXNwaW5fbG9j
a19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFncyk7Cj4gIAlyZXQgPSBkbWFfZmVuY2Vfc2lnbmFs
X2xvY2tlZChmZW5jZSk7Cj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKGZlbmNlLT5sb2NrLCBm
bGFncyk7Cj4gIAo+ICsJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKHRtcCk7Cj4gKwo+ICAJcmV0
dXJuIHJldDsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9zaWduYWwpOwo+IEBAIC0y
MTAsNiArMzY5LDggQEAgZG1hX2ZlbmNlX3dhaXRfdGltZW91dChzdHJ1Y3QgZG1hX2ZlbmNlICpm
ZW5jZSwgYm9vbCBpbnRyLCBzaWduZWQgbG9uZyB0aW1lb3V0KQo+ICAKPiAgCW1pZ2h0X3NsZWVw
KCk7Cj4gIAo+ICsJX19kbWFfZmVuY2VfbWlnaHRfd2FpdCgpOwo+ICsKPiAgCXRyYWNlX2RtYV9m
ZW5jZV93YWl0X3N0YXJ0KGZlbmNlKTsKPiAgCWlmIChmZW5jZS0+b3BzLT53YWl0KQo+ICAJCXJl
dCA9IGZlbmNlLT5vcHMtPndhaXQoZmVuY2UsIGludHIsIHRpbWVvdXQpOwo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaAo+
IGluZGV4IDMzNDdjNTRmM2E4Ny4uM2YyODhmN2RiMmVmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvZG1hLWZlbmNlLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oCj4gQEAg
LTM1Nyw2ICszNTcsMTggQEAgZG1hX2ZlbmNlX2dldF9yY3Vfc2FmZShzdHJ1Y3QgZG1hX2ZlbmNl
IF9fcmN1ICoqZmVuY2VwKQo+ICAJfSB3aGlsZSAoMSk7Cj4gIH0KPiAgCj4gKyNpZmRlZiBDT05G
SUdfTE9DS0RFUAo+ICtib29sIGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKHZvaWQpOwo+ICt2
b2lkIGRtYV9mZW5jZV9lbmRfc2lnbmFsbGluZyhib29sIGNvb2tpZSk7Cj4gKyNlbHNlCj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBkbWFfZmVuY2VfYmVnaW5fc2lnbmFsbGluZyh2b2lkKQo+ICt7Cj4g
KwlyZXR1cm4gdHJ1ZTsKPiArfQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZG1hX2ZlbmNlX2VuZF9z
aWduYWxsaW5nKGJvb2wgY29va2llKSB7fQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19kbWFfZmVu
Y2VfbWlnaHRfd2FpdCh2b2lkKSB7fQo+ICsjZW5kaWYKPiArCj4gIGludCBkbWFfZmVuY2Vfc2ln
bmFsKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKTsKPiAgaW50IGRtYV9mZW5jZV9zaWduYWxfbG9j
a2VkKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKTsKPiAgc2lnbmVkIGxvbmcgZG1hX2ZlbmNlX2Rl
ZmF1bHRfd2FpdChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwKCkFzIG9yaWdpbmFsIGF1dGhvciBv
ZiBkbWEtZmVuY2UsIEkgZW5qb3kgc2VlaW5nIG1vcmUgbG9ja2RlcCBhbm5vdGF0aW9ucy4gRmVu
Y2Ugd2FzIGFsd2F5cyBtZWFudCB0byBiZSBjcm9zcy1kcml2ZXIsIHNvIHN0cmljdCBkcml2ZXIg
YW5ub3RhdGlvbnMgdGhhdCBjYW4gYmUgdmVyaWZpZWQgYnkgbG9ja2RlcCBhcmUgYSBnb29kIHRo
aW5nLiBCZWNhdXNlIGRyaXZlcnMgaGF2ZSB0byBpbnRlcmFjdCB3aXRoIG90aGVyIGRyaXZlcnMg
dGhhdCB1c2UgZG1hLWZlbmNlLCB0aGUgcnVsZXMgbXVzdCBiZSB0aGUgc2FtZSBmb3IgZXZlcnlv
bmUsIGFuZCB0aGUgYWJvdmUgY29kZSBtYWtlcyBzZW5zZS4KClJldmlld2VkLWJ5OiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
