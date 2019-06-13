Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9E43208
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jun 2019 02:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A54F89264;
	Thu, 13 Jun 2019 00:46:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.ud03.udmedia.de (ud03.udmedia.de [194.117.254.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5276A89264
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 00:46:46 +0000 (UTC)
Received: (qmail 24735 invoked from network); 13 Jun 2019 02:46:43 +0200
Received: by mail.ud03.udmedia.de with ESMTPA; 13 Jun 2019 02:46:43 +0200
X-UD-Smtp-Session: ud03?335p7@D4Yh3SmLOrjCdf4e
MIME-Version: 1.0
Date: Thu, 13 Jun 2019 02:46:43 +0200
From: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <Dieter@nuetzel-hh.de>
To: Yrjan Skrimstad <yrjan@skrimstad.net>
Subject: Re: [PATCH] drm/amd/powerplay/smu7_hwmgr: replace blocking delay with
 non-blocking
In-Reply-To: <20190604202149.GA20116@obi-wan>
References: <20190530000819.GA25416@obi-wan> <20190604202149.GA20116@obi-wan>
Message-ID: <b6c658153f1c8d3a18ef4718fbb88706@nuetzel-hh.de>
X-Sender: Dieter@nuetzel-hh.de
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=nuetzel-hh.de;
 h=
 mime-version:content-type:content-transfer-encoding:date:from:to
 :cc:subject:in-reply-to:references:message-id; s=k1; bh=N9Jcd0aT
 vtSufXXMnUUHd5OWWhlgjIb6c9AuYrVQG/s=; b=pBYFc35Zk4Bff/kyNEhdDp5j
 epLwPXrVXc3hpbP/U9S4HYLYKfB4/kvh1NaNLUeZ8wFRN9bnMjcnoDS4TE3ig9fH
 eoiwn0qRoBvbPLjgRO3EC+vp4TuNhGFZwCu0m3Xma/IT9ZZ/aZU7znM9LUQIIv4U
 kOpQpceptj4gTKFVEwA=
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
Cc: David Airlie <airlied@linux.ie>, Harry Wentland <Harry.Wentland@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q0MgdHJpbW1lZAoKSGVsbG8gQWxleCBhbmQgSGFycnksCgphbnkgY29tbWVudHMgb24gdGhpcz8K
SSdtIHJ1bm5pbmcgbXkgWGVvbiBYMzQ3MCAoNGMvOHQpIHdpdGggdGhpcyB1bmRlciBhbWQtc3Rh
Z2luZy1kcm0tbmV4dCAKKGFzIGFsd2F5cyA7LSkgKSBhbmQgc2VlIG5vIGlzc3VlcyBzbyBmYXIu
CgpUaGFua3MhCkRpZXRlcgoKQW0gMDQuMDYuMjAxOSAyMjoyMSwgc2NocmllYiBZcmphbiBTa3Jp
bXN0YWQ6Cj4gT24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDI6MDg6MjFBTSArMDIwMCwgWXJqYW4g
U2tyaW1zdGFkIHdyb3RlOgo+PiBUaGlzIGRyaXZlciBjdXJyZW50bHkgY29udGFpbnMgYSByZXBl
YXRlZCA1MDBtcyBibG9ja2luZyBkZWxheSBjYWxsCj4+IHdoaWNoIGNhdXNlcyBmcmVxdWVudCBt
YWpvciBidWZmZXIgdW5kZXJydW5zIGluIFB1bHNlQXVkaW8uIFRoaXMgcGF0Y2gKPj4gZml4ZXMg
dGhpcyBpc3N1ZSBieSByZXBsYWNpbmcgdGhlIGJsb2NraW5nIGRlbGF5IHdpdGggYSBub24tYmxv
Y2tpbmcKPj4gc2xlZXAgY2FsbC4KPiAKPiBJIHNlZSB0aGF0IEkgaGF2ZSBub3QgZXhwbGFpbmVk
IHRoaXMgYnVnIHdlbGwgZW5vdWdoLCBhbmQgSSBob3BlIHRoYXQgCj4gaXMKPiB0aGUgcmVhc29u
IGZvciB0aGUgbGFjayBvZiByZXBsaWVzIG9uIHRoaXMgcGF0Y2guIEkgd2lsbCBoZXJlIGF0dGVt
cHQgCj4gdG8KPiBleHBsYWluIHRoZSBzaXR1YXRpb24gYmV0dGVyLgo+IAo+IFRvIHN0YXJ0IHdp
dGggc29tZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiBJIGFtIGhlcmUgdXNpbmcgYW4gQU1EIFI5IDM4
MAo+IEdQVSwgYW4gQU1EIFJ5emVuIDcgMTcwMCBFaWdodC1Db3JlIFByb2Nlc3NvciBhbmQgYW4g
QU1EIFgzNzAgY2hpcHNldC4KPiBJZiBhbnkgbW9yZSBoYXJkd2FyZSBvciBzb2Z0d2FyZSBzcGVj
aWZpY2F0aW9ucyBhcmUgbmVjZXNzYXJ5LCBwbGVhc2UKPiBhc2suCj4gCj4gVGhlIGJ1ZyBpcyBh
cyBmb2xsb3dzOiBXaGVuIHBsYXlpbmcgYXVkaW8gSSB3aWxsIHJlZ3VsYXJseSBoYXZlIG1ham9y
Cj4gYXVkaW8gaXNzdWVzLCBzaW1pbGFyIHRvIHRoYXQgb2YgYSBza2lwcGluZyBDRC4gVGhpcyBp
cyByZXBvcnRlZCBieQo+IFB1bHNlQXVkaW8gYXMgc2NoZWR1bGluZyBkZWxheXMgYW5kIGJ1ZmZl
ciB1bmRlcnJ1bnMgd2hlbiBydW5uaW5nCj4gUHVsc2VBdWRpbyB2ZXJib3NlbHkgYW5kIHRoZXNl
IHNjaGVkdWxpbmcgZGVsYXlzIGFyZSBhbHdheXMganVzdCB1bmRlcgo+IDUwMG1zLCB0eXBpY2Fs
bHkgYXJvdW5kIDQ5MG1zLiBUaGlzIG1ha2VzIGxpc3RlbmluZyB0byBhbnkgbXVzaWMgcXVpdGUK
PiB0aGUgaG9ycmlibGUgZXhwZXJpZW5jZSBhcyBQdWxzZUF1ZGlvIGNvbnN0YW50bHkgd2lsbCBh
dHRlbXB0IHRvIHJld2luZAo+IGFuZCBjYXRjaCB1cC4gSXQgaXMgbm90IGEgZ3JlYXQgc2l0dWF0
aW9uLCBhbmQgc2VlbXMgdG8gbWUgdG8gcXVpdGUKPiBjbGVhcmx5IGJlIGEgY2FzZSB3aGVyZSBy
ZWd1bGFyIHVzZXIgc3BhY2UgYmVoYXZpb3VyIGhhcyBiZWVuIGJyb2tlbi4KPiAKPiBJIHdhbnQg
dG8gbm90ZSB0aGF0IHRoaXMgYXVkaW8gcHJvYmxlbSB3YXMgbm90IHNvbWV0aGluZyBJIGV4cGVy
aWVuY2VkCj4gdW50aWwgcmVjZW50bHksIGl0IGlzIHRoZXJlZm9yZSBhIG5ldyBidWcuCj4gCj4g
SSBoYXZlIGJpc2VjdGVkIHRoZSBrZXJuZWwgdG8gZmluZCBvdXQgd2hlcmUgdGhlIHByb2JsZW0g
b3JpZ2luYXRlZCBhbmQKPiBmb3VuZCB0aGUgZm9sbG93aW5nIGNvbW1pdDoKPiAKPiAjIGZpcnN0
IGJhZCBjb21taXQ6IFtmNTc0MmVjMzY0MjJhMzliNTdmMDI1NmU0ODQ3ZjYxYjNjNDMyZjhjXQo+
IGRybS9hbWQvcG93ZXJwbGF5OiBjb3JyZWN0IHBvd2VyIHJlYWRpbmcgb24gZmlqaQo+IAo+IFRo
aXMgY29tbWl0IGludHJvZHVjZXMgYSBibG9ja2luZyBkZWxheSAobWRlbGF5KSBvZiA1MDBtcywg
d2hlcmVhcyB0aGUKPiBvbGQgYmVoYXZpb3VyIHdhcyBhIHNtYWxsZXIgYmxvY2tpbmcgZGVsYXkg
b2Ygb25seSAxbXMuIFRoaXMgc2VlbXMgdG8gCj4gbWUKPiB0byBiZSB2ZXJ5IGN1cmlvdXMgYXMg
dGhlIHNjaGVkdWxpbmcgZGVsYXlzIG9mIFB1bHNlQXVkaW8gYXJlIGFsd2F5cwo+IGFsbW9zdCA1
MDBtcy4gSSBoYXZlIHRoZXJlZm9yZSB3aXRoIHRoZSBwcmV2aW91cyBwYXRjaCByZXBsYWNlZCB0
aGUKPiBzY2hlZHVsaW5nIGRlbGF5IHdpdGggYSBub24tYmxvY2tpbmcgc2xlZXAgKG1zbGVlcCku
Cj4gCj4gVGhlIHJlc3VsdHMgb2YgdGhlIHBhdGNoIHNlZW1zIHByb21pc2luZyBhcyBJIGhhdmUg
eWV0IHRvIGVuY291bnRlciBhbnkKPiBvZiB0aGUgb2xkIDw1MDBtcyBzY2hlZHVsaW5nIGRlbGF5
cyB3aGVuIHVzaW5nIGl0IGFuZCBJIGhhdmUgYWxzbyBub3QKPiBlbmNvdW50ZXJlZCBhbnkga2Vy
bmVsIGxvZyBtZXNzYWdlcyByZWdhcmRpbmcgc2xlZXBpbmcgaW4gYW4gYXRvbWljCj4gY29udGV4
dC4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
