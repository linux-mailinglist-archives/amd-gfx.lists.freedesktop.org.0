Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDDA2FB640
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Jan 2021 14:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93E86E2A3;
	Tue, 19 Jan 2021 13:11:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1217D6E2B4
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 13:11:17 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id i30so6768914ota.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 05:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LYPjUDqt2SfSMpBdpbaPwL7IHVKz5KxdaD2zz+MNJ2g=;
 b=InfTe8ZMyxqLqoKXpE9cAoKqg6le643oMYCAImSqJ70EWqneavqQyA3QjZL1JA8FgN
 zMSduDXYAPZKfwkSFiIRvdKvYVXPJC/poQ2Cf+7OVOIKGlwVkN04FWU0dJtl5qnKnGLK
 Vm2BGphH7+ejNTYcqFmo43VcKfmYAtEFQDbZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LYPjUDqt2SfSMpBdpbaPwL7IHVKz5KxdaD2zz+MNJ2g=;
 b=a96uk2+s11mnCXJP/B5LNZmBgNkkfdOO1jPGmuRicQ/iPXPUcqIGkTRvf7sLfxCaUl
 94sIe9cvnGdn0cCLVnIS/0kVV54+rB+vOqFo17O0qwiox5Bm6krwmuO6Ov9zS+oCYKun
 hW0aoqp908TA3M+7QaNyOVlValiqkrLpiWTP+vGbqIg471pLIGvCnilDoOGTGrvtKwjK
 de0dAsZmd5K/AJqungJL4l7nJmn4A1RoxDqZ+ly+ZXpydWE1uH2rakVZPy4/K6J4M3iD
 fM6VL6TZw8KN6k6fcMFQZT9htTISLEQ07qSNZ6SPYDRyRIY6lOTeytYfpQX+v+zrh4Sg
 L0KA==
X-Gm-Message-State: AOAM532Pz6It5CF07R7iV84d3hD6h5d+mcGlXwzoSTKwcKeeiFWUOSel
 q6qS3e8QPKLYG/2hUnirenep4IDnac4O4qJBPEDMaw==
X-Google-Smtp-Source: ABdhPJx+OfnEIJgdpMRMCsWLrQYSPcXFnSr3sikKbMXqUy7LmXIvutIsDpf7NGRlO8RzRCDkwFG0lKyLT0pj3UvNoUM=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr3331130otb.303.1611061876352; 
 Tue, 19 Jan 2021 05:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
 <20210104210800.789944-2-aurabindo.pillai@amd.com>
 <20210114111445.1d2bbf62@eldfell>
 <b38e46b7707ba9a899384baedc7efe4e70c439bf.camel@amd.com>
 <20210119103510.01f55ee4@eldfell>
In-Reply-To: <20210119103510.01f55ee4@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 14:11:05 +0100
Message-ID: <CAKMK7uGKqA7mMorSBtV255pPxA=adPEP0Bcwot8OMmBVCKV_uQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for freesync
 video mode
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, thong.thai@amd.com,
 shashank.sharma@amd.com, dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gMTksIDIwMjEgYXQgOTozNSBBTSBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDE4IEphbiAyMDIxIDA5OjM2OjQ3IC0wNTAw
