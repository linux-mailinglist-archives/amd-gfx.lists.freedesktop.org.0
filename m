Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90796C9366
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 23:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB86A6E15C;
	Wed,  2 Oct 2019 21:19:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E802C89E3F
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 21:14:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id q24so401682plr.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Oct 2019 14:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHYXT2MapQxKdVQ7MnzMSwJjofrDGs/mMoboG0lEVTY=;
 b=pSx2p8l/OYMGVUjWRQW2C27fnJaVwGhOnO4H6b56E7VEE8vt08ZQe+4KGdBpQ+by4q
 5XWwQNA3nAaTS3hHE/YczOBbVthUqqq2EUqhx9jmA7FN0F+mAvqonrAZ8+xSg8xLWQF4
 2GLhvvZcGEjkiBcegm5TKxqxP6IbbtQ5dHu6COh3FtRZTEFesiZQB64YSgSrNxLrE+lW
 D3YZ+5mUuJzK6Z1lg0BU8yrzP2O5ot3kiEvYNNupMmz499UMxMNlUR6p4LPQQzFXuEhG
 5O9IQBnYW266KttGqMd6Qdn+KywCYfxRBhcqssdOEsXZ2sFlcOOfHz2Lxcbw17qBA+js
 TxKQ==
X-Gm-Message-State: APjAAAV/lC6dknsXsvFFraTYub0Cm6zBXX3VWMdv0B8cU8ebRqGEk90z
 Vm8+iYw8S1o3/eGTY4fuaZB/uEQPToafYJS3K0zqnw==
X-Google-Smtp-Source: APXvYqxscMTSRx/XiSzosNRZGgs61rijzLWHJd6F0wCfXuLQb53BowxR8X4US85qSpRvMEwBdGgmXlVN1rxd4bJrnCY=
X-Received: by 2002:a17:902:7c08:: with SMTP id
 x8mr5677826pll.119.1570050880892; 
 Wed, 02 Oct 2019 14:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
In-Reply-To: <20191002120136.1777161-5-arnd@arndb.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Oct 2019 14:14:29 -0700
Message-ID: <CAKwvOdmjM80XP7VH83iLn=8mz6W1+SbXST2FChEnH0LSRRm4pA@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 21:19:49 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iHYXT2MapQxKdVQ7MnzMSwJjofrDGs/mMoboG0lEVTY=;
 b=q9BbE0GObEk4vG/jJQ0YhLUz1bCBYIbTLNZetkjn6SHRgl3kt8KZJrGK1Tsh2z6ny3
 rvHM0yq5mK/VsmL5dflFyowjNdGsZLa3DqmZurfCRLnoFFe9PLQFznn2ekPcO1ZQ7h4/
 LT2HcpG8jJCe3Qz0l/FHM95jgQSltvUcOmtvBNFNJFU4E+e4Bzh/5pm7ylzLg8Wjl4H0
 f+qkN1H/r8SXX07bGvr+mIDfaUG7pZ62TyLGVWu7gva2uU8wXztk/EI4fmdyTi5jufU7
 xItUvO0XmbH9ob6UK2tvmz4vHwQ1KmB61cN//NqcoJgAFvtlE3ZHuok5RFNzlVOHEXNy
 2Iyw==
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA1OjAzIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gSnVzdCBsaWtlIGFsbCB0aGUgb3RoZXIgdmFyaWFudHMsIHRoaXMgb25l
IHBhc3NlcyBpbnZhbGlkCj4gY29tcGlsZS10aW1lIG9wdGlvbnMgd2l0aCBjbGFuZyBhZnRlciB0
aGUgbmV3IGNvZGUgZ290Cj4gbWVyZ2VkOgo+Cj4gY2xhbmc6IGVycm9yOiB1bmtub3duIGFyZ3Vt
ZW50OiAnLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NCcKPiBzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI2NTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UubycgZmFpbGVkCj4KPiBVc2UgdGhlIHNh
bWUgdmFyaWFudCB0aGF0IHdlIGhhdmUgZm9yIGRjbjIwIHRvIGZpeCBjb21waWxhdGlvbi4KPgo+
IEZpeGVzOiBlY2VkNTFmOWJhYmIgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBodWJwIGJsb2NrIGZv
ciBSZW5vaXIgKHYyKSIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KClRoYW5rcyBmb3IgdGhlIHBhdGNoIQpSZXZpZXdlZC1ieTogTmljayBEZXNhdWxuaWVy
cyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+ClRlc3RlZC1ieTogTmljayBEZXNhdWxuaWVycyA8
bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+CihUaG91Z2ggSSB0aGluayBpdCdzIGFscmVhZHkgYmVl
biBtZXJnZWQpCgpBbGV4LCBkbyB5b3Uga25vdyB3aHkgdGhlIEFNREdQVSBkcml2ZXIgdXNlcyBh
IGRpZmZlcmVudCBzdGFjawphbGlnbm1lbnQgKDE2QikgdGhhbiB0aGUgcmVzdCBvZiB0aGUgeDg2
IGtlcm5lbD8gIChzZWUKYXJjaC94ODYvTWFrZWZpbGUgd2hpY2ggdXNlcyA4QiBzdGFjayBhbGln
bm1lbnQpLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01h
a2VmaWxlIHwgMTIgKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIxL01ha2VmaWxlCj4gaW5kZXggOGNkOWRlOGIxYTdhLi5lZjY3M2JmZmMyNDEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlCj4gQEAg
LTMsNyArMywxNyBAQAo+Cj4gIERDTjIxID0gZGNuMjFfaHVicC5vIGRjbjIxX2h1YmJ1Yi5vIGRj
bjIxX3Jlc291cmNlLm8KPgo+IC1DRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9y
ZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFy
eT00Cj4gK2lmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFy
eT00KSwpCj4gKyAgICAgICBjY19zdGFja19hbGlnbiA6PSAtbXByZWZlcnJlZC1zdGFjay1ib3Vu
ZGFyeT00Cj4gK2Vsc2UgaWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sIC1tc3RhY2stYWxpZ25tZW50
PTE2KSwpCj4gKyAgICAgICBjY19zdGFja19hbGlnbiA6PSAtbXN0YWNrLWFsaWdubWVudD0xNgo+
ICtlbmRpZgo+ICsKPiArQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZGNuMjEvZGNuMjFfcmVzb3Vy
Y2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgJChjY19zdGFja19hbGlnbikKPiArCj4gK2lmZGVm
IENPTkZJR19DQ19JU19DTEFORwo+ICtDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24y
MV9yZXNvdXJjZS5vICs9IC1tc3NlMgo+ICtlbmRpZgo+Cj4gIEFNRF9EQUxfRENOMjEgPSAkKGFk
ZHByZWZpeCAkKEFNRERBTFBBVEgpL2RjL2RjbjIxLywkKERDTjIxKSkKPgo+IC0tCj4gMi4yMC4w
Cj4KPiAtLQo+IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNj
cmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIkNsYW5nIEJ1aWx0IExpbnV4IiBncm91cC4KPiBU
byB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBm
cm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIGNsYW5nLWJ1aWx0LWxpbnV4K3Vuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb20uCj4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNp
dCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvY2xhbmctYnVpbHQtbGludXgvMjAx
OTEwMDIxMjAxMzYuMTc3NzE2MS01LWFybmQlNDBhcm5kYi5kZS4KCgoKLS0gClRoYW5rcywKfk5p
Y2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
