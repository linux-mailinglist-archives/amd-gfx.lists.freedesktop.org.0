Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592650DCC
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 16:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4872B897C5;
	Mon, 24 Jun 2019 14:23:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D33897C5
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:22:46 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id ay6so6948067plb.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 07:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAszyd6Rkh0AyBVnY2MGQeafDGFV/B/Xjwc7nOHGBTU=;
 b=cIUakKwfo2q0N/sFLkUfMlw3dCmJkK2zbFu/QeuRT1bu1xE5g7u2tAXuFMlsdhGipQ
 Bo5Ojpq6kZGIny8PEETZl3UKhlKbYiJsWbV8AXVkao20vPK600K6joH7QgME/z1oWgsr
 CIVxDKznRgo2NcugMFaFpKIyBp1OrdU3kW1WrSGr0vZDKRTAuMDUpo4W7eFHhtos88wY
 RlaKkNJ7ep3SmViurwMkQiCJxJSyV9ksgqz3C2W9lHn9tZTb+geipOfdOsT+c3zjOMwt
 bmjfuxP5vGT+WP8+i34pYVVlGerNApvRAGw2VemYPqxptRRTERYgiD9GcxC8xS1dCICS
 oA2g==
X-Gm-Message-State: APjAAAUMz8HfvbVxMHZLVNxzfv7nXNhvozTw1mRM4ZVTb8CXFpePGqML
 wZ8H3W6ajBsZCLkkduYtaK/gEaQPbqMnANikazAyDA==
X-Google-Smtp-Source: APXvYqx/7NbeFZuwI48tclTUh11xegUV5UsdKc2ldTOnN03zOVYnpDOwlkZEMuzBYRoM7kFvSzXnjLxRZwjrOwVDnPw=
X-Received: by 2002:a17:902:4183:: with SMTP id
 f3mr32179784pld.336.1561386165165; 
 Mon, 24 Jun 2019 07:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
 <f9b50767d639b7116aa986dc67f158131b8d4169.1560339705.git.andreyknvl@google.com>
 <a5e0e465-89d5-91d0-c6a4-39674269bbf2@oracle.com>
 <c4bdd767-eb3f-6668-0f49-4aaf4bc7689d@oracle.com>
In-Reply-To: <c4bdd767-eb3f-6668-0f49-4aaf4bc7689d@oracle.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 24 Jun 2019 16:22:34 +0200
Message-ID: <CAAeHK+zceAZ0Mqhz3t6Ob71-Dgk4DNHRrzr72r+qEsUugwzTsg@mail.gmail.com>
Subject: Re: [PATCH v17 04/15] mm,
 arm64: untag user pointers passed to memory syscalls
To: Khalid Aziz <khalid.aziz@oracle.com>
X-Mailman-Approved-At: Mon, 24 Jun 2019 14:23:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gAszyd6Rkh0AyBVnY2MGQeafDGFV/B/Xjwc7nOHGBTU=;
 b=km7JeQ3vyTD2UtwSHCAAp4q4at1sY/ltJPO5wzrrkqMzNLeQZPjXSnOQ7VtkWA81dl
 HEFVLO9l5VlkdkocDhA+ezC7dKtBn4IeaF4UZLWnOmGq0Ok4r2E9GR7Hoa79HLNOGJVe
 0AHZ3EJWZEjcDwF6xOVW5nBJXR6vOtRMH7oBaouWSEKGFrWAIrbWb9kQA+Hlo7SIhUEB
 uGLPh5fQQfh1ibByxQrZM4UE+cDk+UJmRIBMFqrJwcIDdYtIIT+tU41CsIi86+tplFna
 0qMXAZhS5viMtSm5pwtZ6YrDben3dB8l27s4Hd+Xtz7mclZlxhwdWOJHEC5Ft/EzKQyl
 VZSQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgNjo0NiBQTSBLaGFsaWQgQXppeiA8a2hhbGlkLmF6aXpA
