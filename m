Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5C5A0A8
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 18:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8976E95F;
	Fri, 28 Jun 2019 16:18:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Fri, 28 Jun 2019 16:18:19 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0054B6E95F;
 Fri, 28 Jun 2019 16:18:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 679A02C6;
 Fri, 28 Jun 2019 18:11:56 +0200 (CEST)
Date: Fri, 28 Jun 2019 19:11:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with connectors
Message-ID: <20190628161137.GH4779@pendragon.ideasonboard.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1561738316;
 bh=mSOeRJ1wGePYLOMOW0PRGv70otvkJMFN8nmnuRRHa8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T45j8X2x9MbzTWLkYgvI4lfZMJCNPNRrx0dXLCkVmGtsv1mmOcC1QJjMKXhJbeT6k
 +W769DcVTcs8zRH2S/Ty7Ryk94n9002vHTe6m2VQXPOtaHbBM6JF1APjCaFnN4Kj3L
 EMbuWECrrdf0OMphSda5s15W3KCRYs9pez1z40yo=
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

SGkgQW5kcnplaiwKCkp1c3QgRllJLCBJIGhhdmUgYSBwYXRjaCBzZXJpZXMgdGhhdCByZXdvcmtz
IGhvdyBicmlkZ2VzIGFuZCBjb25uZWN0b3JzCmFyZSBoYW5kbGVkLCBhbmQgaXQgd2lsbCBoZWF2
aWx5IGNvbmZsaWN0IHdpdGggdGhpcy4gVGhlIHB1cnBvc2Ugb2YgdGhlCnR3byBzZXJpZXMgaXNu
J3QgdGhlIHNhbWUsIHNvIGJvdGggbWFrZSBzZW5zZS4gSSB3aWxsIHBvc3QgdGhlIHBhdGNoZXMK
dGhpcyB3ZWVrZW5kLCBhbmQgd2lsbCB0aGVuIHJldmlldyB0aGlzIHNlcmllcyBpbiB0aGF0IGNv
bnRleHQuCkhvcGVmdWxseSB3ZSdsbCBnZXQgdGhlIGJlc3Qgb2YgYm90aCB3b3JsZHMgOi0pCgpP
biBGcmksIEp1biAyOCwgMjAxOSBhdCAwNjowMToxNFBNICswMjAwLCBBbmRyemVqIFBpZXRyYXNp
ZXdpY3ogd3JvdGU6Cj4gSXQgaXMgZGlmZmljdWx0IGZvciBhIHVzZXIgdG8ga25vdyB3aGljaCBv
ZiB0aGUgaTJjIGFkYXB0ZXJzIGlzIGZvciB3aGljaAo+IGRybSBjb25uZWN0b3IuIFRoaXMgc2Vy
aWVzIGFkZHJlc3NlcyB0aGlzIHByb2JsZW0uCj4gCj4gVGhlIGlkZWEgaXMgdG8gaGF2ZSBhIHN5
bWJvbGljIGxpbmsgaW4gY29ubmVjdG9yJ3Mgc3lzZnMgZGlyZWN0b3J5LCBlLmcuOgo+IAo+IGxz
IC1sIC9zeXMvY2xhc3MvZHJtL2NhcmQwLUhETUktQS0xL2RkYwo+IGxyd3hyd3hyd3ggMSByb290
IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjIFwK
PiAJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmkyYy9pMmMtMgo+IAo+IFRoZSB1c2VyIHRo
ZW4ga25vd3MgdGhhdCB0aGVpciBjYXJkMC1IRE1JLUEtMSB1c2VzIGkyYy0yIGFuZCBjYW4gZS5n
LiBydW4KPiBkZGN1dGlsOgo+IAo+IGRkY3V0aWwgLWIgMiBnZXR2Y3AgMHgxMAo+IFZDUCBjb2Rl
IDB4MTAgKEJyaWdodG5lc3MgICAgICAgICAgICAgICAgICAgICk6IGN1cnJlbnQgdmFsdWUgPSAg
ICA5MCwgbWF4IHZhbHVlID0gICAxMDAKPiAKPiBUaGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmll
cyBhZGRzIHN0cnVjdCBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdAo+IGRybV9jb25uZWN0
b3IuIElmIHRoZSBmaWVsZCBpcyB1c2VkIGJ5IGEgcGFydGljdWxhciBkcml2ZXIsIHRoZW4gYW4K
PiBhcHByb3ByaWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgYnkgdGhlIGdlbmVyaWMgY29k
ZSwgd2hpY2ggaXMgYWxzbyBhZGRlZAo+IGJ5IHRoaXMgcGF0Y2guCj4gCj4gVGhlIHNlY29uZCBw
YXRjaCBpcyBhbiBleGFtcGxlIG9mIGhvdyB0byBjb252ZXJ0IGEgZHJpdmVyIHRvIHRoaXMgbmV3
IHNjaGVtZS4KPiAKPiB2MS4udjI6Cj4gCj4gLSB1c2VkIGZpeGVkIG5hbWUgImRkYyIgZm9yIHRo
ZSBzeW1ib2xpYyBsaW5rIGluIG9yZGVyIHRvIG1ha2UgaXQgZWFzeSBmb3IKPiB1c2Vyc3BhY2Ug
dG8gZmluZCB0aGUgaTJjIGFkYXB0ZXIKPiAKPiB2Mi4udjM6Cj4gCj4gLSBjb252ZXJ0ZWQgYXMg
bWFueSBkcml2ZXJzIGFzIHBvc3NpYmxlLgo+IAo+IFBBVENIRVMgMy8yMi0yMi8yMiBTSE9VTEQg
QkUgQ09OU0lERVJFRCBSRkMhCj4gCj4gQW5kcnplaiBQaWV0cmFzaWV3aWN6ICgyMik6Cj4gICBk
cm06IEluY2x1ZGUgZGRjIGFkYXB0ZXIgcG9pbnRlciBpbiBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+
ICAgZHJtL2V4eW5vczogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3IncyBzeXNmcwo+
ICAgZHJtOiByb2NrY2hpcDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiByazMwNjZfaGRtaSBzeXNm
cyBkaXJlY3RvcnkKPiAgIGRybTogcm9ja2NoaXA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gaW5u
b19oZG1pIHN5c2ZzIGRpcmVjdG9yeQo+ICAgZHJtL21zbS9oZG1pOiBQcm92aWRlIGRkYyBzeW1s
aW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQo+ICAgZHJtL3N1bjRpOiBoZG1p
OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIHN1bjRpIGhkbWkgY29ubmVjdG9yIHN5c2ZzCj4gICAg
IGRpcmVjdG9yeQo+ICAgZHJtL21lZGlhdGVrOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkg
Y29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQo+ICAgZHJtL3RlZ3JhOiBQcm92aWRlIGRkYyBzeW1s
aW5rIGluIG91dHB1dCBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5Cj4gICBkcm0vaW14OiBpbXgt
bGRiOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzCj4gICBkcm0vaW14
OiBpbXgtdHZlOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzCj4gICBk
cm0vdmM0OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkK
PiAgIGRybTogenRlOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2Zz
IGRpcmVjdG9yeQo+ICAgZHJtOiB6dGU6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gdmdhIGNvbm5l
Y3RvciBzeXNmcyBkaXJlY3RvcnkKPiAgIGRybS90aWxjZGM6IFByb3ZpZGUgZGRjIHN5bWxpbmsg
aW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQo+ICAgZHJtOiBzdGk6IFByb3ZpZGUgZGRjIHN5
bWxpbmsgaW4gaGRtaSBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5Cj4gICBkcm0vbWdhZzIwMDog
UHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5Cj4gICBkcm0v
YXN0OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKPiAg
IGRybS9icmlkZ2U6IGR1bWItdmdhLWRhYzogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0
b3Igc3lzZnMKPiAgICAgZGlyZWN0b3J5Cj4gICBkcm0vYnJpZGdlOiBkdy1oZG1pOiBQcm92aWRl
IGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKPiAgIGRybS9icmlkZ2U6
IHRpLXRmcDQxMDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMKPiAgICAg
ZGlyZWN0b3J5Cj4gICBkcm0vYW1kZ3B1OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3Rv
ciBzeXNmcyBkaXJlY3RvcnkKPiAgIGRybS9yYWRlb246IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4g
Y29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQo+IAo+ICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jb25uZWN0b3JzLmMgICAgfCA3MCArKysrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYyAgICAgICAgIHwgMTkgKystLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAgIHwgNDAgKysrKy0tLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgICAgICAgICAgICB8IDE5ICsrLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyAgICAgICAgICAgICAgICAgICB8ICA3ICsrCj4g
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyAgICAgICAgICB8IDExICsrLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYyAgICAgICAgICAgICAgICAgfCAxMyArKy0K
PiAgZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtdHZlLmMgICAgICAgICAgICAgICAgIHwgIDggKy0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgIHwgIDkgKy0K
PiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgICAgICAgIHwgIDEgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYyAgICAgfCAgMSArCj4g
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYyAgICB8IDgyICsrKysr
KysrKysrKysrLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jICAg
ICAgICAgIHwgMTcgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcmszMDY2X2hkbWku
YyAgICAgICAgfCAxNyArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyAgICAg
ICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWkuaCAg
ICAgICAgICAgIHwgIDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9lbmMu
YyAgICAgICAgfCAxNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jICAgICAg
ICAgICAgICAgIHwgMTIgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgICAgICAg
ICAgICAgICAgICB8ICA2ICstCj4gIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQx
MC5jICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jICAgICAg
ICAgICAgICAgIHwgMTYgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0venRlL3p4X2hkbWkuYyAgICAg
ICAgICAgICAgICAgfCAyNSArKy0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3p0ZS96eF92Z2EuYyAg
ICAgICAgICAgICAgICAgIHwgMjUgKystLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aCAgICAgICAgICAgICAgICAgICB8IDExICsrKwo+ICAyNiBmaWxlcyBjaGFuZ2VkLCAyNTIgaW5z
ZXJ0aW9ucygrKSwgMTc2IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuMTcuMQo+IAoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
