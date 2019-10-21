Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D7BDFE6F
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 09:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264086E41B;
	Tue, 22 Oct 2019 07:40:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19F6E180
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 16:35:07 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q7so8747576pfh.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 09:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YQ2SYzDjclp6+UMcXfMKe/dCfkknHxuiGOrHRSVn0cA=;
 b=c6U1q+XEEp7zXcW6Di4VdqvOGFxzoUsW5wyC9ucSh2JYcndM2lLnjuSPQM8fz+jF0F
 fY0iVAFyQ/fFUpCeVvR5MjCp1LYNLVkSGTRV0hXPt4nhJvClxle61/QQCgl2vAm8KmOm
 2jHQY2NJwpVFFcJFKH+FeNc1Dl1A71ONgZCMZbiuwqkVMgrfZXL5qSM/UHdHwd5XU9OM
 iFlBrhjoBNyBpWqKue/+XmlkEJ5J8BdgQNZRk+tRB6uhcC3ChyeI43MUzvNBCqbVQdGD
 0iT175dFNzPdziGMxND1/D3rx+E0XwZbQrENwNroS3Hs/v3ywWORdX/JL2Ha/lV0cjGe
 ourw==
X-Gm-Message-State: APjAAAW7tpTh21IEy0/zmIQlOhrs2XXndsqL8C1icU/eCGxeh9PtY76z
 yej2OMuaHvpcKejVHCqwM9ma1Q==
X-Google-Smtp-Source: APXvYqwmyNu50+FxrTO6V6IulFup1S67xnT8cj+dbepaT4niD1qSPIKhFvBy+c/p26nJk53uezcFig==
X-Received: by 2002:a63:ad0d:: with SMTP id g13mr26250877pgf.407.1571675706632; 
 Mon, 21 Oct 2019 09:35:06 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local
 (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
 by smtp.gmail.com with ESMTPSA id e4sm16610297pff.22.2019.10.21.09.35.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 09:35:05 -0700 (PDT)
Subject: Re: [PATCH 5/5] ionic: Use debugfs_create_bool() to export bool
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Breno_Leit=c3=a3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David@rox.of.borg, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Casey Leedom <leedom@chelsio.com>,
 Pensando Drivers <drivers@pensando.io>, Kevin Hilman <khilman@kernel.org>,
 Nishanth Menon <nm@ti.com>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-6-geert+renesas@glider.be>
From: Shannon Nelson <snelson@pensando.io>
Message-ID: <aeebbd5f-6100-2780-ef1c-6b1c261c9d23@pensando.io>
Date: Mon, 21 Oct 2019 09:35:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021145149.31657-6-geert+renesas@glider.be>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:40:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pensando.io; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YQ2SYzDjclp6+UMcXfMKe/dCfkknHxuiGOrHRSVn0cA=;
 b=ZvioHrwPqgA32sqk/ZfXl+AIKFsddUO2tNAqbJtu4tCcRANhGvReU9J0qCrPtBX4dr
 XyEFxDF3rI4Skd8uu+tW37bMnIbIfeVll6YP9QPsiv1m3u9UI7Hz50C/EOmQGDDvJxjt
 MNnpf3ALOQX+wn100d4q49rWpqL/dLYkEvAbPydL+TGXqu4wUlet2YAblmsMtkne7qnv
 mFnrVk537e3SRZLOSIfp5DZTMcRh1T3I7huUyEOh7iplVBe4IuwO1byLK+LTz8AIzALW
 g8HnTvBYEWL7IAty6Tx+yooX0qDMEelsrde2cgdpkGApf9pCWxxWG6Loqrv6o3ZIrYoi
 o0cQ==
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
Cc: amd-gfx@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMTAvMjEvMTkgNzo1MSBBTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEN1cnJlbnRs
eSBib29sIGlvbmljX2NxLmRvbmVfY29sb3IgaXMgZXhwb3J0ZWQgdXNpbmcKPiBkZWJ1Z2ZzX2Ny
ZWF0ZV91OCgpLCB3aGljaCByZXF1aXJlcyBhIGNhc3QsIHByZXZlbnRpbmcgZnVydGhlciBjb21w
aWxlcgo+IGNoZWNrcy4KPgo+IEZpeCB0aGlzIGJ5IHN3aXRjaGluZyB0byBkZWJ1Z2ZzX2NyZWF0
ZV9ib29sKCksIGFuZCBkcm9wcGluZyB0aGUgY2FzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpBY2tlZC1ieTogU2hhbm5v
biBOZWxzb24gPHNuZWxzb25AcGVuc2FuZG8uaW8+Cgo+IC0tLQo+ICAgZHJpdmVycy9uZXQvZXRo
ZXJuZXQvcGVuc2FuZG8vaW9uaWMvaW9uaWNfZGVidWdmcy5jIHwgMyArLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9wZW5zYW5kby9pb25pYy9pb25pY19kZWJ1Z2ZzLmMgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9wZW5zYW5kby9pb25pYy9pb25pY19kZWJ1Z2ZzLmMKPiBpbmRleCBi
YzAzY2VjZjgwY2M5ZWI0Li41YmViYTkxNWY2OWQxMmRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3BlbnNhbmRvL2lvbmljL2lvbmljX2RlYnVnZnMuYwo+ICsrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3BlbnNhbmRvL2lvbmljL2lvbmljX2RlYnVnZnMuYwo+IEBAIC0xNzAs
OCArMTcwLDcgQEAgdm9pZCBpb25pY19kZWJ1Z2ZzX2FkZF9xY3Eoc3RydWN0IGlvbmljX2xpZiAq
bGlmLCBzdHJ1Y3QgaW9uaWNfcWNxICpxY3EpCj4gICAJZGVidWdmc19jcmVhdGVfeDY0KCJiYXNl
X3BhIiwgMDQwMCwgY3FfZGVudHJ5LCAmY3EtPmJhc2VfcGEpOwo+ICAgCWRlYnVnZnNfY3JlYXRl
X3UzMigibnVtX2Rlc2NzIiwgMDQwMCwgY3FfZGVudHJ5LCAmY3EtPm51bV9kZXNjcyk7Cj4gICAJ
ZGVidWdmc19jcmVhdGVfdTMyKCJkZXNjX3NpemUiLCAwNDAwLCBjcV9kZW50cnksICZjcS0+ZGVz
Y19zaXplKTsKPiAtCWRlYnVnZnNfY3JlYXRlX3U4KCJkb25lX2NvbG9yIiwgMDQwMCwgY3FfZGVu
dHJ5LAo+IC0JCQkgICh1OCAqKSZjcS0+ZG9uZV9jb2xvcik7Cj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9i
b29sKCJkb25lX2NvbG9yIiwgMDQwMCwgY3FfZGVudHJ5LCAmY3EtPmRvbmVfY29sb3IpOwo+ICAg
Cj4gICAJZGVidWdmc19jcmVhdGVfZmlsZSgidGFpbCIsIDA0MDAsIGNxX2RlbnRyeSwgY3EsICZj
cV90YWlsX2ZvcHMpOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
