Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB692C5293
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Nov 2020 12:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5E56E8B9;
	Thu, 26 Nov 2020 11:04:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0B96E8B3
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 11:04:25 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id h19so1570369otr.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1KKoTKWNmmVFyHIvK08B7qXDiHFlJKZI0Fsk7h8qlV0=;
 b=ZUM0w7aCJZBbfTDsWM8iaz4ZLWYcGCfoZ+9WTaSG7YtR7VOqL6YEmr4+p9/AIWvP5+
 I2tZIa0ekZriTFbYZJXtt8V0aBlzfFpvo12lnSS1AZqIShkG32KkOm/0/JtHwVMx0w4w
 qbVX0SDm69JZB7Q60esL+uxEeEnAiLc9oA7nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1KKoTKWNmmVFyHIvK08B7qXDiHFlJKZI0Fsk7h8qlV0=;
 b=IPQddwGetUCEFnTLbLRDIvzDaEknUIaN9n6FfTIlDhGCtzW55QiwrVFc7Wr/RLX4NJ
 QwcybHeiBZzKNLFx7SrPzxjubtnyxNjE1Ey4B2F19QYTHRxWRhj+6lXj4GHDDCslV8Qq
 Zl3X9LZP+PqpQiaVd4wvRMys7YQXurtSiQw/1t2RpwwsSwDiCOoTJPdzlpZfc1sg3Yjp
 zNoFVCmOXyX6DZ8ypHoxbJUgqf+vm6XX1xwjOafPcCwAiASLIvbYsvglb1xrtZH7xsnS
 zMK5qCNnwSI8k7Sth1H3S9e1JQXZSqRMXhwGuShx4Jnsh7O8zBCSqQAwm+kUDPHRAMdx
 AUfA==
X-Gm-Message-State: AOAM531NmbJHszhJN+et4nS+8AOqYebiatW7V/thwKfhwJTM0vt9rCia
 rrMtiRmJQJP7619l+PGiVjUvy5Iau68MLcS+1kqbzw==
X-Google-Smtp-Source: ABdhPJyLX6/hsM9KMh6TyPaipBNNK7AmR0lfBiABOP/LAQfZ8vRiQRs6bO0dja+J+/burV/K2vLmXSV4VeTBtwY+u/4=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr1967197otf.188.1606388664573; 
 Thu, 26 Nov 2020 03:04:24 -0800 (PST)
MIME-Version: 1.0
References: <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
 <20201124140937.GK401619@phenom.ffwll.local>
 <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
 <2f8a252a-5413-4b75-a367-f6233121e36e@amd.com>
 <20201125103645.GU401619@phenom.ffwll.local>
 <fd9dff4a-ec16-46d8-d892-b06dad5c11d3@suse.de>
 <20201125163251.GY401619@phenom.ffwll.local>
 <75385451-7969-e199-1a8e-f29fd08d5043@suse.de>
