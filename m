Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39710227BA1
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Jul 2020 11:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13E389AE6;
	Tue, 21 Jul 2020 09:24:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83006E52E
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 09:24:32 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id d4so14581162otk.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nquXkdQRYOPtoNI/3pjve4BmhzPYso4IxoVNtZc0VME=;
 b=CjocwH1W7nFMYJlFZJt0tm40L0soTBLF2A1OyB8G88wf51ZiFhqG/CutsmKeZ5Tdmn
 Y5Pra1EDDvtZhDbFNA40Deym9NI9pzjBkrIByHZc4nyCatLi/P96S+39Zw9EyC+sMvmu
 rkq8EcEXbJqZEJMu9S+hwNyEDe9BYYwCY1240=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nquXkdQRYOPtoNI/3pjve4BmhzPYso4IxoVNtZc0VME=;
 b=noTe0IGF4Wt1fptSMZiJb1MhQCutghk+D+sBHRsLdEFVs8hUkbmqTknTYCSz57S3Vg
 zvKsoH6qEIxOdgaqeqBy0IELzyRQLzY6P449sw3jdrqW2q6si2bGDz10JnyzRdMAINqM
 ObZCJHoIWYHZqn65XFL3QCxOjGT/AkSelyEXE1FMbY6rmRiIs+8Hq+Aevs5itpdcCkqv
 w4Hi8o+hXvV96Yu+oW7HR04Rrt80uj9EXItrHrZGCCco5UGXgdSaoShywp8AUPMpk0Y5
 1z+Q2DF8/QirQdArhbk/rN3YVHES/FvslKXe2AvCKyzPmXuF37F/uKQUtwHSsKpngypY
 nL6g==
X-Gm-Message-State: AOAM5317Y5TcCC0oHQA0tv+laakeYuhGKgCpfU9nfemKAnTKk1g8ou8n
 rpZOcxZFtzMeoqi88Sck98Pa5vIjPWie/ExlnxQ0vw==
X-Google-Smtp-Source: ABdhPJwWzQp8+gEl+OMQCIoHdSTE3WuDzqd0vQntTpza9P5RjwTtbLNRcl1/BieXye7/bW+4dhAaba2R8DiOHrzunIU=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr25072001ota.188.1595323471609; 
 Tue, 21 Jul 2020 02:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <2ca2c004-1e11-87f5-4bd8-761e1b44d21f@amd.com>
 <CAKMK7uHcWMGnLqmNqoyYmk_UcErEZwRon-ybc9t-Joa+bHacaQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHcWMGnLqmNqoyYmk_UcErEZwRon-ybc9t-Joa+bHacaQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 21 Jul 2020 11:24:20 +0200
