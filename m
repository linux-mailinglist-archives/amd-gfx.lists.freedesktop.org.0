Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4A58809
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 19:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31B06E21F;
	Thu, 27 Jun 2019 17:10:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7296D6E21F
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 17:10:58 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so7808754edq.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 10:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=cqjmIWYCcbe/DTVFywh6ejOKO4A7dqBunCsMzhkjRdI=;
 b=KbFDgvI8ddxXrTS2RBigE+hgIJym1CXHA/wt5Kn8BpftsYJBgktLSAMr1K7fVHmusc
 beqS09CXOIS3nYFmb58a+DZAqUiild+FGM5zqc25JfRBIQoRzufYXi2NdtWWWPWHBW7Y
 NpAy7BePVmUPV7ZWMCVcBdVT4v83BU/KzILrrJZW8zQ6dn0M44NctwPdCL3TcY6Kk9iT
 yKfwthZO+tY8LqpjUDsmtRuIkrvTWPEi3Q81sQEUIs8gbrCTHyIBxapQF6t+3kiVYGLg
 0z+iqjwAf/6yoXXYQ2xzeB2NCmxwK3jUKOBhiDListTZNzbWp/K+WTFbaPOJVRyavXlN
 xE7g==
X-Gm-Message-State: APjAAAWda3yr6e0a5hEUjpr8PbzwRTTs9gJOqPYPqmeO7UpFawh/FQ2G
 x0iE0q7x4V11X+kiavxqOVAzaw==
X-Google-Smtp-Source: APXvYqxMZDMfBdqryFXZH9F8MiZeyisFiDXWncBFJVXLovE+HW0JSemMakvZB/5c89+VOIMDMG+3hQ==
X-Received: by 2002:a05:6402:78c:: with SMTP id
 d12mr5741258edy.160.1561655457095; 
 Thu, 27 Jun 2019 10:10:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g18sm287097ejo.3.2019.06.27.10.10.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 10:10:55 -0700 (PDT)
Date: Thu, 27 Jun 2019 19:10:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 2/2] dma-buf: cleanup shared fence removal
Message-ID: <20190627171053.GN12905@phenom.ffwll.local>
References: <20190627101813.61430-1-christian.koenig@amd.com>
 <20190627101813.61430-2-christian.koenig@amd.com>
 <CAKMK7uGtdSxVSUor8P_8XH+uf4_A-kRfY6h+XnJoizscWE4AOg@mail.gmail.com>
 <f1a792c2-87e0-9aba-c6f1-0374122d025b@gmail.com>
 <CAKMK7uFoeugD0ASHm4DRLzq6h3aAvNhE1ODh-bxoH7Lucf1m3w@mail.gmail.com>
 <5e182e5d-efcb-00bd-fa31-6e8bc9571ce6@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e182e5d-efcb-00bd-fa31-6e8bc9571ce6@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=cqjmIWYCcbe/DTVFywh6ejOKO4A7dqBunCsMzhkjRdI=;
 b=Y3yayEkfsgWRDg+L8kxWbRYEx1gpkNMywkwFDSPmvx+YyotltbpUjXNbrnCVdISpRL
 LQf7mLsMe/uObhbvzvV6H+p32usENWY0tlcjSpsmA3C4Z3+smj++sU5C8BvKgCbn6rTi
 tOQ7kz+F6ALM+Tl4yIwdfM2vw6R2a6G2KKWYo=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDM6NDg6MDZQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMjcuMDYuMTkgdW0gMTc6MzQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+
