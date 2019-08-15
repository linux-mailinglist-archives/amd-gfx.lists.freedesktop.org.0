Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B338EC60
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 15:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB29A6E990;
	Thu, 15 Aug 2019 13:07:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947986E990
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 13:07:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so2130395wru.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 06:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7iUTr+qK3Uwks/qwkkgwDmjkR5QtJiKQ3eQIuX0apc=;
 b=NbeXoHMG4/UBrF1bMNmiAKq0thmj9XR0AXrwCCID5JxacuwxctgMCjBEVBkjpIY6Z9
 VkBx4KZwMq1fliIRsrjuL0mlPzWc74clxMMvb3mYFGZCAy+403r6ewdLuqJZPxLIBeqG
 QqfLwfPx9JIv3UfFIEe/76f27irz+sW2nbR9pUi9ScacoBsWEdyj6PvpDkrk9GBlFzex
 E8hGQ7yCa8qfTrK0Ep228+H7iUjVem2MwpHvFKZrGpXsWOz3gpz9HE2eOWq1fh912VvG
 bZgWT8/fBC/kVQM6Wd0c8rWUompgtF+rec40xE6gO0543Sddr/R3CiUEb52XD8btFgM3
 faSg==
X-Gm-Message-State: APjAAAUH2imoA1O077DnljTS4eISToBUz7Cdh3h21vtA5gVJ1p9A6Mzq
 IYNZjRMfEjXxK8/g0FWgJsJVicq2pdUlHrvfn4o=
X-Google-Smtp-Source: APXvYqydG3hzgH1fNH5X76tJeEOtOHnPdb8LHZezZXVBIj4UIauOu145t7lScRLkKNIBSAWBzAmgp4hN+0oGWtwaPNU=
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr5371602wru.74.1565874448050; 
 Thu, 15 Aug 2019 06:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190815084320.20015-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190815084320.20015-1-xiaojie.yuan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 09:07:15 -0400
Message-ID: <CADnq5_P=L+WsykKyYmW+FNCwYFY3VkRM9q5jfos70ogAJqhVJA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove special autoload handling for navi12
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r7iUTr+qK3Uwks/qwkkgwDmjkR5QtJiKQ3eQIuX0apc=;
 b=Ty67zsIW+l4Um1qEDK1hymfYyk0ibFqSrLiq0VKuWQ43eGBHorD7TzkkyiS5jP08Ww
 C7x/SOdGg5BqP8bpT58YCvSeiX+wEt+YHSXobvaCcYoatoOvgvj7GD3WAxC79TzugLF2
 8iN2gSG++BXZgVNexGJmhXNSDpYoau1OadfTQr1I9ZiGULk2IpKr7gVci54dMN2nm8n4
 mskSg4V0gD3hf3FqvAVlOl7tlayjJ6ltswVm1lAuwhdYG9e7RySP6liCWpmdf4wyXOZl
 u0Ju1FlcjLhZ7GAlW84AC/q5CJupaiddFaG8mTLGHTUTEmEVPtBagrhObaMsRwl5AP17
 X8vA==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDo0MyBBTSBZdWFuLCBYaWFvamllIDxYaWFvamllLll1
YW5AYW1kLmNvbT4gd3JvdGU6Cj4KPiBzL3IgbGlzdCBpbiBybGMgZmlybXdhcmUgaXMgcmVhZHks
IHNvIHJlbW92ZSB0aGUgc3BlY2lhbCBhdXRvbG9hZCBoYW5kbGluZwo+Cj4gU2lnbmVkLW9mZi1i
eTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFja2VkLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jCj4gaW5kZXggYWFhNGNkZjhiY2FlLi40YjJkMmZkNzJkYzYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gQEAgLTEwMzMsOCArMTAzMyw3
IEBAIHN0YXRpYyBpbnQgcHNwX25wX2Z3X2xvYWQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICAgICAgICAgICAgICAgICAv
KiBTdGFydCBybGMgYXV0b2xvYWQgYWZ0ZXIgcHNwIHJlY2lldmVkIGFsbCB0aGUgZ2Z4IGZpcm13
YXJlICovCj4gLSAgICAgICAgICAgICAgIGlmICh1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VD
T0RFX0lEX1JMQ19SRVNUT1JFX0xJU1RfU1JNX01FTSB8fAo+IC0gICAgICAgICAgICAgICAgICAg
KGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMiAmJiB1Y29kZS0+dWNvZGVfaWQgPT0gQU1E
R1BVX1VDT0RFX0lEX1JMQ19HKSkgewo+ICsgICAgICAgICAgICAgICBpZiAodWNvZGUtPnVjb2Rl
X2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX1NSTV9NRU0pIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXQgPSBwc3BfcmxjX2F1dG9sb2FkKHBzcCk7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRFJNX0VSUk9SKCJGYWlsZWQgdG8gc3RhcnQgcmxjIGF1dG9sb2FkXG4iKTsKPiAtLQo+
IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
