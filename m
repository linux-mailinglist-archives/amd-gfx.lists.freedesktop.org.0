Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9C839CB
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 21:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2A16E536;
	Tue,  6 Aug 2019 19:45:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217826E536
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 19:45:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v15so79399229wml.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 12:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zqnY4zoExYirv5j275kkSZM5xl5DmrdpmTxFwF+lOzc=;
 b=ejIbFOHQOErJm04LsRum2B2zuwmoLEAYXnpILtmEaPJABGFchdLgonpCsyMb4XDuEX
 QVj+lPM6H15/n1bPNgLz4wYVNqQV1z2+g9oiDLQJcDELDzeeveoIvfaRGEi6qmIuJ9Uo
 65zGCJqj4GglN/CrTTLmI7t9AIUvjmPpRBnycc2oL/Q2giCshuWorFo/sqnzK5Q+wyiD
 GYoOkQaBTmTmC/0yW6zSteQdGyIsXuygdXZciRrbym6k4rjB4UFlRaW3TFa2Rxavhxrr
 ZWCsV3bQTjzOZjSsR3jZi/qwpbyKL4RJPX6FcVGNCTgu3dEwN6VsDTDQx3DIWBm+l979
 iG/A==
X-Gm-Message-State: APjAAAXmN/NL0Fyl0MHt/ZNJ1NB46PK9QVXv5BWNblj/nquexoSAPTZK
 c7ILPd8MhImPXVwxIb2lhOL4yu1rCKIpt3AHK7c=
X-Google-Smtp-Source: APXvYqzXwbQhPH1/MtKwj6ayoXZ0LVip26qAJLlPdhq0Iu78rygKXhUnocsYSmd520AxEmlG08hdIWBRfBfsMkHCL3g=
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr6386822wme.67.1565120755598; 
 Tue, 06 Aug 2019 12:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190806103156.3778-1-tao.zhou1@amd.com>
 <a19ac490-a803-84c0-5598-e78edbb3447b@gmail.com>
In-Reply-To: <a19ac490-a803-84c0-5598-e78edbb3447b@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Aug 2019 15:45:44 -0400
Message-ID: <CADnq5_Pv8xqexv_gv4F1jBis2RPuTgHfr4wb39OpFR6kJF9KcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix compile error about readq/writeq on arm
 ARCH
To: Christian Koenig <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zqnY4zoExYirv5j275kkSZM5xl5DmrdpmTxFwF+lOzc=;
 b=EwYoxePl/KS6w7E7Ft/Exsa8u38hJ3WVuPExyN5cC/FDcWzSAHXyg/Q/451kVCnuSc
 r2yVnbykRxLXcYvajEd0Ihn60FHLEFnK2GktLeQocU1RHcL/AaLTGK8cSKUlNXhAtpkY
 HNmclOmV7P78RMyreNQoaVPEC5L0i1g/dQ24Brdmuj1/bHMIbh6pYN7SNKhT4aq0IXjl
 zsGaQPTnJBbfqQGKY8qsHepf6Z4rvtViRbKhHjCUHqIGET23NOPzwD+hEd/JuWRKOh3a
 gbmJERJJr4ETZorgu9ExtCQabyJvPLwNnbER5ydIXqEMbyw65lkJKfnmJWvfwXErCwQC
 WUkQ==
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 kernel-build-reports@lists.linaro.org, Tao Zhou <tao.zhou1@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA3OjI2IEFNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFtIDA2LjA4LjE5IHVtIDEyOjMx
IHNjaHJpZWIgVGFvIFpob3U6Cj4gPiByZWFkcS93cml0ZXEgY2FuJ3QgYmUgZm91bmQgb24gYXJt
IGFyY2hpdGVjdHVyZSwgaW1wbGVtZW50IHRoZW0KPiA+IHdpdGggMzIgYml0cyBvcGVyYXRpb25z
Cj4KPiBNaG0sIHdhc24ndCB0aGUgd2hvbGUgcG9pbnQgYWJvdXQgdXNpbmcgcmVhZHEvd3JpdGVx
IHRoYXQgd2UgbmVlZGVkCj4gNjRiaXQgYXRvbWljIG9wZXJhdGlvbnM/CgpJdCBtaWdodCBiZSBi
ZXR0ZXIgdG8gdXNlIGF0b21pYzY0X3JlYWQvYXRvbWljNjRfc2V0IGxpa2Ugd2UgZG8gZm9yIGRv
b3JiZWxscy4KCkFsZXgKCj4KPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBU
YW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKPiA+IGluZGV4IGY2MmQ0ZjMwZTgxMC4uYWFmN2YzMWNmOGRmIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiA+IEBAIC0yOSw2
ICsyOSw3IEBACj4gPiAgICNpbmNsdWRlIDxsaW51eC9rdGhyZWFkLmg+Cj4gPiAgICNpbmNsdWRl
IDxsaW51eC9jb25zb2xlLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2lvLTY0LW5vbmF0b21pYy1sby1oaS5oPgo+ID4gICAjaW5jbHVkZSA8ZHJt
L2RybVAuaD4KPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+ID4gICAj
aW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
