Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D092B166E
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 08:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2576E429;
	Fri, 13 Nov 2020 07:28:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208346E405;
 Fri, 13 Nov 2020 07:28:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p1so8565405wrf.12;
 Thu, 12 Nov 2020 23:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hVPwHWAZj6up5C0m49QwQFFtiDPClN6OW9TEFDvJOqE=;
 b=XhCXQgh0t2uqfEZaZtU2KTOiB5sGzCX6pkINJ+axvhAajcURoGCQ08OptWg5SQO6hZ
 mKx1iG4cyqkqE+GnmIQhNugvOlrQNSAk5LlJwJvczGUkJHNMfT3NLcfXZYOo0coXOLhe
 lyBZ5PIFFP0bgI9QPCyviCQ+DTySx27SH54HWU2ipInRCEf/V8uRL1YAsaaQPU4GreK0
 esaslZdEoy/nvznghOFV+eePMIEW7uCr+v6LlCt4SbVZvra3h3wuVAanSgju2L+CgNuL
 zN14O4mHHxqIXbQRNpNsTaG8//T7wQOkTae74e4t+fWOMLWwwUWhYnmoJfCXYK3s7uX0
 hqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hVPwHWAZj6up5C0m49QwQFFtiDPClN6OW9TEFDvJOqE=;
 b=Q3IDo/Ae1sYb9hak9+i0Q3rpr2H1S/PXW9c1/TM5wFrK/Qyjny2/2SzRrxTl/R2NC2
 JWr7uwoXgUKJSlKlGbhoMbq0CNgJkZHEZ4RmARtMN1KTeaq6GM/c8+npyhcY07OXfIiG
 1O3KZcPUh3gCXbXliBKaD9n7EO8vhPQYzC/+zWp2W+nxgVj9VwNzI4q51yGshKtKV3qC
 U59tyjUXY9S85e7srviZFAbpRsKuDJ7JJHoETs4D8ZGF6kjzsEmPp2c8vFnK0wGyLXfx
 x+b52h16kqs+t9S6mD7hslLhuA+sCMP/gl447Mwn/gRCWVtBPrN120bHA12Amj1ALAOz
 epXA==
X-Gm-Message-State: AOAM533FpA9dGJogQyL60HtYXPIyHm/wjrYzFesHQiWqKoO1KVmbMtoX
 Kv8ujZ1zcUlE35/03dpAhUVR9Gp5BzY8UgX0OLI=
X-Google-Smtp-Source: ABdhPJwgRv2GXLjMRaooE4zHeMJQnlQeGDQsbGhM5gdUluImaGH8IGbQ4ATMSTmlmwEE+Po8PcAAa18Z2KqjbwbKS70=
X-Received: by 2002:adf:8028:: with SMTP id 37mr1554406wrk.111.1605252515878; 
 Thu, 12 Nov 2020 23:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201113071932.GF2787115@dell>
In-Reply-To: <20201113071932.GF2787115@dell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 02:28:24 -0500
Message-ID: <CADnq5_NnKoOMQCQm0fJnER7mOGgYPvudfbbFOZkPC5Kg6Lp0XA@mail.gmail.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>, Huang Rui <ray.huang@amd.com>,
 Rob Clark <rob@ti.com>, Gareth Hughes <gareth@valinux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Rob Clark <rob.clark@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Keith Whitwell <keith@tungstengraphics.com>, Andy Gross <andy.gross@ti.com>,
 Harry Wentland <harry.wentland@amd.com>,
 linux-media <linux-media@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Leo Li <sunpeng.li@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 by <jhartmann@precisioninsight.com>, Jeff Hartmann <jhartmann@valinux.com>,
 LKML <linux-kernel@vger.kernel.org>, Faith <faith@valinux.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMjoxOSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgMDYgTm92IDIwMjAsIExlZSBKb25lcyB3cm90ZToK
