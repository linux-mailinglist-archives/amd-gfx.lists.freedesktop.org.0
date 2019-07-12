Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA9667E7
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 09:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954396E2E2;
	Fri, 12 Jul 2019 07:42:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C0E6E2E5
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 07:42:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d79so5697126qke.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 00:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T9t4sMdQ7ju6F95r8VqvTuSRnDoqwe8Mg8/EN7g9bjA=;
 b=pd8hHZ07ocKDhEJUo1FIuDDwFtJRxOeQpAiGT0NAdRefuyUFOLgZJksOhsAGSxpBIE
 OFu16SiPDLzIJ7WibvcvmecjyFdzBN8Ybth92iiwSjDeCk/l+M+XT5fVZP9OH8lzYWLg
 qnRoAm/ufguXDIW0Yg28wg1tDM9UNu2m90ErlqfZIDb/WW1/txj7c4jdbslg4XunlLjE
 g5zw5pyiEwkLM0GkSIJKvNC7m4iZ+IcpZ5ZYKb3aYDOcLMCA8Y99pF5ORiaTutGb7L4r
 H6qzivKZmF5fWjT8yFJayuOUjC85SOMw0ahNGVzcCoy+Dt+KlRAwvcMEC5J0891VIXSZ
 0Zcw==
X-Gm-Message-State: APjAAAWVrNzzBVBhayUqCuqn3FGWyf2uKZmjb1uBWvr0fEwnaGOyi8QU
 A2ThgdEe6p8PMd8sgPt3aboSzNjlDFJWNaElYtkMJw==
X-Google-Smtp-Source: APXvYqwrgaL71IJVsa72rhVPOh+cWEZTyj1wxVLTO7GH4TREGLwUjIqC+Ue6eLE9ZNTL9jxZF/dPXtjZfP7KY6zczmo=
X-Received: by 2002:a37:bcc7:: with SMTP id m190mr5072496qkf.433.1562917375149; 
 Fri, 12 Jul 2019 00:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <86afdc0bca6939901870176dcf55f279f7b10a08.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <86afdc0bca6939901870176dcf55f279f7b10a08.1562843413.git.andrzej.p@collabora.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 12 Jul 2019 09:42:44 +0200
Message-ID: <CA+M3ks63WY4umDR_1apjLj4kDf8jpm-CLsC-XO7dY=LbY--p-w@mail.gmail.com>
Subject: Re: [PATCH v4 15/23] drm: sti: Provide ddc symlink in hdmi connector
 sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T9t4sMdQ7ju6F95r8VqvTuSRnDoqwe8Mg8/EN7g9bjA=;
 b=rk/R6JuNMGMSZJb+YPovsTkrtFyiszy1QWZh3TpLHFIqylcWHxh/ewIgd5a91wVrQN
 ceahiCjA8ikBPJluTWFpkNkYsV/2p3vlCRMfVhOMdONZ8Zsfd3+3N/qVDb4F6+pIMDnK
 MbECjms9qZWlKYELmMDYGSebaDp1YXaSOCKmgRxegfoFrGHo+siChFMRBKT6zhvAcFLi
 UXNatuEC7/Nah1UVkg8fj0wFrba/yP9t7EBPLYREIDMsvG8kovZq5n+fy87RmOjt2+sl
 282rTn+x8xEupAa3RoC0ULJjlpGrxGjO+Ro8hneewvhjGYR9H4mz+vUwj9n1jyvbXOaQ
 ghUQ==
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TGUgamV1LiAxMSBqdWlsLiAyMDE5IMOgIDEzOjMwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiBhIMOpY3JpdCA6Cj4KPiBVc2UgdGhlIGRkYyBwb2ludGVy
IHByb3ZpZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0aS9z
dGlfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jCj4gaW5kZXggZjAzZDYx
N2VkYzRjLi45MGY4ZGI2M2MwOTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0aS9z
dGlfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jCj4gQEAgLTEy
NzksNiArMTI3OSw3IEBAIHN0YXRpYyBpbnQgc3RpX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIGRybV9icmlk
Z2VfYXR0YWNoKGVuY29kZXIsIGJyaWRnZSwgTlVMTCk7Cj4KPiAgICAgICAgIGNvbm5lY3Rvci0+
ZW5jb2RlciA9IGVuY29kZXI7Cj4gKyAgICAgICBkcm1fY29ubmVjdG9yLT5kZGMgPSBoZG1pLT5k
ZGNfYWRhcHQ7Cj4KPiAgICAgICAgIGRybV9jb25uZWN0b3IgPSAoc3RydWN0IGRybV9jb25uZWN0
b3IgKiljb25uZWN0b3I7Cj4KPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
