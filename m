Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D135F434
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Apr 2021 14:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEB36E429;
	Wed, 14 Apr 2021 12:47:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A190E6E499
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 12:47:30 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id b3so5670015oie.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 05:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hhfpt89oKZxckwGOpdt/ZK1QspnrMqbjzeAE44r026o=;
 b=c0WbgIFCvzDm0yiP4ZUvmZTOaW2qLfCOHVAExMAKQhe/izkuMAidG4/QQfciF6HIES
 YobLqZi3S21RB74BlOHLe+D17xTh+Rz3YDXVtuyNPYOHWqzRQrpgeVsiiGiZyBxF0Jv7
 8Imr3y6WImhRuJu0y+NppGe24loTmU9khVXkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hhfpt89oKZxckwGOpdt/ZK1QspnrMqbjzeAE44r026o=;
 b=o+v6UDjgmutMvDSQBpkW39yqTFQX6M5w+yaT5y/GSlsLoJc8P/qFTS+YpoV51AI3Ur
 Lbpj5I/OzdYWr2ZI78gULbBoL9EPfC0Pny99yxk0I9I4VSBIl8IFhzx2xh2PPOkjcdBI
 iVM5FKlb/4cvIObNQoy9RZYkELQ7G3xzG2Nn416yjU9Ko3ATdIFqUAq4k7Wy7+pLQnGa
 ohGoKhj2HXmwcjnObsbQitdvF0awZQcegr+sRI6FwpTIqpCjY9nxKfzC9B7naP1prISu
 lBHPUHi+ivmYtB+kR9KdkoMnbjM7e4gePo6FGN3TQJv7EkUbB/cDUxw5W4KH7vyprg04
 lv8Q==
X-Gm-Message-State: AOAM532QZqvvaTcgjnSHZGg5a7ozL5JmMNSsW++FcwQ6rx2bopZpgSu9
 8uWGQEK8ulyb2VHMTXD2cqJaLdne67IoFf1kvRpf/Q==
X-Google-Smtp-Source: ABdhPJytTBtZsxm8COQRMZKfhXP3CC9bI1xH2ZzTrTa/FdTjNdItiwiawpzwjHhCNYNotCNfSSl5VWbjJ5WUy+M/ri0=
X-Received: by 2002:aca:1c17:: with SMTP id c23mr2236844oic.128.1618404449882; 
 Wed, 14 Apr 2021 05:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
 <YHayqD3IbupkY7b+@phenom.ffwll.local>
 <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
 <YHbDQcr6Yl1Lljep@phenom.ffwll.local>
 <7ac3a5e9-abf6-6ea5-af21-25c04e984d57@gmail.com>
 <CAKMK7uFniPaRLpO9KmPe22xP69yahTwVomCE2FuMRG97_K_NVQ@mail.gmail.com>
 <18af0d4e-1ec8-a761-e4df-d4904755a432@amd.com>
