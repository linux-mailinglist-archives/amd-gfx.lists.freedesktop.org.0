Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BDE3164D
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 22:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6970089994;
	Fri, 31 May 2019 20:53:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5375E89994
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 20:53:54 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so2616793qto.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 13:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fkjJqTjeo+2b6y/fGs4Wa3swUnvRaql7+w4BFS3CkfE=;
 b=WTI03TYEbthPoaVwsW8hThgkYXq00bICTAmVUUN6Lctp6fm0KJzGFBM37JYS8OsSMz
 dzmWJlbuSWfaf2XyJXg8ZKZV71i1wa6B2uhQxlfAMP4u0Aluqg3XffmkDOWDp+akpDC1
 +/3wAM8bsDFhUpKgO4/hBIzrp/Bro0LIgkp7/LuamSJQudx6JLBCfBaDim+bm0E2T/F1
 Pb+eSm2ZVEhf5Tld6zPTlYMDNJdT5ABNz4cJQWGV6HOFZqo0lYj1n+ixiPQe9/zpKVMJ
 71sRPhyPyCsfh6ukNbxfhry6whumz5Derz3lb0UJEDXQzi3CNmaYC8eNPA5f8fp/cQCW
 RGEw==
X-Gm-Message-State: APjAAAX87OxiKui5GhFGmDHoPK0oR4bhnWgqFjuAhbPVldpMTgQGB/Kr
 K6tDanNQ2rxPhrppM8uyoef0qYIuli2wYgem5VN+73Fz
X-Google-Smtp-Source: APXvYqzPlPS8EgMWqebhONXkGyqDgYBWaNMpSOxmJPbggYcskP5BNTjG4shdeoKU9S8aIqvXRShMEDB0vKfmmrlo2WY=
X-Received: by 2002:ac8:2744:: with SMTP id h4mr11490684qth.180.1559336033278; 
 Fri, 31 May 2019 13:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-6-git-send-email-Oak.Zeng@amd.com>
 <4f49af4d-0953-030c-bb1b-47b7a5fa7c7c@amd.com>
 <CAPM=9tzs9adV7_ef4hpgswB-S==iQizAF_=FTarVm3EYwPCg0w@mail.gmail.com>
 <e857f0f4-341d-1e64-0ffe-5b6812ca5b7f@amd.com>