b3JhY2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiA2LzE5LzE5IDk6NTUgQU0sIEtoYWxpZCBBeml6IHdy
b3RlOgo+ID4gT24gNi8xMi8xOSA1OjQzIEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4+
IFRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJu
ZWwgQUJJIHRvIGFsbG93IHRvCj4gPj4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0
aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4gPj4gdGhhbiAweDAwKSBh
cyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+Pgo+ID4+IFRoaXMgcGF0Y2ggYWxsb3dzIHRhZ2dlZCBw
b2ludGVycyB0byBiZSBwYXNzZWQgdG8gdGhlIGZvbGxvd2luZyBtZW1vcnkKPiA+PiBzeXNjYWxs
czogZ2V0X21lbXBvbGljeSwgbWFkdmlzZSwgbWJpbmQsIG1pbmNvcmUsIG1sb2NrLCBtbG9jazIs
IG1wcm90ZWN0LAo+ID4+IG1yZW1hcCwgbXN5bmMsIG11bmxvY2ssIG1vdmVfcGFnZXMuCj4gPj4K
PiA+PiBUaGUgbW1hcCBhbmQgbXJlbWFwIHN5c2NhbGxzIGRvIG5vdCBjdXJyZW50bHkgYWNjZXB0
IHRhZ2dlZCBhZGRyZXNzZXMuCj4gPj4gQXJjaGl0ZWN0dXJlcyBtYXkgaW50ZXJwcmV0IHRoZSB0
YWcgYXMgYSBiYWNrZ3JvdW5kIGNvbG91ciBmb3IgdGhlCj4gPj4gY29ycmVzcG9uZGluZyB2bWEu
Cj4gPj4KPiA+PiBSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNA
YXJtLmNvbT4KPiA+PiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5v
cmc+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29n
bGUuY29tPgo+ID4+IC0tLQo+ID4KPiA+IFJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlk
LmF6aXpAb3JhY2xlLmNvbT4KPiA+Cj4gPgo+Cj4gSSB3b3VsZCBhbHNvIHJlY29tbWVuZCB1cGRh
dGluZyBjb21taXQgbG9nIGZvciBhbGwgdGhlIHBhdGNoZXMgaW4gdGhpcwo+IHNlcmllcyB0aGF0
IGFyZSBjaGFuZ2luZyBmaWxlcyB1bmRlciBtbS8gYXMgb3Bwb3NlZCB0byBhcmNoL2FybTY0IHRv
IG5vdAo+IHJlZmVyZW5jZSBhcm02NCBrZXJuZWwgQUJJIHNpbmNlIHRoZSBjaGFuZ2UgYXBwbGll
cyB0byBldmVyeQo+IGFyY2hpdGVjdHVyZS4gU28gc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBv
ZiAiVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIGEKPiBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBB
QkkgdG8gYWxsb3cuLi4uLi4uIgoKU3VyZSwgd2lsbCBkbyBpbiB2MTgsIHRoYW5rcyEKCj4KPiAt
LQo+IEtoYWxpZAo+Cj4KPiA+PiAgbW0vbWFkdmlzZS5jICAgfCAyICsrCj4gPj4gIG1tL21lbXBv
bGljeS5jIHwgMyArKysKPiA+PiAgbW0vbWlncmF0ZS5jICAgfCAyICstCj4gPj4gIG1tL21pbmNv
cmUuYyAgIHwgMiArKwo+ID4+ICBtbS9tbG9jay5jICAgICB8IDQgKysrKwo+ID4+ICBtbS9tcHJv
dGVjdC5jICB8IDIgKysKPiA+PiAgbW0vbXJlbWFwLmMgICAgfCA3ICsrKysrKysKPiA+PiAgbW0v
bXN5bmMuYyAgICAgfCAyICsrCj4gPj4gIDggZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL21tL21hZHZpc2UuYyBiL21t
L21hZHZpc2UuYwo+ID4+IGluZGV4IDYyODAyMmU2NzRhNy4uMzliODJmOGE2OThmIDEwMDY0NAo+
ID4+IC0tLSBhL21tL21hZHZpc2UuYwo+ID4+ICsrKyBiL21tL21hZHZpc2UuYwo+ID4+IEBAIC04
MTAsNiArODEwLDggQEAgU1lTQ0FMTF9ERUZJTkUzKG1hZHZpc2UsIHVuc2lnbmVkIGxvbmcsIHN0
YXJ0LCBzaXplX3QsIGxlbl9pbiwgaW50LCBiZWhhdmlvcikKPiA+PiAgICAgIHNpemVfdCBsZW47
Cj4gPj4gICAgICBzdHJ1Y3QgYmxrX3BsdWcgcGx1ZzsKPiA+Pgo+ID4+ICsgICAgc3RhcnQgPSB1
bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiA+PiArCj4gPj4gICAgICBpZiAoIW1hZHZpc2VfYmVoYXZp
b3JfdmFsaWQoYmVoYXZpb3IpKQo+ID4+ICAgICAgICAgICAgICByZXR1cm4gZXJyb3I7Cj4gPj4K
PiA+PiBkaWZmIC0tZ2l0IGEvbW0vbWVtcG9saWN5LmMgYi9tbS9tZW1wb2xpY3kuYwo+ID4+IGlu
ZGV4IDAxNjAwZDgwYWUwMS4uNzhlMGE4OGIyNjgwIDEwMDY0NAo+ID4+IC0tLSBhL21tL21lbXBv
bGljeS5jCj4gPj4gKysrIGIvbW0vbWVtcG9saWN5LmMKPiA+PiBAQCAtMTM2MCw2ICsxMzYwLDcg
QEAgc3RhdGljIGxvbmcga2VybmVsX21iaW5kKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVk
IGxvbmcgbGVuLAo+ID4+ICAgICAgaW50IGVycjsKPiA+PiAgICAgIHVuc2lnbmVkIHNob3J0IG1v
ZGVfZmxhZ3M7Cj4gPj4KPiA+PiArICAgIHN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4g
Pj4gICAgICBtb2RlX2ZsYWdzID0gbW9kZSAmIE1QT0xfTU9ERV9GTEFHUzsKPiA+PiAgICAgIG1v
ZGUgJj0gfk1QT0xfTU9ERV9GTEFHUzsKPiA+PiAgICAgIGlmIChtb2RlID49IE1QT0xfTUFYKQo+
ID4+IEBAIC0xNTE3LDYgKzE1MTgsOCBAQCBzdGF0aWMgaW50IGtlcm5lbF9nZXRfbWVtcG9saWN5
KGludCBfX3VzZXIgKnBvbGljeSwKPiA+PiAgICAgIGludCB1bmluaXRpYWxpemVkX3ZhcihwdmFs
KTsKPiA+PiAgICAgIG5vZGVtYXNrX3Qgbm9kZXM7Cj4gPj4KPiA+PiArICAgIGFkZHIgPSB1bnRh
Z2dlZF9hZGRyKGFkZHIpOwo+ID4+ICsKPiA+PiAgICAgIGlmIChubWFzayAhPSBOVUxMICYmIG1h
eG5vZGUgPCBucl9ub2RlX2lkcykKPiA+PiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvbW0vbWlncmF0ZS5jIGIvbW0vbWlncmF0ZS5jCj4gPj4gaW5k
ZXggZjJlY2MyODU1YTEyLi5kMjJjNDVjZjM2YjIgMTAwNjQ0Cj4gPj4gLS0tIGEvbW0vbWlncmF0
ZS5jCj4gPj4gKysrIGIvbW0vbWlncmF0ZS5jCj4gPj4gQEAgLTE2MTYsNyArMTYxNiw3IEBAIHN0
YXRpYyBpbnQgZG9fcGFnZXNfbW92ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgbm9kZW1hc2tfdCB0
YXNrX25vZGVzLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZsdXNoOwo+ID4+
ICAgICAgICAgICAgICBpZiAoZ2V0X3VzZXIobm9kZSwgbm9kZXMgKyBpKSkKPiA+PiAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dF9mbHVzaDsKPiA+PiAtICAgICAgICAgICAgYWRkciA9ICh1
bnNpZ25lZCBsb25nKXA7Cj4gPj4gKyAgICAgICAgICAgIGFkZHIgPSAodW5zaWduZWQgbG9uZyl1
bnRhZ2dlZF9hZGRyKHApOwo+ID4+Cj4gPj4gICAgICAgICAgICAgIGVyciA9IC1FTk9ERVY7Cj4g
Pj4gICAgICAgICAgICAgIGlmIChub2RlIDwgMCB8fCBub2RlID49IE1BWF9OVU1OT0RFUykKPiA+
PiBkaWZmIC0tZ2l0IGEvbW0vbWluY29yZS5jIGIvbW0vbWluY29yZS5jCj4gPj4gaW5kZXggYzNm
MDU4YmQwZmFmLi42NGMzMjJlZDg0NWMgMTAwNjQ0Cj4gPj4gLS0tIGEvbW0vbWluY29yZS5jCj4g
Pj4gKysrIGIvbW0vbWluY29yZS5jCj4gPj4gQEAgLTI0OSw2ICsyNDksOCBAQCBTWVNDQUxMX0RF
RklORTMobWluY29yZSwgdW5zaWduZWQgbG9uZywgc3RhcnQsIHNpemVfdCwgbGVuLAo+ID4+ICAg
ICAgdW5zaWduZWQgbG9uZyBwYWdlczsKPiA+PiAgICAgIHVuc2lnbmVkIGNoYXIgKnRtcDsKPiA+
Pgo+ID4+ICsgICAgc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiA+PiArCj4gPj4gICAg
ICAvKiBDaGVjayB0aGUgc3RhcnQgYWRkcmVzczogbmVlZHMgdG8gYmUgcGFnZS1hbGlnbmVkLi4g
Ki8KPiA+PiAgICAgIGlmIChzdGFydCAmIH5QQUdFX01BU0spCj4gPj4gICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMO2ZpeHVwX3VzZXJfZmF1bHQKPiA+PiBkaWZmIC0tZ2l0IGEvbW0vbWxvY2su
YyBiL21tL21sb2NrLmMKPiA+PiBpbmRleCAwODBmM2IzNjQxNWIuLmU4MjYwOWVhYTQyOCAxMDA2
NDQKPiA+PiAtLS0gYS9tbS9tbG9jay5jCj4gPj4gKysrIGIvbW0vbWxvY2suYwo+ID4+IEBAIC02
NzQsNiArNjc0LDggQEAgc3RhdGljIF9fbXVzdF9jaGVjayBpbnQgZG9fbWxvY2sodW5zaWduZWQg
bG9uZyBzdGFydCwgc2l6ZV90IGxlbiwgdm1fZmxhZ3NfdCBmbGEKPiA+PiAgICAgIHVuc2lnbmVk
IGxvbmcgbG9ja19saW1pdDsKPiA+PiAgICAgIGludCBlcnJvciA9IC1FTk9NRU07Cj4gPj4KPiA+
PiArICAgIHN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gPj4gKwo+ID4+ICAgICAgaWYg
KCFjYW5fZG9fbWxvY2soKSkKPiA+PiAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPiA+Pgo+
ID4+IEBAIC03MzUsNiArNzM3LDggQEAgU1lTQ0FMTF9ERUZJTkUyKG11bmxvY2ssIHVuc2lnbmVk
IGxvbmcsIHN0YXJ0LCBzaXplX3QsIGxlbikKPiA+PiAgewo+ID4+ICAgICAgaW50IHJldDsKPiA+
Pgo+ID4+ICsgICAgc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiA+PiArCj4gPj4gICAg
ICBsZW4gPSBQQUdFX0FMSUdOKGxlbiArIChvZmZzZXRfaW5fcGFnZShzdGFydCkpKTsKPiA+PiAg
ICAgIHN0YXJ0ICY9IFBBR0VfTUFTSzsKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9tbS9tcHJvdGVj
dC5jIGIvbW0vbXByb3RlY3QuYwo+ID4+IGluZGV4IGJmMzhkZmJiYjRiNC4uMTlmOTgxYjczM2Jj
IDEwMDY0NAo+ID4+IC0tLSBhL21tL21wcm90ZWN0LmMKPiA+PiArKysgYi9tbS9tcHJvdGVjdC5j
Cj4gPj4gQEAgLTQ2NSw2ICs0NjUsOCBAQCBzdGF0aWMgaW50IGRvX21wcm90ZWN0X3BrZXkodW5z
aWduZWQgbG9uZyBzdGFydCwgc2l6ZV90IGxlbiwKPiA+PiAgICAgIGNvbnN0IGJvb2wgcmllciA9
IChjdXJyZW50LT5wZXJzb25hbGl0eSAmIFJFQURfSU1QTElFU19FWEVDKSAmJgo+ID4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKHByb3QgJiBQUk9UX1JFQUQpOwo+ID4+Cj4gPj4gKyAg
ICBzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+ID4+ICsKPiA+PiAgICAgIHByb3QgJj0g
fihQUk9UX0dST1dTRE9XTnxQUk9UX0dST1dTVVApOwo+ID4+ICAgICAgaWYgKGdyb3dzID09IChQ
Uk9UX0dST1dTRE9XTnxQUk9UX0dST1dTVVApKSAvKiBjYW4ndCBiZSBib3RoICovCj4gPj4gICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4+IGRpZmYgLS1naXQgYS9tbS9tcmVtYXAuYyBi
L21tL21yZW1hcC5jCj4gPj4gaW5kZXggZmMyNDFkMjNjZDk3Li42NGM5YTNiOGJlMGEgMTAwNjQ0
Cj4gPj4gLS0tIGEvbW0vbXJlbWFwLmMKPiA+PiArKysgYi9tbS9tcmVtYXAuYwo+ID4+IEBAIC02
MDYsNiArNjA2LDEzIEBAIFNZU0NBTExfREVGSU5FNShtcmVtYXAsIHVuc2lnbmVkIGxvbmcsIGFk
ZHIsIHVuc2lnbmVkIGxvbmcsIG9sZF9sZW4sCj4gPj4gICAgICBMSVNUX0hFQUQodWZfdW5tYXBf
ZWFybHkpOwo+ID4+ICAgICAgTElTVF9IRUFEKHVmX3VubWFwKTsKPiA+Pgo+ID4+ICsgICAgLyoK
PiA+PiArICAgICAqIEFyY2hpdGVjdHVyZXMgbWF5IGludGVycHJldCB0aGUgdGFnIHBhc3NlZCB0
byBtbWFwIGFzIGEgYmFja2dyb3VuZAo+ID4+ICsgICAgICogY29sb3VyIGZvciB0aGUgY29ycmVz
cG9uZGluZyB2bWEuIEZvciBtcmVtYXAgd2UgZG9uJ3QgYWxsb3cgdGFnZ2VkCj4gPj4gKyAgICAg
KiBuZXdfYWRkciB0byBwcmVzZXJ2ZSBzaW1pbGFyIGJlaGF2aW91ciB0byBtbWFwLgo+ID4+ICsg
ICAgICovCj4gPj4gKyAgICBhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKPiA+PiArCj4gPj4g
ICAgICBpZiAoZmxhZ3MgJiB+KE1SRU1BUF9GSVhFRCB8IE1SRU1BUF9NQVlNT1ZFKSkKPiA+PiAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9tbS9tc3luYy5j
IGIvbW0vbXN5bmMuYwo+ID4+IGluZGV4IGVmMzBhNDI5NjIzYS4uYzNiZDNlNzVmNjg3IDEwMDY0
NAo+ID4+IC0tLSBhL21tL21zeW5jLmMKPiA+PiArKysgYi9tbS9tc3luYy5jCj4gPj4gQEAgLTM3
LDYgKzM3LDggQEAgU1lTQ0FMTF9ERUZJTkUzKG1zeW5jLCB1bnNpZ25lZCBsb25nLCBzdGFydCwg
c2l6ZV90LCBsZW4sIGludCwgZmxhZ3MpCj4gPj4gICAgICBpbnQgdW5tYXBwZWRfZXJyb3IgPSAw
Owo+ID4+ICAgICAgaW50IGVycm9yID0gLUVJTlZBTDsKPiA+Pgo+ID4+ICsgICAgc3RhcnQgPSB1
bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiA+PiArCj4gPj4gICAgICBpZiAoZmxhZ3MgJiB+KE1TX0FT
WU5DIHwgTVNfSU5WQUxJREFURSB8IE1TX1NZTkMpKQo+ID4+ICAgICAgICAgICAgICBnb3RvIG91
dDsKPiA+PiAgICAgIGlmIChvZmZzZXRfaW5fcGFnZShzdGFydCkpCj4gPj4KPiA+Cj4gPgo+Cj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
