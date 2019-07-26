Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE175F27
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 08:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDF26E892;
	Fri, 26 Jul 2019 06:38:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875486E88D;
 Fri, 26 Jul 2019 06:38:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 318B080349;
 Fri, 26 Jul 2019 08:38:01 +0200 (CEST)
Date: Fri, 26 Jul 2019 08:37:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v5 01/24] drm: Include ddc adapter pointer in struct
 drm_connector
Message-ID: <20190726063759.GB6443@ravnborg.org>
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <e82d6aca4f8abc95834c8a36c101d153518bb1ac.1563960855.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e82d6aca4f8abc95834c8a36c101d153518bb1ac.1563960855.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=hD80L64hAAAA:8 a=lhJ_FgXY410baidqpgAA:9 a=CjuIK1q_8ugA:10
 a=AbAUZ8qAyYyZVLSsDulk:22
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
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Vincent Abriou <vincent.abriou@st.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, Shashank Sharma <shashank.sharma@intel.com>,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQW5kcnplai4KClBhdGNoIGxvb2tzIGdvb2QsIGJ1dCBvbmUga2VybmVsLWRvYyBkZXRhaWwu
CgpPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwMzo1OToyM1BNICswMjAwLCBBbmRyemVqIFBpZXRy
YXNpZXdpY3ogd3JvdGU6Cj4gQWRkIGdlbmVyaWMgY29kZSB3aGljaCBjcmVhdGVzIHN5bWJvbGlj
IGxpbmtzIGluIHN5c2ZzLCBwb2ludGluZyB0byBkZGMKPiBpbnRlcmZhY2UgdXNlZCBieSBhIHBh
cnRpY3VsYXIgdmlkZW8gb3V0cHV0LiBGb3IgZXhhbXBsZToKPiAKPiBscyAtbCAvc3lzL2NsYXNz
L2RybS9jYXJkMC1IRE1JLUEtMS9kZGMKPiBscnd4cnd4cnd4IDEgcm9vdCByb290IDAgSnVuIDI0
IDEwOjQyIC9zeXMvY2xhc3MvZHJtL2NhcmQwLUhETUktQS0xL2RkYyBcCj4gCS0+IC4uLy4uLy4u
Ly4uL3NvYy8xMzg4MDAwMC5pMmMvaTJjLTIKPiAKPiBUaGlzIG1ha2VzIGl0IGVhc3kgZm9yIHVz
ZXIgdG8gYXNzb2NpYXRlIGEgZGlzcGxheSB3aXRoIGl0cyBkZGMgYWRhcHRlcgo+IGFuZCB1c2Ug
ZS5nLiBkZGN1dGlsIHRvIGNvbnRyb2wgdGhlIGNob3NlbiBtb25pdG9yLgo+IAo+IFRoaXMgcGF0
Y2ggYWRkcyBhbiBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdCBkcm1fY29ubmVjdG9yLiBQ
YXJ0aWN1bGFyCj4gZHJpdmVycyBjYW4gdGhlbiB1c2UgaXQgaW5zdGVhZCBvZiB1c2luZyB0aGVp
ciBvd24gcHJpdmF0ZSBpbnN0YW5jZS4gSWYgYQo+IGNvbm5lY3RvciBjb250YWlucyBhIGRkYywg
dGhlbiBjcmVhdGUgYSBzeW1ib2xpYyBsaW5rIGluIHN5c2ZzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gQWNrZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gUmV2aWV3ZWQtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fc3lzZnMuYyB8ICA4ICsrKysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaCB8IDExICsrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBpbmRleCBhZDEwODEwYmM5NzIuLmU5NjJhOWQ0NWY3ZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBAQCAtMTQsNiArMTQsNyBAQAo+ICAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2dmcC5oPgo+ICsjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZGV2
X3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgCj4gQEAgLTI5NCw2ICsyOTUsOSBA
QCBpbnQgZHJtX3N5c2ZzX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikKPiAgCS8qIExldCB1c2Vyc3BhY2Uga25vdyB3ZSBoYXZlIGEgbmV3IGNvbm5lY3RvciAq
Lwo+ICAJZHJtX3N5c2ZzX2hvdHBsdWdfZXZlbnQoZGV2KTsKPiAgCj4gKwlpZiAoY29ubmVjdG9y
LT5kZGMpCj4gKwkJcmV0dXJuIHN5c2ZzX2NyZWF0ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtv
YmosCj4gKwkJCQkgJmNvbm5lY3Rvci0+ZGRjLT5kZXYua29iaiwgImRkYyIpOwo+ICAJcmV0dXJu
IDA7Cj4gIH0KPiAgCj4gQEAgLTMwMSw2ICszMDUsMTAgQEAgdm9pZCBkcm1fc3lzZnNfY29ubmVj
dG9yX3JlbW92ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICB7Cj4gIAlpZiAo
IWNvbm5lY3Rvci0+a2RldikKPiAgCQlyZXR1cm47Cj4gKwo+ICsJaWYgKGNvbm5lY3Rvci0+ZGRj
KQo+ICsJCXN5c2ZzX3JlbW92ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtvYmosICJkZGMiKTsK
PiArCj4gIAlEUk1fREVCVUcoInJlbW92aW5nIFwiJXNcIiBmcm9tIHN5c2ZzXG4iLAo+ICAJCSAg
Y29ubmVjdG9yLT5uYW1lKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IDRjMzBkNzUxNDg3
YS4uMzNhNmZmZjg1ZmRiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBAIC00MSw2ICs0MSw3IEBA
IHN0cnVjdCBkcm1fcHJvcGVydHk7Cj4gIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYjsKPiAgc3Ry
dWN0IGRybV9wcmludGVyOwo+ICBzdHJ1Y3QgZWRpZDsKPiArc3RydWN0IGkyY19hZGFwdGVyOwo+
ICAKPiAgZW51bSBkcm1fY29ubmVjdG9yX2ZvcmNlIHsKPiAgCURSTV9GT1JDRV9VTlNQRUNJRklF
RCwKPiBAQCAtMTMxMSw2ICsxMzEyLDE2IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsKPiAgCSAq
IFswXTogcHJvZ3Jlc3NpdmUsIFsxXTogaW50ZXJsYWNlZAo+ICAJICovCj4gIAlpbnQgYXVkaW9f
bGF0ZW5jeVsyXTsKPiArCj4gKwkvKioKPiArCSAqIEBkZGM6IGFzc29jaWF0ZWQgZGRjIGFkYXB0
ZXIuCj4gKwkgKiBBIGNvbm5lY3RvciB1c3VhbGx5IGhhcyBpdHMgYXNzb2NpYXRlZCBkZGMgYWRh
cHRlci4gSWYgYSBkcml2ZXIgdXNlcwo+ICsJICogdGhpcyBmaWVsZCwgdGhlbiBhbiBhcHByb3By
aWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgaW4gY29ubmVjdG9yCj4gKwkgKiBzeXNmcyBk
aXJlY3RvcnkgdG8gbWFrZSBpdCBlYXN5IGZvciB0aGUgdXNlciB0byB0ZWxsIHdoaWNoIGkyYwo+
ICsJICogYWRhcHRlciBpcyBmb3IgYSBwYXJ0aWN1bGFyIGRpc3BsYXkuCj4gKwkgKi8KPiArCXN0
cnVjdCBpMmNfYWRhcHRlciAqZGRjOwoKVG8gaGVscCB0aGUgcmVhZGVyIGNvdWxkIHlvdSBhZGQg
aW4gdGhlIGFib3ZlIGEgcmVmZXJlbmNlIHRvCmRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygp
IHNwIHRoZSByZWFkZXIgaXMgdG9sZCBob3cgdG8gaW5pdCB0aGlzCmZpZWxkLgoKRWl0aGVyIGFk
ZCBpdCBpbiBQQVRDSCAyIC0gb3IgbWVyZ2UgcGF0Y2ggMSBhbmQgMi4KCglTYW0KCj4gKwo+ICAJ
LyoqCj4gIAkgKiBAbnVsbF9lZGlkX2NvdW50ZXI6IHRyYWNrIHNpbmtzIHRoYXQgZ2l2ZSB1cyBh
bGwgemVyb3MgZm9yIHRoZSBFRElELgo+ICAJICogTmVlZGVkIHRvIHdvcmthcm91bmQgc29tZSBI
VyBidWdzIHdoZXJlIHdlIGdldCBhbGwgMHMKPiAtLSAKPiAyLjE3LjEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