In-Reply-To: <e857f0f4-341d-1e64-0ffe-5b6812ca5b7f@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 1 Jun 2019 06:53:41 +1000
Message-ID: <CAPM=9tzQB_SbCHcAcs3PRq-maed9XdMroROWNQuf9DdgOH5zcQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fkjJqTjeo+2b6y/fGs4Wa3swUnvRaql7+w4BFS3CkfE=;
 b=tjolHrrOycGtEuBISO+i/N6W3A74tWQH7+W+RphuBJZv62GO2TA5Mg9bPLBshRhzw4
 GiFY4hYPiSz5+7uTh1h88Fr9/SN/Na9hQgOGYjzdhDpaeCvyE2tpoMD2XJ6SiT7Nfnpz
 UNP9l7xhfib1etWn2K6XzqIhMUYqhyz6SM3eTWMhROdzxyHzHGugGVsYya6cxDWTGNAr
 uGyFMa39HShUMHyrhbg8KU4GbPRgWeAHt2hCI4uw/a6RRCPLli44tBid8Z5rTtta1aye
 o8Bu+m5+QgkTqcrf9G3/6/6VXAf2EKal3QwIcr+/GEw4o48/12m1RAljw0QFFqetPL1e
 WskQ==
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCAxIEp1biAyMDE5IGF0IDA2OjA0LCBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS0wNS0zMCAxMToxMyBwLm0uLCBEYXZlIEFp
cmxpZSB3cm90ZToKPiA+IE9uIFNhdCwgMjUgTWF5IDIwMTkgYXQgMDU6NDgsIEt1ZWhsaW5nLCBG
ZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6Cj4gPj4gT24gMjAxOS0wNS0yMyA2
OjQxIHAubS4sIFplbmcsIE9hayB3cm90ZToKPiA+Pj4gQWRkIGEgbmV3IGtmZCBpb2N0bCB0byBh
bGxvY2F0ZSBxdWV1ZSBHV1MuIFF1ZXVlCj4gPj4+IEdXUyBpcyByZWxlYXNlZCBvbiBxdWV1ZSBk
ZXN0cm95Lgo+ID4+Pgo+ID4+PiBDaGFuZ2UtSWQ6IEk2MDE1M2MyNmE1Nzc5OTJhZDg3M2U0Mjky
ZTc1OWU1YzNkNWJiZDE1Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0Bh
bWQuY29tPgo+ID4+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4KPiA+Pgo+ID4gYnR3IGp1c3Qgbm90aWNlZCBpbiBwYXNzaW5nIHdlIGFyZSBhZGRp
bmcgbmV3IGZlYXR1cmVzIHRvIGtmZCwgaXMKPiA+IHRoZXJlIGFuIG9wZW4gc291cmNlIGRldmVs
b3BlZCB1c2Vyc3BhY2UgdG8gZ28gYWxvbmcgd2l0aCB0aGlzLCB0aGVyZQo+ID4gbmVlZHMgdG8g
YSBkZXYgYnJhbmNoIGluIHB1YmxpYyBiZWZvcmUgbmV3IGlvY3Rscy91YXBpIHN1cmZhY2VzIHNo
b3VsZAo+ID4gYmUgYWRkZWQgdG8gdGhlIGtlcm5lbC4KPiA+Cj4gPiBUaGUgY29tbWl0cyBzaG91
bGQgcHJvYmFibHkgaGF2ZSBwb2ludGVycyB0byB0aGF0IGJyYW5jaC4KPgo+IEFoLCBhIGNoaWNr
ZW4gYW5kIGVnZyBwcm9ibGVtLiBJIHRoaW5rIHRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgd2UncmUK
PiBhZGRpbmcgYSBuZXcgaW9jdGwgdG8gdXBzdHJlYW0gS0ZEIHJhdGhlciB0aGFuIHVwc3RyZWFt
aW5nIG9uZSB0aGF0J3MKPiBiZWVuIGRldmVsb3BlZCBpbnRlcm5hbGx5IGZpcnN0LiBNYXliZSBu
b3QgdGhlIHJpZ2h0IHdheSB0byBkbyBpdC4KClRoZXJlIGlzIG5vIGNoaWNrZW4vZWdnIHByb2Js
ZW0gaGVyZS4gWW91IGRldmVsb3Aga2VybmVsIGFuZCB1c2Vyc3BhY2UKaW4gcGFyYWxsZWwgaW4g
dGhlIG9wZW4sIG9uY2UgeW91IGFyZSBoYXBweSBhbmQgYm90aCBzaWRlcyBhcmUKcmV2aWV3ZWQg
eW91IG1lcmdlIGtlcm5lbCB0aGVuIHVzZXJzcGFjZS4KCkRhdmUuCgo+Cj4gSSBzaG91bGQgYmUg
YWJsZSB0byBwdWJsaXNoIHRoZSB1c2VyIG1vZGUgY29kZSBpbiBsaWJoc2FrbXQgbmV4dCB3ZWVr
Lgo+IFRoZW4gd2UnbGwgd29yayBvbiBhIGtmZHRlc3QgdG8gdmFsaWRhdGUgdGhlIGZpcm13YXJl
IGZ1bmN0aW9uYWxpdHkuCj4gRmluYWxseSB3ZSdsbCB1c2UgR1dTIGZ1cnRoZXIgdXAgdGhlIHNv
ZnR3YXJlIHN0YWNrIGZvciBzeW5jaHJvbml6YXRpb24KPiBvZiBjb25jdXJyZW50IGNvbXB1dGUg
d29ya2dyb3Vwcy4KPgo+IFJlZ2FyZHMsCj4gICAgRmVsaXgKPgo+Cj4gPgo+ID4gRGF2ZS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
