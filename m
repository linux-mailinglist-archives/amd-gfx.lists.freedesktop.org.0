Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC665FCF
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 20:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D966E27F;
	Thu, 11 Jul 2019 18:55:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A586E202;
 Thu, 11 Jul 2019 11:59:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 04:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,478,1557212400"; d="scan'208";a="186365579"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 11 Jul 2019 04:59:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Jul 2019 14:59:26 +0300
Date: Thu, 11 Jul 2019 14:59:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 23/23] drm/i915: Provide ddc symlink in hdmi connector
 sysfs directory
Message-ID: <20190711115926.GT5942@intel.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <1d9bb3d65127a5093d6e9f9cc62a5c7c7502f61d.1562843413.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d9bb3d65127a5093d6e9f9cc62a5c7c7502f61d.1562843413.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 11 Jul 2019 18:55:40 +0000
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
	Sam Ravnborg <sam@ravnborg.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <a.hajda@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	kernel@collabora.com, Fabio Estevam <festevam@gmail.com>,
	"David (ChunMing) Zhou" <David1.Zhou@amd.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Vincent Abriou <vincent.abriou@st.com>,
	Rob Clark <robdclark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
	Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Inki Dae <inki.dae@samsung.com>, Chris@freedesktop.org,
	Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Eric Anholt <eric@anholt.net>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDE6MjY6NTBQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdlbmVy
aWMgY29ubmVjdG9yLgoKV2UgYWxyZWFkeSBoYXZlIGEgc3ltbGluayB2aWEgaW50ZWxfaGRtaV9j
cmVhdGVfaTJjX3N5bWxpbmsoKS4gSSBndWVzcwp3ZSBzaG91bGQgcmVtb3ZlIHRoYXQgaW4gZmF2
b3Igb2YgdGhlIGdlbmVyaWMgb25lLiBPbGVnPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVq
IFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyB8IDUgKysrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwo+IGluZGV4IDBlYmVjNjliYmJmYy4uNjc4ZmE0
ZDFiZDRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
aGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMK
PiBAQCAtMzA5NCw2ICszMDk0LDkgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVjdG9yKHN0
cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAo+ICAJCSBpbnRlbF9kaWdf
cG9ydC0+bWF4X2xhbmVzLCBwb3J0X25hbWUocG9ydCkpKQo+ICAJCXJldHVybjsKPiAgCj4gKwlp
bnRlbF9oZG1pLT5kZGNfYnVzID0gaW50ZWxfaGRtaV9kZGNfcGluKGRldl9wcml2LCBwb3J0KTsK
PiArCWNvbm5lY3Rvci0+ZGRjID0gaW50ZWxfZ21idXNfZ2V0X2FkYXB0ZXIoZGV2X3ByaXYsIGlu
dGVsX2hkbWktPmRkY19idXMpOwo+ICsKPiAgCWRybV9jb25uZWN0b3JfaW5pdChkZXYsIGNvbm5l
Y3RvciwgJmludGVsX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAo+ICAJCQkgICBEUk1fTU9ERV9DT05O
RUNUT1JfSERNSUEpOwo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJmlu
dGVsX2hkbWlfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7Cj4gQEAgLTMxMDUsOCArMzEwOCw2IEBA
IHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0
ICppbnRlbF9kaWdfcG9ydCwKPiAgCWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEwIHx8IElT
X0dFTUlOSUxBS0UoZGV2X3ByaXYpKQo+ICAJCWNvbm5lY3Rvci0+eWNiY3JfNDIwX2FsbG93ZWQg
PSB0cnVlOwo+ICAKPiAtCWludGVsX2hkbWktPmRkY19idXMgPSBpbnRlbF9oZG1pX2RkY19waW4o
ZGV2X3ByaXYsIHBvcnQpOwo+IC0KPiAgCWlmIChXQVJOX09OKHBvcnQgPT0gUE9SVF9BKSkKPiAg
CQlyZXR1cm47Cj4gIAlpbnRlbF9lbmNvZGVyLT5ocGRfcGluID0gaW50ZWxfaHBkX3Bpbl9kZWZh
dWx0KGRldl9wcml2LCBwb3J0KTsKPiAtLSAKPiAyLjE3LjEKCi0tIApWaWxsZSBTeXJqw6Rsw6QK
SW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
