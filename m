Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C974F3B9CA3
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Jul 2021 08:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E4589E69;
	Fri,  2 Jul 2021 06:56:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EBE89E69
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Jul 2021 06:56:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id o5so14539257ejy.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Jul 2021 23:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=in2SVVqcnUqkj85eAj6o5RhnZ0dCtYefB5uwiriMLsI=;
 b=Hz088EbSKHWdlKrJTacSASRFPdM0iK0JgaerUzk7fm3fSyZzkkBfNeoHZVK/G/lYrf
 gwJwxJfiuxjGxLEWsVlZ1iFo/GXNCy7Ny2DUOtRqT0RlpFUP6tZNjPxvJlbyDNbtaoui
 cJaZCvyMBdVR1BO/NpbMiNZBaN9ZeJeyZ0BFjNFcsZ0PUsb8RcSN7q3jg4qjkAnbrctw
 LXhMP9mdpW+kPmq+HtmCqZe971Bi98MEJvovBF8KRfD5HI91F9KrtF04PI5P7W158CaH
 bKwkJUsJXGVfUiMSwHHDyFKINgGQLpHfVUVQ9qQYsGEsBVsnt+0pXkbTYPzxUzyPSTyz
 thDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=in2SVVqcnUqkj85eAj6o5RhnZ0dCtYefB5uwiriMLsI=;
 b=rfWrZhGxjdipwPZNEuXEYDqn++pELOYLTE693duK4M8U7ch8ShXgW8k1/konui/3TQ
 dsIK5u9+mCCHmnAtaHCEyqgYUS41oNni3csxe+6wtJqvQ7RI+eT7EUpCDIdw/2Kq5Ixt
 qaIsWwoephIDsl2J+H9Ww0cxIH8UcmLbsUiWyQetP2/w/12svnWAls3OHTuaMVo3eLgc
 b7fzcTvptK74krHviiViiuX8r8k3Wg4trmIwHtjuQQGrtRb3jDMNwkseuLMxI/6wSE0d
 qSFYgClbovdoCmk0dRlCnAJ7NZQ7lQXrZMIYouqMdxyEcdZTmjGvI8lLWECCkqJIQ5ye
 jNVw==
X-Gm-Message-State: AOAM531NOcTJeUJMTsybydiaki3zdg35xa+rsjQ2TbmFdk8pLG6Tuigj
 1mlUQnrvdt77hS1ab70BwUbftVcdlJw=
X-Google-Smtp-Source: ABdhPJwr9QIL+EsEL9Owxg4Jzl7/HkoG0KrlZTADwHhC+alQSGb8IfvPeSH9qoSIAhjGkBgf3OrirQ==
X-Received: by 2002:a17:906:1c4d:: with SMTP id
 l13mr3850626ejg.277.1625208988736; 
 Thu, 01 Jul 2021 23:56:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c4dc:c513:8418:12c8?
 ([2a02:908:1252:fb60:c4dc:c513:8418:12c8])
 by smtp.gmail.com with ESMTPSA id h8sm704081ejj.22.2021.07.01.23.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 23:56:28 -0700 (PDT)
