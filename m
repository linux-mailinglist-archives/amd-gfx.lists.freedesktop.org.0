Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA748245F4
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 04:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EB48922A;
	Tue, 21 May 2019 02:28:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EA889243
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 May 2019 23:53:20 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id z11so10031855vsq.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 May 2019 16:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DOow0La3W2Essx5H031uTOWFbAnDcBGJlXVfamcoL3w=;
 b=k1+Zt1urJQNS5gLFTb+vvSX48AiY0htDEm+Svdtw27knijoPoF8znO0lPwbdhKJ7r3
 IxqFp3/7U4J3YXHxqon2pyDh+T3oEqqvgzxyaRaNCm+k/gVWJyTNLEzvjgRDHDbjxib0
 QBr8ai+0HfuUxF4DT6YDWjuzkh1ac0tjhIMSX+Qvmxyma5SKpSzaWJARgN8TpSQ/T2F3
 rud8MKj6zMxhK+S8wRXUAPoDDi+ysnxTiKfL6sojHrVKEby61nVNMJ++d2lyxGFCq8qi
 tzPAkDap441W2yxw5wGvJMxnIhUsm1E8rUcEUNoJaAoNm2niI2C4nq3ElBDfV3YlGY1f
 37OA==
X-Gm-Message-State: APjAAAX7ewvAxEtqmGWwAoO6LTtfnpwklvaopxXZs/yZ+p3tiDzRaus+
 uKtnfk6F/mRrXkaoBlkonZjtdZ6qmzecD8gdr2KpRQ==
X-Google-Smtp-Source: APXvYqyR0JsazypV3hCmWgdEzYpNKlJ3PjKF8ENA0Fjbz+eEGES/3XAyQs/kAm4YlbOIpNAtAAzvW9GW3+g1GtceCfY=
X-Received: by 2002:a67:be17:: with SMTP id x23mr26047761vsq.173.1558396399029; 
 Mon, 20 May 2019 16:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