In-Reply-To: <75385451-7969-e199-1a8e-f29fd08d5043@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 26 Nov 2020 12:04:12 +0100
Message-ID: <CAKMK7uGfaHdTOEBPmeNiFWz2GVb4C+-cYO7SkJsyQCsa-sCZ5Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgMTE6MTUgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGkKPgo+IEFtIDI1LjExLjIwIHVtIDE3OjMyIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IFsuLi5dCj4gPiBJIGd1ZXNzIGZ1bGwgbG9ja2luZyBp
cyByZXF1aXJlZCA6LS8gSSdtIG5vdCBleGFjdGx5IHN1cmUgaG93IHRvIG1ha2UgdGhpcwo+ID4g
aGFwcGVuIHdpdGggdGhlIGN1cnJlbnQgcGxldGhvcmEgb2YgaGVscGVycyAuLi4gSSB0aGluayB3
ZSBuZWVkIGFuCj4gPiBfbG9ja2VkIHZlcnNpb24gb2Ygdm1hcC92dW5tYXAgY2FsbGJhY2tzIGlu
IGRybV9nZW1fb2JqZWN0X2Z1bmNzLgo+Cj4gSSB0aGluayB3ZSBtaWdodCBiZSBhYmxlIHRvIGdl
dCBhd2F5IHdpdGhvdXQgbmV3IGNhbGxiYWNrcy4KPgo+IEkgbG9va2VkIHRocm91Z2ggdGhlIHNv
dXJjZXMgdGhhdCBpbXBsZW1lbnQgYW5kIHVzZSB2bWFwLiBBbGwgdGhlCj4gaW1wbGVtZW50YXRp
b25zIGFyZSB3aXRob3V0IHRha2luZyByZXN2IGxvY2tzLiBGb3IgbG9ja2luZywgd2UgY2FuIHdy
YXAKPiB0aGVtIGluIGxvY2svdW5sb2NrIHBhaXJzLiBIYXZpbmcgc29tZXRoaW5nIGxpa2UgZHJt
X2dlbV92bWFwX3VubG9ja2VkKCkKPiB0aGF0IGxvY2tzIGFuZCB2bWFwcyBzaG91bGQgbWFrZSB0
aGlzIGVhc3kuCj4KPiBJbiB0ZXJtcyBvZiBpbXBsZW1lbnRhdGlvbiwgb25seSB2cmFtIGhlbHBl
cnMgZG8gYSBwaW4rbWFwIGluIHRoZWlyIHZtYXAKPiBjb2RlLiBBbmQgYXMgSSBtZW50aW9uZWQg
YmVmb3JlLCB0aGlzIGlzIGFjdHVhbGx5IHdyb25nLiBUaGUgcGF0dGVybgo+IGRhdGVzIGJhY2sg
dG8gd2hlbiB0aGUgY29kZSB3YXMgc3RpbGwgaW4gaW5kaXZpZHVhbCBkcml2ZXJzLiBJdCdzIHRp
bWUKPiB0byBjbGVhbiB0aGlzIHVwLiBWcmFtIGhlbHBlcnMgY2FuIHVzZSBkcm1fZ2VtX3R0bV92
bWFwKCkgaW5zdGVhZC4KPgo+IEZpbmFsbHksIHRoZXJlIGFyZW4ndCB0aGF0IG1hbnkgdXNlcnMg
b2Ygdm1hcC4gQSBmZXcgZHJpdmVycyB1c2UgaXQKPiB3aGlsZSBibGl0dGluZyBmcmFtZWJ1ZmZl
cnMgaW50byBIVyBidWZmZXJzIGFuZCBhc3QgZG9lcyBzb21lIHBlcm1hbmVudAo+IG1hcHBpbmcg
b2YgdGhlIGN1cnNvciBCTy4gQWxsIHRoaXMgaXMgdHJpdmlhbCB0byB0dXJuIGludG8gc21hbGwg
cGFpcnMKPiBvZiBsb2NrK3ZtYXAgYW5kIHZ1bm1hcCt1bmxvY2suCj4KPiBUaGF0IGxlYXZlcyBn
ZW5lcmljIGZiZGV2LiBUaGUgc2hhZG93IGJ1ZmZlciBpcyBhbHNvIHRyaXZpYWwgdG8gZml4LCBh
cwo+IG91dGxpbmVkIGR1cmluZyB0aGlzIGRpc2N1c3Npb24uCj4KPiBUaGUgY29kZSBmb3IgZmJk
ZXYgaW4gaGFyZHdhcmUgYnVmZmVycyBpcyBhIHNwZWNpYWwgY2FzZS4gSXQgdm1hcHMgdGhlCj4g
YnVmZmVyIGR1cmluZyBpbml0aWFsaXphdGlvbiBhbmQgb25seSB2dW5tYXBzIGl0IGR1cmluZyBz
aHV0ZG93bi4gQXMKPiB0aGlzIGhhcyB3b3JrZWQgc28gZmFyIHdpdGhvdXQgbG9ja2luZywgSSdk
IGxlYXZlIGl0IGFzIGl0IGlzIGFuZCBwdXQgYQo+IGJpZyBjb21tZW50IG5leHQgdG8gaXMuCj4K
PiBIYXJkd2FyZSBmYmRldiBidWZmZXJzIGlzIG9ubHkgcmVxdWlyZWQgYnkgZmV3IGRyaXZlcnM7
IG5hbWVseSB0aG9zZQo+IHRoYXQgcmVxdWlyZSB0aGUgQ09ORklHX0RSTV9GQkRFVl9MRUFLX1BI
WVNfU01FTSBjb25maWcgb3B0aW9uIHRvIHdvcmsuCj4gV2Ugc2hvdWxkIGNvbnNpZGVyIHRvIG1h
a2UgdGhlIGZiZGV2IHNoYWRvdyBidWZmZXIgdGhlIGRlZmF1bHQgYW5kIGhhdmUKPiBkcml2ZXJz
IG9wdC1pbiBmb3IgdGhlIGhhcmR3YXJlIGJ1ZmZlciwgaWYgdGhleSBuZWVkIGl0Lgo+Cj4gPgo+
ID4gQW5kIHRoZW4gZG9jdW1lbnQgdGhhdCBpZiB0aGUgY2FsbGVycyBvZiB0aGUgX2xvY2tlZCB2
ZXJzaW9uIHdhbnRzIGEKPiA+IHBlcm1hbmVudCBtYXBwaW5nLCBpdCBhbHNvIG5lZWRzIHRvIHBp
biBpdC4gUGx1cyBJIGd1ZXNzIGlkZWFsbHkgaW1wbGVtZW50Cj4gPiB0aGUgdW5sb2NrZWQvcGVy
bWFuZW50IHZlcnNpb25zIGluIHRlcm1zIG9mIHRoYXQsIHNvIHRoYXQgZHJpdmVycyBvbmx5Cj4g
PiBoYXZlIHRvIGltcGxlbWVudCBvbmUgb3IgdGhlIG90aGVyLgo+Cj4gRm9yIG15IHVuZGVyc3Rh
bmRpbmcsIHBpbm5pbmcgaXMgb25seSBkb25lIGluIHByZXBhcmVfZmIgY29kZS4gQW5kIGFzdAo+
IHBpbnMgaXRzIGN1cnNvciBCT3MgaW50byB2cmFtLiBXZSBzaG91bGQgZG9jdW1lbnQgdG8gaG9s
cyB2bWFwL3Z1bm1hcAo+IG9ubHkgZm9yIHRpbWUgYW5kIGNvdmVyIHRoZW0gd2l0aCByZXN2IGxv
Y2tzLiBQaW5uaW5nIGlzIGZvciBjYXNlcyB3aGVyZQo+IHRoZSBoYXJkd2FyZSByZXF1aXJlcyBi
dWZmZXJzIGluIGEgc3BlY2lhbCBsb2NhdGlvbiwgYnV0IGRvZXMgbm90Cj4gcHJvdGVjdCBhZ2Fp
bnN0IGNvbmN1cnJlbnQgdGhyZWF0LiBJIHRoaW5rIHRob3NlIGFyZSB0aGUgaW1wbGljaXQgcnVs
ZXMKPiBhbHJlYWR5Lgo+Cj4gSSB1cGRhdGVkIHRoZSByYWRlb24gcGF0Y2hzZXQsIHdoZXJlIGFs
bCB0aGlzIGFwcGVhcnMgdG8gYmUgd29ya2luZyB3ZWxsLgoKSG0geWVhaCBpZiB5b3Ugd2FudCB0
byBkbyB0aGUgZnVsbCBjaGFuZ2UsIHRoZW4gdGhhdCB3b3JrcyBvdXQgdG9vLgpJdCdzIGp1c3Qg
YSBwaWxlIG9mIHdvcmsuCgpCdXQgaWYgd2UgY2FuIGZpbmlzaCBvZmYgd2l0aCBhbiBkbWFfcmVz
dl9hc3NlcnRfbG9ja2VkIGluCmRtYV9idWZfdm1hcC92dW5tYXAsIHRoZW4gSSB0aGluayB0aGF0
J3Mgb2suIEl0IGRvZXMgbWVhbiB0aGF0CmV4cG9ydGVycyBtdXN0IGltcGxlbWVudCB2bWFwIGNh
Y2hpbmcsIG9yIHBlcmZvcm1hbmNlIHdpbGwgYmUKdGVycmlibGUuIFNvIHF1aXRlIHNvbWUgdXBk
YXRlIGZvciB0aGUgZG1hLWJ1ZiBkb2NzLgoKQnV0IGlmIHlvdSdyZSB3aWxsaW5nIHRvIGRvIGFs
bCB0aGF0IGNvbnZlcnNpb24gb2YgY2FsbGVycywgdGhlbiBvZgpjb3Vyc2UgSSdtIG5vdCBzdG9w
cGluZyB5b3UuIE5vdCBhdCBhbGwsIGl0J3MgZ3JlYXQgdG8gc2VlIHRoYXQga2luZApvZiBtYXpl
IHVudGFuZ2xlZC4KLURhbmllbAoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4gPgo+ID4g
VGhhdCBzaG91bGQgZ2l2ZSB1cyBhdCBsZWFzdCBzb21lIHdheSBmb3J3YXJkIHRvIGdyYWR1YWxs
eSBjb252ZXIgYWxsIHRoZQo+ID4gZHJpdmVycyBhbmQgaGVscGVycyBvdmVyIHRvIGRtYV9yZXN2
IGxvY2tpbmcuCj4gPiAtRGFuaWVsCj4gPgo+ID4+IFRoZSBwaW4gY291bnQgaXMgY3VycmVudGx5
IG1haW50YWluZWQgYnkgdGhlIHZtYXAgaW1wbGVtZW50YXRpb24gaW4gdnJhbQo+ID4+IGhlbHBl
cnMuIENhbGxpbmcgdm1hcCBpcyBhbiBpbXBsaWNpdCBwaW47IGNhbGxpbmcgdnVubWFwIGlzIGFu
IGltcGxpY2l0Cj4gPj4gdW5waW4uIFRoaXMgcHJldmVudHMgZXZpY3Rpb24gaW4gdGhlIGRhbWFn
ZSB3b3JrZXIuIEJ1dCBub3cgSSB3YXMgdG9sZCB0aGFuCj4gPj4gcGlubmluZyBpcyBvbmx5IGZv
ciBCT3MgdGhhdCBhcmUgY29udHJvbGxlZCBieSB1c2Vyc3BhY2UgYW5kIGludGVybmFsIHVzZXJz
Cj4gPj4gc2hvdWxkIGFjcXVpcmUgdGhlIHJlc3YgbG9jay4gU28gdnJhbSBoZWxwZXJzIGhhdmUg
dG8gYmUgZml4ZWQsIGFjdHVhbGx5Lgo+ID4+Cj4gPj4gSW4gdnJhbSBoZWxwZXJzLCB1bm1hcHBp
bmcgZG9lcyBub3QgbWVhbiBldmljdGlvbi4gVGhlIHVubWFwIG9wZXJhdGlvbiBvbmx5Cj4gPj4g
bWFya3MgdGhlIEJPIGFzIHVubWFwcGFibGUuIFRoZSByZWFsIHVubWFwIGhhcHBlbnMgd2hlbiB0
aGUgZXZpY3Rpb24gdGFrZXMKPiA+PiBwbGFjZS4gVGhpcyBhdm9pZHMgbWFueSBtb2RpZmljYXRp
b25zIHRvIHRoZSBwYWdlIHRhYmxlcy4gSU9XIGFuIHVucGlubmVkLAo+ID4+IHVubWFwcGVkIEJP
IHdpbGwgcmVtYWluIGluIFZSQU0gdW50aWwgdGhlIG1lbW9yeSBpcyBhY3R1YWxseSBuZWVkZWQu
Cj4gPj4KPiA+PiBCZXN0IHJlZ2FyZHMKPiA+PiBUaG9tYXMKPiA+Pgo+ID4+Pgo+ID4+PiBTbyBJ
J20gc3RpbGwgbm90IHNlZWluZyBob3cgdGhpcyBjYW4gZ28gYm9vbS4KPiA+Pj4KPiA+Pj4gTm93
IGxvbmcgdGVybSBpdCdkIGJlIG5pY2UgdG8gY3V0IGV2ZXJ5dGhpbmcgb3ZlciB0byBkbWFfcmVz
diBsb2NraW5nLCBidXQKPiA+Pj4gdGhlIGlzc3VlIHRoZXJlIGlzIHRoYXQgYmV5b25kIHR0bSwg
bm9uZSBvZiB0aGUgaGVscGVycyAoYW5kIGZldyBvZiB0aGUKPiA+Pj4gZHJpdmVycykgdXNlIGRt
YV9yZXN2LiBTbyB0aGlzIGlzIGEgZmFpcmx5IGJpZyB1cGhpbGwgYmF0dGxlLiBRdWljawo+ID4+
PiBpbnRlcmltIGZpeCBzZWVtcyBsaWtlIHRoZSByaWdodCBzb2x1dGlvbiB0byBtZS4KPiA+Pj4g
LURhbmllbAo+ID4+Pgo+ID4+Pj4KPiA+Pj4+IFJlZ2FyZHMsCj4gPj4+PiBDaHJpc3RpYW4uCj4g
Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gQmVzdCByZWdhcmRzCj4gPj4+Pj4gVGhvbWFzCj4gPj4+Pj4K
PiA+Pj4+Pj4KPiA+Pj4+Pj4+IFRoZXJlJ3Mgbm8gcmVjdXJzaW9uIHRha2luZyBwbGFjZSwgc28g
SSBndWVzcyB0aGUgcmVzZXJ2YXRpb24KPiA+Pj4+Pj4+IGxvY2sgY291bGQgYmUKPiA+Pj4+Pj4+
IGFjcXVpcmVkL3JlbGVhc2UgaW4gZHJtX2NsaWVudF9idWZmZXJfdm1hcC92dW5tYXAoKSwgb3Ig
YQo+ID4+Pj4+Pj4gc2VwYXJhdGUgcGFpciBvZgo+ID4+Pj4+Pj4gRFJNIGNsaWVudCBmdW5jdGlv
bnMgY291bGQgZG8gdGhlIGxvY2tpbmcuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEdpdmVuIGhvdyB0aGlz
ICJkbyB0aGUgcmlnaHQgbG9ja2luZyIgaXMgYSBjYW4gb2Ygd29ybXMgKGFuZCBJIHRoaW5rCj4g
Pj4+Pj4+IGl0J3MKPiA+Pj4+Pj4gd29yc2UgdGhhbiB3aGF0IHlvdSBkdWcgb3V0IGFscmVhZHkp
IEkgdGhpbmsgdGhlIGZiX2hlbHBlci5sb2NrIGhhY2sgaXMKPiA+Pj4+Pj4gcGVyZmVjdGx5IGdv
b2QgZW5vdWdoLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJJ20gYWxzbyBzb21ld2hhdCB3b3JyaWVkIHRo
YXQgc3RhcnRpbmcgdG8gdXNlIGRtYV9yZXN2IGxvY2sgaW4gZ2VuZXJpYwo+ID4+Pj4+PiBjb2Rl
LCB3aGlsZSBtYW55IGhlbHBlcnMvZHJpdmVycyBzdGlsbCBoYXZlIHRoZWlyIGhhbmQtcm9sbGVk
IGxvY2tpbmcsCj4gPj4+Pj4+IHdpbGwgbWFrZSBjb252ZXJzaW9uIG92ZXIgdG8gZG1hX3Jlc3Yg
bmVlZGxlc3NseSBtb3JlIGNvbXBsaWNhdGVkLgo+ID4+Pj4+PiAtRGFuaWVsCj4gPj4+Pj4+Cj4g
Pj4+Pj4+Pgo+ID4+Pj4+Pj4gQmVzdCByZWdhcmRzCj4gPj4+Pj4+PiBUaG9tYXMKPiA+Pj4+Pj4+
Cj4gPj4+Pj4+PiBbMV0gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLXRpcC90
cmVlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmM/aWQ9YWM2MGYzZjMwOTAxMTVkMjFm
MDI4YmZmYTJkY2ZiNjdmNjk1YzRmMiNuMzk0Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+
Pj4gUGxlYXNlIG5vdGUgdGhhdCB0aGUgcmVzZXJ2YXRpb24gbG9jayB5b3UgbmVlZCB0byB0YWtl
IGhlcmUgaXMgcGFydCBvZgo+ID4+Pj4+Pj4+IHRoZSBHRU0gb2JqZWN0Lgo+ID4+Pj4+Pj4+Cj4g
Pj4+Pj4+Pj4gVXN1YWxseSB3ZSBkZXNpZ24gdGhpbmdzIGluIHRoZSB3YXkgdGhhdCB0aGUgY29k
ZSBuZWVkcyB0byB0YWtlIGEgbG9jawo+ID4+Pj4+Pj4+IHdoaWNoIHByb3RlY3RzIGFuIG9iamVj
dCwgdGhlbiBkbyBzb21lIG9wZXJhdGlvbnMgd2l0aCB0aGUgb2JqZWN0IGFuZAo+ID4+Pj4+Pj4+
IHRoZW4gcmVsZWFzZSB0aGUgbG9jayBhZ2Fpbi4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IEhhdmlu
ZyBpbiB0aGUgbG9jayBpbnNpZGUgdGhlIG9wZXJhdGlvbiBjYW4gYmUgZG9uZSBhcyB3ZWxsLCBi
dXQKPiA+Pj4+Pj4+PiByZXR1cm5pbmcgd2l0aCBpdCBpcyBraW5kIG9mIHVudXN1YWwgZGVzaWdu
Lgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IFNvcnJ5IGZvciB0aGUgbm9vYiBxdWVzdGlvbnMuIEkn
bSBzdGlsbCB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUKPiA+Pj4+Pj4+Pj4gaW1wbGljYXRpb25z
IG9mIGFjcXVpcmluZyB0aGVzZSBsb2Nrcy4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IFdlbGwgdGhp
cyBpcyB0aGUgcmVzZXJ2YXRpb24gbG9jayBvZiB0aGUgR0VNIG9iamVjdCB3ZSBhcmUKPiA+Pj4+
Pj4+PiB0YWxraW5nIGFib3V0Cj4gPj4+Pj4+Pj4gaGVyZS4gV2UgbmVlZCB0byB0YWtlIHRoYXQg
Zm9yIGEgY291cGxlIG9mIGRpZmZlcmVudCBvcGVyYXRpb25zLAo+ID4+Pj4+Pj4+IHZtYXAvdnVu
bWFwIGRvZXNuJ3Qgc291bmQgbGlrZSBhIHNwZWNpYWwgY2FzZSB0byBtZS4KPiA+Pj4+Pj4+Pgo+
ID4+Pj4+Pj4+IFJlZ2FyZHMsCj4gPj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+ID4+Pj4+Pj4+Cj4gPj4+
Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IEJlc3QgcmVnYXJkcwo+ID4+Pj4+Pj4+PiBUaG9tYXMKPiA+Pj4+
Pj4+Pgo+ID4+Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPj4+Pj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+Pj4+Pj4+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4+Pj4+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+
IC0tCj4gPj4+Pj4+PiBUaG9tYXMgWmltbWVybWFubgo+ID4+Pj4+Pj4gR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcgo+ID4+Pj4+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
Cj4gPj4+Pj4+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiA+Pj4+
Pj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKPiA+Pj4+Pj4+IEdlc2Now6RmdHNmw7xocmVy
OiBGZWxpeCBJbWVuZMO2cmZmZXIKPiA+Pj4+Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pj4K
PiA+Pj4+Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4KPiA+Pj4KPiA+Pgo+ID4+IC0tCj4gPj4g
VGhvbWFzIFppbW1lcm1hbm4KPiA+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gPj4gU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gPj4gTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+ID4+
IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPiA+Cj4gPgo+ID4KPiA+Cj4g
Pgo+ID4KPgo+IC0tCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+
IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
