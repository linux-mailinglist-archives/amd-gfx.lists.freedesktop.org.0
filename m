Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940BC1F54C4
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2020 14:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98F96E570;
	Wed, 10 Jun 2020 12:27:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77396E566
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2020 12:27:26 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k4so1877027oik.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2020 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yzNpoBVUIzGM0jWy4CzYzFZyv4ZMyRLgTHGzYAF0h/4=;
 b=Udr1IYqvi6qIHAbHY4mma1jfM4+F8fyym+UpFudEP3iOPClfc79jh7mYuxD9geSyBW
 wqF0X2roOIO7E1PuOFkp9HcvutoataC22Lucpcih42JnSXmiJ0UJvcRJhs8u1RxWzaGF
 hNLrk0c4XJr4c/c699xf6oxhxTfydvg3VIfss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yzNpoBVUIzGM0jWy4CzYzFZyv4ZMyRLgTHGzYAF0h/4=;
 b=ev7la995A5clydVEhOYFY+xTEzMoH4qNNb1dQD2HUN5vIShhDkmt42dppbUemSBhhs
 lRSzx4fRIQ4TlOY3jyItlVdfCpE5FbdCymlo/OdB4S2M5mIvyrDM+GEjl+NXqh1vNLc/
 GFmtbUDDEx7l7CenBMjxF6NDjm05NSZE756hmgxbRU0SQpsx3wrIDaFWwjl6snwCdmD0
 gPC5uwlcYPqZ3Pm1fYdl0vhVR8D4QW7Cyq4CHHJIGbEJWBCthcHgHzgSIBxMITSlIeXv
 gvaA4dNnacu64LA1nd//o6G7FxLxxCrC19nJ2hOmUBdZYaz4LzVoCsG1wsBaCL0K01n4
 v5mA==
X-Gm-Message-State: AOAM530fHhroqRpuF1tD6rVE0o/Y7soTkS6rNXuh2n2MUn14q9hcPNls
 Tmzy9W36R1leaouggN53lMMfeC/OyM5F5F5LwByFSg==
X-Google-Smtp-Source: ABdhPJy7HqpB75fD6Jg4sB9zMPwjBriAsngvkdaN1meJQNljLuj1e/WyfJpcpBT3SMXWs6iH6T+oCNJGmM4lYUXZKX4=
X-Received: by 2002:aca:4b91:: with SMTP id y139mr2202871oia.128.1591791970590; 
 Wed, 10 Jun 2020 05:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-2-daniel.vetter@ffwll.ch>
 <15bcdddd-b560-e98b-eaec-62277b5ab4af@shipmail.org>