ID4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMzoxOSBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPiA8
Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4+IEFtIDI3LjA2LjE5
IHVtIDEyOjQzIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+Pj4gT24gVGh1LCBKdW4gMjcsIDIw
MTkgYXQgMTI6MTggUE0gQ2hyaXN0aWFuIEvDtm5pZwo+ID4+PiA8Y2tvZW5pZy5sZWljaHR6dW1l
cmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pj4gV2hpbGUgZnJlZWluZyB1cCBtZW1vcnkgaXQg
aXMgZWFzaWVyIHRvIHJlbW92ZSBhIGZlbmNlIGZyb20gYSByZXNlcnZhdGlvbgo+ID4+Pj4gb2Jq
ZWN0IGluc3RlYWQgb2Ygc2lnbmFsaW5nIGl0IGFuZCBpbnN0YWxsaW5nIGEgbmV3IG9uZSBpbiBh
bGwgb3RoZXIgb2JqZWN0cy4KPiA+Pj4+Cj4gPj4+PiBDbGVhbiB0aGlzIHVwIGJ5IGFkZGluZyB0
aGUgcmVtb3ZhbCBmdW5jdGlvbiB0byB0aGUgY29yZSByZXNlcnZhdGlvbiBvYmplY3QKPiA+Pj4+
IGNvZGUgaW5zdGVhZCBvZiBtZXNzaW5nIHdpdGggdGhlIGludGVybmFsIGluIGFtZGdwdS4KPiA+
Pj4+Cj4gPj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPj4+PiAt
LS0KPiA+Pj4+ICAgIGRyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jICAgICAgICAgICAgICAg
ICB8IDYyICsrKysrKysrKysrKysrKysrKysKPiA+Pj4+ICAgIC4uLi9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8IDQ1ICstLS0tLS0tLS0tLS0tCj4gPj4+PiAgICBp
bmNsdWRlL2xpbnV4L3Jlc2VydmF0aW9uLmggICAgICAgICAgICAgICAgICAgfCAgMyArLQo+ID4+
Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkK
PiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMg
Yi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYwo+ID4+Pj4gaW5kZXggZWY3MTBlZmZlZGZh
Li5lNDNhMzE2YTAwNWQgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2
YXRpb24uYwo+ID4+Pj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMKPiA+Pj4+
IEBAIC0yMzEsNiArMjMxLDY4IEBAIHZvaWQgcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRf
ZmVuY2Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAo+ID4+Pj4gICAgfQo+ID4+Pj4g
ICAgRVhQT1JUX1NZTUJPTChyZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZSk7Cj4g
Pj4+Pgo+ID4+Pj4gKy8qKgo+ID4+Pj4gKyAqIHJlc2VydmF0aW9uX29iamVjdF9yZW1vdmVfc2hh
cmVkX2ZlbmNlIC0gcmVtb3ZlIHNoYXJlZCBmZW5jZXMKPiA+Pj4+ICsgKiBAb2JqOiB0aGUgcmVz
ZXJ2YXRpb24gb2JqZWN0Cj4gPj4+PiArICogQGNvbnRleHQ6IHRoZSBjb250ZXh0IG9mIHRoZSBm
ZW5jZXMgdG8gcmVtb3ZlCj4gPj4+PiArICoKPiA+Pj4+ICsgKiBSZW1vdmUgc2hhcmVkIGZlbmNl
cyBiYXNlZCBvbiB0aGVpciBmZW5jZSBjb250ZXh0Lgo+ID4+Pj4gKyAqLwo+ID4+PiBUaGlzIG5l
ZWRzIGEgc2VyaW91cyBleHBsYW5hdGlvbiBvZiAid2h5PyIuIFJlbW92aW5nIGZlbmNlcyB3aXRo
b3V0Cj4gPj4+IGd1YXJhbnRlZWluZyB0aGV5J3JlIGFsbCBzaWduYWxlZCBpcyBhIGdvb2Qgd2F5
IHRvIGNyZWF0ZSBoYXZvYy4gWW91cgo+ID4+PiBjb21taXQgbWVzc2FnZSBoYXMgYSBmZXcgd29y
ZHMgYWJvdXQgd2hhdCB5b3UncmUgZG9pbmcgaGVyZSwgYnV0IGl0Cj4gPj4+IHN0aWxsIGRvZXNu
J3QgZXhwbGFpbiB3aHkgdGhpcyBpcyBzYWZlIGFuZCB3aGVuIGV4YWN0bHkgaXQgc2hvdWxkIGJl
Cj4gPj4+IHVzZWQuCj4gPj4gWWVhaCwgSSdtIG5vdCB2ZXJ5IGtlZW4gYWJvdXQgdGhpcyBlaXRo
ZXIuCj4gPj4KPiA+PiBUaGUga2V5IHBvaW50IGlzIHRoZSBtZW1vcnkgaXMgbm90IGFjY2Vzc2li
bGUgYnkgdGhlIGhhcmR3YXJlIGFueSBtb3JlCj4gPj4gYmVjYXVzZSBpdCBpcyBmcmVlZCBhbmQg
cmVtb3ZlZCBmcm9tIHRoZSBwYWdlIHRhYmxlcy4KPiA+Pgo+ID4+IFNvIGZ1cnRoZXIgYWNjZXNz
IGlzIHByZXZlbnRlZCBhbmQgaW4gdGhpcyBzcGVjaWFsIGNhc2UgaXQgaXMgYWN0dWFsbHkKPiA+
PiB2YWxpZCB0byBkbyB0aGlzIGV2ZW4gaWYgdGhlIG9wZXJhdGlvbiByZXByZXNlbnRlZCBieSB0
aGUgZmVuY2UgaXMgc3RpbGwKPiA+PiBvbmdvaW5nLgo+ID4gSG0sIHdoeSBkbyB5b3UgaGF2ZSB0
byByZW1vdmUgdGhlc2UgZmVuY2VzIHRoZW4/IENhbid0IHlvdSBqdXN0IGxldAo+ID4gdGhlbSBz
aWduYWwgYW5kIGdldCBjb2xsZWN0ZWQgYXMgdXN1YWw/IEFzIHNvb24gYXMgeW91IHNoYXJlIGJ1
ZmZlcnMKPiA+IHRoZXNlIGZlbmNlcyBjYW4gZ2V0IGFueXdoZXJlLCBzbyB5b3UgbmVlZCB0byBj
b3JyZWN0bHkgdW53aW5kIHRoZW0gbm8KPiA+IG1hdHRlciB3aGF0Lgo+ID4KPiA+IFlvdSdyZSBr
aW5kYSBzdGlsbCBqdXN0IGRlc2NyaWJpbmcgd2hhdCB5b3UncmUgZG9pbmcsIG5vdCB3aHkuCj4g
Cj4gSXQgaXMgc2ltcGx5IG1vcmUgZWZmaWNpZW50IHRvIHJlbW92ZSB0aGUgZmVuY2UgZnJvbSBv
bmUgcmVzZXJ2YXRpb24gCj4gb2JqZWN0IHRoYW4gdG8gYWRkIGEgbmV3IGZlbmNlIHRvIGFsbCBv
dGhlciByZXNlcnZhdGlvbiBvYmplY3RzIGluIHRoZSAKPiBzYW1lIHByb2Nlc3MuCgpPaywgeW91
IHN0aWxsIHRhbGsgaW4gcmlkZGxlcyBhbmQgZG9uJ3QgZXhwbGFpbiB3aGF0IHRoZSBnb2FsIG9m
IHRoaXMKZW50aXJlIGRhbmNlIGlzLCBzbyBJIHdlbnQgYW5kIHJlYWQgdGhlIGNvZGUuIEFzc3Vt
aW5nIEkgZGlkbid0IG1pc3JlYWQKdG9vIG11Y2g6CgoxLiB5b3UgY3JlYXRlIGEgZmFrZSBmZW5j
ZSBvbiBhIHBlci1wcm9jZXNzIHRpbWVsaW5lLgoyLiB5b3UgYXR0YWNoIHRoaXMgbGliZXJhbGx5
IHRvIGFsbCB0aGUgYm8geW91J3JlIGNyZWF0aW5nIG9uIHRoYXQKcHJvY2VzcwozLiB0aGUgZmVu
Y2UgbmV2ZXIgc2lnbmFscyBvbiBpdHMgb3duLCBidXQgaXQgaGFzIGEgdmVyeSBtYWdpYwotPmVu
YWJsZV9zaWduYWxpbmcgY2FsbGJhY2sgd2hpY2ggaXMgdGhlIG9ubHkgdGhpbmcgdGhhdCBtYWtl
cyB0aGlzIGZlbmNlCnN3aXRjaCB0byBzaWduYWxsZWQgaW4gYSBmaW5pdGUgdGltZS4gQmVmb3Jl
IHRoYXQgaXQncyBzdHVjayBmb3JldmVyLiBTbwpxdWl0ZSBhIGJpdCBhIHNjaHLDtmRpbmdlciBm
ZW5jZTogSXQncyBub3QgYSByZWFsIGZlbmNlIChiZWNhdXNlIGl0IGZhaWxzCnRvIHNpZ25hbCBp
biBib3VuZGVkIHRpbWUpIGV4Y2VwdCB3aGVuIHlvdSBzdGFydCB0byBsb29rIGF0IGl0Lgo0LiBM
b29raW5nIGF0IHRoZSBmZW5jZSB0cmlnZ2VycyBldmljdGlvbiwgYXQgdGhhdCBwb2ludCB3ZSBy
ZXBsYWNlIHRoaXMKbWFnaWMgZXZpY3Rpb24gZmVuY2Ugd2l0aCB0aGUgbmV4dCBzZXQsIHJlYWNx
dWlyZSBidWZmZXJzIGFuZCB0aGVuIHVuYmxvY2sKdGhlIGtmZCBwcm9jZXNzIG9uY2UgZXZlcnl0
aGluZyBpcyBpbiBzaGFwZSBhZ2Fpbi4KClRoaXMgaXMgc29vb29vb29vb29vb29vb29vbyBtYWdp
YyB0aGF0IEkgcmVhbGx5IGRvbid0IHRoaW5rIHdlIHNob3VsZAplbmNvdXJhZ2UgcGVvcGxlIHdp
dGhvdXQgY2x1ZSB0byBtYXliZSB1c2UgdGhpcyBhbmQgdG90YWxseSBicmVhayBhbGwKZmVuY2Vz
IGd1YXJhbnRlZXMuCgpJZiB5b3UgZG8gd2FudCB0byBtYWtlIHN1cmUgYW4gb3B0aW1pemVkIHZl
cnNpb24gd2l0aGluCnJlc2VydmF0aW9uX29iamVjdC5jLCB0aGVuIGl0IHNob3VsZCBiZSBjb2Rl
IHdoaWNoIHJlcGxhY2VzIGZlbmNlcyBpZmY6Ci0gdGhleSdyZSB0aGUgc2FtZSBjb250ZXh0Ci0g
bGF0ZXIgaW4gdGhlIG9yZGVyaW5nIHdpdGhpbiB0aGF0IGNvbnRleHQKLSBvZiB0aGUgc2FtZSB0
eXBlIChpLmUuIHNhZmUgdnMgc2hhcmVkKQoKVGhhdCB3b3VsZCBhY3R1YWxseSBiZSBzYWZlIHRo
aW5nIHRvIGRvLgoKQWxzbywgdGhlIGFib3ZlIGlzIHdoYXQgSSBleHBlY3RlZCB3aGVuIGFza2lu
ZyAid2h5IGRvIHlvdSBuZWVkIHRoaXMiLCBub3QKIndlIHJlcGxhY2UgZmVuY2VzLCBpdHMgbW9y
ZSBlZmZpY2llbnQiIEkga2luZGEgZ290IHRoYXQgZnJvbSB0aGUgY29kZSA6LSkKClBsdXMgcmVh
ZGluZyB0aGlzIG5vdyB3aXRoIChhdCBsZWFzdCB0aGUgYmVsaWV2ZSBvZikgdW5kZXJzdGFuZGlu
ZyB3aGF0CnlvdSdyZSBkb2luZywgcmVwbGFjaW5nIHRoZSBmZW5jZXMgYW5kIHJlYXR0YWNoaW5n
IHRoZSBuZXh0IG9uZSBvZiB0aGVzZQptYWdpYyBmZW5jZXMgZG9lc24ndCBmZWVsIGxpa2UgaXQn
cyBhY3R1YWxseSBtYWtpbmcgYW55dGhpbmcgZmFzdGVyLiBKdXN0Cm1vcmUgb2JzY3VyZSAuLi4K
Ckxvb2tpbmcgYXQgcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2UgaXQgc2VlbXMg
dG8gZHRydCBhbHJlYWR5LgotRGFuaWVsCgo+ID4+IEhvdyBzaG91bGQgd2Ugd29yZCB0aGlzPyBT
b21ldGhpbmcgbGlrZToKPiA+Pgo+ID4+ICAgICogUmVtb3ZlIHNoYXJlZCBmZW5jZXMgYmFzZWQg
b24gdGhlaXIgZmVuY2UgY29udGV4dC4gUmVtb3ZpbmcgYSBmZW5jZQo+ID4+IGJlZm9yZSBpdCBp
cyBzaWduYWxlZCBpcyBvbmx5IHZhbGlkIGlmIGhhcmR3YXJlIGFjY2VzcyBpcyBwcmV2ZW50ZWQg
YnkKPiA+PiBzb21lIG90aGVyIG1lYW5zIGxpa2UgSU9NTVUgb3Igc2ltaWxhciB2aXJ0dWFsIG1l
bW9yeSBwcm90ZWN0aW9uLgo+ID4gVGhlIHBhcnQgdGhhdCBmcmVha3MgbWUgb3V0IGlzIHdoZXRo
ZXIgd2UgYnJlYWsgdGhlIGZlbmNlIGNoYWluZwo+ID4gYW55d2hlcmUgYnkgcmVtb3ZpbmcgZmVu
Y2VzLiBCdXQgSSBndWVzcyBpZiB5b3UncmUgb25seSByZW1vdmluZyB0aGUKPiA+IHNoYXJlZCBm
ZW5jZXMgdGhhdCBzaG91ZGwgYmUgZmluZSAuLi4KPiA+Cj4gPj4+IEFsc28gSSdtIG5vdCBzdXJl
IChkZXBlbmRpbmcgdXBvbiB3aGF0IHlvdSB1c2UgdGhpcyBmb3IpIHRoaXMgaXMKPiA+Pj4gYWN0
dWFsbHkgY29ycmVjdCBvdXRzaWRlIG9mIGFtZGdwdSBhbmQgaXQncyBpZ25vcmFuY2Ugb2YgdGhl
IGV4Y2x1c2l2ZQo+ID4+PiBmZW5jZS4KPiA+PiBObywgdGhhdCBpcyBjb21wbGV0ZWx5IHVucmVs
YXRlZC4gQnV0IEkgdGhvdWdodCB0aGF0IEkgY2xlYW4gdGhpcyB1cAo+ID4+IGJlZm9yZSBJIHN0
YXJ0IHRvIHRhY2tsZSB0aGUgZXhjbHVzaXZlIGZlbmNlIGlzc3VlLgo+ID4gLi4uIGV4Y2VwdCBh
bWRncHUgaGFzIGludGVybmFsbHkgYSB2ZXJ5IHN0cmFuZ2UgaWRlYSBvZiBzaGFyZWQgZmVuY2Vz
Cj4gPiB3aXRoIGF1dG8tZXhjbHVzaXZlIHByb21vdGlvbi4gQW5kIEkgdGhpbmsgcmVtb3Zpbmcg
ZXhjbHVzaXZlIGZlbmNlcwo+ID4gd2lsbCBicmVhayB0aGUgZmVuY2UgZGVwZW5kZW5jaWVzIG9m
IG90aGVyIChlYXJsaWVyKSBkbWEgZHJpdmVycyBieQo+ID4gb3RoZXIgb3BlcmF0aW9ucy4gT3Ig
aXMgdGhhdCB3aHkgeW91IGZpbHRlciBvbiB0aGUgY29udGV4dCwKPiA+IGVzc2VudGlhbGx5IGFt
ZCdzIHdheSBvZiBzYXlpbmcgInJlbW92ZSBhbGwgc2hhcmVkIGZlbmNlcyBmb3IgdGhpcwo+ID4g
dGhpbmcsIGtlZXAgb25seSB0aGUgZXhjbHVzaXZlIG9uZXMiLgo+ID4KPiA+IEkgZ3Vlc3MgSSBu
ZWVkIHRvIHJlYWQgd2hhdCB0aGlzIGFjdHVhbGx5IGRvZXMgaW4gdGhlIGNvZGUsIHNpbmNlIEkK
PiA+IHN0aWxsIGhhdmUgbm8gaWRlYSB3aHkgeW91IG5lZWQgdG8gZG8gdGhpcy4KPiA+IC1EYW5p
ZWwKPiA+Cj4gPj4gQ2hyaXN0aWFuLgo+ID4+Cj4gPj4+IC1EYW5pZWwKPiA+Pj4KPiA+Pj4+ICtp
bnQgcmVzZXJ2YXRpb25fb2JqZWN0X3JlbW92ZV9zaGFyZWRfZmVuY2Uoc3RydWN0IHJlc2VydmF0
aW9uX29iamVjdCAqb2JqLAo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQ2NF90IGNvbnRleHQpCj4gPj4+PiArewo+ID4+Pj4gKyAgICAgICBzdHJ1
Y3QgcmVzZXJ2YXRpb25fb2JqZWN0X2xpc3QgKm9sZCwgKm5ldzsKPiA+Pj4+ICsgICAgICAgdW5z
aWduZWQgaW50IGksIGosIGs7Cj4gPj4+PiArCj4gPj4+PiArICAgICAgIHJlc2VydmF0aW9uX29i
amVjdF9hc3NlcnRfaGVsZChvYmopOwo+ID4+Pj4gKwo+ID4+Pj4gKyAgICAgICBvbGQgPSByZXNl
cnZhdGlvbl9vYmplY3RfZ2V0X2xpc3Qob2JqKTsKPiA+Pj4+ICsgICAgICAgaWYgKCFvbGQpCj4g
Pj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPj4+PiArCj4gPj4+PiArICAgICAgIG5l
dyA9IGttYWxsb2Mob2Zmc2V0b2YodHlwZW9mKCpuZXcpLCBzaGFyZWRbb2xkLT5zaGFyZWRfbWF4
XSksCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7Cj4gPj4+PiArICAg
ICAgIGlmICghbmV3KQo+ID4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4+
Pj4gKwo+ID4+Pj4gKyAgICAgICAvKiBHbyB0aHJvdWdoIGFsbCB0aGUgc2hhcmVkIGZlbmNlcyBp
biB0aGUgcmVzZXZhdGlvbiBvYmplY3QgYW5kIHNvcnQKPiA+Pj4+ICsgICAgICAgICogdGhlIGlu
dGVyZXN0aW5nIG9uZXMgdG8gdGhlIGVuZCBvZiB0aGUgbmV3IGxpc3QuCj4gPj4+PiArICAgICAg
ICAqLwo+ID4+Pj4gKyAgICAgICBmb3IgKGkgPSAwLCBqID0gb2xkLT5zaGFyZWRfY291bnQsIGsg
PSAwOyBpIDwgb2xkLT5zaGFyZWRfY291bnQ7ICsraSkgewo+ID4+Pj4gKyAgICAgICAgICAgICAg
IHN0cnVjdCBkbWFfZmVuY2UgKmY7Cj4gPj4+PiArCj4gPj4+PiArICAgICAgICAgICAgICAgZiA9
IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQob2xkLT5zaGFyZWRbaV0sCj4gPj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXJ2YXRpb25fb2JqZWN0
X2hlbGQob2JqKSk7Cj4gPj4+PiArCj4gPj4+PiArICAgICAgICAgICAgICAgaWYgKGYtPmNvbnRl
eHQgPT0gY29udGV4dCkKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIFJDVV9JTklUX1BP
SU5URVIobmV3LT5zaGFyZWRbLS1qXSwgZik7Cj4gPj4+PiArICAgICAgICAgICAgICAgZWxzZQo+
ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgUkNVX0lOSVRfUE9JTlRFUihuZXctPnNoYXJl
ZFtrKytdLCBmKTsKPiA+Pj4+ICsgICAgICAgfQo+ID4+Pj4gKyAgICAgICBuZXctPnNoYXJlZF9t
YXggPSBvbGQtPnNoYXJlZF9tYXg7Cj4gPj4+PiArICAgICAgIG5ldy0+c2hhcmVkX2NvdW50ID0g
azsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgICAgLyogSW5zdGFsbCB0aGUgbmV3IGZlbmNlIGxpc3Qs
IHNlcWNvdW50IHByb3ZpZGVzIHRoZSBiYXJyaWVycyAqLwo+ID4+Pj4gKyAgICAgICBwcmVlbXB0
X2Rpc2FibGUoKTsKPiA+Pj4+ICsgICAgICAgd3JpdGVfc2VxY291bnRfYmVnaW4oJm9iai0+c2Vx
KTsKPiA+Pj4+ICsgICAgICAgUkNVX0lOSVRfUE9JTlRFUihvYmotPmZlbmNlLCBuZXcpOwo+ID4+
Pj4gKyAgICAgICB3cml0ZV9zZXFjb3VudF9lbmQoJm9iai0+c2VxKTsKPiA+Pj4+ICsgICAgICAg
cHJlZW1wdF9lbmFibGUoKTsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgICAgLyogRHJvcCB0aGUgcmVm
ZXJlbmNlcyB0byB0aGUgcmVtb3ZlZCBmZW5jZXMgKi8KPiA+Pj4+ICsgICAgICAgZm9yIChpID0g
aiwgayA9IDA7IGkgPCBvbGQtPnNoYXJlZF9jb3VudDsgKytpKSB7Cj4gPj4+PiArICAgICAgICAg
ICAgICAgc3RydWN0IGRtYV9mZW5jZSAqZjsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgICAgICAgICAg
ICBmID0gcmN1X2RlcmVmZXJlbmNlX3Byb3RlY3RlZChuZXctPnNoYXJlZFtpXSwKPiA+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXNlcnZhdGlvbl9v
YmplY3RfaGVsZChvYmopKTsKPiA+Pj4+ICsgICAgICAgICAgICAgICBkbWFfZmVuY2VfcHV0KGYp
Owo+ID4+Pj4gKyAgICAgICB9Cj4gPj4+PiArICAgICAgIGtmcmVlX3JjdShvbGQsIHJjdSk7Cj4g
Pj4+PiArCj4gPj4+PiArICAgICAgIHJldHVybiAwOwo+ID4+Pj4gK30KPiA+Pj4+ICtFWFBPUlRf
U1lNQk9MKHJlc2VydmF0aW9uX29iamVjdF9yZW1vdmVfc2hhcmVkX2ZlbmNlKTsKPiA+Pj4+ICsK
PiA+Pj4+ICAgIC8qKgo+ID4+Pj4gICAgICogcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9leGNsX2Zl
bmNlIC0gQWRkIGFuIGV4Y2x1c2l2ZSBmZW5jZS4KPiA+Pj4+ICAgICAqIEBvYmo6IHRoZSByZXNl
cnZhdGlvbiBvYmplY3QKPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMKPiA+Pj4+IGluZGV4IDEwYWJhZTM5OGU1MS4uOWIyNWFkM2Qw
MDNlIDEwMDY0NAo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9ncHV2bS5jCj4gPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMKPiA+Pj4+IEBAIC0yMjQsNTAgKzIyNCw3IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X2FtZGtmZF9yZW1vdmVfZXZpY3Rpb25fZmVuY2Uoc3RydWN0IGFtZGdwdV9ibyAq
Ym8sCj4gPj4+PiAgICAgICAgICAgaWYgKCFlZikKPiA+Pj4+ICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4+Pj4KPiA+Pj4+IC0gICAgICAgb2xkID0gcmVzZXJ2YXRpb25fb2Jq
ZWN0X2dldF9saXN0KHJlc3YpOwo+ID4+Pj4gLSAgICAgICBpZiAoIW9sZCkKPiA+Pj4+IC0gICAg
ICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4+IC0KPiA+Pj4+IC0gICAgICAgbmV3ID0ga21hbGxv
YyhvZmZzZXRvZih0eXBlb2YoKm5ldyksIHNoYXJlZFtvbGQtPnNoYXJlZF9tYXhdKSwKPiA+Pj4+
IC0gICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKPiA+Pj4+IC0gICAgICAgaWYgKCFu
ZXcpCj4gPj4+PiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPj4+PiAtCj4gPj4+
PiAtICAgICAgIC8qIEdvIHRocm91Z2ggYWxsIHRoZSBzaGFyZWQgZmVuY2VzIGluIHRoZSByZXNl
dmF0aW9uIG9iamVjdCBhbmQgc29ydAo+ID4+Pj4gLSAgICAgICAgKiB0aGUgaW50ZXJlc3Rpbmcg
b25lcyB0byB0aGUgZW5kIG9mIHRoZSBsaXN0Lgo+ID4+Pj4gLSAgICAgICAgKi8KPiA+Pj4+IC0g
ICAgICAgZm9yIChpID0gMCwgaiA9IG9sZC0+c2hhcmVkX2NvdW50LCBrID0gMDsgaSA8IG9sZC0+
c2hhcmVkX2NvdW50OyArK2kpIHsKPiA+Pj4+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2Zl
bmNlICpmOwo+ID4+Pj4gLQo+ID4+Pj4gLSAgICAgICAgICAgICAgIGYgPSByY3VfZGVyZWZlcmVu
Y2VfcHJvdGVjdGVkKG9sZC0+c2hhcmVkW2ldLAo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2VydmF0aW9uX29iamVjdF9oZWxkKHJlc3YpKTsK
PiA+Pj4+IC0KPiA+Pj4+IC0gICAgICAgICAgICAgICBpZiAoZi0+Y29udGV4dCA9PSBlZi0+YmFz
ZS5jb250ZXh0KQo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgUkNVX0lOSVRfUE9JTlRF
UihuZXctPnNoYXJlZFstLWpdLCBmKTsKPiA+Pj4+IC0gICAgICAgICAgICAgICBlbHNlCj4gPj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICBSQ1VfSU5JVF9QT0lOVEVSKG5ldy0+c2hhcmVkW2sr
K10sIGYpOwo+ID4+Pj4gLSAgICAgICB9Cj4gPj4+PiAtICAgICAgIG5ldy0+c2hhcmVkX21heCA9
IG9sZC0+c2hhcmVkX21heDsKPiA+Pj4+IC0gICAgICAgbmV3LT5zaGFyZWRfY291bnQgPSBrOwo+
ID4+Pj4gLQo+ID4+Pj4gLSAgICAgICAvKiBJbnN0YWxsIHRoZSBuZXcgZmVuY2UgbGlzdCwgc2Vx
Y291bnQgcHJvdmlkZXMgdGhlIGJhcnJpZXJzICovCj4gPj4+PiAtICAgICAgIHByZWVtcHRfZGlz
YWJsZSgpOwo+ID4+Pj4gLSAgICAgICB3cml0ZV9zZXFjb3VudF9iZWdpbigmcmVzdi0+c2VxKTsK
PiA+Pj4+IC0gICAgICAgUkNVX0lOSVRfUE9JTlRFUihyZXN2LT5mZW5jZSwgbmV3KTsKPiA+Pj4+
IC0gICAgICAgd3JpdGVfc2VxY291bnRfZW5kKCZyZXN2LT5zZXEpOwo+ID4+Pj4gLSAgICAgICBw
cmVlbXB0X2VuYWJsZSgpOwo+ID4+Pj4gLQo+ID4+Pj4gLSAgICAgICAvKiBEcm9wIHRoZSByZWZl
cmVuY2VzIHRvIHRoZSByZW1vdmVkIGZlbmNlcyBvciBtb3ZlIHRoZW0gdG8gZWZfbGlzdCAqLwo+
ID4+Pj4gLSAgICAgICBmb3IgKGkgPSBqLCBrID0gMDsgaSA8IG9sZC0+c2hhcmVkX2NvdW50OyAr
K2kpIHsKPiA+Pj4+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpmOwo+ID4+Pj4g
LQo+ID4+Pj4gLSAgICAgICAgICAgICAgIGYgPSByY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKG5l
dy0+c2hhcmVkW2ldLAo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlc2VydmF0aW9uX29iamVjdF9oZWxkKHJlc3YpKTsKPiA+Pj4+IC0gICAgICAg
ICAgICAgICBkbWFfZmVuY2VfcHV0KGYpOwo+ID4+Pj4gLSAgICAgICB9Cj4gPj4+PiAtICAgICAg
IGtmcmVlX3JjdShvbGQsIHJjdSk7Cj4gPj4+PiAtCj4gPj4+PiAtICAgICAgIHJldHVybiAwOwo+
ID4+Pj4gKyAgICAgICByZXR1cm4gcmVzZXJ2YXRpb25fb2JqZWN0X3JlbW92ZV9zaGFyZWRfZmVu
Y2UocmVzdiwgZWYtPmJhc2UuY29udGV4dCk7Cj4gPj4+PiAgICB9Cj4gPj4+Pgo+ID4+Pj4gICAg
c3RhdGljIGludCBhbWRncHVfYW1ka2ZkX2JvX3ZhbGlkYXRlKHN0cnVjdCBhbWRncHVfYm8gKmJv
LCB1aW50MzJfdCBkb21haW4sCj4gPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9yZXNl
cnZhdGlvbi5oIGIvaW5jbHVkZS9saW51eC9yZXNlcnZhdGlvbi5oCj4gPj4+PiBpbmRleCBmNDdl
ODE5NmQwMzkuLjFjODMzYTU2YjY3OCAxMDA2NDQKPiA+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgv
cmVzZXJ2YXRpb24uaAo+ID4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9yZXNlcnZhdGlvbi5oCj4g
Pj4+PiBAQCAtMjI5LDcgKzIyOSw4IEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfcmVzZXJ2ZV9z
aGFyZWQoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAo+ID4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBudW1fZmVuY2VzKTsKPiA+
Pj4+ICAgIHZvaWQgcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRfZmVuY2Uoc3RydWN0IHJl
c2VydmF0aW9uX29iamVjdCAqb2JqLAo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKTsKPiA+Pj4+IC0KPiA+Pj4+
ICtpbnQgcmVzZXJ2YXRpb25fb2JqZWN0X3JlbW92ZV9zaGFyZWRfZmVuY2Uoc3RydWN0IHJlc2Vy
dmF0aW9uX29iamVjdCAqb2JqLAo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQ2NF90IGNvbnRleHQpOwo+ID4+Pj4gICAgdm9pZCByZXNlcnZhdGlv
bl9vYmplY3RfYWRkX2V4Y2xfZmVuY2Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAo+
ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG1h
X2ZlbmNlICpmZW5jZSk7Cj4gPj4+Pgo+ID4+Pj4gLS0KPiA+Pj4+IDIuMTcuMQo+ID4+Pj4KPiA+
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4+
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo+ID4+Pgo+ID4KPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