In-Reply-To: <20190517144931.GA56186@arrakis.emea.arm.com>
From: Evgenii Stepanov <eugenis@google.com>
Date: Mon, 20 May 2019 16:53:07 -0700
Message-ID: <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Tue, 21 May 2019 02:28:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DOow0La3W2Essx5H031uTOWFbAnDcBGJlXVfamcoL3w=;
 b=Dx4+lU9jqXDtln/17Mrd8EV4Dxp/5zASL+1Y8Niio9Pqb06rC0aI8wedP3ohgziyEW
 jppEZzDyXiAo/njLuzUnS0cZqB4tlCDf5SInO7A6W3spDccr9FtwpNa39rs9vTjn9Pol
 gFjx66w14oqATAsCg/4xevDnAIAQo2Q0YzZMa3Njt5yFKOelm+SuxVUsWhk4woonxC/+
 9D5FC/UAWBXCau72ARfrLZBFx2zGvzGs/3QYXrUb8NFYR9FnDOYRxbwkdocqirkPGsSw
 AxoIYh3MeUP070fRiIy388VcetefsVsnX0FjFahzGTgGe2zBg5LkCE8dqpCaiB/D65kK
 79Pw==
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Elliott Hughes <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgNzo0OSBBTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IEhpIEFuZHJleSwKPgo+IE9uIE1vbiwgTWF5IDA2
LCAyMDE5IGF0IDA2OjMwOjQ2UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBP
bmUgb2YgdGhlIGFsdGVybmF0aXZlIGFwcHJvYWNoZXMgdG8gdW50YWdnaW5nIHRoYXQgd2FzIGNv
bnNpZGVyZWQgaXMgdG8KPiA+IGNvbXBsZXRlbHkgc3RyaXAgdGhlIHBvaW50ZXIgdGFnIGFzIHRo
ZSBwb2ludGVyIGVudGVycyB0aGUga2VybmVsIHdpdGgKPiA+IHNvbWUga2luZCBvZiBhIHN5c2Nh
bGwgd3JhcHBlciwgYnV0IHRoYXQgd29uJ3Qgd29yayB3aXRoIHRoZSBjb3VudGxlc3MKPiA+IG51
bWJlciBvZiBkaWZmZXJlbnQgaW9jdGwgY2FsbHMuIFdpdGggdGhpcyBhcHByb2FjaCB3ZSB3b3Vs
ZCBuZWVkIGEgY3VzdG9tCj4gPiB3cmFwcGVyIGZvciBlYWNoIGlvY3RsIHZhcmlhdGlvbiwgd2hp
Y2ggZG9lc24ndCBzZWVtIHByYWN0aWNhbC4KPgo+IFRoZSBtb3JlIEkgbG9vayBhdCB0aGlzIHBy
b2JsZW0sIHRoZSBsZXNzIGNvbnZpbmNlZCBJIGFtIHRoYXQgd2UgY2FuCj4gc29sdmUgaXQgaW4g
YSB3YXkgdGhhdCByZXN1bHRzIGluIGEgc3RhYmxlIEFCSSBjb3ZlcmluZyBpb2N0bHMoKS4gV2hp
bGUKPiBmb3IgdGhlIEFuZHJvaWQga2VybmVsIGNvZGViYXNlIGl0IGNvdWxkIGJlIHNpbXBsZXIg
YXMgeW91IGRvbid0IHVwZ3JhZGUKPiB0aGUga2VybmVsIHZlcnNpb24gZXZlcnkgMi41IG1vbnRo
cywgZm9yIHRoZSBtYWlubGluZSBrZXJuZWwgdGhpcwo+IGRvZXNuJ3Qgc2NhbGUuIEFueSBydW4t
dGltZSBjaGVja3MgYXJlIHJlbGF0aXZlbHkgbGltaXRlZCBpbiB0ZXJtcyBvZgo+IGRyaXZlcnMg
Y292ZXJlZC4gQmV0dGVyIHN0YXRpYyBjaGVja2luZyB3b3VsZCBiZSBuaWNlIGFzIGEgbG9uZyB0
ZXJtCj4gc29sdXRpb24gYnV0IHdlIGRpZG4ndCBnZXQgYW55d2hlcmUgd2l0aCB0aGUgZGlzY3Vz
c2lvbiBsYXN0IHllYXIuCj4KPiBJTU8gKFJGQyBmb3Igbm93KSwgSSBzZWUgdHdvIHdheXMgZm9y
d2FyZDoKPgo+IDEuIE1ha2UgdGhpcyBhIHVzZXIgc3BhY2UgcHJvYmxlbSBhbmQgZG8gbm90IGFs
bG93IHRhZ2dlZCBwb2ludGVycyBpbnRvCj4gICAgdGhlIHN5c2NhbGwgQUJJLiBBIGxpYmMgd3Jh
cHBlciB3b3VsZCBoYXZlIHRvIGNvbnZlcnQgc3RydWN0dXJlcywKPiAgICBwYXJhbWV0ZXJzIGJl
Zm9yZSBwYXNzaW5nIHRoZW0gaW50byB0aGUga2VybmVsLiBOb3RlIHRoYXQgd2UgY2FuCj4gICAg
c3RpbGwgc3VwcG9ydCB0aGUgaGFyZHdhcmUgTVRFIGluIHRoZSBrZXJuZWwgYnkgZW5hYmxpbmcg
dGFnZ2VkCj4gICAgbWVtb3J5IHJhbmdlcywgc2F2aW5nL3Jlc3RvcmluZyB0YWdzIGV0Yy4gYnV0
IG5vdCBhbGxvd2luZyB0YWdnZWQKPiAgICBhZGRyZXNzZXMgYXQgdGhlIHN5c2NhbGwgYm91bmRh
cnkuCj4KPiAyLiBTaW1pbGFyIHNoaW0gdG8gdGhlIGFib3ZlIGxpYmMgd3JhcHBlciBidXQgaW5z
aWRlIHRoZSBrZXJuZWwKPiAgICAoYXJjaC9hcm02NCBvbmx5OyBtb3N0IHBvaW50ZXIgYXJndW1l
bnRzIGNvdWxkIGJlIGNvdmVyZWQgd2l0aCBhbgo+ICAgIF9fU0NfQ0FTVCBzaW1pbGFyIHRvIHRo
ZSBzMzkwIG9uZSkuIFRoZXJlIGFyZSB0d28gZGlmZmVyZW5jZXMgZnJvbQo+ICAgIHdoYXQgd2Un
dmUgZGlzY3Vzc2VkIGluIHRoZSBwYXN0Ogo+Cj4gICAgYSkgdGhpcyBpcyBhbiBvcHQtaW4gYnkg
dGhlIHVzZXIgd2hpY2ggd291bGQgaGF2ZSB0byBleHBsaWNpdGx5IGNhbGwKPiAgICAgICBwcmN0
bCgpLiBJZiBpdCByZXR1cm5zIC1FTk9UU1VQUCBldGMuLCB0aGUgdXNlciB3b24ndCBiZSBhbGxv
d2VkCj4gICAgICAgdG8gcGFzcyB0YWdnZWQgcG9pbnRlcnMgdG8gdGhlIGtlcm5lbC4gVGhpcyB3
b3VsZCBwcm9iYWJseSBiZSB0aGUKPiAgICAgICByZXNwb25zaWJpbGl0eSBvZiB0aGUgQyBsaWIg
dG8gbWFrZSBzdXJlIGl0IGRvZXNuJ3QgdGFnIGhlYXAKPiAgICAgICBhbGxvY2F0aW9ucy4gSWYg
dGhlIHVzZXIgZGlkIG5vdCBvcHQtaW4sIHRoZSBzeXNjYWxscyBhcmUgcm91dGVkCj4gICAgICAg
dGhyb3VnaCB0aGUgbm9ybWFsIHBhdGggKG5vIHVudGFnZ2luZyBhZGRyZXNzIHNoaW0pLgo+Cj4g
ICAgYikgaW9jdGwoKSBhbmQgb3RoZXIgYmxhY2tsaXN0ZWQgc3lzY2FsbHMgKHByY3RsKSB3aWxs
IG5vdCBhY2NlcHQKPiAgICAgICB0YWdnZWQgcG9pbnRlcnMgKHRvIGJlIGRvY3VtZW50ZWQgaW4g
VmljZW56bydzIEFCSSBwYXRjaGVzKS4KPgo+IEl0IGRvZXNuJ3Qgc29sdmUgdGhlIHByb2JsZW1z
IHdlIGFyZSB0cnlpbmcgdG8gYWRkcmVzcyBidXQgMi5hIHNhdmVzIHVzCj4gZnJvbSBibGluZGx5
IHJlbGF4aW5nIHRoZSBBQkkgd2l0aG91dCBrbm93aW5nIGhvdyB0byBlYXNpbHkgYXNzZXNzIG5l
dwo+IGNvZGUgYmVpbmcgbWVyZ2VkIChvdmVyIDUwMEsgbGluZXMgYmV0d2VlbiBrZXJuZWwgdmVy
c2lvbnMpLiBFeGlzdGluZwo+IGFwcGxpY2F0aW9ucyAod2hvIGRvbid0IG9wdC1pbikgd29uJ3Qg
aW5hZHZlcnRlbnRseSBzdGFydCB1c2luZyB0aGUgbmV3Cj4gQUJJIHdoaWNoIGNvdWxkIHJpc2sg
YmVjb21pbmcgZGUtZmFjdG8gQUJJIHRoYXQgd2UgbmVlZCB0byBzdXBwb3J0IG9uCj4gdGhlIGxv
bmcgcnVuLgo+Cj4gT3B0aW9uIDEgd291bGRuJ3Qgc29sdmUgdGhlIGlvY3RsKCkgcHJvYmxlbSBl
aXRoZXIgYW5kIHdoaWxlIGl0IG1ha2VzCj4gdGhpbmdzIHNpbXBsZXIgZm9yIHRoZSBrZXJuZWws
IEkgYW0gYXdhcmUgdGhhdCBpdCdzIHNsaWdodGx5IG1vcmUKPiBjb21wbGljYXRlZCBpbiB1c2Vy
IHNwYWNlIChidXQgSSByZWFsbHkgZG9uJ3QgbWluZCBpZiB5b3UgcHJlZmVyIG9wdGlvbgo+IDEg
OykpLgo+Cj4gVGhlIHRhZ2dlZCBwb2ludGVycyAod2hldGhlciBod2FzYW4gb3IgTVRFKSBzaG91
bGQgaWRlYWxseSBiZSBhCj4gdHJhbnNwYXJlbnQgZmVhdHVyZSBmb3IgdGhlIGFwcGxpY2F0aW9u
IHdyaXRlciBidXQgSSBkb24ndCB0aGluayB3ZSBjYW4KPiBzb2x2ZSBpdCBlbnRpcmVseSBhbmQg
bWFrZSBpdCBzZWFtbGVzcyBmb3IgdGhlIG11bHRpdHVkZSBvZiBpb2N0bHMoKS4KPiBJJ2Qgc2F5
IHlvdSBvbmx5IG9wdCBpbiB0byBzdWNoIGZlYXR1cmUgaWYgeW91IGtub3cgd2hhdCB5b3UgYXJl
IGRvaW5nCj4gYW5kIHRoZSB1c2VyIGNvZGUgdGFrZXMgY2FyZSBvZiBzcGVjaWZpYyBjYXNlcyBs
aWtlIGlvY3RsKCksIGhlbmNlIHRoZQo+IHByY3RsKCkgcHJvcG9zYWwgZXZlbiBmb3IgdGhlIGh3
YXNhbi4KPgo+IENvbW1lbnRzIHdlbGNvbWVkLgoKQW55IHVzZXJzcGFjZSBzaGltIGFwcHJvYWNo
IGlzIHByb2JsZW1hdGljIGZvciBBbmRyb2lkIGJlY2F1c2Ugb2YgdGhlCmFwcHMgdGhhdCB1c2Ug
cmF3IHN5c3RlbSBjYWxscy4gQUZBSUssIGFsbCBhcHBzIHdyaXR0ZW4gaW4gR28gYXJlIGluCnRo
YXQgY2FtcCAtIEknbSBub3Qgc3VyZSBob3cgY29tbW9uIHRoZXkgYXJlLCBidXQgZ2V0dGluZyB0
aGVtIGFsbApyZWNvbXBpbGVkIGlzIHByb2JhYmx5IG5vdCByZWFsaXN0aWMuCgpUaGUgd2F5IEkg
c2VlIGl0LCBhIHBhdGNoIHRoYXQgYnJlYWtzIGhhbmRsaW5nIG9mIHRhZ2dlZCBwb2ludGVycyBp
cwpub3QgdGhhdCBkaWZmZXJlbnQgZnJvbSwgc2F5LCBhIHBhdGNoIHRoYXQgYWRkcyBhIHdpbGQg
cG9pbnRlcgpkZXJlZmVyZW5jZS4gQm90aCBhcmUgYnVnczsgdGhlIGRpZmZlcmVuY2UgaXMgdGhh
dCAoYSkgdGhlIGZvcm1lcgpicmVha3MgYSByZWxhdGl2ZWx5IHVuY29tbW9uIHRhcmdldCBhbmQg
KGIpIGl0J3MgYXJndWFibHkgYW4gZWFzaWVyCm1pc3Rha2UgdG8gbWFrZS4gSWYgTVRFIGFkb3B0
aW9uIGdvZXMgd2VsbCwgKGEpIHdpbGwgbm90IGJlIHRoZSBjYXNlCmZvciBsb25nLgoKVGhpcyBp
cyBhIGJpdCBvZiBhIGNoaWNrZW4tYW5kLWVnZyBwcm9ibGVtLiBJbiBhIHdvcmxkIHdoZXJlIG1l
bW9yeQphbGxvY2F0b3JzIG9uIG9uZSBvciBzZXZlcmFsIHBvcHVsYXIgcGxhdGZvcm1zIGdlbmVy
YXRlIHBvaW50ZXJzIHdpdGgKbm9uLXplcm8gdGFncywgYW55IHN1Y2ggYnJlYWthZ2Ugd2lsbCBi
ZSBjYXVnaHQgaW4gdGVzdGluZy4KVW5mb3J0dW5hdGVseSB0byByZWFjaCB0aGF0IHN0YXRlIHdl
IG5lZWQgdGhlIGtlcm5lbCB0byBzdGFydAphY2NlcHRpbmcgdGFnZ2VkIHBvaW50ZXJzIGZpcnN0
LCBhbmQgdGhlbiBob2xkIG9uIGZvciBhIGNvdXBsZSBvZgp5ZWFycyB1bnRpbCB1c2Vyc3BhY2Ug
Y2F0Y2hlcyB1cC4KClBlcmhhcHMgd2UgY2FuIHN0YXJ0IGJ5IHdoaXRlbGlzdGluZyBpb2N0bHMg
YnkgZHJpdmVyPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