Subject: Re: [PATCH v4] drm/amdgpu: Restore msix after FLR
To: Peng Ju Zhou <PengJu.Zhou@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210702032318.27215-1-PengJu.Zhou@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9e7beb4a-cf7d-2384-4385-51ff2da1ff69@gmail.com>
Date: Fri, 2 Jul 2021 08:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702032318.27215-1-PengJu.Zhou@amd.com>
Content-Language: en-US
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
Cc: "Emily.Deng" <Emily.Deng@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpBbSAwMi4wNy4yMSB1bSAwNToyMyBzY2hyaWViIFBlbmcgSnUgWmhvdToKPiBGcm9tOiAiRW1p
bHkuRGVuZyIgPEVtaWx5LkRlbmdAYW1kLmNvbT4KPgo+IEFmdGVyIEZMUiwgdGhlIG1zaXggd2ls
bCBiZSBjbGVhcmVkLCBzbyBuZWVkIHRvIHJlLWVuYWJsZSBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEVtaWx5LkRlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEp1
IFpob3UgPFBlbmdKdS5aaG91QGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaXJxLmMgfCAxNCArKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aXJxLmMKPiBpbmRleCA5MGY1MDU2MWI0M2EuLjAzNDQyMGMzODM1MiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKPiBAQCAtMjc3LDYgKzI3NywxOSBAQCBzdGF0
aWMgYm9vbCBhbWRncHVfbXNpX29rKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCXJl
dHVybiB0cnVlOwo+ICAgfQo+ICAgCj4gK3ZvaWQgYW1kZ3B1X3Jlc3RvcmVfbXNpeChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKCkkgdGhpbmsgdGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgc3Rh
dGljIGFuZCBtYXliZSBhZGQgYSBvbmUgbGluZSBjb21tZW50IApsaWtlICJDbGVhciBhbmQgcmUt
c2V0IHRoZSBNU0lYIGZsYWdzIGlmIHRoZXkgd2hlcmUgc2V0IGJlZm9yZSB0byAKdHJpZ2dlciBy
ZS1lbmFibGluZyBpdCIuCgpXaXRoIHRoYXQgZG9uZSBmZWVsIGZyZWUgdG8gYWRkIGFuIEFja2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiwgYnV0IEkg
d291bGQgYWxzbyB3YWl0IHdoYXQgQWxleCBoYXMgdG8gc2F5IAphYm91dCB0aGF0LgoKUmVnYXJk
cywKQ2hyaXN0aWFuCgo+ICt7Cj4gKwl1MTYgY3RybDsKPiArCj4gKwlwY2lfcmVhZF9jb25maWdf
d29yZChhZGV2LT5wZGV2LCBhZGV2LT5wZGV2LT5tc2l4X2NhcCArIFBDSV9NU0lYX0ZMQUdTLCAm
Y3RybCk7Cj4gKwlpZiAoIShjdHJsICYgUENJX01TSVhfRkxBR1NfRU5BQkxFKSkKPiArCQlyZXR1
cm47Cj4gKwo+ICsJY3RybCAmPSB+UENJX01TSVhfRkxBR1NfRU5BQkxFOwo+ICsJcGNpX3dyaXRl
X2NvbmZpZ193b3JkKGFkZXYtPnBkZXYsIGFkZXYtPnBkZXYtPm1zaXhfY2FwICsgUENJX01TSVhf
RkxBR1MsIGN0cmwpOwo+ICsJY3RybCB8PSBQQ0lfTVNJWF9GTEFHU19FTkFCTEU7Cj4gKwlwY2lf
d3JpdGVfY29uZmlnX3dvcmQoYWRldi0+cGRldiwgYWRldi0+cGRldi0+bXNpeF9jYXAgKyBQQ0lf
TVNJWF9GTEFHUywgY3RybCk7Cj4gK30KPiAgIC8qKgo+ICAgICogYW1kZ3B1X2lycV9pbml0IC0g
aW5pdGlhbGl6ZSBpbnRlcnJ1cHQgaGFuZGxpbmcKPiAgICAqCj4gQEAgLTU1OCw2ICs1NzEsNyBA
QCB2b2lkIGFtZGdwdV9pcnFfZ3B1X3Jlc2V0X3Jlc3VtZV9oZWxwZXIoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCj4gICB7Cj4gICAJaW50IGksIGosIGs7Cj4gICAKPiArCWFtZGdwdV9yZXN0
b3JlX21zaXgoYWRldik7Cj4gICAJZm9yIChpID0gMDsgaSA8IEFNREdQVV9JUlFfQ0xJRU5USURf
TUFYOyArK2kpIHsKPiAgIAkJaWYgKCFhZGV2LT5pcnEuY2xpZW50W2ldLnNvdXJjZXMpCj4gICAJ
CQljb250aW51ZTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