Pgo+ID4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBj
bGVhbi11cCBXPTEKPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3Zlcndo
ZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiBuaWdnbHkgbGl0dGxlIHdhcm5pbmdzLgo+ID4KPiA+
IFRoZXJlIGFyZSA1MDAwIHdhcm5pbmdzIHRvIHdvcmsgdGhyb3VnaC4gIEl0IHdpbGwgdGFrZSBh
IGNvdXBsZSBtb3JlCj4gPiBzZXRzLiAgQWx0aG91Z2gsICgiZHJtL2FtZC9kaXNwbGF5L2RjL2Jh
c2ljcy9maXhwdDMxXzMyOiBNb3ZlCj4gPiB2YXJpYWJsZXMgdG8gd2hlcmUgdGhleSdyZSB1c2Vk
IikgZG9lcyB0YWtlIGNhcmUgb2YgMjAwMCBvZiB0aGVtIQo+ID4KPiA+IExlZSBKb25lcyAoMTkp
Ogo+ID4gICBkcm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQg
a2VybmVsLWRvYyBoZWFkZXIKPiA+ICAgZHJtL3IxMjgvYXRpX3BjaWdhcnQ6IFNvdXJjZSBmaWxl
IGhlYWRlcnMgYXJlIG5vdCBnb29kIGNhbmRpZGF0ZXMgZm9yCj4gPiAgICAga2VybmVsLWRvYwo+
ID4gICBkcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXI6IE1vdmUKPiA+ICAgICAn
c2lkZWJhbmRfbXNnX3JlcV9lbmNvZGVfZGVjb2RlJyBvbnRvIHRoZSBoZWFwCj4gPiAgIGRybS9t
Z2EvbWdhX2RtYTogRGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2VycyB0byBzdGFuZGFyZCBjb21tZW50
IGJsb2Nrcwo+ID4gICBkcm0vbWdhL21nYV9zdGF0ZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAn
YnVmX3ByaXYnCj4gPiAgIGRybS9yYWRlb24vYXRvbTogTW92ZSBwcm90b3R5cGUgaW50byBzaGFy
ZWQgbG9jYXRpb24KPiA+ICAgZHJtL3JhZGVvbi9yYWRlb25fa21zOiBJbmNsdWRlIGhlYWRlciBj
b250YWluaW5nIG91ciBvd24gcHJvdG90eXBlcwo+ID4gICBkcm0vb21hcGRybS9vbWFwX2dlbTog
Rml4IG1pc25hbWVkIGFuZCBtaXNzaW5nIHBhcmFtZXRlciBkZXNjcmlwdGlvbnMKPiA+ICAgZHJt
L29tYXBkcm0vb21hcF9kbW1fdGlsZXI6IERlbW90ZSBhYnVzaXZlIHVzZSBvZiBrZXJuZWwtZG9j
IGZvcm1hdAo+ID4gICBkcm0vcmFkZW9uL3JhZGVvbjogTW92ZSBwcm90b3R5cGUgaW50byBzaGFy
ZWQgaGVhZGVyCj4gPiAgIGRybS9yYWRlb24vcmFkZW9uX2RydjogU291cmNlIGZpbGUgaGVhZGVy
cyBhcmUgbm90IGdvb2QgY2FuZGlkYXRlcyBmb3IKPiA+ICAgICBrZXJuZWwtZG9jCj4gPiAgIGRy
bS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvZml4cHQzMV8zMjogTW92ZSB2YXJpYWJsZXMgdG8gd2hl
cmUgdGhleSdyZQo+ID4gICAgIHVzZWQKPiA+ICAgZHJtL3JhZGVvbi9yYWRlb25fZHJ2OiBNb3Zl
IHByb3RvdHlwZXMgdG8gYSBzaGFyZWQgaGVhZGVyZmlsZQo+ID4gICBkcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlOiBQcm92aWRlIGRvY3VtZW50YXRpb24gZm9yICdyZWdfYWRkcicKPiA+ICAg
ICBwYXJhbXMKPiA+ICAgZHJtL3JhZGVvbjogTW92ZSBwcm90b3R5cGVzIHRvIHNoYXJlZCBoZWFk
ZXIKPiA+ICAgZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttczogUmVtb3ZlICdzdHJ1Y3QgZHJtX2Ft
ZGdwdV9pbmZvX2RldmljZQo+ID4gICAgIGRldl9pbmZvJyBmcm9tIHRoZSBzdGFjawo+ID4gICBk
cm0vcmFkZW9uL3JhZGVvbl9rbXM6IEZpeCBtaXNuYW1pbmcgb2YgJ3JhZGVvbl9pbmZvX2lvY3Rs
J3MgZGV2IHBhcmFtCj4gPiAgIGRybS9yYWRlb24vYXRvbWJpb3NfY3J0YzogUmVtb3ZlIGRlc2Ny
aXB0aW9uIG9mIG5vbi1leGlzdGVudCBmdW5jdGlvbgo+ID4gICAgIHBhcmFtICdlbmNvZGVyJwo+
ID4gICBkcm0vdjNkL3YzZF9kcnY6IFJlbW92ZSB1bnVzZWQgc3RhdGljIHZhcmlhYmxlICd2M2Rf
djNkX3BtX29wcycKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jICAgIHwgICAyICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
a21zLmMgICAgICAgfCAxMDQgKysrKysrKysrLS0tLS0tLS0tCj4gPiAgLi4uL2RybS9hbWQvZGlz
cGxheS9kYy9iYXNpY3MvZml4cHQzMV8zMi5jICAgIHwgICA1ICsKPiA+ICAuLi4vZ3B1L2RybS9h
bWQvZGlzcGxheS9pbmNsdWRlL2ZpeGVkMzFfMzIuaCAgfCAgIDYgLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tZ2EvbWdhX2RtYS5jICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9tZ2EvbWdhX3N0YXRlLmMgICAgICAgICAgICAgICB8ICAgMiAtCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYyAgICAgIHwgICA2ICstCj4gPiAgZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyAgICAgICAgICAgIHwgICAzICstCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3IxMjgvYXRpX3BjaWdhcnQuYyAgICAgICAgICAgIHwgICAyICstCj4g
PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmggICAgICAgICAgICAgICAgIHwgICA2ICsK
PiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2NydGMuYyAgICAgICAgfCAgIDEg
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZW5jb2RlcnMuYyAgICB8ICAg
NCAtCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAgICAgICAgICAgICAgIHwg
ICA2ICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyAgICAgICAg
fCAgIDEgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5oICAgICAg
ICB8ICAzMiArKysrKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5
LmMgICAgICAgfCAgIDQgLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5j
ICAgICAgICAgICB8ICAxMSArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5oICAgICAgICAgICB8ICAgNyArKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2ttcy5jICAgICAgICAgICB8ICAgMyArLQo+ID4gIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJt
X2RwX21zdF9oZWxwZXIuYyAgICB8ICAxMSArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3JhbmdlX21hbmFnZXIuYyAgICAgICB8ICAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92M2Qv
djNkX2Rydi5jICAgICAgICAgICAgICAgICB8ICAzNiAtLS0tLS0KPiA+ICAyMiBmaWxlcyBjaGFu
Z2VkLCAxMzggaW5zZXJ0aW9ucygrKSwgMTI2IGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuaAo+Cj4gU3RpbGwg
bm8gUmFkZW9uIHBhdGNoZXMgaW4gdG9kYXkncyAtbmV4dC4KPgo+IEkgcmVhbGx5IHdhbnRlZCB0
byBoYXZlIGhhZCB0aGlzIHNldCByZWJhc2VkIGJ5IG5vdy4KPgo+IEhvdyBsb25nIGRvIHRoZXkg
dGFrZSB0byBwZWN1bGF0ZSB0aHJvdWdoPwoKVXN1YWxseSBhIGRheSBvciB0d28sIGJ1dCBJIHdh
cyBzd2FtcGVkIHRoZSBsYXN0IGNvdXBsZSBvZiBkYXlzLiBJCnB1c2hlZCBhbiB1cGRhdGVkIC1u
ZXh0IGJyYW5jaCB0b2RheToKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGlu
dXgvbG9nLz9oPWRybS1uZXh0CgpBbGV4Cgo+Cj4gLS0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10K
PiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBG
YWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo=
