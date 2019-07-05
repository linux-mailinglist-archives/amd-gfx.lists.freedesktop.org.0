Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E0D60255
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 10:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17226E422;
	Fri,  5 Jul 2019 08:40:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823B46E422
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 08:39:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DADF324B;
 Fri,  5 Jul 2019 10:39:54 +0200 (CEST)
Date: Fri, 5 Jul 2019 11:39:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with connectors
Message-ID: <20190705083934.GB4994@pendragon.ideasonboard.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <20190628161137.GH4779@pendragon.ideasonboard.com>
 <44f98134-bc8a-133a-b702-589f007b175e@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44f98134-bc8a-133a-b702-589f007b175e@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562315995;
 bh=USKu7A4PWilgTTdXdxKtoXPECYgfrGM8DlEj3pQAAto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1pwwLHVR/7eXdMJTO0WkEhUPtQkbyKj4lTdqiGuGovVQhxKvRxa7vEFFHzwMxUzs
 KX9kqTU82CYRsTLJToik+vtuoqGa2AcS0KkMZZSIIaakDJZZeoZQPm4UvzcK9CQVWb
 N0LtHMV3M7CG297W0BtkxJNNTlmHsl9sFp/OidcE=
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
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDEwOjM4OjI3QU0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBXIGRuaXUgMjguMDYuMjAxOSBvwqAxODoxMSwg
TGF1cmVudCBQaW5jaGFydCBwaXN6ZToKPiA+IEhpIEFuZHJ6ZWosCj4gPiAKPiA+IEp1c3QgRllJ
LCBJIGhhdmUgYSBwYXRjaCBzZXJpZXMgdGhhdCByZXdvcmtzIGhvdyBicmlkZ2VzIGFuZCBjb25u
ZWN0b3JzCj4gPiBhcmUgaGFuZGxlZCwgYW5kIGl0IHdpbGwgaGVhdmlseSBjb25mbGljdCB3aXRo
IHRoaXMuIFRoZSBwdXJwb3NlIG9mIHRoZQo+ID4gdHdvIHNlcmllcyBpc24ndCB0aGUgc2FtZSwg
c28gYm90aCBtYWtlIHNlbnNlLiBJIHdpbGwgcG9zdCB0aGUgcGF0Y2hlcwo+ID4gdGhpcyB3ZWVr
ZW5kLCBhbmQgd2lsbCB0aGVuIHJldmlldyB0aGlzIHNlcmllcyBpbiB0aGF0IGNvbnRleHQuCj4g
PiBIb3BlZnVsbHkgd2UnbGwgZ2V0IHRoZSBiZXN0IG9mIGJvdGggd29ybGRzIDotKQo+IAo+IEhp
IExhdXJlbnQsCj4gCj4gRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHJldmlldyBteSBwYXRjaCBz
ZXJpZXM/CgpOb3QgeWV0IEknbSBhZnJhaWQuIEkndmUgYmVlbiBmYWlybHkgYnVzeSB0aGlzIHdl
ZWssIGFuZCBjb3VwbGVkIHdpdGgKc29tZSBoZWFsdGggaXNzdWVzIChidXQgSSdtIGZlZWxpbmcg
YmV0dGVyIG5vdywgc28gbm90aGluZyB0byB3b3JyeQphYm91dCkgaXQgZGVsYXllZCBteSByZXZp
ZXdzLiBJJ2xsIGdldCB0byBpdCBhcyBzb29uIGFzIHBvc3NpYmxlLiBUaGFuawp5b3UgZm9yIHBp
bmdpbmcgbWUuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