In-Reply-To: <18af0d4e-1ec8-a761-e4df-d4904755a432@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 14 Apr 2021 14:47:19 +0200
Message-ID: <CAKMK7uFpyLW1X0hWtS71kKMSQRgh=6AK3O+KtCJNw-8y9smiZQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgMjo0MyBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMTQuMDQuMjEgdW0gMTQ6MjUgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOgo+ID4gT24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgMTI6NDkgUE0gQ2hy
aXN0aWFuIEvDtm5pZwo+ID4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90
ZToKPiA+PiBBbSAxNC4wNC4yMSB1bSAxMjoyNiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPj4+
IE9uIFdlZCwgQXByIDE0LCAyMDIxIGF0IDExOjE5OjQxQU0gKzAyMDAsIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4gPj4+PiBBbSAxNC4wNC4yMSB1bSAxMToxNSBzY2hyaWViIERhbmllbCBWZXR0
ZXI6Cj4gPj4+Pj4gT24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgMDg6NTE6NTFBTSArMDIwMCwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+Pj4+Pj4gQW0gMTQuMDQuMjEgdW0gMDg6NDggc2Nocmll
YiBGZWxpeCBLdWVobGluZzoKPiA+Pj4+Pj4+IFBhZ2VzIGluIFNHIEJPcyB3ZXJlIG5vdCBhbGxv
Y2F0ZWQgYnkgVFRNLiBTbyBkb24ndCBjb3VudCB0aGVtIGFnYWluc3QKPiA+Pj4+Pj4+IFRUTSdz
IHBhZ2VzIGxpbWl0Lgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+ID4+Pj4+PiBSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4+Pj4+Pgo+ID4+Pj4+
PiBHb2luZyB0byBwaWNrIHRoYXQgb25lIHVwIGZvciBpbmNsdXNpb24gaW4gZHJtLW1pc2MtbmV4
dC4KPiA+Pj4+PiBTZWUgbXkgb3RoZXIgZW1haWwsIGJ1dCB3aHkgZG8gd2UgbmVlZCB0aGlzPyBB
IGJpdCBtb3JlIGV4cGxhbmF0aW9uIGlzIGltbwo+ID4+Pj4+IG5lZWRlZCBoZXJlIGF0IGxlYXN0
LCBzaW5jZSB3ZSBzdGlsbCBuZWVkIHRvIGd1YXJhbnRlZSB0aGF0IGFsbG9jYXRpb25zCj4gPj4+
Pj4gZG9uJ3Qgb3ZlciB0aGUgbGltaXQgaW4gdG90YWwgZm9yIGFsbCBncHUgYnVmZmVycyB0b2dl
dGhlci4gQXQgbGVhc3QgdW50aWwKPiA+Pj4+PiB0aGUgc2hyaW5rZXIgaGFzIGxhbmRlZC4KPiA+
Pj4+Pgo+ID4+Pj4+IEFuZCB0aGlzIGhlcmUganVzdCBvcGVucyB1cCB0aGUgYmFybiBkb29yIHdp
dGhvdXQgYW55IGV4cGxhbmF0aW9uIHdoeSBpdCdzCj4gPj4+Pj4gb2suCj4gPj4+PiBUaGUgU0cg
YmFzZWQgQk9zIG1pZ2h0IG5vdCBldmVuIGJlIGJhY2tlZCBieSBwYWdlcy4gRS5nLiBleHBvcnRl
ZCBWUkFNLgo+ID4+Pj4KPiA+Pj4+IFNvIGVpdGhlciB0aGV5IGFyZSBleHBvcnRlZCBieSBhIGRy
aXZlciB3aGljaCBzaG91bGQgaGF2ZSBhY2NvdW50ZWQgZm9yIHRoZQo+ID4+Pj4gYWxsb2NhdGlv
biwgZXhwb3J0ZWQgYnkgVFRNIHdoaWNoIGFscmVhZHkgZGlkIHRoZSBhY2NvdW50aW5nIG9yIGRv
ZXNuJ3QgZXZlbgo+ID4+Pj4gcG9pbnQgdG8gcGFnZXMgYXQgYWxsLgo+ID4+Pj4KPiA+Pj4+IFRo
aXMgaXMgcmVhbGx5IGEgYnVnIGZpeCB0byByZWNyZWF0ZSB0aGUgYmVoYXZpb3Igd2UgaGFkIGJl
Zm9yZSBtb3ZpbmcgdGhlCj4gPj4+PiBhY2NvdW50aW5nIHRvIHRoaXMgcGxhY2UuCj4gPj4+IFRo
cm93IHRoYXQgaW50byB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGEtYjogbWUuIElkZWFsbHkgd2l0
aCBhIEZpeGVzOiBsaW5lCj4gPj4+IG9yIHNvIHBvaW50aW5nIGF0IHRoZSBvZmZlbmRpbmcgY29t
bWl0IHRoYXQgYnJva2Ugc3R1ZmYuIENvbW1pdCBtZXNzYWdlcwo+ID4+PiBzaG91bGQgcmVhbGx5
IGdvIGludG8gbW9yZSBkZXRhaWwgd2hlbiB0aGVyZSdzIGFuIGVudGlyZSBzdG9yeSBiZWhpbmQg
YQo+ID4+PiBzbWFsbCBjaGFuZ2UgbGlrZSB0aGlzIG9uZS4KPiA+PiBTb3JyeSBJIHRob3VnaCB0
aGF0IHRoaXMgd291bGQgYmUgb2J2aW91cyA6KQo+ID4+Cj4gPj4gSSd2ZSBhbHJlYWR5IHB1c2hl
ZCB0aGUgcGF0Y2ggaW4gdGhlIG1vcm5pbmcsIGJ1dCBnb2luZyB0byBrZWVwIHRoYXQgaW4KPiA+
PiBtaW5kIGZvciB0aGUgbmV4dCB0aW1lLgo+ID4gSSdsbCBrZWVwIHJlbWluZGluZyB5b3UgdG8g
cGxzIGVsYWJvcmF0ZSBtb3JlIGluIGNvbW1pdCBtZXNzYWdlcywgaXQncwo+ID4gY29taW5nIHVw
IGV2ZXJ5IG9uY2UgaW4gYSB3aGlsZSA6LSkKPgo+IFdlbGwsIGRlc2NyaWJpbmcgc3R1ZmYgaW4g
YSBjb21taXQgbWVzc2FnZSB3aGljaCBpcyBvYnZpb3VzIGlzIGp1c3QKPiByZWR1bmRhbnQuCj4K
PiBJIGNhbiBvZiBjb3Vyc2UgZXhwbGFpbiB0aGUgd2hvbGUgYmFja2dyb3VuZCBvZiB0aGUgY29k
ZSBpbiBxdWVzdGlvbiBpbgo+IHRoZSBjb21taXQgbWVzc2FnZSwgYnV0IGZvciBvYnZpb3VzIGJ1
ZyBmaXhlcyBsaWtlIHRoaXMgaXQgaXMganVzdCBvdmVya2lsbC4KPgo+ID4gQWxzbyBpbiBnZW5l
cmFsIEkgdGhpbmsgYSBmZXcgZGF5cyBvZiBsZXR0aW5nIHBhdGNoZXMgc29hayBvdXQgdGhlcmUs
Cj4gPiBlc3BlY2lhbGx5IHNoYXJlZCBjb2RlLCBpcyBnb29kIGN1cnRlc3kuIFNvbWUgZm9sa3Mg
ZGVtYW5kIDIgd2Vla3MsCj4gPiB3aGljaCBJIHRoaW5rIGlzIHRvbyBtdWNoLCBidXQgbGVzcyB0
aGFuIDI0aCBqdXN0IG1lYW5zIHlvdSdyZQo+ID4gZ3VhcmFudGVlZCB0byBsZWF2ZSBvdXQgaGFs
ZiB0aGUgZ2xvYmUgd2l0aCB0aGVpciBmZWVkYmFjay4gV2hpY2gKPiA+IGlzbid0IGdyZWF0Lgo+
Cj4gV2VsbCBmb3Igc3RydWN0dXJhbCBjaGFuZ2VzIEkgY2VydGFpbmx5IGFncmVlLCBidXQgbm90
IGZvciBhIGJ1ZyBmaXgKPiB3aGljaCBhZGRzIGEgbWlzc2luZyBjaGVjayBmb3IgYSBzcGVjaWFs
IGNhc2UuCgpXZWxsIGlmIGl0J3MgYSBidWdmaXggc2hvdWxkIGF0IGxlYXN0IGluZGljYXRlIHRo
YXQsIGFuZCByZWdyZXNzaW9uCmZpeGVzIHNob3VsZCBjb21lIHdpdGggRml4ZXM6IHRhZ3MuIE9i
dmlvdXMgZm9yIHlvdSB3aG8gc2NyZWFtZWQgYXQKdGhlIGNvZGUgaXMgZ2VuZXJhbGx5IG5vdCBp
bXBseWluZyBpdCdzIG9idmlvdXMgZm9yIGFueW9uZSBlbHNlLiBTbwp5ZWFoIEkgdGhpbmsgaW4g
Z2VuZXJhbCBtb3JlIGV4cGxhbmF0aW9ucyB3b3VsZCBiZSBnb29kLgotRGFuaWVsCgo+Cj4gQ2hy
aXN0aWFuLgo+Cj4gPgo+ID4gRHJpdmVyIGNvZGUgSSBkb24ndCBjYXJlIHNpbmNlIHRoZXJlIHlv
dSBrbm93IGFsbCB0aGUgc3Rha2Vob2xkZXJzIG9mYy4KPiA+IC1EYW5pZWwKPiA+Cj4gPj4gQ2hy
aXN0aWFuLgo+ID4+Cj4gPj4+IC1EYW5pZWwKPiA+Pj4KPiA+Pj4+IENocmlzdGlhbi4KPiA+Pj4+
Cj4gPj4+Pj4gLURhbmllbAo+ID4+Pj4+Cj4gPj4+Pj4+IFJlZ2FyZHMsCj4gPj4+Pj4+IENocmlz
dGlhbi4KPiA+Pj4+Pj4KPiA+Pj4+Pj4+IC0tLQo+ID4+Pj4+Pj4gICAgICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV90dC5jIHwgMjcgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPj4+Pj4+
PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
ID4+Pj4+Pj4KPiA+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90
dC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+ID4+Pj4+Pj4gaW5kZXggNWQ4ODIw
NzI1Yjc1Li5lOGI4YzMyNTczOTIgMTAwNjQ0Cj4gPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV90dC5jCj4gPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90
dC5jCj4gPj4+Pj4+PiBAQCAtMzE3LDkgKzMxNywxMiBAQCBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0
cnVjdCB0dG1fZGV2aWNlICpiZGV2LAo+ID4+Pj4+Pj4gICAgICAgICAgICBpZiAodHRtX3R0X2lz
X3BvcHVsYXRlZCh0dG0pKQo+ID4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+
ID4+Pj4+Pj4gLSBhdG9taWNfbG9uZ19hZGQodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxs
b2NhdGVkKTsKPiA+Pj4+Pj4+IC0gaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+ID4+Pj4+Pj4g
LSAgICAgICAgIGF0b21pY19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywgJnR0bV9kbWEzMl9wYWdl
c19hbGxvY2F0ZWQpOwo+ID4+Pj4+Pj4gKyBpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFH
RV9GTEFHX1NHKSkgewo+ID4+Pj4+Pj4gKyAgICAgICAgIGF0b21pY19sb25nX2FkZCh0dG0tPm51
bV9wYWdlcywgJnR0bV9wYWdlc19hbGxvY2F0ZWQpOwo+ID4+Pj4+Pj4gKyAgICAgICAgIGlmIChi
ZGV2LT5wb29sLnVzZV9kbWEzMikKPiA+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgIGF0b21pY19s
b25nX2FkZCh0dG0tPm51bV9wYWdlcywKPiA+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmdHRtX2RtYTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4gPj4+Pj4+PiArIH0KPiA+
Pj4+Pj4+ICAgICAgICAgICAgd2hpbGUgKGF0b21pY19sb25nX3JlYWQoJnR0bV9wYWdlc19hbGxv
Y2F0ZWQpID4gdHRtX3BhZ2VzX2xpbWl0IHx8Cj4gPj4+Pj4+PiAgICAgICAgICAgICAgICAgICBh
dG9taWNfbG9uZ19yZWFkKCZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKSA+Cj4gPj4+Pj4+PiBA
QCAtMzUwLDkgKzM1MywxMiBAQCBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNl
ICpiZGV2LAo+ID4+Pj4+Pj4gICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4+Pj4+ICAgICAgZXJy
b3I6Cj4gPj4+Pj4+PiAtIGF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdl
c19hbGxvY2F0ZWQpOwo+ID4+Pj4+Pj4gLSBpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4gPj4+
Pj4+PiAtICAgICAgICAgYXRvbWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX2RtYTMy
X3BhZ2VzX2FsbG9jYXRlZCk7Cj4gPj4+Pj4+PiArIGlmICghKHR0bS0+cGFnZV9mbGFncyAmIFRU
TV9QQUdFX0ZMQUdfU0cpKSB7Cj4gPj4+Pj4+PiArICAgICAgICAgYXRvbWljX2xvbmdfc3ViKHR0
bS0+bnVtX3BhZ2VzLCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7Cj4gPj4+Pj4+PiArICAgICAgICAg
aWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+ID4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgYXRv
bWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLAo+ID4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsKPiA+Pj4+Pj4+ICsg
fQo+ID4+Pj4+Pj4gICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4+Pj4+Pj4gICAgICB9Cj4gPj4+
Pj4+PiAgICAgIEVYUE9SVF9TWU1CT0wodHRtX3R0X3BvcHVsYXRlKTsKPiA+Pj4+Pj4+IEBAIC0z
ODIsOSArMzg4LDEyIEBAIHZvaWQgdHRtX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2Ug
KmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSkKPiA+Pj4+Pj4+ICAgICAgICAgICAgZWxzZQo+ID4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgIHR0bV9wb29sX2ZyZWUoJmJkZXYtPnBvb2wsIHR0bSk7
Cj4gPj4+Pj4+PiAtIGF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19h
bGxvY2F0ZWQpOwo+ID4+Pj4+Pj4gLSBpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4gPj4+Pj4+
PiAtICAgICAgICAgYXRvbWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX2RtYTMyX3Bh
Z2VzX2FsbG9jYXRlZCk7Cj4gPj4+Pj4+PiArIGlmICghKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9Q
QUdFX0ZMQUdfU0cpKSB7Cj4gPj4+Pj4+PiArICAgICAgICAgYXRvbWljX2xvbmdfc3ViKHR0bS0+
bnVtX3BhZ2VzLCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7Cj4gPj4+Pj4+PiArICAgICAgICAgaWYg
KGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+ID4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgYXRvbWlj
X2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLAo+ID4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsKPiA+Pj4+Pj4+ICsgfQo+
ID4+Pj4+Pj4gICAgICAgICAgICB0dG0tPnBhZ2VfZmxhZ3MgJj0gflRUTV9QQUdFX0ZMQUdfUFJJ
Vl9QT1BVTEFURUQ7Cj4gPj4+Pj4+PiAgICAgIH0KPiA+Pj4+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4+Pj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+ID4+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4+Pj4+IGh0
dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1k
ZXZlbCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M1MDNm
MjQwZDQwOTc0MGMxMzMzNTA4ZDhmZjQwNjU0NSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2Mzc1Mzk5OTkzNTUzMzA0ODElN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxD
SlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9NnNXNTMlMkZHcHhrNHJaS003bXBIRGZnQmhy
ZUNYWTRNY3lwS0dxVEgxM2I4JTNEJmFtcDtyZXNlcnZlZD0wCj4gPgo+CgoKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
