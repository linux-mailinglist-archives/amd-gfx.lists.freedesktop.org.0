Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980CB2066FC
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2020 00:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9D6E46F;
	Tue, 23 Jun 2020 22:13:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1756E479
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2020 22:13:35 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 18so10060otv.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2020 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0ZGDNOSDA1Ta3hgcxRzaAOGyEheiE8Jvv+zjE+Mj6/w=;
 b=fI6rkREdBOXiWQhJfInIzRJF7zpcxrfUpkbR7wS6uFp1jIy/srpIpWCY2qhR8SlvJM
 E9xvsRSEuDYKViPPM35jShY2ry/XhUUMfYpJa9F42ZAf+3HnD68PPN/LWw0vhxeX+umr
 qEMqwgKep73f2cLlFdLlz3jj8N3/5WFnj0bpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0ZGDNOSDA1Ta3hgcxRzaAOGyEheiE8Jvv+zjE+Mj6/w=;
 b=kjv6n6YakNzlFN/NSxo5n4TWxiYhhygNYVrWJEdqDgnfc0TXzoantwjsf8BTCSEnvL
 zeEUahGTd8NpOtj7PhQyL3gewFfNurci8PQqIR/XMKYt2A7zF9JeY6iyoV585vCLcfpt
 4kmJaxdBsmtA9XcnJRJmf4MVXVU4Ffl4BMFMTZu8oSZ1Z0QqPc4CUFH6ettsQGTvWX6Y
 p2xahWdVndze3csIUEeM30EVH7aLOfZwDdMkIdrmlwzPgVA2ACic13zuwVBAi4aKYMfZ
 72IcSSVwXoxKhDJERkb+stSNKDXHVvOBMglMbkzI9psrI1LmOx5pHMERvW9KNRElHkBZ
 DEyA==
X-Gm-Message-State: AOAM531hAQjF3JuZ9yb7XX8QqzO/uTJ0LWObcZlYB+u9x+X3DrQCJJdq
 dXbmbZv/SihmGAmyaHaIUVLeJy0TPKgZB5+on1D+Iw==
X-Google-Smtp-Source: ABdhPJwPmQOfovNfpWZFRMIarIw+GC3JzL8nOeU25adQ547Jc0j/YgtfLS4GnLCbiFY0QLcY9IzMa6Nlpo7Cz+8cT/8=
X-Received: by 2002:a05:6830:2017:: with SMTP id
 e23mr12956621otp.303.1592950414566; 
 Tue, 23 Jun 2020 15:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-2-daniel.vetter@ffwll.ch>
 <20200610194101.1668038-1-daniel.vetter@ffwll.ch>
 <20200621174205.GB1398@lca.pw>
 <CAKMK7uFZAFVmceoYvqPovOifGw_Y8Ey-OMy6wioMjwPWhu9dDg@mail.gmail.com>
 <20200621200103.GV20149@phenom.ffwll.local> <20200623161754.GA1140@lca.pw>