In-Reply-To: <15bcdddd-b560-e98b-eaec-62277b5ab4af@shipmail.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 10 Jun 2020 14:25:59 +0200
Message-ID: <CAKMK7uGF_ghH-3hT5QMKHuzToP50xj3OaDzAtdjO-d8H9svdjQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/18] mm: Track mmu notifiers in
 fs_reclaim_acquire/release
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMjowMSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwp
Cjx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPgo+IEhpLCBEYW5pZWwsCj4KPiBQbGVh
c2Ugc2VlIGJlbG93Lgo+Cj4gT24gNi80LzIwIDEwOjEyIEFNLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+ID4gZnNfcmVjbGFpbV9hY3F1aXJlL3JlbGVhc2UgbmljZWx5IGNhdGNoIHJlY3Vyc2lvbiBp
c3N1ZXMgd2hlbgo+ID4gYWxsb2NhdGluZyBHRlBfS0VSTkVMIG1lbW9yeSBhZ2FpbnN0IHNocmlu
a2VycyAod2hpY2ggZ3B1IGRyaXZlcnMgdGVuZAo+ID4gdG8gdXNlIHRvIGtlZXAgdGhlIGV4Y2Vz
c2l2ZSBjYWNoZXMgaW4gY2hlY2spLiBGb3IgbW11IG5vdGlmaWVyCj4gPiByZWN1cnNpb25zIHdl
IGRvIGhhdmUgbG9ja2RlcCBhbm5vdGF0aW9ucyBzaW5jZSAyM2I2ODM5NWM3YzcKPiA+ICgibW0v
bW11X25vdGlmaWVyczogYWRkIGEgbG9ja2RlcCBtYXAgZm9yIGludmFsaWRhdGVfcmFuZ2Vfc3Rh
cnQvZW5kIikuCj4gPgo+ID4gQnV0IHRoZXNlIG9ubHkgZmlyZSBpZiBhIHBhdGggYWN0dWFsbHkg
cmVzdWx0cyBpbiBzb21lIHB0ZQo+ID4gaW52YWxpZGF0aW9uIC0gZm9yIG1vc3Qgc21hbGwgYWxs
b2NhdGlvbnMgdGhhdCdzIHZlcnkgcmFyZWx5IHRoZSBjYXNlLgo+ID4gVGhlIG90aGVyIHRyb3Vi
bGUgaXMgdGhhdCBwdGUgaW52YWxpZGF0aW9uIGNhbiBoYXBwZW4gYW55IHRpbWUgd2hlbgo+ID4g
X19HRlBfUkVDTEFJTSBpcyBzZXQuIFdoaWNoIG1lYW5zIG9ubHkgcmVhbGx5IEdGUF9BVE9NSUMg
aXMgYSBzYWZlCj4gPiBjaG9pY2UsIEdGUF9OT0lPIGlzbid0IGdvb2QgZW5vdWdoIHRvIGF2b2lk
IHBvdGVudGlhbCBtbXUgbm90aWZpZXIKPiA+IHJlY3Vyc2lvbi4KPiA+Cj4gPiBJIHdhcyBwb25k
ZXJpbmcgd2hldGhlciB3ZSBzaG91bGQganVzdCBkbyB0aGUgZ2VuZXJhbCBhbm5vdGF0aW9uLCBi
dXQKPiA+IHRoZXJlJ3MgYWx3YXlzIHRoZSByaXNrIGZvciBmYWxzZSBwb3NpdGl2ZXMuIFBsdXMg
SSdtIGFzc3VtaW5nIHRoYXQKPiA+IHRoZSBjb3JlIGZzIGFuZCBpbyBjb2RlIGlzIGEgbG90IGJl
dHRlciByZXZpZXdlZCBhbmQgdGVzdGVkIHRoYW4KPiA+IHJhbmRvbSBtbXUgbm90aWZpZXIgY29k
ZSBpbiBkcml2ZXJzLiBIZW5jZSB3aHkgSSBkZWNpZGUgdG8gb25seQo+ID4gYW5ub3RhdGUgZm9y
IHRoYXQgc3BlY2lmaWMgY2FzZS4KPiA+Cj4gPiBGdXJ0aGVybW9yZSBldmVuIGlmIHdlJ2QgY3Jl
YXRlIGEgbG9ja2RlcCBtYXAgZm9yIGRpcmVjdCByZWNsYWltLCB3ZSdkCj4gPiBzdGlsbCBuZWVk
IHRvIGV4cGxpY2l0IHB1bGwgaW4gdGhlIG1tdSBub3RpZmllciBtYXAgLSB0aGVyZSdzIGEgbG90
Cj4gPiBtb3JlIHBsYWNlcyB0aGF0IGRvIHB0ZSBpbnZhbGlkYXRpb24gdGhhbiBqdXN0IGRpcmVj
dCByZWNsYWltLCB0aGVzZQo+ID4gdHdvIGNvbnRleHRzIGFyZW50IHRoZSBzYW1lLgo+ID4KPiA+
IE5vdGUgdGhhdCB0aGUgbW11IG5vdGlmaWVycyBuZWVkaW5nIHRoZWlyIG93biBpbmRlcGVuZGVu
dCBsb2NrZGVwIG1hcAo+ID4gaXMgYWxzbyB0aGUgcmVhc29uIHdlIGNhbid0IGhvbGQgdGhlbSBm
cm9tIGZzX3JlY2xhaW1fYWNxdWlyZSB0bwo+ID4gZnNfcmVjbGFpbV9yZWxlYXNlIC0gaXQgd291
bGQgbmVzdCB3aXRoIHRoZSBhY3F1aXN0aW9uIGluIHRoZSBwdGUKPiA+IGludmFsaWRhdGlvbiBj
b2RlLCBjYXVzaW5nIGEgbG9ja2RlcCBzcGxhdC4gQW5kIHdlIGNhbid0IHJlbW92ZSB0aGUKPiA+
IGFubm90YXRpb25zIGZyb20gcHRlIGludmFsaWRhdGlvbiBhbmQgYWxsIHRoZSBvdGhlciBwbGFj
ZXMgc2luY2UKPiA+IHRoZXkncmUgY2FsbGVkIGZyb20gbWFueSBvdGhlciBwbGFjZXMgdGhhbiBw
YWdlIHJlY2xhaW0uIEhlbmNlIHdlIGNhbgo+ID4gb25seSBkbyB0aGUgZXF1aXZhbGVudCBvZiBt
aWdodF9sb2NrLCBidXQgb24gdGhlIHJhdyBsb2NrZGVwIG1hcC4KPiA+Cj4gPiBXaXRoIHRoaXMg
d2UgY2FuIGFsc28gcmVtb3ZlIHRoZSBsb2NrZGVwIHByaW1pbmcgYWRkZWQgaW4gNjYyMDRmMWQy
ZDFiCj4gPiAoIm1tL21tdV9ub3RpZmllcnM6IHByaW1lIGxvY2tkZXAiKSBzaW5jZSB0aGUgbmV3
IGFubm90YXRpb25zIGFyZQo+ID4gc3RyaWN0bHkgbW9yZSBwb3dlcmZ1bC4KPiA+Cj4gPiBDYzog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4g
PiBDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiBUaGlzIGlzIHBh
cnQgb2YgYSBncHUgbG9ja2RlcCBhbm5vdGF0aW9uIHNlcmllcyBzaW1wbHkgYmVjYXVzZSBpdAo+
ID4gcmVhbGx5IGhlbHBzIHRvIGNhdGNoIGlzc3VlcyB3aGVyZSBncHUgc3Vic3lzdGVtIGxvY2tz
IGFuZCBwcmltaXRpdmVzCj4gPiBjYW4gZGVhZGxvY2sgd2l0aCB0aGVtc2VsdmVzIHRocm91Z2gg
YWxsb2NhdGlvbnMgYW5kIG1tdSBub3RpZmllcnMuCj4gPiBCdXQgYXNpZGUgZnJvbSB0aGF0IG1v
dGl2YXRpb24gaXQgc2hvdWxkIGJlIGNvbXBsZXRlbHkgZnJlZS1zdGFuZGluZywKPiA+IGFuZCBj
YW4gbGFuZCB0aHJvdWdoIC1tbS8tcmRtYS8taG1tIG9yIGFueSBvdGhlciB0cmVlIHJlYWxseSB3
aGVuZXZlci4KPiA+IC1EYW5pZWwKPiA+IC0tLQo+ID4gICBtbS9tbXVfbm90aWZpZXIuYyB8ICA3
IC0tLS0tLS0KPiA+ICAgbW0vcGFnZV9hbGxvYy5jICAgfCAyMyArKysrKysrKysrKysrKy0tLS0t
LS0tLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9ub3Rp
Zmllci5jCj4gPiBpbmRleCAwNjg1MmI4OTZmYTYuLjVkNTc4YjkxMjJmOCAxMDA2NDQKPiA+IC0t
LSBhL21tL21tdV9ub3RpZmllci5jCj4gPiArKysgYi9tbS9tbXVfbm90aWZpZXIuYwo+ID4gQEAg
LTYxMiwxMyArNjEyLDYgQEAgaW50IF9fbW11X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBtbXVf
bm90aWZpZXIgKnN1YnNjcmlwdGlvbiwKPiA+ICAgICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGRfd3Jp
dGUoJm1tLT5tbWFwX3NlbSk7Cj4gPiAgICAgICBCVUdfT04oYXRvbWljX3JlYWQoJm1tLT5tbV91
c2VycykgPD0gMCk7Cj4gPgo+ID4gLSAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0xPQ0tERVAp
KSB7Cj4gPiAtICAgICAgICAgICAgIGZzX3JlY2xhaW1fYWNxdWlyZShHRlBfS0VSTkVMKTsKPiA+
IC0gICAgICAgICAgICAgbG9ja19tYXBfYWNxdWlyZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0
ZV9yYW5nZV9zdGFydF9tYXApOwo+ID4gLSAgICAgICAgICAgICBsb2NrX21hcF9yZWxlYXNlKCZf
X21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7Cj4gPiAtICAgICAgICAg
ICAgIGZzX3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsKPiA+IC0gICAgIH0KPiA+IC0KPiA+
ICAgICAgIGlmICghbW0tPm5vdGlmaWVyX3N1YnNjcmlwdGlvbnMpIHsKPiA+ICAgICAgICAgICAg
ICAgLyoKPiA+ICAgICAgICAgICAgICAgICoga21hbGxvYyBjYW5ub3QgYmUgY2FsbGVkIHVuZGVy
IG1tX3Rha2VfYWxsX2xvY2tzKCksIGJ1dCB3ZQo+ID4gZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxs
b2MuYyBiL21tL3BhZ2VfYWxsb2MuYwo+ID4gaW5kZXggMTNjYzY1MzEyMmI3Li5mOGEyMjJkYjRh
NTMgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiA+ICsrKyBiL21tL3BhZ2VfYWxs
b2MuYwo+ID4gQEAgLTU3LDYgKzU3LDcgQEAKPiA+ICAgI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9v
b20uaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3ByZWZldGNoLmg+Cj4gPiAgICNpbmNsdWRlIDxs
aW51eC9tbV9pbmxpbmUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvbW11X25vdGlmaWVyLmg+Cj4g
PiAgICNpbmNsdWRlIDxsaW51eC9taWdyYXRlLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9odWdl
dGxiLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9zY2hlZC9ydC5oPgo+ID4gQEAgLTQxMjQsNyAr
NDEyNSw3IEBAIHNob3VsZF9jb21wYWN0X3JldHJ5KHN0cnVjdCBhbGxvY19jb250ZXh0ICphYywg
dW5zaWduZWQgaW50IG9yZGVyLCBpbnQgYWxsb2NfZmxhCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgbG9j
a2RlcF9tYXAgX19mc19yZWNsYWltX21hcCA9Cj4gPiAgICAgICBTVEFUSUNfTE9DS0RFUF9NQVBf
SU5JVCgiZnNfcmVjbGFpbSIsICZfX2ZzX3JlY2xhaW1fbWFwKTsKPiA+Cj4gPiAtc3RhdGljIGJv
b2wgX19uZWVkX2ZzX3JlY2xhaW0oZ2ZwX3QgZ2ZwX21hc2spCj4gPiArc3RhdGljIGJvb2wgX19u
ZWVkX3JlY2xhaW0oZ2ZwX3QgZ2ZwX21hc2spCj4gPiAgIHsKPiA+ICAgICAgIGdmcF9tYXNrID0g
Y3VycmVudF9nZnBfY29udGV4dChnZnBfbWFzayk7Cj4gPgo+ID4gQEAgLTQxMzYsMTAgKzQxMzcs
NiBAQCBzdGF0aWMgYm9vbCBfX25lZWRfZnNfcmVjbGFpbShnZnBfdCBnZnBfbWFzaykKPiA+ICAg
ICAgIGlmIChjdXJyZW50LT5mbGFncyAmIFBGX01FTUFMTE9DKQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gPgo+ID4gLSAgICAgLyogV2UncmUgb25seSBpbnRlcmVzdGVkIF9fR0ZQ
X0ZTIGFsbG9jYXRpb25zIGZvciBub3cgKi8KPiA+IC0gICAgIGlmICghKGdmcF9tYXNrICYgX19H
RlBfRlMpKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAtCj4gPiAgICAgICBp
ZiAoZ2ZwX21hc2sgJiBfX0dGUF9OT0xPQ0tERVApCj4gPiAgICAgICAgICAgICAgIHJldHVybiBm
YWxzZTsKPiA+Cj4gPiBAQCAtNDE1OCwxNSArNDE1NSwyMyBAQCB2b2lkIF9fZnNfcmVjbGFpbV9y
ZWxlYXNlKHZvaWQpCj4gPgo+ID4gICB2b2lkIGZzX3JlY2xhaW1fYWNxdWlyZShnZnBfdCBnZnBf
bWFzaykKPiA+ICAgewo+ID4gLSAgICAgaWYgKF9fbmVlZF9mc19yZWNsYWltKGdmcF9tYXNrKSkK
PiA+IC0gICAgICAgICAgICAgX19mc19yZWNsYWltX2FjcXVpcmUoKTsKPiA+ICsgICAgIGlmIChf
X25lZWRfcmVjbGFpbShnZnBfbWFzaykpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKCEoZ2ZwX21h
c2sgJiBfX0dGUF9GUykpCj4gSG1tLiBTaG91bGRuJ3QgdGhpcyBiZSAiaWYgKGdmcF9tYXNrICYg
X19HRlBfRlMpIiBvciBhbSBJIG1pc3VuZGVyc3RhbmRpbmc/CgpVaCB5ZXMgOi0oIEkgZ3Vlc3Mg
d2hhdCBzYXZlZCBtZSBpcyB0aGF0IEkgaW1tZWRpYXRlbHkgd2VudCBmb3IgdGhlCmxvY2tkZXAg
c3BsYXQgaW4gZHJpdmVycy9ncHUuIEFuZCBJIGd1ZXNzIHRoZXJlJ3Mgbm90IGFueSBvYnZpb3Vz
CmludmVyc2lvbnMgZm9yIEdGUF9OT0ZTL0dGUF9OT0lPLCBhbmQgc2luY2UgSSBtYWRlIHRoZSBt
aXN0YWtlCmNvbnNpbnRlbHkgdGhlIEdGUF9GUyBhbm5vdGF0aW9uIHdhcyBzdGlsbCBjb25zaXN0
ZW50LCBidXQgc2ltcGx5IGZvcgpHRlBfTk9GUy4gT29wcy4KCldpbGwgZml4IGluIHRoZSBuZXh0
IHZlcnNpb24uCgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIF9fZnNfcmVjbGFpbV9hY3F1aXJl
KCk7Cj4KPgo+ICNpZmRlZiBDT05GSUdfTU1VX05PVElGSUVSPwoKSG0gaW5kZWVkLiBXaWxsIGZp
eCB0b28uCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKPgo+ID4gKwo+ID4gKyAgICAgICAgICAg
ICBsb2NrX21hcF9hY3F1aXJlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
X21hcCk7Cj4gPiArICAgICAgICAgICAgIGxvY2tfbWFwX3JlbGVhc2UoJl9fbW11X25vdGlmaWVy
X2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiA+ICsKPiA+ICsgICAgIH0KPiA+ICAgfQo+
ID4gICBFWFBPUlRfU1lNQk9MX0dQTChmc19yZWNsYWltX2FjcXVpcmUpOwo+ID4KPiA+ICAgdm9p
ZCBmc19yZWNsYWltX3JlbGVhc2UoZ2ZwX3QgZ2ZwX21hc2spCj4gPiAgIHsKPiA+IC0gICAgIGlm
IChfX25lZWRfZnNfcmVjbGFpbShnZnBfbWFzaykpCj4gPiAtICAgICAgICAgICAgIF9fZnNfcmVj
bGFpbV9yZWxlYXNlKCk7Cj4gPiArICAgICBpZiAoX19uZWVkX3JlY2xhaW0oZ2ZwX21hc2spKSB7
Cj4gPiArICAgICAgICAgICAgIGlmICghKGdmcF9tYXNrICYgX19HRlBfRlMpKQo+IFNhbWUgaGVy
ZT8KPiA+ICsgICAgICAgICAgICAgICAgICAgICBfX2ZzX3JlY2xhaW1fcmVsZWFzZSgpOwo+ID4g
KyAgICAgfQo+ID4gICB9Cj4gPiAgIEVYUE9SVF9TWU1CT0xfR1BMKGZzX3JlY2xhaW1fcmVsZWFz
ZSk7Cj4gPiAgICNlbmRpZgo+Cj4gT25lIHN1Z2dlc3RlZCB0ZXN0IGNhc2Ugd291bGQgcGVyaGFw
cyBiZSB0byBjYWxsIG1hZHZpc2UobWFkdl9kb250bmVlZCkKPiBvbiBhIHN1YnBhcnQgb2YgYSB0
cmFuc2h1Z2UgcGFnZS4gVGhhdCB3b3VsZCBJSVJDIHRyaWdnZXIgYSBwYWdlIHNwbGl0Cj4gYW5k
IGludGVyZXN0aW5nIG1tdSBub3RpZmllciBjYWxscy4uLi4KClRoZSBuZWF0IHRoaW5nIGFib3V0
IHRoZSBtbXUgbm90aWZpZXIgbG9ja2RlcCBrZXkgaXMgdGhhdCB3ZSB0YWtlIGl0CndoZXRoZXIg
dGhlcmUncyBub3RpZmllcnMgb3Igbm90IC0gaXQncyBjYWxsZWQgb3V0c2lkZSBvZiBhbnkgb2Yg
dGhlc2UKcGF0aHMuIFNvIGFzIGxvbmcgYXMgeW91IGhhdmUgZXZlciBoaXQgYSBodWdlcGFnZSBz
cGxpdCBzb21ld2hlbiBzaW5jZQpib290LCBhbmQgeW91J3ZlIGhpdCB5b3VyIGRyaXZlcidzIG1t
dV9ub3RpZmllciBwYXRocywgbG9ja2RlcCB3aWxsCmNvbm5lY3QgdGhlIGRvdHMuIEV4cGxpY2l0
IHRlc3RjYXNlcyBmb3IgYWxsIGNvbWJpbmF0aW9ucyBub3QgbmVlZGVkCmFueW1vcmUuIFRoaXMg
cGF0Y2ggaGVyZSBqdXN0IG1ha2VzIHN1cmUgdGhhdCB0aGUgc2FtZSBob2xkcyBmb3IKbWVtb3J5
IGFsbG9jYXRpb25zIGFuZCBkaXJlY3QgcmVjbGFpbSAod2hpY2ggaXMgYSBsb3QgaGFyZGVyIHRv
CnRyaWdnZXIgaW50ZW50aW9uYWxseSBpbiB0ZXN0Y2FzZXMpLgoKVGhhdCB3YXMgYXQgbGVhc3Qg
dGhlIGlkZWEsIHNlZW1zIHRvIGhhdmUgY2F1Z2h0IGEgZmV3IHRoaW5ncyBhbHJlYWR5LgotRGFu
aWVsCgo+Cj4gVGhhbmtzLAo+IFRob21hcwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
