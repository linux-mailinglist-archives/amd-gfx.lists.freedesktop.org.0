Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3298B202BF6
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2020 20:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635C86E4A5;
	Sun, 21 Jun 2020 18:07:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2776E48E
 for <amd-gfx@lists.freedesktop.org>; Sun, 21 Jun 2020 18:07:21 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g5so11294385otg.6
 for <amd-gfx@lists.freedesktop.org>; Sun, 21 Jun 2020 11:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hkY+mvVCSNUqnU46JQUcfldcUr2AblQrljsgQbEmFDY=;
 b=CWaJNI9mIAy3B+kUqv8vpMwVavGoJLNUSH2+wG8sy2rPcWNUL2zeJsqNCxNFpN/eHN
 6xjlZE6koJI+BQizXMdKHb+YU0i38lFuzso810CO8dISil870kOQ5f/gCi0Oeju0jqVo
 bmOTmmzTHnqSevuQlYpUUeiM8NdRSH7Kh7joA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hkY+mvVCSNUqnU46JQUcfldcUr2AblQrljsgQbEmFDY=;
 b=qXFRYbnEJZmStJ/0BeOUqqwK65LzM9QPbNhZBWUjFJbb/UKSJlisebhaz4wPKplj+j
 EKEM7h9yjvWkhlCzq7TWnxgpyz1Rf78mg68OIpcOM43tqIB2RG2gPVP2SiuQe6ParY+A
 ZqnqPSXCas3SrTlTCoAdQwwWYG9WD6rkFNq2zhmoFwozDorXrkFi1rFHn72zoLcaoc4Z
 Rvyv5tN+Hjtw56paBXJNcbHYuwbjHXBRlWSSfNow0q6AO0A5620PHL6YzYgb+W4GxSBH
 apnEs+Z/4LCJHHpjdNw9zRXjdtEHmQHI3rRQvBSVNfKOa5TGdCA6RSt3EfcTg0rF5Gal
 hhOw==
X-Gm-Message-State: AOAM530v4o9H0Rw+tbnbB7e9igfJgmjvmN5GoTHzOgCxD9hlCB0uq3aQ
 RyD+aC5K7El68nFnBcsYxne+H03S6MabKvGHOE8QVg==
X-Google-Smtp-Source: ABdhPJxENNk3MwbwQ/5c167pIosbYZuOnF6zwm9j9k2BsCK5QyUv1YoGN8bmgp/WhWBGTzFBeCwGQuGoW7D5Sh86lkU=
X-Received: by 2002:a9d:4cd:: with SMTP id 71mr11920168otm.188.1592762839637; 
 Sun, 21 Jun 2020 11:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-2-daniel.vetter@ffwll.ch>
 <20200610194101.1668038-1-daniel.vetter@ffwll.ch>
 <20200621174205.GB1398@lca.pw>
In-Reply-To: <20200621174205.GB1398@lca.pw>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 21 Jun 2020 20:07:08 +0200
Message-ID: <CAKMK7uFZAFVmceoYvqPovOifGw_Y8Ey-OMy6wioMjwPWhu9dDg@mail.gmail.com>
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