Cj4gQXVyYWJpbmRvIFBpbGxhaSA8YXVyYWJpbmRvLnBpbGxhaUBhbWQuY29tPiB3cm90ZToKPgo+
ID4gT24gVGh1LCAyMDIxLTAxLTE0IGF0IDExOjE0ICswMjAwLCBQZWtrYSBQYWFsYW5lbiB3cm90
ZToKPiA+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+IHBsZWFzZSBkb2N1bWVudCBzb21ld2hlcmUg
dGhhdCBlbmRzIHVwIGluIGdpdCBoaXN0b3J5IChjb21taXQKPiA+ID4gbWVzc2FnZSwKPiA+ID4g
Y29kZSBjb21tZW50cywgZGVzY3JpcHRpb24gb2YgdGhlIHBhcmFtZXRlciB3b3VsZCBiZSB0aGUg
YmVzdCBidXQKPiA+ID4gbWF5YmUKPiA+ID4gdGhlcmUgaXNuJ3QgZW5vdWdoIHNwYWNlPykgd2hh
dCBDaHJpc3RpYW4gS8O2bmlnIGV4cGxhaW5lZCBpbgo+ID4gPgo+ID4gPgo+ID4gPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMC1EZWNlbWJlci8y
OTEyNTQuaHRtbAo+ID4gPgo+ID4gPiB0aGF0IHRoaXMgaXMgYSBzdG9wLWdhcCBmZWF0dXJlIGlu
dGVuZGVkIHRvIGJlIHJlbW92ZWQgYXMgc29vbiBhcwo+ID4gPiBwb3NzaWJsZSAod2hlbiBhIGJl
dHRlciBzb2x1dGlvbiBjb21lcyB1cCwgd2hpY2ggY291bGQgYmUgeWVhcnMpLgo+ID4gPgo+ID4g
PiBTbyBmYXIgSSBoYXZlIG5vdCBzZWVuIGEgc2luZ2xlIG1lbnRpb24gb2YgdGhpcyBpbnRlbnRp
b24gaW4geW91cgo+ID4gPiBwYXRjaAo+ID4gPiBzdWJtaXNzaW9ucywgYW5kIEkgdGhpbmsgaXQg
aXMgdmVyeSBpbXBvcnRhbnQgdG8gbWFrZSBrbm93bi4KPiA+Cj4gPiBIaSwKPiA+Cj4gPiBUaGFu
a3MgZm9yIHRoZSBoZWFkc3VwLCBJIHNoYWxsIGFkZCB0aGUgcmVsZXZhbnQgaW5mbyBpbiB0aGUg
bmV4dAo+ID4gdmVyaXNvbi4KPiA+Cj4gPiA+Cj4gPiA+IEkgYWxzbyBkaWQgbm90IHNlZSBhbiBl
eHBsYW5hdGlvbiBvZiB3aHkgdGhpcyBpbnN0ZWFkIG9mCj4gPiA+IG1hbnVmYWN0dXJpbmcKPiA+
ID4gdGhlc2UgdmlkZW8gbW9kZXMgaW4gdXNlcnNwYWNlIChhbiBpZGVhIG1lbnRpb25lZCBieSBD
aHJpc3RpYW4gaW4gdGhlCj4gPiA+IHJlZmVyZW5jZWQgZW1haWwpLiBJIHRoaW5rIHRoYXQgdG9v
IHNob3VsZCBiZSBwYXJ0IG9mIGEgY29tbWl0Cj4gPiA+IG1lc3NhZ2UuCj4gPgo+ID4gVGhpcyBp
cyBhbiBvcHQtaW4gZmVhdHVyZSwgd2hpY2ggc2hhbGwgYmUgc3VwZXJzZWRlZCBieSBhIGJldHRl
cgo+ID4gc29sdXRpb24uIFdlIGFsc28gYWRkIGEgc2V0IG9mIGNvbW1vbiBtb2RlcyBmb3Igc2Nh
bGluZyBzaW1pbGFybHkuCj4gPiBVc2Vyc3BhY2UgY2FuIHN0aWxsIGFkZCB3aGF0ZXZlciBtb2Rl
IHRoZXkgd2FudC4gU28gSSBkb250IHNlZSBhIHJlYXNvbgo+ID4gd2h5IHRoaXMgY2FudCBiZSBp
biB0aGUga2VybmVsLgo+Cj4gSGksCj4KPiBzb3JyeSwgSSB0aGluayB0aGF0IGtpbmQgb2YgdGhp
bmtpbmcgaXMgYmFja3dhcmRzLiBUaGVyZSBuZWVkcyB0byBiZSBhCj4gcmVhc29uIHRvIHB1dCBz
b21ldGhpbmcgaW4gdGhlIGtlcm5lbCwgYW5kIGlmIHRoZXJlIGlzIG5vIHJlYXNvbiwgdGhlbgo+
IGl0IHJlbWFpbnMgaW4gdXNlcnNwYWNlLiBTbyB3aGF0J3MgdGhlIHJlYXNvbiB0byBwdXQgdGhp
cyBpbiB0aGUga2VybmVsPwo+Cj4gT25lIGV4YW1wbGUgcmVhc29uIHdoeSB0aGlzIHNob3VsZCBu
b3QgYmUgaW4gdGhlIGtlcm5lbCBpcyB0aGF0IHRoZSBzZXQKPiBvZiB2aWRlbyBtb2RlcyB0byBt
YW51ZmFjdHVyZSBpcyBhIGtpbmQgb2YgcG9saWN5LCB3aGljaCBtb2RlcyB0byBhZGQKPiBhbmQg
d2hpY2ggbm90LiBVc2Vyc3BhY2Uga25vd3Mgd2hhdCBtb2RlcyBpdCBuZWVkcywgYW5kIGVzdGFi
bGlzaGluZwo+IHRoZSBtb2RlcyBpbiB0aGUga2VybmVsIGluc3RlYWQgaXMgc2Vjb25kLWd1ZXNz
aW5nIHdoYXQgdGhlIHVzZXJzcGFjZQo+IHdvdWxkIHdhbnQuIFNvIGlmIHVzZXJzcGFjZSBuZWVk
cyB0byBtYW51ZmFjdHVyZSBtb2RlcyBpbiB1c2Vyc3BhY2UKPiBhbnl3YXkgYXMgc29tZSBtb2Rl
cyBtaWdodCBiZSBtaXNzZWQgYnkgdGhlIGtlcm5lbCwgdGhlbiB3aHkgYm90aGVyIGluCj4gdGhl
IGtlcm5lbCB0byBiZWdpbiB3aXRoPyBXaHkgc2hvdWxkIHRoZSBrZXJuZWwgcGxheSBjYXRjaC11
cCB3aXRoIHdoYXQKPiBtb2RlcyB1c2Vyc3BhY2Ugd2FudHMgd2hlbiB3ZSBhbHJlYWR5IGhhdmUg
ZXZlcnl0aGluZyB1c2Vyc3BhY2UgbmVlZHMKPiB0byBtYWtlIGl0cyBvd24gbW9kZXMsIGV2ZW4g
dG8gYWRkIHRoZW0gdG8gdGhlIGtlcm5lbCBtb2RlIGxpc3Q/Cj4KPiBEb2VzIG1hbnVmYWN0dXJp
bmcgdGhlc2UgZXh0cmEgdmlkZW8gbW9kZXMgdG8gYWNoaWV2ZSBmYXN0IHRpbWluZwo+IGNoYW5n
ZXMgcmVxdWlyZSBBTUQgaGFyZHdhcmUtc3BlY2lmaWMga25vd2xlZGdlLCBhcyBvcHBvc2VkIHRv
IHRoZQo+IGdlbmVyYWwgVlJSIGFwcHJvYWNoIG9mIHNpbXBseSBhZGp1c3RpbmcgdGhlIGZyb250
IHBvcmNoPwo+Cj4gU29tZXRoaW5nIGxpa2UgdGhpcyBzaG91bGQgYWxzbyBiZSBkb2N1bWVudGVk
IGluIGEgY29tbWl0IG1lc3NhZ2UuIE9yCj4gaWYgeW91IGluc2lzdCB0aGF0ICJubyByZWFzb24g
dG8gbm90IHB1dCB0aGlzIGluIHRoZSBrZXJuZWwiIGlzIHJlYXNvbgo+IGVub3VnaCwgdGhlbiB3
cml0ZSB0aGF0IGRvd24sIGJlY2F1c2UgaXQgZG9lcyBub3Qgc2VlbSBvYnZpb3VzIHRvIG1lIG9y
Cj4gb3RoZXJzIHRoYXQgdGhpcyBmZWF0dXJlIG5lZWRzIHRvIGJlIGluIHRoZSBrZXJuZWwuCgpP
bmUgcmVhc29uIG1pZ2h0IGJlIGRlYnVnZ2luZywgaWYgYSBmZWF0dXJlIGlzIGtub3duIHRvIGNh
dXNlIGlzc3Vlcy4KQnV0IGltbyBpbiB0aGF0IGNhc2UgdGhlIGtub2Igc2hvdWxkIGJlIHVzaW5n
IHRoZSBfdW5zYWZlIHZhcmlhbnRzIHNvCml0IHRhaW50cyB0aGUga2VybmVsLCBzaW5jZSBvdGhl
cndpc2Ugd2UgZ2V0IHN0dWNrIGluIHRoaXMgdmVyeSBjb3p5CnBsYWNlIHdoZXJlIGtlcm5lbCBt
YWludGFpbmVycyBkb24ndCBoYXZlIHRvIGNhcmUgbXVjaCBmb3IgYnVncwoiYmVjYXVzZSBpdCdz
IG9mZiBieSBkZWZhdWx0IiwgYnV0IGFsc28gbm90IHJlYWxseSBjYXJlIGFib3V0CnBvbGlzaGlu
ZyB0aGUgZmVhdHVyZSAic2luY2UgdXNlcnMgY2FuIGp1c3QgZW5hYmxlIGl0IGlmIHRoZXkgd2Fu
dAppdCIuIEp1c3QgYSBzbGlnaHRseSBkaWZmZXJlbnQgZmxhdm91ciBvZiB3aGF0IHlvdSdyZSBl
eHBsYWluaW5nIGFib3ZlCmFscmVhZHkuCi1EYW5pZWwKCj4gVGhhbmtzLAo+IHBxCgoKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