Message-ID: <CAKMK7uF6L1vZR9VxTdvN80xQ3Qn6jBnGV5QQCBUrNOwrWPjruw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgMTE6MTYgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDIxLCAyMDIwIGF0IDEwOjU1IEFNIENocmlz
dGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+Cj4gPiBB
bSAyMS4wNy4yMCB1bSAxMDo0NyBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6Cj4g
PiA+Cj4gPiA+IE9uIDcvMjEvMjAgOTo0NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+
ID4+IEFtIDIxLjA3LjIwIHVtIDA5OjQxIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+ID4+PiBP
biBNb24sIEp1bCAyMCwgMjAyMCBhdCAwMToxNToxN1BNICswMjAwLCBUaG9tYXMgSGVsbHN0csO2
bSAoSW50ZWwpCj4gPiA+Pj4gd3JvdGU6Cj4gPiA+Pj4+IEhpLAo+ID4gPj4+Pgo+ID4gPj4+PiBP
biA3LzkvMjAgMjozMyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4+Pj4+IENvbWVzIHVw
IGV2ZXJ5IGZldyB5ZWFycywgZ2V0cyBzb21ld2hhdCB0ZWRpb3VzIHRvIGRpc2N1c3MsIGxldCdz
Cj4gPiA+Pj4+PiB3cml0ZSB0aGlzIGRvd24gb25jZSBhbmQgZm9yIGFsbC4KPiA+ID4+Pj4+Cj4g
PiA+Pj4+PiBXaGF0IEknbSBub3Qgc3VyZSBhYm91dCBpcyB3aGV0aGVyIHRoZSB0ZXh0IHNob3Vs
ZCBiZSBtb3JlCj4gPiA+Pj4+PiBleHBsaWNpdCBpbgo+ID4gPj4+Pj4gZmxhdCBvdXQgbWFuZGF0
aW5nIHRoZSBhbWRrZmQgZXZpY3Rpb24gZmVuY2VzIGZvciBsb25nIHJ1bm5pbmcKPiA+ID4+Pj4+
IGNvbXB1dGUKPiA+ID4+Pj4+IHdvcmtsb2FkcyBvciB3b3JrbG9hZHMgd2hlcmUgdXNlcnNwYWNl
IGZlbmNpbmcgaXMgYWxsb3dlZC4KPiA+ID4+Pj4gQWx0aG91Z2ggKGluIG15IGh1bWJsZSBvcGlu
aW9uKSBpdCBtaWdodCBiZSBwb3NzaWJsZSB0byBjb21wbGV0ZWx5Cj4gPiA+Pj4+IHVudGFuZ2xl
Cj4gPiA+Pj4+IGtlcm5lbC1pbnRyb2R1Y2VkIGZlbmNlcyBmb3IgcmVzb3VyY2UgbWFuYWdlbWVu
dCBhbmQgZG1hLWZlbmNlcwo+ID4gPj4+PiB1c2VkIGZvcgo+ID4gPj4+PiBjb21wbGV0aW9uLSBh
bmQgZGVwZW5kZW5jeSB0cmFja2luZyBhbmQgbGlmdCBhIGxvdCBvZiByZXN0cmljdGlvbnMKPiA+
ID4+Pj4gZm9yIHRoZQo+ID4gPj4+PiBkbWEtZmVuY2VzLCBpbmNsdWRpbmcgcHJvaGliaXRpbmcg
aW5maW5pdGUgb25lcywgSSB0aGluayB0aGlzIG1ha2VzCj4gPiA+Pj4+IHNlbnNlCj4gPiA+Pj4+
IGRlc2NyaWJpbmcgdGhlIGN1cnJlbnQgc3RhdGUuCj4gPiA+Pj4gWWVhaCBJIHRoaW5rIGEgZnV0
dXJlIHBhdGNoIG5lZWRzIHRvIHR5cGUgdXAgaG93IHdlIHdhbnQgdG8gbWFrZSB0aGF0Cj4gPiA+
Pj4gaGFwcGVuIChmb3Igc29tZSBjcm9zcyBkcml2ZXIgY29uc2lzdGVuY3kpIGFuZCB3aGF0IG5l
ZWRzIHRvIGJlCj4gPiA+Pj4gY29uc2lkZXJlZC4gU29tZSBvZiB0aGUgbmVjZXNzYXJ5IHBhcnRz
IGFyZSBhbHJlYWR5IHRoZXJlICh3aXRoIGxpa2UKPiA+ID4+PiB0aGUKPiA+ID4+PiBwcmVlbXB0
aW9uIGZlbmNlcyBhbWRrZmQgaGFzIGFzIGFuIGV4YW1wbGUpLCBidXQgSSB0aGluayBzb21lIGNs
ZWFyCj4gPiA+Pj4gZG9jcwo+ID4gPj4+IG9uIHdoYXQncyByZXF1aXJlZCBmcm9tIGJvdGggaHcs
IGRyaXZlcnMgYW5kIHVzZXJzcGFjZSB3b3VsZCBiZSByZWFsbHkKPiA+ID4+PiBnb29kLgo+ID4g
Pj4KPiA+ID4+IEknbSBjdXJyZW50bHkgd3JpdGluZyB0aGF0IHVwLCBidXQgcHJvYmFibHkgc3Rp
bGwgbmVlZCBhIGZldyBkYXlzIGZvcgo+ID4gPj4gdGhpcy4KPiA+ID4KPiA+ID4gR3JlYXQhIEkg
cHV0IGRvd24gc29tZSAodmVyeSkgaW5pdGlhbCB0aG91Z2h0cyBhIGNvdXBsZSBvZiB3ZWVrcyBh
Z28KPiA+ID4gYnVpbGRpbmcgb24gZXZpY3Rpb24gZmVuY2VzIGZvciB2YXJpb3VzIGhhcmR3YXJl
IGNvbXBsZXhpdHkgbGV2ZWxzIGhlcmU6Cj4gPiA+Cj4gPiA+IGh0dHBzOi8vbmFtMTEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVl
ZGVza3RvcC5vcmclMkZ0aG9tYXNoJTJGZG9jcyUyRi0lMkZibG9iJTJGbWFzdGVyJTJGVW50YW5n
bGluZyUyNTIwZG1hLWZlbmNlJTI1MjBhbmQlMjUyMG1lbW9yeSUyNTIwYWxsb2NhdGlvbi5vZHQm
YW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDODk3OGJiZDc4
MjNlNGI0MTY2MzcwOGQ4MmQ1MmFkZDMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgz
ZCU3QzAlN0MwJTdDNjM3MzA5MTgwNDI0MzEyMzkwJmFtcDtzZGF0YT10VHh4MnZmemZ3TE0xSUJK
U3FxQVpSdzE2MDRSJTJGMGJJM013TjElMkZCZjJWUSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+ID4gPgo+
ID4KPiA+IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIHdpbGwgZXZlciBiZSBwb3NzaWJsZS4KPiA+
Cj4gPiBTZWUgdGhhdCBEYW5pZWwgZGVzY3JpYmVzIGluIGhpcyB0ZXh0IGlzIHRoYXQgaW5kZWZp
bml0ZSBmZW5jZXMgYXJlIGEKPiA+IGJhZCBpZGVhIGZvciBtZW1vcnkgbWFuYWdlbWVudCwgYW5k
IEkgdGhpbmsgdGhhdCB0aGlzIGlzIGEgZml4ZWQgZmFjdC4KPiA+Cj4gPiBJbiBvdGhlciB3b3Jk
cyB0aGUgd2hvbGUgY29uY2VwdCBvZiBzdWJtaXR0aW5nIHdvcmsgdG8gdGhlIGtlcm5lbCB3aGlj
aAo+ID4gZGVwZW5kcyBvbiBzb21lIHVzZXIgc3BhY2UgaW50ZXJhY3Rpb24gZG9lc24ndCB3b3Jr
IGFuZCBuZXZlciB3aWxsLgo+ID4KPiA+IFdoYXQgY2FuIGJlIGRvbmUgaXMgdGhhdCBkbWFfZmVu
Y2VzIHdvcmsgd2l0aCBoYXJkd2FyZSBzY2hlZHVsZXJzLiBFLmcuCj4gPiB3aGF0IHRoZSBLRkQg
dHJpZXMgdG8gZG8gd2l0aCBpdHMgcHJlZW1wdGlvbiBmZW5jZXMuCj4gPgo+ID4gQnV0IGZvciB0
aGlzIHlvdSBuZWVkIGEgYmV0dGVyIGNvbmNlcHQgYW5kIGRlc2NyaXB0aW9uIG9mIHdoYXQgdGhl
Cj4gPiBoYXJkd2FyZSBzY2hlZHVsZXIgaXMgc3VwcG9zZWQgdG8gZG8gYW5kIGhvdyB0aGF0IGlu
dGVyYWN0cyB3aXRoCj4gPiBkbWFfZmVuY2Ugb2JqZWN0cy4KPgo+IFllYWggSSB0aGluayB0cnlp
bmcgdG8gc3BsaXQgZG1hX2ZlbmNlIHdvbnQgd29yaywgc2ltcGx5IGJlY2F1c2Ugb2YKPiBpbmVy
dGlhLiBDcmVhdGluZyBhbiBlbnRpcmVseSBuZXcgdGhpbmcgZm9yIGF1Z21lbnRlZCB1c2Vyc3Bh
Y2UKPiBjb250cm9sbGVkIGZlbmNpbmcsIGFuZCB0aGVuIGpvdHRpbmcgZG93biBhbGwgdGhlIHJ1
bGVzIHRoZQo+IGtlcm5lbC9ody91c2Vyc3BhY2UgbmVlZCB0byBvYmV5IHRvIG5vdCBicmVhayBk
bWFfZmVuY2UgaXMgd2hhdCBJIGhhZAo+IGluIG1pbmQuIEFuZCBJIGd1ZXNzIHRoYXQncyBhbHNv
IHdoYXQgQ2hyaXN0aWFuIGlzIHdvcmtpbmcgb24uIEUuZy4KPiBqdXN0IGdvaW5nIHRocm91Z2gg
YWxsIHRoZSBjYXNlcyBvZiBob3cgbXVjaCB5b3VyIGh3IGNhbiBwcmVlbXB0IG9yCj4gaGFuZGxl
IHBhZ2UgZmF1bHRzIG9uIHRoZSBncHUsIGFuZCB3aGF0IHRoYXQgbWVhbnMgaW4gdGVybXMgb2YK
PiBkbWFfZmVuY2VfYmVnaW4vZW5kX3NpZ25hbGxpbmcgYW5kIG90aGVyIGNvbnN0cmFpbnRzIHdv
dWxkIGJlIHJlYWxseQo+IGdvb2QuCgpPciByZXBocmFzZWQgaW4gdGVybXMgb2YgVGhvbWFzJyBk
b2M6IGRtYS1mZW5jZSB3aWxsIHN0YXkgdGhlIG1lbW9yeQpmZW5jZSwgYW5kIGFsc28gdGhlIHN5
bmMgZmVuY2UgZm9yIGN1cnJlbnQgdXNlcnNwYWNlIGFuZCB3aW5zeXMuCgpUaGVuIHdlIGNyZWF0
ZSBhIG5ldyB0aGluZyBhbmQgY29tcGxldGUgcHJvdG9jb2wgYW5kIGRyaXZlciByZXZpbmcgb2YK
dGhlIGVudGlyZSB3b3JsZC4gVGhlIHJlYWxseSBoYXJkIHBhcnQgaXMgdGhhdCBydW5uaW5nIG9s
ZCBzdHVmZiBvbiBhCm5ldyBzdGFjayBpcyBwb3NzaWJsZSAod2UnZCBiZSB0b3RhbGx5IHNjcmV3
ZWQgb3RoZXJ3aXNlLCBzaW5jZSBpdAp3b3VsZCBiZWNvbWUgYSBzeXN0ZW0gd2lkZSBmbGFnIGRh
eSkuIEJ1dCBydW5uaW5nIG5ldyBzdHVmZiBvbiBhbiBvbGQKc3RhY2sgKGV2ZW4gaWYgaXQncyBq
dXN0IHNvbWV0aGluZyBpbiB1c2Vyc3BhY2UgbGlrZSB0aGUgY29tcG9zaXRvcikKZG9lc24ndCB3
b3JrLCBiZWNhdXNlIHRoZW4geW91IHRpZSB0aGUgbmV3IHN5bmNocm9uaXphdGlvbiBmZW5jZXMg
YmFjawppbnRvIHRoZSBkbWEtZmVuY2UgbWVtb3J5IGZlbmNlcywgYW5kIGdhbWUgb3Zlci4KClNv
IHllYWggYXJvdW5kIDUgeWVhcnMgb3Igc28gZm9yIGFueXRoaW5nIHRoYXQgd2FudHMgdG8gdXNl
IGEgd2luc3lzLApvciBhdCBsZWFzdCB0aGF0J3Mgd2hhdCBpdCB1c3VhbGx5IHRha2VzIHVzIHRv
IGRvIHNvbWV0aGluZyBsaWtlIHRoaXMKOi0vIEVudGlyZWx5IHN0YW5kLWFsb25lIGNvbXB1dGUg
d29ya2xvYWRzIChpcnJlc3BlY3RpdmUgd2hldGhlciBpdCdzCmN1ZGEsIGNsLCB2ayBvciB3aGF0
ZXZlcikgZG9lc24ndCBoYXZlIHRoYXQgcHJvYmxlbSBvZmMuCi1EYW5pZWwKCj4gLURhbmllbAo+
Cj4gPgo+ID4gQ2hyaXN0aWFuLgo+ID4KPiA+ID4KPiA+ID4gL1Rob21hcwo+ID4gPgo+ID4gPgo+
ID4KPgo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
