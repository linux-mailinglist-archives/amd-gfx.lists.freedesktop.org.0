Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE42CE86B
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 17:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D586E07B;
	Mon,  7 Oct 2019 15:56:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556996E07B;
 Mon,  7 Oct 2019 15:56:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so15973587wro.5;
 Mon, 07 Oct 2019 08:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKl/PfgKAr8YhYEpS+YymS2q68h7uKqU67+A+i7H4JI=;
 b=jSLlPlqiDWv/X1SxcNfgpZ7H39L6Oih2aXdqN1fYjT8nq04L3H4vEpf+7Bi7MFpUOM
 IXP0vwGMt1/p/ziFWEjPvFmydRm6cgVfwgo3LqRNvf5yqEw6DiX2XRL+xwzlikcEreH5
 3L4kY06fSqTQBROYrb8CsOW6+ChVqMmmiVVW01TYEs1ZDyEDLqFI3r2o5s6djuqzXcSo
 giqA/ngIBHXB/I6rbjajcR6MLaijccNW5vzViaC7sxMVE42oaszpQdEQ9+LnePUIbPac
 QUCsdfLy6+hWRVsgdLSPUClfLP9OLKQHnXlkX9LcTsoLM4XeZEbdnAxDFUX2WEYuXWML
 ldSA==
X-Gm-Message-State: APjAAAWIJdSm+qIn6OIu/dM1Iy/PSXiSWHgfey6icf9RzEzJ5Fx1MuSO
 6Yp2eKAZN/E4U4JGVIkOhtHX4xY3BrT7rHNVCXo=
X-Google-Smtp-Source: APXvYqzWRusk54BRlh8Vj4kcGxAB4PQIYCfS3CJJZ8LD48feZ0ZtBtZKhBITIHTmurRV0B3SD7aw+dSJ7U9VUoYljLo=
X-Received: by 2002:adf:fc07:: with SMTP id i7mr8222186wrr.50.1570463770859;
 Mon, 07 Oct 2019 08:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191005113205.14601-1-christophe.jaillet@wanadoo.fr>
 <04e006aa-a354-dfe3-3d13-d674c662c300@amd.com>
In-Reply-To: <04e006aa-a354-dfe3-3d13-d674c662c300@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 11:55:58 -0400
Message-ID: <CADnq5_NhypGdi6z78BbWimAZVtEDxhe1Rw=D4p7JPQNH0Kdqyw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix typo in some comments
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DKl/PfgKAr8YhYEpS+YymS2q68h7uKqU67+A+i7H4JI=;
 b=JAkfGW2fPhaHwu0r9uGVsSnnwKsartCh6UKqSuYnahS/t+YLlfImE2qxkw0cKF1IuD
 k8ym2ZMJljbeH0v2fLjNn0tx29Pyi1Kjmxr0QJnPF4ppQmP39wc21eO5wxswpJ5FrOA7
 Pn1d5rIc42LYilntEcM6NsrZxRShz3m2TO3SpXLqNNq7CmgBc532yIy7+RzubAMwjbaZ
 bOEBt2Oo7IQ1B5ROl4U+YyNc+DKU8HfWBT9iCMPsyrY4aSI2ywXr4yJ4KVpdDPEvTp6t
 LHqxKeFN5iLPeCYKWvCeuoxU3gEOxfKG/b6D6GYjg1Uu0fYdMDrJfXUP3F6XJmGrw1Aj
 wWTA==
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCAxMDoxMyBBTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTEwLTA1IDc6MzIgYS5tLiwgQ2hyaXN0b3BoZSBK
QUlMTEVUIHdyb3RlOgo+ID4gcCBhbmQgZyBhcmUgc3dpdGNoZWQgaW4gJ2FtZHBndV9kbScKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxl
dEB3YW5hZG9vLmZyPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4KPiBIYXJyeQo+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKPiA+IGluZGV4IDkyOTMyZDUyMWQ3Zi4uYjljMmUxYTkzMGFiIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwo+ID4gQEAgLTEwNDMsNyArMTA0Myw3IEBAIHN0YXRpYyB2b2lkIHMzX2hhbmRsZV9t
c3Qoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9vbCBzdXNwZW5kKQo+ID4KPiA+ICAvKioKPiA+
ICAgKiBkbV9od19pbml0KCkgLSBJbml0aWFsaXplIERDIGRldmljZQo+ID4gLSAqIEBoYW5kbGU6
IFRoZSBiYXNlIGRyaXZlciBkZXZpY2UgY29udGFpbmluZyB0aGUgYW1kcGd1X2RtIGRldmljZS4K
PiA+ICsgKiBAaGFuZGxlOiBUaGUgYmFzZSBkcml2ZXIgZGV2aWNlIGNvbnRhaW5pbmcgdGhlIGFt
ZGdwdV9kbSBkZXZpY2UuCj4gPiAgICoKPiA+ICAgKiBJbml0aWFsaXplIHRoZSAmc3RydWN0IGFt
ZGdwdV9kaXNwbGF5X21hbmFnZXIgZGV2aWNlLiBUaGlzIGludm9sdmVzIGNhbGxpbmcKPiA+ICAg
KiB0aGUgaW5pdGlhbGl6ZXJzIG9mIGVhY2ggRE0gY29tcG9uZW50LCB0aGVuIHBvcHVsYXRpbmcg
dGhlIHN0cnVjdCB3aXRoIHRoZW0uCj4gPiBAQCAtMTA3Myw3ICsxMDczLDcgQEAgc3RhdGljIGlu
dCBkbV9od19pbml0KHZvaWQgKmhhbmRsZSkKPiA+Cj4gPiAgLyoqCj4gPiAgICogZG1faHdfZmlu
aSgpIC0gVGVhcmRvd24gREMgZGV2aWNlCj4gPiAtICogQGhhbmRsZTogVGhlIGJhc2UgZHJpdmVy
IGRldmljZSBjb250YWluaW5nIHRoZSBhbWRwZ3VfZG0gZGV2aWNlLgo+ID4gKyAqIEBoYW5kbGU6
IFRoZSBiYXNlIGRyaXZlciBkZXZpY2UgY29udGFpbmluZyB0aGUgYW1kZ3B1X2RtIGRldmljZS4K
PiA+ICAgKgo+ID4gICAqIFRlYXJkb3duIGNvbXBvbmVudHMgd2l0aGluICZzdHJ1Y3QgYW1kZ3B1
X2Rpc3BsYXlfbWFuYWdlciB0aGF0IHJlcXVpcmUKPiA+ICAgKiBjbGVhbnVwLiBUaGlzIGludm9s
dmVzIGNsZWFuaW5nIHVwIHRoZSBEUk0gZGV2aWNlLCBEQywgYW5kIGFueSBtb2R1bGVzIHRoYXQK
PiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