T24gU3VuLCBKdW4gMjEsIDIwMjAgYXQgNzo0MiBQTSBRaWFuIENhaSA8Y2FpQGxjYS5wdz4gd3Jv
dGU6Cj4KPiBPbiBXZWQsIEp1biAxMCwgMjAyMCBhdCAwOTo0MTowMVBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gZnNfcmVjbGFpbV9hY3F1aXJlL3JlbGVhc2UgbmljZWx5IGNhdGNo
IHJlY3Vyc2lvbiBpc3N1ZXMgd2hlbgo+ID4gYWxsb2NhdGluZyBHRlBfS0VSTkVMIG1lbW9yeSBh
Z2FpbnN0IHNocmlua2VycyAod2hpY2ggZ3B1IGRyaXZlcnMgdGVuZAo+ID4gdG8gdXNlIHRvIGtl
ZXAgdGhlIGV4Y2Vzc2l2ZSBjYWNoZXMgaW4gY2hlY2spLiBGb3IgbW11IG5vdGlmaWVyCj4gPiBy
ZWN1cnNpb25zIHdlIGRvIGhhdmUgbG9ja2RlcCBhbm5vdGF0aW9ucyBzaW5jZSAyM2I2ODM5NWM3
YzcKPiA+ICgibW0vbW11X25vdGlmaWVyczogYWRkIGEgbG9ja2RlcCBtYXAgZm9yIGludmFsaWRh
dGVfcmFuZ2Vfc3RhcnQvZW5kIikuCj4gPgo+ID4gQnV0IHRoZXNlIG9ubHkgZmlyZSBpZiBhIHBh
dGggYWN0dWFsbHkgcmVzdWx0cyBpbiBzb21lIHB0ZQo+ID4gaW52YWxpZGF0aW9uIC0gZm9yIG1v
c3Qgc21hbGwgYWxsb2NhdGlvbnMgdGhhdCdzIHZlcnkgcmFyZWx5IHRoZSBjYXNlLgo+ID4gVGhl
IG90aGVyIHRyb3VibGUgaXMgdGhhdCBwdGUgaW52YWxpZGF0aW9uIGNhbiBoYXBwZW4gYW55IHRp
bWUgd2hlbgo+ID4gX19HRlBfUkVDTEFJTSBpcyBzZXQuIFdoaWNoIG1lYW5zIG9ubHkgcmVhbGx5
IEdGUF9BVE9NSUMgaXMgYSBzYWZlCj4gPiBjaG9pY2UsIEdGUF9OT0lPIGlzbid0IGdvb2QgZW5v
dWdoIHRvIGF2b2lkIHBvdGVudGlhbCBtbXUgbm90aWZpZXIKPiA+IHJlY3Vyc2lvbi4KPiA+Cj4g
PiBJIHdhcyBwb25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQganVzdCBkbyB0aGUgZ2VuZXJhbCBh
bm5vdGF0aW9uLCBidXQKPiA+IHRoZXJlJ3MgYWx3YXlzIHRoZSByaXNrIGZvciBmYWxzZSBwb3Np
dGl2ZXMuIFBsdXMgSSdtIGFzc3VtaW5nIHRoYXQKPiA+IHRoZSBjb3JlIGZzIGFuZCBpbyBjb2Rl
IGlzIGEgbG90IGJldHRlciByZXZpZXdlZCBhbmQgdGVzdGVkIHRoYW4KPiA+IHJhbmRvbSBtbXUg
bm90aWZpZXIgY29kZSBpbiBkcml2ZXJzLiBIZW5jZSB3aHkgSSBkZWNpZGUgdG8gb25seQo+ID4g
YW5ub3RhdGUgZm9yIHRoYXQgc3BlY2lmaWMgY2FzZS4KPiA+Cj4gPiBGdXJ0aGVybW9yZSBldmVu
IGlmIHdlJ2QgY3JlYXRlIGEgbG9ja2RlcCBtYXAgZm9yIGRpcmVjdCByZWNsYWltLCB3ZSdkCj4g
PiBzdGlsbCBuZWVkIHRvIGV4cGxpY2l0IHB1bGwgaW4gdGhlIG1tdSBub3RpZmllciBtYXAgLSB0
aGVyZSdzIGEgbG90Cj4gPiBtb3JlIHBsYWNlcyB0aGF0IGRvIHB0ZSBpbnZhbGlkYXRpb24gdGhh
biBqdXN0IGRpcmVjdCByZWNsYWltLCB0aGVzZQo+ID4gdHdvIGNvbnRleHRzIGFyZW50IHRoZSBz
YW1lLgo+ID4KPiA+IE5vdGUgdGhhdCB0aGUgbW11IG5vdGlmaWVycyBuZWVkaW5nIHRoZWlyIG93
biBpbmRlcGVuZGVudCBsb2NrZGVwIG1hcAo+ID4gaXMgYWxzbyB0aGUgcmVhc29uIHdlIGNhbid0
IGhvbGQgdGhlbSBmcm9tIGZzX3JlY2xhaW1fYWNxdWlyZSB0bwo+ID4gZnNfcmVjbGFpbV9yZWxl
YXNlIC0gaXQgd291bGQgbmVzdCB3aXRoIHRoZSBhY3F1aXN0aW9uIGluIHRoZSBwdGUKPiA+IGlu
dmFsaWRhdGlvbiBjb2RlLCBjYXVzaW5nIGEgbG9ja2RlcCBzcGxhdC4gQW5kIHdlIGNhbid0IHJl
bW92ZSB0aGUKPiA+IGFubm90YXRpb25zIGZyb20gcHRlIGludmFsaWRhdGlvbiBhbmQgYWxsIHRo
ZSBvdGhlciBwbGFjZXMgc2luY2UKPiA+IHRoZXkncmUgY2FsbGVkIGZyb20gbWFueSBvdGhlciBw
bGFjZXMgdGhhbiBwYWdlIHJlY2xhaW0uIEhlbmNlIHdlIGNhbgo+ID4gb25seSBkbyB0aGUgZXF1
aXZhbGVudCBvZiBtaWdodF9sb2NrLCBidXQgb24gdGhlIHJhdyBsb2NrZGVwIG1hcC4KPiA+Cj4g
PiBXaXRoIHRoaXMgd2UgY2FuIGFsc28gcmVtb3ZlIHRoZSBsb2NrZGVwIHByaW1pbmcgYWRkZWQg
aW4gNjYyMDRmMWQyZDFiCj4gPiAoIm1tL21tdV9ub3RpZmllcnM6IHByaW1lIGxvY2tkZXAiKSBz
aW5jZSB0aGUgbmV3IGFubm90YXRpb25zIGFyZQo+ID4gc3RyaWN0bHkgbW9yZSBwb3dlcmZ1bC4K
PiA+Cj4gPiB2MjogUmV2aWV3IGZyb20gVGhvbWFzIEhlbGxzdHJvbToKPiA+IC0gdW5ib3RjaCB0
aGUgZnNfcmVjbGFpbSBjb250ZXh0IGNoZWNrLCBJIGFjY2lkZW50YWxseSBpbnZlcnRlZCBpdCwK
PiA+ICAgYnV0IGl0IGRpZG4ndCBibG93IHVwIGJlY2F1c2UgSSBpbnZlcnRlZCBpdCBpbW1lZGlh
dGVseQo+ID4gLSBmaXggY29tcGlsaW5nIGZvciAhQ09ORklHX01NVV9OT1RJRklFUgo+ID4KPiA+
IENjOiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPgo+
ID4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiBDYzog
SmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gQ2M6IGxpbnV4LW1tQGt2YWNr
Lm9yZwo+ID4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCj4gPiBDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPgo+IFJlcGx5aW5nIHRo
ZSByaWdodCBwYXRjaCBoZXJlLi4uCj4KPiBSZXZlcnRpbmcgdGhpcyBjb21taXQgWzFdIGZpeGVk
IHRoZSBsb2NrZGVwIHdhcm5pbmcgYmVsb3cgd2hpbGUgYXBwbHlpbmcKPiBzb21lIG1lbW9yeSBw
cmVzc3VyZS4KPgo+IFsxXSBsaW51eC1uZXh0IGNiZjdjOWQ4NmQ3NSAoIm1tOiB0cmFjayBtbXUg
bm90aWZpZXJzIGluIGZzX3JlY2xhaW1fYWNxdWlyZS9yZWxlYXNlIikKCkhtLCB0aGVuIEknbSBj
b25mdXNlZCBiZWNhdXNlCi0gdGhlcmUncyBub3QgbW11dCBub3RpZmllciBsb2NrZGVwIG1hcCBp
biB0aGUgc3BsYXQgYXQgYS4uCi0gdGhlIHBhdGNoIGlzIHN1cHBvc2VkIHRvIG5vdCBjaGFuZ2Ug
YW55dGhpbmcgZm9yIGZzX3JlY2xhaW0gKGJ1dCB0aGUKaW50ZXJpbSB2ZXJzaW9uIGdvdCB0aGF0
IHdyb25nKQotIGxvb2tpbmcgYXQgdGhlIHBhdGhzIGl0J3Mga21hbGxvYyB2cyBrc3dhcGQsIGJv
dGggcGxhY2VzIEkgdG90YWxseQpleHBlY3QgZnNfcmVmbGFpbSB0byBiZSB1c2VkLgoKQnV0IHlv
dSdyZSBjbGFpbWluZyByZXZlcnRpbmcgdGhpcyBwcmV2ZW50cyB0aGUgbG9ja2RlcCBzcGxhdC4g
SWYKdGhhdCdzIHJpZ2h0LCB0aGVuIG15IHJlYXNvbmluZyBhYm92ZSBpcyBicm9rZW4gc29tZXdo
ZXJlLiBTb21lb25lCmxlc3MgYmxpbmQgdGhhbiBtZSBoYXZpbmcgYW4gaWRlYT8KCkFzaWRlIHRo
aXMgaXMgdGhlIGZpcnN0IGVtYWlsIEkndmUgdHlwZWQsIHVudGlsIEkgcmVhbGl6ZWQgdGhlIGZp
cnN0CnJlcG9ydCB3YXMgYWdhaW5zdCB0aGUgYnJva2VuIHBhdGNoIGFuZCB0aGF0IGxvb2tlZCBs
aWtlIGEgbXVjaCBtb3JlCnJlYXNvbmFibGUgZXhwbGFuYXRpb24gKGJ1dCBkaWRuJ3QgcXVpdGUg
bWF0Y2ggdXAgd2l0aCB0aGUgY29kZQpwYXRocykuCgpUaGFua3MsIERhbmllbAoKCj4KPiBbICAx
OTAuNDU1MDAzXVsgIFQzNjldIFdBUk5JTkc6IHBvc3NpYmxlIGNpcmN1bGFyIGxvY2tpbmcgZGVw
ZW5kZW5jeSBkZXRlY3RlZAo+IFsgIDE5MC40ODcyOTFdWyAgVDM2OV0gNS44LjAtcmMxLW5leHQt
MjAyMDA2MjEgIzEgTm90IHRhaW50ZWQKPiBbICAxOTAuNTEyMzYzXVsgIFQzNjldIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFsgIDE5MC41
NDMzNTRdWyAgVDM2OV0ga3N3YXBkMy8zNjkgaXMgdHJ5aW5nIHRvIGFjcXVpcmUgbG9jazoKPiBb
ICAxOTAuNTY4NTIzXVsgIFQzNjldIGZmZmY4ODlmY2Y2OTQ1MjggKCZ4ZnNfbm9uZGlyX2lsb2Nr
X2NsYXNzKXsrKysrfS17MzozfSwgYXQ6IHhmc19yZWNsYWltX2lub2RlKzB4ZGYvMHg4NjAKPiBz
cGluX2xvY2sgYXQgaW5jbHVkZS9saW51eC9zcGlubG9jay5oOjM1Mwo+IChpbmxpbmVkIGJ5KSB4
ZnNfaWZsYWdzX3Rlc3RfYW5kX3NldCBhdCBmcy94ZnMveGZzX2lub2RlLmg6MTY2Cj4gKGlubGlu
ZWQgYnkpIHhmc19pZmxvY2tfbm93YWl0IGF0IGZzL3hmcy94ZnNfaW5vZGUuaDoyNDkKPiAoaW5s
aW5lZCBieSkgeGZzX3JlY2xhaW1faW5vZGUgYXQgZnMveGZzL3hmc19pY2FjaGUuYzoxMTI3Cj4g
WyAgMTkwLjYxNDM1OV1bICBUMzY5XQo+IFsgIDE5MC42MTQzNTldWyAgVDM2OV0gYnV0IHRhc2sg
aXMgYWxyZWFkeSBob2xkaW5nIGxvY2s6Cj4gWyAgMTkwLjY0Nzc2M11bICBUMzY5XSBmZmZmZmZm
ZmI1MGNlZDAwIChmc19yZWNsYWltKXsrLisufS17MDowfSwgYXQ6IF9fZnNfcmVjbGFpbV9hY3F1
aXJlKzB4MC8weDMwCj4gX19mc19yZWNsYWltX2FjcXVpcmUgYXQgbW0vcGFnZV9hbGxvYy5jOjQy
MDAKPiBbICAxOTAuNjg3ODQ1XVsgIFQzNjldCj4gWyAgMTkwLjY4Nzg0NV1bICBUMzY5XSB3aGlj
aCBsb2NrIGFscmVhZHkgZGVwZW5kcyBvbiB0aGUgbmV3IGxvY2suCj4gWyAgMTkwLjY4Nzg0NV1b
ICBUMzY5XQo+IFsgIDE5MC43MzQ4OTBdWyAgVDM2OV0KPiBbICAxOTAuNzM0ODkwXVsgIFQzNjld
IHRoZSBleGlzdGluZyBkZXBlbmRlbmN5IGNoYWluIChpbiByZXZlcnNlIG9yZGVyKSBpczoKPiBb
ICAxOTAuNzc1OTkxXVsgIFQzNjldCj4gWyAgMTkwLjc3NTk5MV1bICBUMzY5XSAtPiAjMSAoZnNf
cmVjbGFpbSl7Ky4rLn0tezA6MH06Cj4gWyAgMTkwLjgwODE1MF1bICBUMzY5XSAgICAgICAgZnNf
cmVjbGFpbV9hY3F1aXJlKzB4NzcvMHg4MAo+IFsgIDE5MC44MzIxNTJdWyAgVDM2OV0gICAgICAg
IHNsYWJfcHJlX2FsbG9jX2hvb2suY29uc3Rwcm9wLjUyKzB4MjAvMHgxMjAKPiBzbGFiX3ByZV9h
bGxvY19ob29rIGF0IG1tL3NsYWIuaDo1MDcKPiBbICAxOTAuODYyMTczXVsgIFQzNjldICAgICAg
ICBrbWVtX2NhY2hlX2FsbG9jKzB4NDMvMHgyYTAKPiBbICAxOTAuODg1NjAyXVsgIFQzNjldICAg
ICAgICBrbWVtX3pvbmVfYWxsb2MrMHgxMTMvMHgzZWYKPiBrbWVtX3pvbmVfYWxsb2MgYXQgZnMv
eGZzL2ttZW0uYzoxMjkKPiBbICAxOTAuOTA4NzAyXVsgIFQzNjldICAgICAgICB4ZnNfaW5vZGVf
aXRlbV9pbml0KzB4MWQvMHhhMAo+IHhmc19pbm9kZV9pdGVtX2luaXQgYXQgZnMveGZzL3hmc19p
bm9kZV9pdGVtLmM6NjM5Cj4gWyAgMTkwLjkzNDQ2MV1bICBUMzY5XSAgICAgICAgeGZzX3RyYW5z
X2lqb2luKzB4OTYvMHgxMDAKPiB4ZnNfdHJhbnNfaWpvaW4gYXQgZnMveGZzL2xpYnhmcy94ZnNf
dHJhbnNfaW5vZGUuYzozNAo+IFsgIDE5MC45NjE1MzBdWyAgVDM2OV0gICAgICAgIHhmc19zZXRh
dHRyX25vbnNpemUrMHgxYTYvMHhjZDAKPiB4ZnNfc2V0YXR0cl9ub25zaXplIGF0IGZzL3hmcy94
ZnNfaW9wcy5jOjcxNgo+IFsgIDE5MC45ODczMzFdWyAgVDM2OV0gICAgICAgIHhmc192bl9zZXRh
dHRyKzB4MTMzLzB4MTYwCj4geGZzX3ZuX3NldGF0dHIgYXQgZnMveGZzL3hmc19pb3BzLmM6MTA4
MQo+IFsgIDE5MS4wMTA0NzZdWyAgVDM2OV0gICAgICAgIG5vdGlmeV9jaGFuZ2UrMHg2YzUvMHhi
YTEKPiBub3RpZnlfY2hhbmdlIGF0IGZzL2F0dHIuYzozMzYKPiBbICAxOTEuMDMzMzE3XVsgIFQz
NjldICAgICAgICBjaG1vZF9jb21tb24rMHgxOWIvMHgzOTAKPiBbICAxOTEuMDU1NzcwXVsgIFQz
NjldICAgICAgICBrc3lzX2ZjaG1vZCsweDI4LzB4NjAKPiBbICAxOTEuMDc3OTU3XVsgIFQzNjld
ICAgICAgICBfX3g2NF9zeXNfZmNobW9kKzB4NGUvMHg3MAo+IFsgIDE5MS4xMDI3NjddWyAgVDM2
OV0gICAgICAgIGRvX3N5c2NhbGxfNjQrMHg1Zi8weDMxMAo+IFsgIDE5MS4xMjUwOTBdWyAgVDM2
OV0gICAgICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPiBbICAx
OTEuMTUzNzQ5XVsgIFQzNjldCj4gWyAgMTkxLjE1Mzc0OV1bICBUMzY5XSAtPiAjMCAoJnhmc19u
b25kaXJfaWxvY2tfY2xhc3MpeysrKyt9LXszOjN9Ogo+IFsgIDE5MS4xOTEyNjddWyAgVDM2OV0g
ICAgICAgIF9fbG9ja19hY3F1aXJlKzB4MmVmYy8weDRkYTAKPiBbICAxOTEuMjE1OTc0XVsgIFQz
NjldICAgICAgICBsb2NrX2FjcXVpcmUrMHgxYWMvMHhhZjAKPiBbICAxOTEuMjM4OTUzXVsgIFQz
NjldICAgICAgICBkb3duX3dyaXRlX25lc3RlZCsweDkyLzB4MTUwCj4gWyAgMTkxLjI2Mjk1NV1b
ICBUMzY5XSAgICAgICAgeGZzX3JlY2xhaW1faW5vZGUrMHhkZi8weDg2MAo+IFsgIDE5MS4yODcx
NDldWyAgVDM2OV0gICAgICAgIHhmc19yZWNsYWltX2lub2Rlc19hZysweDUwNS8weGIwMAo+IFsg
IDE5MS4zMTMyOTFdWyAgVDM2OV0gICAgICAgIHhmc19yZWNsYWltX2lub2Rlc19ucisweDkzLzB4
ZDAKPiBbICAxOTEuMzM4MzU3XVsgIFQzNjldICAgICAgICBzdXBlcl9jYWNoZV9zY2FuKzB4MmZk
LzB4NDMwCj4gWyAgMTkxLjM2MjM1NF1bICBUMzY5XSAgICAgICAgZG9fc2hyaW5rX3NsYWIrMHgz
MTcvMHg5OTAKPiBbICAxOTEuMzg1MzQxXVsgIFQzNjldICAgICAgICBzaHJpbmtfc2xhYisweDNh
OC8weDRiMAo+IFsgIDE5MS40MDcyMTRdWyAgVDM2OV0gICAgICAgIHNocmlua19ub2RlKzB4NDlj
LzB4MTdiMAo+IFsgIDE5MS40Mjk4NDFdWyAgVDM2OV0gICAgICAgIGJhbGFuY2VfcGdkYXQrMHg1
OWMvMHhlZDAKPiBbICAxOTEuNDU1MDQxXVsgIFQzNjldICAgICAgICBrc3dhcGQrMHg1YTQvMHhj
NDAKPiBbICAxOTEuNDc3NTI0XVsgIFQzNjldICAgICAgICBrdGhyZWFkKzB4MzU4LzB4NDIwCj4g
WyAgMTkxLjQ5OTI4NV1bICBUMzY5XSAgICAgICAgcmV0X2Zyb21fZm9yaysweDIyLzB4MzAKPiBb
ICAxOTEuNTIxMTA3XVsgIFQzNjldCj4gWyAgMTkxLjUyMTEwN11bICBUMzY5XSBvdGhlciBpbmZv
IHRoYXQgbWlnaHQgaGVscCB1cyBkZWJ1ZyB0aGlzOgo+IFsgIDE5MS41MjExMDddWyAgVDM2OV0K
PiBbICAxOTEuNTY3NDkwXVsgIFQzNjldICBQb3NzaWJsZSB1bnNhZmUgbG9ja2luZyBzY2VuYXJp
bzoKPiBbICAxOTEuNTY3NDkwXVsgIFQzNjldCj4gWyAgMTkxLjYwMDk0N11bICBUMzY5XSAgICAg
ICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgQ1BVMQo+IFsgIDE5MS42MjQ4MDhdWyAgVDM2OV0g
ICAgICAgIC0tLS0gICAgICAgICAgICAgICAgICAgIC0tLS0KPiBbICAxOTEuNjQ5MjM2XVsgIFQz
NjldICAgbG9jayhmc19yZWNsYWltKTsKPiBbICAxOTEuNjY3NjA3XVsgIFQzNjldICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsb2NrKCZ4ZnNfbm9uZGlyX2lsb2NrX2NsYXNzKTsKPiBb
ICAxOTEuNzAyMDk2XVsgIFQzNjldICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2Nr
KGZzX3JlY2xhaW0pOwo+IFsgIDE5MS43MzEyNDNdWyAgVDM2OV0gICBsb2NrKCZ4ZnNfbm9uZGly
X2lsb2NrX2NsYXNzKTsKPiBbICAxOTEuNzU0MDI1XVsgIFQzNjldCj4gWyAgMTkxLjc1NDAyNV1b
ICBUMzY5XSAgKioqIERFQURMT0NLICoqKgo+IFsgIDE5MS43NTQwMjVdWyAgVDM2OV0KPiBbICAx
OTEuNzkxMTI2XVsgIFQzNjldIDQgbG9ja3MgaGVsZCBieSBrc3dhcGQzLzM2OToKPiBbICAxOTEu
ODEyMTk4XVsgIFQzNjldICAjMDogZmZmZmZmZmZiNTBjZWQwMCAoZnNfcmVjbGFpbSl7Ky4rLn0t
ezA6MH0sIGF0OiBfX2ZzX3JlY2xhaW1fYWNxdWlyZSsweDAvMHgzMAo+IFsgIDE5MS44NTQzMTld
WyAgVDM2OV0gICMxOiBmZmZmZmZmZmI1MDc0YzUwIChzaHJpbmtlcl9yd3NlbSl7KysrK30tezM6
M30sIGF0OiBzaHJpbmtfc2xhYisweDIxOS8weDRiMAo+IFsgIDE5MS44OTYwNDNdWyAgVDM2OV0g
ICMyOiBmZmZmODg5MDI3OWI0MGUwICgmdHlwZS0+c191bW91bnRfa2V5IzI3KXsrKysrfS17Mzoz
fSwgYXQ6IHRyeWxvY2tfc3VwZXIrMHgxMS8weGIwCj4gWyAgMTkxLjk0MDUzOF1bICBUMzY5XSAg
IzM6IGZmZmY4ODkwMjdhNzNhMjggKCZwYWctPnBhZ19pY2lfcmVjbGFpbV9sb2NrKXsrLisufS17
MzozfSwgYXQ6IHhmc19yZWNsYWltX2lub2Rlc19hZysweDEzNS8weGIwMAo+IFsgIDE5MS45OTUz
MTRdWyAgVDM2OV0KPiBbICAxOTEuOTk1MzE0XVsgIFQzNjldIHN0YWNrIGJhY2t0cmFjZToKPiBb
ICAxOTIuMDIyOTM0XVsgIFQzNjldIENQVTogNDIgUElEOiAzNjkgQ29tbToga3N3YXBkMyBOb3Qg
dGFpbnRlZCA1LjguMC1yYzEtbmV4dC0yMDIwMDYyMSAjMQo+IFsgIDE5Mi4wNjA1NDZdWyAgVDM2
OV0gSGFyZHdhcmUgbmFtZTogSFAgUHJvTGlhbnQgQkw2NjBjIEdlbjksIEJJT1MgSTM4IDEwLzE3
LzIwMTgKPiBbICAxOTIuMDk0NTE4XVsgIFQzNjldIENhbGwgVHJhY2U6Cj4gWyAgMTkyLjEwOTAw
NV1bICBUMzY5XSAgZHVtcF9zdGFjaysweDlkLzB4ZTAKPiBbICAxOTIuMTI3NDY4XVsgIFQzNjld
ICBjaGVja19ub25jaXJjdWxhcisweDM0Ny8weDQwMAo+IFsgIDE5Mi4xNDk1MjZdWyAgVDM2OV0g
ID8gcHJpbnRfY2lyY3VsYXJfYnVnKzB4MzYwLzB4MzYwCj4gWyAgMTkyLjE3MjU4NF1bICBUMzY5
XSAgPyBmcmVlemluZ19zbG93X3BhdGguY29sZC4yKzB4MmEvMHgyYQo+IFsgIDE5Mi4xOTcyNTFd
WyAgVDM2OV0gIF9fbG9ja19hY3F1aXJlKzB4MmVmYy8weDRkYTAKPiBbICAxOTIuMjE4NzM3XVsg
IFQzNjldICA/IGxvY2tkZXBfaGFyZGlycXNfb25fcHJlcGFyZSsweDU1MC8weDU1MAo+IFsgIDE5
Mi4yNDY3MzZdWyAgVDM2OV0gID8gX19sb2NrX2FjcXVpcmUrMHgzNTQxLzB4NGRhMAo+IFsgIDE5
Mi4yNjk2NzNdWyAgVDM2OV0gIGxvY2tfYWNxdWlyZSsweDFhYy8weGFmMAo+IFsgIDE5Mi4yOTAx
OTJdWyAgVDM2OV0gID8geGZzX3JlY2xhaW1faW5vZGUrMHhkZi8weDg2MAo+IFsgIDE5Mi4zMTMx
NThdWyAgVDM2OV0gID8gcmN1X3JlYWRfdW5sb2NrKzB4NTAvMHg1MAo+IFsgIDE5Mi4zMzUwNTdd
WyAgVDM2OV0gIGRvd25fd3JpdGVfbmVzdGVkKzB4OTIvMHgxNTAKPiBbICAxOTIuMzU4NDA5XVsg
IFQzNjldICA/IHhmc19yZWNsYWltX2lub2RlKzB4ZGYvMHg4NjAKPiBbICAxOTIuMzgwODkwXVsg
IFQzNjldICA/IHJ3c2VtX2Rvd25fd3JpdGVfc2xvd3BhdGgrMHhmNTAvMHhmNTAKPiBbICAxOTIu
NDA2ODkxXVsgIFQzNjldICA/IGZpbmRfaGVsZF9sb2NrKzB4MzMvMHgxYzAKPiBbICAxOTIuNDI3
OTI1XVsgIFQzNjldICA/IHhmc19pbG9jaysweDJlZi8weDM3MAo+IFsgIDE5Mi40NDc0OTZdWyAg
VDM2OV0gID8geGZzX3JlY2xhaW1faW5vZGUrMHhkZi8weDg2MAo+IFsgIDE5Mi40NzIzMTVdWyAg
VDM2OV0gIHhmc19yZWNsYWltX2lub2RlKzB4ZGYvMHg4NjAKPiBbICAxOTIuNDk2NjQ5XVsgIFQz
NjldICA/IHhmc19pbm9kZV9jbGVhcl9yZWNsYWltX3RhZysweGEwLzB4YTAKPiBbICAxOTIuNTI0
MTg4XVsgIFQzNjldICA/IGRvX3Jhd19zcGluX3VubG9jaysweDRmLzB4MjUwCj4gWyAgMTkyLjU0
Njg1Ml1bICBUMzY5XSAgeGZzX3JlY2xhaW1faW5vZGVzX2FnKzB4NTA1LzB4YjAwCj4gWyAgMTky
LjU3MDQ3M11bICBUMzY5XSAgPyB4ZnNfcmVjbGFpbV9pbm9kZSsweDg2MC8weDg2MAo+IFsgIDE5
Mi41OTI2OTJdWyAgVDM2OV0gID8gbWFya19oZWxkX2xvY2tzKzB4YjAvMHgxMTAKPiBbICAxOTIu
NjE0Mjg3XVsgIFQzNjldICA/IGxvY2tkZXBfaGFyZGlycXNfb25fcHJlcGFyZSsweDM4Yy8weDU1
MAo+IFsgIDE5Mi42NDA4MDBdWyAgVDM2OV0gID8gX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3Jl
KzB4MzkvMHg0MAo+IFsgIDE5Mi42NjY2OTVdWyAgVDM2OV0gID8gdHJ5X3RvX3dha2VfdXArMHhj
Zi8weGY0MAo+IFsgIDE5Mi42ODgyNjVdWyAgVDM2OV0gID8gbWlncmF0ZV9zd2FwX3N0b3ArMHhj
MTAvMHhjMTAKPiBbICAxOTIuNzExOTY2XVsgIFQzNjldICA/IGRvX3Jhd19zcGluX3VubG9jaysw
eDRmLzB4MjUwCj4gWyAgMTkyLjczNTAzMl1bICBUMzY5XSAgeGZzX3JlY2xhaW1faW5vZGVzX25y
KzB4OTMvMHhkMAo+IHhmc19yZWNsYWltX2lub2Rlc19uciBhdCBmcy94ZnMveGZzX2ljYWNoZS5j
OjEzOTkKPiBbICAxOTIuNzU3Njc0XVsgIFQzNjldICA/IHhmc19yZWNsYWltX2lub2RlcysweDkw
LzB4OTAKPiBbICAxOTIuNzgwMDI4XVsgIFQzNjldICA/IGxpc3RfbHJ1X2NvdW50X29uZSsweDE3
Ny8weDMwMAo+IFsgIDE5Mi44MDMwMTBdWyAgVDM2OV0gIHN1cGVyX2NhY2hlX3NjYW4rMHgyZmQv
MHg0MzAKPiBzdXBlcl9jYWNoZV9zY2FuIGF0IGZzL3N1cGVyLmM6MTE1Cj4gWyAgMTkyLjgyNDQ5
MV1bICBUMzY5XSAgZG9fc2hyaW5rX3NsYWIrMHgzMTcvMHg5OTAKPiBkb19zaHJpbmtfc2xhYiBh
dCBtbS92bXNjYW4uYzo1MTQKPiBbICAxOTIuODQ1MTYwXVsgIFQzNjldICBzaHJpbmtfc2xhYisw
eDNhOC8weDRiMAo+IHNocmlua19zbGFiX21lbWNnIGF0IG1tL3Ztc2Nhbi5jOjU4NAo+IChpbmxp
bmVkIGJ5KSBzaHJpbmtfc2xhYiBhdCBtbS92bXNjYW4uYzo2NjIKPiBbICAxOTIuODY0NzIyXVsg
IFQzNjldICA/IGRvX3Nocmlua19zbGFiKzB4OTkwLzB4OTkwCj4gWyAgMTkyLjg4NjEzN11bICBU
MzY5XSAgPyByY3VfaXNfd2F0Y2hpbmcrMHgyYy8weDgwCj4gWyAgMTkyLjkwNzI4OV1bICBUMzY5
XSAgPyBtZW1fY2dyb3VwX3Byb3RlY3RlZCsweDIyOC8weDQ3MAo+IFsgIDE5Mi45MzExNjZdWyAg
VDM2OV0gID8gdm1wcmVzc3VyZSsweDI1LzB4MjkwCj4gWyAgMTkyLjk1MDU5NV1bICBUMzY5XSAg
c2hyaW5rX25vZGUrMHg0OWMvMHgxN2IwCj4gWyAgMTkyLjk3MjMzMl1bICBUMzY5XSAgYmFsYW5j
ZV9wZ2RhdCsweDU5Yy8weGVkMAo+IGtzd2FwZF9zaHJpbmtfbm9kZSBhdCBtbS92bXNjYW4uYzoz
NTIxCj4gKGlubGluZWQgYnkpIGJhbGFuY2VfcGdkYXQgYXQgbW0vdm1zY2FuLmM6MzY3MAo+IFsg
IDE5Mi45OTQ5MThdWyAgVDM2OV0gID8gX19ub2RlX3JlY2xhaW0rMHg5NTAvMHg5NTAKPiBbICAx
OTMuMDE4NjI1XVsgIFQzNjldICA/IGxvY2tkZXBfaGFyZGlycXNfb25fcHJlcGFyZSsweDM4Yy8w
eDU1MAo+IFsgIDE5My4wNDY1NjZdWyAgVDM2OV0gID8gX3Jhd19zcGluX3VubG9ja19pcnErMHgx
Zi8weDMwCj4gWyAgMTkzLjA3MDIxNF1bICBUMzY5XSAgPyBfcmF3X3NwaW5fdW5sb2NrX2lycSsw
eDFmLzB4MzAKPiBbICAxOTMuMDkzMTc2XVsgIFQzNjldICA/IGZpbmlzaF90YXNrX3N3aXRjaCsw
eDEyOS8weDY1MAo+IFsgIDE5My4xMTYyMjVdWyAgVDM2OV0gID8gZmluaXNoX3Rhc2tfc3dpdGNo
KzB4ZjIvMHg2NTAKPiBbICAxOTMuMTM4ODA5XVsgIFQzNjldICA/IHJjdV9yZWFkX2xvY2tfYmhf
aGVsZCsweGMwLzB4YzAKPiBbICAxOTMuMTYzMzIzXVsgIFQzNjldICBrc3dhcGQrMHg1YTQvMHhj
NDAKPiBbICAxOTMuMTgyNjkwXVsgIFQzNjldICA/IF9fa3RocmVhZF9wYXJrbWUrMHg0ZC8weDFh
MAo+IFsgIDE5My4yMDQ2NjBdWyAgVDM2OV0gID8gYmFsYW5jZV9wZ2RhdCsweGVkMC8weGVkMAo+
IFsgIDE5My4yMjU3NzZdWyAgVDM2OV0gID8gX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKzB4
MzkvMHg0MAo+IFsgIDE5My4yNTIzMDZdWyAgVDM2OV0gID8gZmluaXNoX3dhaXQrMHgyNzAvMHgy
NzAKPiBbICAxOTMuMjcyNDczXVsgIFQzNjldICA/IF9fa3RocmVhZF9wYXJrbWUrMHg0ZC8weDFh
MAo+IFsgIDE5My4yOTQ0NzZdWyAgVDM2OV0gID8gX19rdGhyZWFkX3BhcmttZSsweGNjLzB4MWEw
Cj4gWyAgMTkzLjMxNjcwNF1bICBUMzY5XSAgPyBiYWxhbmNlX3BnZGF0KzB4ZWQwLzB4ZWQwCj4g
WyAgMTkzLjMzNzgwOF1bICBUMzY5XSAga3RocmVhZCsweDM1OC8weDQyMAo+IFsgIDE5My4zNTU2
NjZdWyAgVDM2OV0gID8ga3RocmVhZF9jcmVhdGVfd29ya2VyX29uX2NwdSsweGMwLzB4YzAKPiBb
ICAxOTMuMzgxODg0XVsgIFQzNjldICByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMAo+Cj4gPiAtLS0K
PiA+IFRoaXMgaXMgcGFydCBvZiBhIGdwdSBsb2NrZGVwIGFubm90YXRpb24gc2VyaWVzIHNpbXBs
eSBiZWNhdXNlIGl0Cj4gPiByZWFsbHkgaGVscHMgdG8gY2F0Y2ggaXNzdWVzIHdoZXJlIGdwdSBz
dWJzeXN0ZW0gbG9ja3MgYW5kIHByaW1pdGl2ZXMKPiA+IGNhbiBkZWFkbG9jayB3aXRoIHRoZW1z
ZWx2ZXMgdGhyb3VnaCBhbGxvY2F0aW9ucyBhbmQgbW11IG5vdGlmaWVycy4KPiA+IEJ1dCBhc2lk
ZSBmcm9tIHRoYXQgbW90aXZhdGlvbiBpdCBzaG91bGQgYmUgY29tcGxldGVseSBmcmVlLXN0YW5k
aW5nLAo+ID4gYW5kIGNhbiBsYW5kIHRocm91Z2ggLW1tLy1yZG1hLy1obW0gb3IgYW55IG90aGVy
IHRyZWUgcmVhbGx5IHdoZW5ldmVyLgo+ID4gLURhbmllbAo+ID4gLS0tCj4gPiAgbW0vbW11X25v
dGlmaWVyLmMgfCAgNyAtLS0tLS0tCj4gPiAgbW0vcGFnZV9hbGxvYy5jICAgfCAyNSArKysrKysr
KysrKysrKysrLS0tLS0tLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlmaWVyLmMg
Yi9tbS9tbXVfbm90aWZpZXIuYwo+ID4gaW5kZXggMDY4NTJiODk2ZmE2Li41ZDU3OGI5MTIyZjgg
MTAwNjQ0Cj4gPiAtLS0gYS9tbS9tbXVfbm90aWZpZXIuYwo+ID4gKysrIGIvbW0vbW11X25vdGlm
aWVyLmMKPiA+IEBAIC02MTIsMTMgKzYxMiw2IEBAIGludCBfX21tdV9ub3RpZmllcl9yZWdpc3Rl
cihzdHJ1Y3QgbW11X25vdGlmaWVyICpzdWJzY3JpcHRpb24sCj4gPiAgICAgICBsb2NrZGVwX2Fz
c2VydF9oZWxkX3dyaXRlKCZtbS0+bW1hcF9zZW0pOwo+ID4gICAgICAgQlVHX09OKGF0b21pY19y
ZWFkKCZtbS0+bW1fdXNlcnMpIDw9IDApOwo+ID4KPiA+IC0gICAgIGlmIChJU19FTkFCTEVEKENP
TkZJR19MT0NLREVQKSkgewo+ID4gLSAgICAgICAgICAgICBmc19yZWNsYWltX2FjcXVpcmUoR0ZQ
X0tFUk5FTCk7Cj4gPiAtICAgICAgICAgICAgIGxvY2tfbWFwX2FjcXVpcmUoJl9fbW11X25vdGlm
aWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiA+IC0gICAgICAgICAgICAgbG9ja19t
YXBfcmVsZWFzZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOwo+
ID4gLSAgICAgICAgICAgICBmc19yZWNsYWltX3JlbGVhc2UoR0ZQX0tFUk5FTCk7Cj4gPiAtICAg
ICB9Cj4gPiAtCj4gPiAgICAgICBpZiAoIW1tLT5ub3RpZmllcl9zdWJzY3JpcHRpb25zKSB7Cj4g
PiAgICAgICAgICAgICAgIC8qCj4gPiAgICAgICAgICAgICAgICAqIGttYWxsb2MgY2Fubm90IGJl
IGNhbGxlZCB1bmRlciBtbV90YWtlX2FsbF9sb2NrcygpLCBidXQgd2UKPiA+IGRpZmYgLS1naXQg
YS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKPiA+IGluZGV4IDEzY2M2NTMxMjJi
Ny4uNzUzNmZhYWFhMGZkIDEwMDY0NAo+ID4gLS0tIGEvbW0vcGFnZV9hbGxvYy5jCj4gPiArKysg
Yi9tbS9wYWdlX2FsbG9jLmMKPiA+IEBAIC01Nyw2ICs1Nyw3IEBACj4gPiAgI2luY2x1ZGUgPHRy
YWNlL2V2ZW50cy9vb20uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcHJlZmV0Y2guaD4KPiA+ICAj
aW5jbHVkZSA8bGludXgvbW1faW5saW5lLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21tdV9ub3Rp
Zmllci5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9taWdyYXRlLmg+Cj4gPiAgI2luY2x1ZGUgPGxp
bnV4L2h1Z2V0bGIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvcnQuaD4KPiA+IEBAIC00
MTI0LDcgKzQxMjUsNyBAQCBzaG91bGRfY29tcGFjdF9yZXRyeShzdHJ1Y3QgYWxsb2NfY29udGV4
dCAqYWMsIHVuc2lnbmVkIGludCBvcmRlciwgaW50IGFsbG9jX2ZsYQo+ID4gIHN0YXRpYyBzdHJ1
Y3QgbG9ja2RlcF9tYXAgX19mc19yZWNsYWltX21hcCA9Cj4gPiAgICAgICBTVEFUSUNfTE9DS0RF
UF9NQVBfSU5JVCgiZnNfcmVjbGFpbSIsICZfX2ZzX3JlY2xhaW1fbWFwKTsKPiA+Cj4gPiAtc3Rh
dGljIGJvb2wgX19uZWVkX2ZzX3JlY2xhaW0oZ2ZwX3QgZ2ZwX21hc2spCj4gPiArc3RhdGljIGJv
b2wgX19uZWVkX3JlY2xhaW0oZ2ZwX3QgZ2ZwX21hc2spCj4gPiAgewo+ID4gICAgICAgZ2ZwX21h
c2sgPSBjdXJyZW50X2dmcF9jb250ZXh0KGdmcF9tYXNrKTsKPiA+Cj4gPiBAQCAtNDEzNiwxMCAr
NDEzNyw2IEBAIHN0YXRpYyBib29sIF9fbmVlZF9mc19yZWNsYWltKGdmcF90IGdmcF9tYXNrKQo+
ID4gICAgICAgaWYgKGN1cnJlbnQtPmZsYWdzICYgUEZfTUVNQUxMT0MpCj4gPiAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiA+Cj4gPiAtICAgICAvKiBXZSdyZSBvbmx5IGludGVyZXN0ZWQg
X19HRlBfRlMgYWxsb2NhdGlvbnMgZm9yIG5vdyAqLwo+ID4gLSAgICAgaWYgKCEoZ2ZwX21hc2sg
JiBfX0dGUF9GUykpCj4gPiAtICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+IC0KPiA+ICAg
ICAgIGlmIChnZnBfbWFzayAmIF9fR0ZQX05PTE9DS0RFUCkKPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOwo+ID4KPiA+IEBAIC00MTU4LDE1ICs0MTU1LDI1IEBAIHZvaWQgX19mc19yZWNs
YWltX3JlbGVhc2Uodm9pZCkKPiA+Cj4gPiAgdm9pZCBmc19yZWNsYWltX2FjcXVpcmUoZ2ZwX3Qg
Z2ZwX21hc2spCj4gPiAgewo+ID4gLSAgICAgaWYgKF9fbmVlZF9mc19yZWNsYWltKGdmcF9tYXNr
KSkKPiA+IC0gICAgICAgICAgICAgX19mc19yZWNsYWltX2FjcXVpcmUoKTsKPiA+ICsgICAgIGlm
IChfX25lZWRfcmVjbGFpbShnZnBfbWFzaykpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKGdmcF9t
YXNrICYgX19HRlBfRlMpCj4gPiArICAgICAgICAgICAgICAgICAgICAgX19mc19yZWNsYWltX2Fj
cXVpcmUoKTsKPiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX01NVV9OT1RJRklFUgo+ID4gKyAgICAg
ICAgICAgICBsb2NrX21hcF9hY3F1aXJlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3Jhbmdl
X3N0YXJ0X21hcCk7Cj4gPiArICAgICAgICAgICAgIGxvY2tfbWFwX3JlbGVhc2UoJl9fbW11X25v
dGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiA+ICsjZW5kaWYKPiA+ICsKPiA+
ICsgICAgIH0KPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwoZnNfcmVjbGFpbV9hY3F1aXJl
KTsKPiA+Cj4gPiAgdm9pZCBmc19yZWNsYWltX3JlbGVhc2UoZ2ZwX3QgZ2ZwX21hc2spCj4gPiAg
ewo+ID4gLSAgICAgaWYgKF9fbmVlZF9mc19yZWNsYWltKGdmcF9tYXNrKSkKPiA+IC0gICAgICAg
ICAgICAgX19mc19yZWNsYWltX3JlbGVhc2UoKTsKPiA+ICsgICAgIGlmIChfX25lZWRfcmVjbGFp
bShnZnBfbWFzaykpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKGdmcF9tYXNrICYgX19HRlBfRlMp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgX19mc19yZWNsYWltX3JlbGVhc2UoKTsKPiA+ICsg
ICAgIH0KPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwoZnNfcmVjbGFpbV9yZWxlYXNlKTsK
PiA+ICAjZW5kaWYKPiA+IC0tCj4gPiAyLjI2LjIKPiA+Cj4gPgoKCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
