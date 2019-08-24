Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B29BD3D
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Aug 2019 13:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6946E0BD;
	Sat, 24 Aug 2019 11:13:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563FC6E0BD
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 11:13:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f72so11118062wmf.5
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 04:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=qy9T5Af5P4xa7BS9ErVy0UgjnsV8jeQ2YcfzPCA9OMQ=;
 b=szK4VgefBuFZy1Qcf2I6TeerzGvadYcxiaymSfeZp5Y5N5RF0kXU66AUUwaSsy6Hap
 X7yXqrekjDzoraEZ38Jo6fw1AITl4xQdGhvjrwk929wSfFa+oFuJgV+3r2htho0gjMk9
 ggbPieaQ8TtF7YqrvuGePeaFM9hdHUFGGF6JsegRQacq/VZV/o26xGcp3VFirFb+B2Oo
 T68+T63qUtWmhYfTEww3S/aaE9J8jmnfL00OwI7dCQlzkusZw5c9elmAUiHALGlHVUZ/
 Ivtowd+X7cypaVwmpUsNXCa87ygYfyQW3w2xZB8N9H9ctwq6nGRxLXwOSULLDNOJoNHT
 okMw==
X-Gm-Message-State: APjAAAVvw13zz3gESeOvAlwCt+SNAdH2uw/USdkVu5Dh+BcHb0E93zPC
 jUNZBegz4xppKkpMXlmwPUmrab+F
X-Google-Smtp-Source: APXvYqzGscD3bfFgSynymCmWQMs8e2Wp1skN+PPpRr9fH7XGYdvsZwy+ImOzxVvWxpFYXZNintrJhQ==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr10531998wmb.170.1566645192983; 
 Sat, 24 Aug 2019 04:13:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p19sm6438698wmg.31.2019.08.24.04.13.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Aug 2019 04:13:12 -0700 (PDT)
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
Date: Sat, 24 Aug 2019 13:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823213249.10749-4-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qy9T5Af5P4xa7BS9ErVy0UgjnsV8jeQ2YcfzPCA9OMQ=;
 b=H3SSKhM2QBM4cuhhvH/mjHSF3tZFfIxUuYTb+0snKvqQYfdXOFPXeaIELbUTtbKpNS
 FuKEbF5rdUj/V6Far4LnNNeWIXWv/aR4oPR4GC9uDvBVjUcplzxXtwABetrhV8D/TF9C
 9efgZII90S7+K015nlzdJwLLp5hp+W3xuADdm9THH5L900eDQZqUMXLI1BPltXKZ/P/6
 vLdYFUoQXuB9wG7IIO6OMbXO2ZTUh/wLcOTlIkPLAtpxmy/jaqa6MPKU0AveAUp+uPwo
 c14pRZR7aAapCdXE09axXdeXSLafkkfVeCs4DM6Zs4f61KACfNf8mVFIqD7UW9JkiygR
 byVw==
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
Reply-To: christian.koenig@amd.com
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjMuMDguMTkgdW0gMjM6MzMgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gRnJvbTogT2Fr
IFplbmcgPE9hay5aZW5nQGFtZC5jb20+Cj4KPiBTZXQgc25vb3BlZCBQVEUgZmxhZyBhY2NvcmRp
bmcgdG8gbWFwcGluZyBmbGFnLiBXcml0ZSByZXF1ZXN0IHRvIGEKPiBwYWdlIHdpdGggc25vb3Bl
ZCBiaXQgc2V0LCB3aWxsIHNlbmQgb3V0IGludmFsaWRhdGUgcHJvYmUgcmVxdWVzdAo+IHRvIFRD
QyBvZiB0aGUgcmVtb3RlIEdQVSB3aGVyZSB0aGUgdnJhbSBwYWdlIHJlc2lkZXMuCj4KPiBDaGFu
Z2UtSWQ6IEk3OTlmNjhlYzdhNWExYWJmMzIwNzVmNWVmMzEwNTE2NDFhMGIzNzM2Cj4gU2lnbmVk
LW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+IGlu
ZGV4IDlhYWZjZGE2YzQ4OC4uOGE3YzRlYzY5YWU4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jCj4gQEAgLTYwNCw2ICs2MDQsOSBAQCBzdGF0aWMgdWludDY0X3QgZ21j
X3Y5XzBfZ2V0X3ZtX3B0ZV9mbGFncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAlp
ZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9QUlQpCj4gICAJCXB0ZV9mbGFnIHw9IEFNREdQVV9Q
VEVfUFJUOwo+ICAgCj4gKwlpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9JTlZBTElEQVRFX1BS
T0JFKQo+ICsJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfU05PT1BFRDsKPiArCgpUaGF0IGlzIHN0
aWxsIGEgTkFLIHdpdGhvdXQgZnVydGhlciBjaGVja3MuIFdlIG5lZWQgdG8gbWFrZSBhYnNvbHV0
ZWx5IApzdXJlIHRoYXQgd2UgZG9uJ3Qgc2V0IHRoaXMgd2hlbiBQQ0llIHJvdXRpbmcgaXMgaW4g
dXNlLgoKQ2hyaXN0aWFuLgoKPiAgIAlyZXR1cm4gcHRlX2ZsYWc7Cj4gICB9Cj4gICAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