In-Reply-To: <20200623161754.GA1140@lca.pw>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 24 Jun 2020 00:13:23 +0200
Message-ID: <CAKMK7uH90-k12KMHE0pWN6G_aCTr=YNhQsqoaAJC5FHygnf96g@mail.gmail.com>
Subject: Re: [PATCH] mm: Track mmu notifiers in fs_reclaim_acquire/release
To: Qian Cai <cai@lca.pw>
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-xfs@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgNjoxOCBQTSBRaWFuIENhaSA8Y2FpQGxjYS5wdz4gd3Jv
dGU6Cj4KPiBPbiBTdW4sIEp1biAyMSwgMjAyMCBhdCAxMDowMTowM1BNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gU3VuLCBKdW4gMjEsIDIwMjAgYXQgMDg6MDc6MDhQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gU3VuLCBKdW4gMjEsIDIwMjAgYXQgNzo0
MiBQTSBRaWFuIENhaSA8Y2FpQGxjYS5wdz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQs
IEp1biAxMCwgMjAyMCBhdCAwOTo0MTowMVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
ID4gPiA+ID4gZnNfcmVjbGFpbV9hY3F1aXJlL3JlbGVhc2UgbmljZWx5IGNhdGNoIHJlY3Vyc2lv
biBpc3N1ZXMgd2hlbgo+ID4gPiA+ID4gYWxsb2NhdGluZyBHRlBfS0VSTkVMIG1lbW9yeSBhZ2Fp
bnN0IHNocmlua2VycyAod2hpY2ggZ3B1IGRyaXZlcnMgdGVuZAo+ID4gPiA+ID4gdG8gdXNlIHRv
IGtlZXAgdGhlIGV4Y2Vzc2l2ZSBjYWNoZXMgaW4gY2hlY2spLiBGb3IgbW11IG5vdGlmaWVyCj4g
PiA+ID4gPiByZWN1cnNpb25zIHdlIGRvIGhhdmUgbG9ja2RlcCBhbm5vdGF0aW9ucyBzaW5jZSAy
M2I2ODM5NWM3YzcKPiA+ID4gPiA+ICgibW0vbW11X25vdGlmaWVyczogYWRkIGEgbG9ja2RlcCBt
YXAgZm9yIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5kIikuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
QnV0IHRoZXNlIG9ubHkgZmlyZSBpZiBhIHBhdGggYWN0dWFsbHkgcmVzdWx0cyBpbiBzb21lIHB0
ZQo+ID4gPiA+ID4gaW52YWxpZGF0aW9uIC0gZm9yIG1vc3Qgc21hbGwgYWxsb2NhdGlvbnMgdGhh
dCdzIHZlcnkgcmFyZWx5IHRoZSBjYXNlLgo+ID4gPiA+ID4gVGhlIG90aGVyIHRyb3VibGUgaXMg
dGhhdCBwdGUgaW52YWxpZGF0aW9uIGNhbiBoYXBwZW4gYW55IHRpbWUgd2hlbgo+ID4gPiA+ID4g
X19HRlBfUkVDTEFJTSBpcyBzZXQuIFdoaWNoIG1lYW5zIG9ubHkgcmVhbGx5IEdGUF9BVE9NSUMg
aXMgYSBzYWZlCj4gPiA+ID4gPiBjaG9pY2UsIEdGUF9OT0lPIGlzbid0IGdvb2QgZW5vdWdoIHRv
IGF2b2lkIHBvdGVudGlhbCBtbXUgbm90aWZpZXIKPiA+ID4gPiA+IHJlY3Vyc2lvbi4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBJIHdhcyBwb25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQganVzdCBkbyB0
aGUgZ2VuZXJhbCBhbm5vdGF0aW9uLCBidXQKPiA+ID4gPiA+IHRoZXJlJ3MgYWx3YXlzIHRoZSBy
aXNrIGZvciBmYWxzZSBwb3NpdGl2ZXMuIFBsdXMgSSdtIGFzc3VtaW5nIHRoYXQKPiA+ID4gPiA+
IHRoZSBjb3JlIGZzIGFuZCBpbyBjb2RlIGlzIGEgbG90IGJldHRlciByZXZpZXdlZCBhbmQgdGVz
dGVkIHRoYW4KPiA+ID4gPiA+IHJhbmRvbSBtbXUgbm90aWZpZXIgY29kZSBpbiBkcml2ZXJzLiBI
ZW5jZSB3aHkgSSBkZWNpZGUgdG8gb25seQo+ID4gPiA+ID4gYW5ub3RhdGUgZm9yIHRoYXQgc3Bl
Y2lmaWMgY2FzZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGdXJ0aGVybW9yZSBldmVuIGlmIHdlJ2Qg
Y3JlYXRlIGEgbG9ja2RlcCBtYXAgZm9yIGRpcmVjdCByZWNsYWltLCB3ZSdkCj4gPiA+ID4gPiBz
dGlsbCBuZWVkIHRvIGV4cGxpY2l0IHB1bGwgaW4gdGhlIG1tdSBub3RpZmllciBtYXAgLSB0aGVy
ZSdzIGEgbG90Cj4gPiA+ID4gPiBtb3JlIHBsYWNlcyB0aGF0IGRvIHB0ZSBpbnZhbGlkYXRpb24g
dGhhbiBqdXN0IGRpcmVjdCByZWNsYWltLCB0aGVzZQo+ID4gPiA+ID4gdHdvIGNvbnRleHRzIGFy
ZW50IHRoZSBzYW1lLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vdGUgdGhhdCB0aGUgbW11IG5vdGlm
aWVycyBuZWVkaW5nIHRoZWlyIG93biBpbmRlcGVuZGVudCBsb2NrZGVwIG1hcAo+ID4gPiA+ID4g
aXMgYWxzbyB0aGUgcmVhc29uIHdlIGNhbid0IGhvbGQgdGhlbSBmcm9tIGZzX3JlY2xhaW1fYWNx
dWlyZSB0bwo+ID4gPiA+ID4gZnNfcmVjbGFpbV9yZWxlYXNlIC0gaXQgd291bGQgbmVzdCB3aXRo
IHRoZSBhY3F1aXN0aW9uIGluIHRoZSBwdGUKPiA+ID4gPiA+IGludmFsaWRhdGlvbiBjb2RlLCBj
YXVzaW5nIGEgbG9ja2RlcCBzcGxhdC4gQW5kIHdlIGNhbid0IHJlbW92ZSB0aGUKPiA+ID4gPiA+
IGFubm90YXRpb25zIGZyb20gcHRlIGludmFsaWRhdGlvbiBhbmQgYWxsIHRoZSBvdGhlciBwbGFj
ZXMgc2luY2UKPiA+ID4gPiA+IHRoZXkncmUgY2FsbGVkIGZyb20gbWFueSBvdGhlciBwbGFjZXMg
dGhhbiBwYWdlIHJlY2xhaW0uIEhlbmNlIHdlIGNhbgo+ID4gPiA+ID4gb25seSBkbyB0aGUgZXF1
aXZhbGVudCBvZiBtaWdodF9sb2NrLCBidXQgb24gdGhlIHJhdyBsb2NrZGVwIG1hcC4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBXaXRoIHRoaXMgd2UgY2FuIGFsc28gcmVtb3ZlIHRoZSBsb2NrZGVwIHBy
aW1pbmcgYWRkZWQgaW4gNjYyMDRmMWQyZDFiCj4gPiA+ID4gPiAoIm1tL21tdV9ub3RpZmllcnM6
IHByaW1lIGxvY2tkZXAiKSBzaW5jZSB0aGUgbmV3IGFubm90YXRpb25zIGFyZQo+ID4gPiA+ID4g
c3RyaWN0bHkgbW9yZSBwb3dlcmZ1bC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiB2MjogUmV2aWV3IGZy
b20gVGhvbWFzIEhlbGxzdHJvbToKPiA+ID4gPiA+IC0gdW5ib3RjaCB0aGUgZnNfcmVjbGFpbSBj
b250ZXh0IGNoZWNrLCBJIGFjY2lkZW50YWxseSBpbnZlcnRlZCBpdCwKPiA+ID4gPiA+ICAgYnV0
IGl0IGRpZG4ndCBibG93IHVwIGJlY2F1c2UgSSBpbnZlcnRlZCBpdCBpbW1lZGlhdGVseQo+ID4g
PiA+ID4gLSBmaXggY29tcGlsaW5nIGZvciAhQ09ORklHX01NVV9OT1RJRklFUgo+ID4gPiA+ID4K
PiA+ID4gPiA+IENjOiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIDx0aG9tYXNfb3NAc2hpcG1h
aWwub3JnPgo+ID4gPiA+ID4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Cj4gPiA+ID4gPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+
ID4gPiA+ID4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+ID4gPiA+ID4gQ2M6IGxpbnV4LXJkbWFA
dmdlci5rZXJuZWwub3JnCj4gPiA+ID4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+ID4gPiA+IENjOiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFJlcGx5
aW5nIHRoZSByaWdodCBwYXRjaCBoZXJlLi4uCj4gPiA+ID4KPiA+ID4gPiBSZXZlcnRpbmcgdGhp
cyBjb21taXQgWzFdIGZpeGVkIHRoZSBsb2NrZGVwIHdhcm5pbmcgYmVsb3cgd2hpbGUgYXBwbHlp
bmcKPiA+ID4gPiBzb21lIG1lbW9yeSBwcmVzc3VyZS4KPiA+ID4gPgo+ID4gPiA+IFsxXSBsaW51
eC1uZXh0IGNiZjdjOWQ4NmQ3NSAoIm1tOiB0cmFjayBtbXUgbm90aWZpZXJzIGluIGZzX3JlY2xh
aW1fYWNxdWlyZS9yZWxlYXNlIikKPiA+ID4KPiA+ID4gSG0sIHRoZW4gSSdtIGNvbmZ1c2VkIGJl
Y2F1c2UKPiA+ID4gLSB0aGVyZSdzIG5vdCBtbXV0IG5vdGlmaWVyIGxvY2tkZXAgbWFwIGluIHRo
ZSBzcGxhdCBhdCBhLi4KPiA+ID4gLSB0aGUgcGF0Y2ggaXMgc3VwcG9zZWQgdG8gbm90IGNoYW5n
ZSBhbnl0aGluZyBmb3IgZnNfcmVjbGFpbSAoYnV0IHRoZQo+ID4gPiBpbnRlcmltIHZlcnNpb24g
Z290IHRoYXQgd3JvbmcpCj4gPiA+IC0gbG9va2luZyBhdCB0aGUgcGF0aHMgaXQncyBrbWFsbG9j
IHZzIGtzd2FwZCwgYm90aCBwbGFjZXMgSSB0b3RhbGx5Cj4gPiA+IGV4cGVjdCBmc19yZWZsYWlt
IHRvIGJlIHVzZWQuCj4gPiA+Cj4gPiA+IEJ1dCB5b3UncmUgY2xhaW1pbmcgcmV2ZXJ0aW5nIHRo
aXMgcHJldmVudHMgdGhlIGxvY2tkZXAgc3BsYXQuIElmCj4gPiA+IHRoYXQncyByaWdodCwgdGhl
biBteSByZWFzb25pbmcgYWJvdmUgaXMgYnJva2VuIHNvbWV3aGVyZS4gU29tZW9uZQo+ID4gPiBs
ZXNzIGJsaW5kIHRoYW4gbWUgaGF2aW5nIGFuIGlkZWE/Cj4gPiA+Cj4gPiA+IEFzaWRlIHRoaXMg
aXMgdGhlIGZpcnN0IGVtYWlsIEkndmUgdHlwZWQsIHVudGlsIEkgcmVhbGl6ZWQgdGhlIGZpcnN0
Cj4gPiA+IHJlcG9ydCB3YXMgYWdhaW5zdCB0aGUgYnJva2VuIHBhdGNoIGFuZCB0aGF0IGxvb2tl
ZCBsaWtlIGEgbXVjaCBtb3JlCj4gPiA+IHJlYXNvbmFibGUgZXhwbGFuYXRpb24gKGJ1dCBkaWRu
J3QgcXVpdGUgbWF0Y2ggdXAgd2l0aCB0aGUgY29kZQo+ID4gPiBwYXRocykuCj4gPgo+ID4gQmVs
b3cgZGlmZiBzaG91bGQgdW5kbyB0aGUgZnVuY3Rpb25hbCBjaGFuZ2UgaW4gbXkgcGF0Y2guIENh
biB5b3UgcGxzIHRlc3QKPiA+IHdoZXRoZXIgdGhlIGxvY2tkZXAgc3BsYXQgaXMgcmVhbGx5IGdv
bmUgd2l0aCB0aGF0PyBNaWdodCBuZWVkIGEgbG90IG9mCj4gPiB0ZXN0aW5nIGFuZCBtZW1vcnkg
cHJlc3N1cmUgdG8gYmUgc3VyZSwgc2luY2UgYWxsIHRoZXNlIHJlY2xhaW0gcGF0aHMKPiA+IGFy
ZW4ndCB2ZXJ5IGRldGVybWluaXN0aWMuCj4KPiBObywgdGhpcyBwYXRjaCBkb2VzIG5vdCBoZWxw
IGJ1dCByZXZlcnRpbmcgdGhlIHdob2xlIHBhdGNoIHN0aWxsIGZpeGVkCj4gdGhlIHNwbGF0LgoK
T2sgSSB0ZXN0ZWQgdGhpcy4gSSBjYW4ndCB1c2UgeW91ciBzY3JpcHQgdG8gcmVwcm8gYmVjYXVz
ZQotIEkgZG9uJ3QgaGF2ZSBhIHNldHVwIHdpdGggeGZzLCBhbmQgdGhlIHNwbGF0IHBvaW50cyBh
dCBhbiBpc3N1ZSBpbiB4ZnMKLSByZXByb2R1Y2luZyBsb2NrZGVwIHNwbGF0cyBpbiBzaHJpbmtl
ciBjYWxsYmFja3MgaXMgYWx3YXlzIGEgYml0IHRyaWNreQoKU28gaW5zdGVhZCBJIG1hZGUgYSBx
dWljayB0ZXN0IHRvIHZhbGlkYXRlIHdoZXRoZXIgdGhlIGZzX3JlY2xhaW0KYW5ub3RhdGlvbnMg
d29yayBjb3JyZWN0bHksIGFuZCBub3RoaW5nIGhhcyBjaGFuZ2VkOgoKKyAgICAgICBwcmludGso
IkdGUF9OT0ZTIGJsb2NrXG4iKTsKKyAgICAgICBmc19yZWNsYWltX2FjcXVpcmUoR0ZQX05PRlMp
OworICAgICAgIHByaW50aygiYWxsb2NhdGUgYXRvbWljXG4iKTsKKyAgICAgICBrZnJlZShrbWFs
bG9jKDE2LCBHRlBfQVRPTUlDKSk7CisgICAgICAgcHJpbnRrKCJhbGxvY2F0ZSBub2lvXG4iKTsK
KyAgICAgICBrZnJlZShrbWFsbG9jKDE2LCBHRlBfTk9JTykpOwoKVGhlIGJlbG93IHR3byBjYWxs
cyB0byBrbWFsbG9jIGFyZSB3cm9uZywgYnV0IHRoZSBjdXJyZW50IGFubm90YXRpb25zCmRvbid0
IHRyYWNrIF9fR0ZQX0lPIGFuZCBvdGhlciBsZXZlbHMsIG9ubHkgX19HRlBfRlMuIFNvIG5vIGxv
Y2tkZXAKc3BsYXRzIGhlcmUuCgorICAgICAgIHByaW50aygiYWxsb2NhdGUgbm9mc1xuIik7Cisg
ICAgICAga2ZyZWUoa21hbGxvYygxNiwgR0ZQX05PRlMpKTsKKyAgICAgICBwcmludGsoImFsbG9j
YXRlIGtlcm5lbFxuIik7CisgICAgICAga2ZyZWUoa21hbGxvYygxNiwgR0ZQX0tFUk5FTCkpOwor
ICAgICAgIGZzX3JlY2xhaW1fcmVsZWFzZShHRlBfTk9GUyk7CisKKworICAgICAgIHByaW50aygi
R0ZQX0tFUk5FTCBibG9ja1xuIik7CisgICAgICAgZnNfcmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJO
RUwpOworICAgICAgIHByaW50aygiYWxsb2NhdGUgYXRvbWljXG4iKTsKKyAgICAgICBrZnJlZShr
bWFsbG9jKDE2LCBHRlBfQVRPTUlDKSk7CisgICAgICAgcHJpbnRrKCJhbGxvY2F0ZSBub2lvXG4i
KTsKKyAgICAgICBrZnJlZShrbWFsbG9jKDE2LCBHRlBfTk9JTykpOworICAgICAgIHByaW50aygi
YWxsb2NhdGUgbm9mc1xuIik7CisgICAgICAga2ZyZWUoa21hbGxvYygxNiwgR0ZQX05PRlMpKTsK
ClRoaXMgYWxsb2NhdGlvbiBpcyBidWdneSwgYW5kIHNob3VsZCBzcGxhdC4gVGhpcyBpcyB0aGUg
Y2FzZSBmb3IgYm90aAp3aXRoIG15IHBhdGNoLCBhbmQgd2l0aCBteSBwYXRjaCByZXZlcnRlZC4K
CisgICAgICAgcHJpbnRrKCJhbGxvY2F0ZSBrZXJuZWxcbiIpOworICAgICAgIGtmcmVlKGttYWxs
b2MoMTYsIEdGUF9LRVJORUwpKTsKKyAgICAgICBmc19yZWNsYWltX3JlbGVhc2UoR0ZQX0tFUk5F
TCk7CgpJIGFsc28gbG9va2VkIGF0IHRoZSBwYXRocyBpbiB5b3VyIGxvY2tkZXAgc3BsYXQgaW4g
eGZzLCB0aGlzIGlzCnNpbXBseSBHRlBfS0VSTkVMIHZzIGEgc2hyaW5rZXIgcmVjbGFpbSBpbiBr
c3dhcGQuCgpTdW1tYXJ5OiBFdmVyeXRoaW5nIGlzIHdvcmtpbmcgYXMgZXhwZWN0ZWQsIHRoZXJl
J3Mgbm8gY2hhbmdlIGluIHRoZQpsb2NrZGVwIGFubm90YXRpb25zLgoKSSByZWFsbHkgdGhpbmsg
dGhlIHByb2JsZW0gaXMgdGhhdCBlaXRoZXIgeW91ciB0ZXN0Y2FzZSBkb2Vzbid0IGhpdAp0aGUg
aXNzdWUgcmVsaWFibHkgZW5vdWdoLCBvciB0aGF0IHlvdSdyZSBub3QgYWN0dWFsbHkgdGVzdGlu
ZyB0aGUKc2FtZSBrZXJuZWxzIGFuZCB0aGVyZSdzIHNvbWUgb3RoZXIgY2hhbmdlcyAoeGZzIG1v
c3QgbGlrZWx5LCBidXQKcmVhbGx5IGl0IGNvdWxkIGJlIGFueXdoZXJlKSB3aGljaCBpcyBjYXVz
aW5nIHRoaXMgcmVncmVzc2lvbi4gSSdtCnJhdGhlciBjb252aW5jZWQgbm93IGFmdGVyIHRoaXMg
dGVzdCB0aGF0IGl0J3Mgbm90IG15IHN0dWZmLgoKVGhhbmtzLCBEYW5pZWwKCj4KPiA+IC1EYW5p
ZWwKPiA+Cj4gPiAtLS0KPiA+IGRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdl
X2FsbG9jLmMKPiA+IGluZGV4IGQ4MDc1ODdjOWFlNi4uMjdlYTc2M2M2MTU1IDEwMDY0NAo+ID4g
LS0tIGEvbW0vcGFnZV9hbGxvYy5jCj4gPiArKysgYi9tbS9wYWdlX2FsbG9jLmMKPiA+IEBAIC00
MTkxLDExICs0MTkxLDYgQEAgdm9pZCBmc19yZWNsYWltX2FjcXVpcmUoZ2ZwX3QgZ2ZwX21hc2sp
Cj4gPiAgICAgICAgICAgICAgIGlmIChnZnBfbWFzayAmIF9fR0ZQX0ZTKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIF9fZnNfcmVjbGFpbV9hY3F1aXJlKCk7Cj4gPgo+ID4gLSNpZmRlZiBDT05G
SUdfTU1VX05PVElGSUVSCj4gPiAtICAgICAgICAgICAgIGxvY2tfbWFwX2FjcXVpcmUoJl9fbW11
X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiA+IC0gICAgICAgICAgICAg
bG9ja19tYXBfcmVsZWFzZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9t
YXApOwo+ID4gLSNlbmRpZgo+ID4gLQo+ID4gICAgICAgfQo+ID4gIH0KPiA+ICBFWFBPUlRfU1lN
Qk9MX0dQTChmc19yZWNsYWltX2FjcXVpcmUpOwo+ID4gLS0KPiA+IERhbmllbCBWZXR0ZXIKPiA+
IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAo=
