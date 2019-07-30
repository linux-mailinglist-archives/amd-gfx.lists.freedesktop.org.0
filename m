Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B57AB1A
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 16:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3346E57F;
	Tue, 30 Jul 2019 14:33:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AB86E57F
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 14:33:24 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id g7so48048670oia.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 07:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X7ZAcJ103Q+TcrL+5+PqgSRWi2eCQ1wo573Yn6x0gSc=;
 b=X1SgmnNr7CTgFqvnmmHje2mj35oTkVaz1abusPSWEr1ZHlaSBzpFsrjKsrC0FNcR1V
 Yk9YzpoC0UCRw2PVlJgjZHWu9rqWD/7pumVWDkm4N/TEKDS7c93+cQg+b6jpoovPRHTf
 Z80m50RgTybQkqhyI+4w0TqJJtVBu2OUZaetDooEJhj5EPdRdSpNebK7uoWwgMG/jtMH
 vgC+flmiY21WRBHvy96KCvgNOUCiSkfafOeW+NxWryHIEJZUJjCfr809Q8upJirqxVgk
 KAudaFGeOF2WPrsSCwFjwVmwAcWStAD9T5iqlR344ZzkosDzWNYV+VCMXkrnNatyzYHA
 RD2A==
X-Gm-Message-State: APjAAAUvshCT2+524pKG9ufxWlDNcQiDAm/dI+Wum6Z7XWOaqzvlnig2
 LbzMdFpa24MjwcpL8Q3ROh55I9wbv4rjhQESZMs=
X-Google-Smtp-Source: APXvYqz+G/C1P9RfombGxaXko5WV80erStoFLuUT3ryqPTBzuFJb2xlZoLcofvGG50rroMqjhDlEfolhE3dPKyjxRwQ=
X-Received: by 2002:a05:6808:118:: with SMTP id
 b24mr58738233oie.128.1564497203463; 
 Tue, 30 Jul 2019 07:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190730003225.322-1-brian.welty@intel.com>
 <951e9e42-96bc-fc8d-0153-3ca7ac5f1e74@amd.com>
 <20190730093847.GP15868@phenom.ffwll.local>
 <ee600bcd-d880-7199-21d0-df6e51f5adfa@amd.com>
 <CAKMK7uHrGgn7FqSBD+qDYYHxyPLvv5OqzwLTACWuqbjANKFuQA@mail.gmail.com>
 <743ab99e-95cb-f6fa-6903-5556d5050f6d@daenzer.net>
In-Reply-To: <743ab99e-95cb-f6fa-6903-5556d5050f6d@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 30 Jul 2019 16:33:12 +0200
Message-ID: <CAKMK7uGhwWcJ_PzHF_7uVMP+=3fLug4FfB2k6Q4Dy2C+z2Ae9g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Propose new struct drm_mem_region
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X7ZAcJ103Q+TcrL+5+PqgSRWi2eCQ1wo573Yn6x0gSc=;
 b=EBNtsOu8I09fRm7GcDgXSU57qJKk3fUtI27PcLB5ugzH94KohkTS/0O29xh3ONEPKb
 bGCfSEwQ5bOCxPWy8P7FzmCGPUgKxFUPsP9txpzkyJYj/l4ODEquINXe1KH35mSAF9t+
 UfjOJyzSG7wwhOX6KKtt3iuHTIJSc4UvWQwzo=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Brian Welty <brian.welty@intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgNDozMCBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPiBPbiAyMDE5LTA3LTMwIDEyOjQ1IHAubS4sIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAzMCwgMjAxOSBhdCAxMjoyNCBQTSBLb2VuaWcsIENo
cmlzdGlhbgo+ID4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPj4gQW0gMzAu
MDcuMTkgdW0gMTE6Mzggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4+PiBPbiBUdWUsIEp1bCAz
MCwgMjAxOSBhdCAwODo0NTo1N0FNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiA+
Cj4gPj4+Pj4gKyNkZWZpbmUgRFJNX01FTV9TWVNURU0gICAgIDAKPiA+Pj4+PiArI2RlZmluZSBE
Uk1fTUVNX1NUT0xFTiAgICAgMQo+ID4+Pj4gSSB0aGluayB3ZSBuZWVkIGEgYmV0dGVyIG5hbWlu
ZyBmb3IgdGhhdC4KPiA+Pj4+Cj4gPj4+PiBTVE9MRU4gc291bmRzIHdheSB0byBtdWNoIGxpa2Ug
c3RvbGVuIFZSQU0gZm9yIGludGVncmF0ZWQgR1BVcywgYnV0IGF0Cj4gPj4+PiBsZWFzdCBmb3Ig
VFRNIHRoaXMgaXMgdGhlIHN5c3RlbSBtZW1vcnkgY3VycmVudGx5IEdQVSBhY2Nlc3NpYmxlLgo+
ID4+PiBZdXAgdGhpcyBpcyB3cm9uZywgZm9yIGk5MTUgd2UgdXNlIHRoaXMgYXMgc3RvbGVuLCBm
b3IgdHRtIGl0J3MgdGhlIGdwdQo+ID4+PiB0cmFuc2xhdGlvbiB0YWJsZSB3aW5kb3cgaW50byBz
eXN0ZW0gbWVtb3J5LiBOb3QgdGhlIHNhbWUgdGhpbmcgYXQgYWxsLgo+ID4+Cj4gPj4gVGhvdWdo
dCBzby4gVGhlIGNsb3Nlc3QgSSBoYXZlIGluIG1pbmQgaXMgR1RULCBidXQgZXZlcnl0aGluZyBl
bHNlIHdvcmtzCj4gPj4gYXMgd2VsbC4KPiA+Cj4gPiBXb3VsZCB5b3VyIEdQVV9NQVBQRUQgYWJv
dmUgd29yayBmb3IgVFQ/IEkgdGhpbmsgd2UnbGwgYWxzbyBuZWVkCj4gPiBTVE9MRU4sIEknbSBl
dmVuIGhlYXJpbmcgbm9pc2VzIHRoYXQgdGhlcmUncyBnb2luZyB0byBiZSBzdG9sZW4gZm9yCj4g
PiBkaXNjcmV0ZSB2cmFtIGZvciB1cyAuLi4KPgo+IENvdWxkIGk5MTUgdXNlIERSTV9NRU1fUFJJ
ViBmb3Igc3RvbGVuPyBPciBpcyB0aGVyZSBvdGhlciBoYXJkd2FyZSB3aXRoCj4gc29tZXRoaW5n
IHNpbWlsYXI/CgpJIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMgbXVjaCB3aGF0IHdlIG5hbWUgaXQg
Li4uIF9QUklWIHNvdW5kcyBhcyBnb29kCmFzIGFueXRoaW5nIGVsc2UuIEFzIGxvbmcgYXMgd2Ug
bWFrZSBpdCBjbGVhciB0aGF0IHVzZXJzcGFjZSBibyBhbHNvCm1pZ2h0IGVuZCB1cCBpbiB0aGVy
ZSBJIHRoaW5rIGl0J3MgYWxsIGdvb2QuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
