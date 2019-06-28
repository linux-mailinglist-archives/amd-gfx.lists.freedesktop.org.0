Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1535A0E8
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 18:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EBB6E96C;
	Fri, 28 Jun 2019 16:31:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEDC6E960;
 Fri, 28 Jun 2019 16:04:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 110AC27FD65
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/22] drm: Include ddc adapter pointer in struct
 drm_connector
Date: Fri, 28 Jun 2019 18:01:15 +0200
Message-Id: <d6381c020ea1c848a7044d830bdb0ec9663d1619.1561735433.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <cover.1561735433.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Fri, 28 Jun 2019 16:31:43 +0000
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
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
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
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGdlbmVyaWMgY29kZSB3aGljaCBjcmVhdGVzIHN5bWJvbGljIGxpbmtzIGluIHN5c2ZzLCBw
b2ludGluZyB0byBkZGMKaW50ZXJmYWNlIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIHZpZGVvIG91dHB1
dC4gRm9yIGV4YW1wbGU6CgpscyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMK
bHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJk
MC1IRE1JLUEtMS9kZGMgXAoJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmkyYy9pMmMtMgoK
VGhpcyBtYWtlcyBpdCBlYXN5IGZvciB1c2VyIHRvIGFzc29jaWF0ZSBhIGRpc3BsYXkgd2l0aCBp
dHMgZGRjIGFkYXB0ZXIKYW5kIHVzZSBlLmcuIGRkY3V0aWwgdG8gY29udHJvbCB0aGUgY2hvc2Vu
IG1vbml0b3IuCgpUaGlzIHBhdGNoIGFkZHMgYW4gaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvci4gUGFydGljdWxhcgpkcml2ZXJzIGNhbiB0aGVuIHVzZSBpdCBpbnN0
ZWFkIG9mIHVzaW5nIHRoZWlyIG93biBwcml2YXRlIGluc3RhbmNlLiBJZiBhCmNvbm5lY3RvciBj
b250YWlucyBhIGRkYywgdGhlbiBjcmVhdGUgYSBzeW1ib2xpYyBsaW5rIGluIHN5c2ZzLgoKU2ln
bmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNv
bT4KQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jIHwgIDcgKysrKysrKwogaW5jbHVkZS9kcm0vZHJt
X2Nvbm5lY3Rvci5oIHwgMTEgKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3lzZnMuYwppbmRleCBhZDEwODEwYmM5NzIuLjI2ZDM1OWIzOTc4NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3lzZnMuYwpAQCAtMjk0LDYgKzI5NCw5IEBAIGludCBkcm1fc3lzZnNfY29ubmVj
dG9yX2FkZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCS8qIExldCB1c2Vyc3Bh
Y2Uga25vdyB3ZSBoYXZlIGEgbmV3IGNvbm5lY3RvciAqLwogCWRybV9zeXNmc19ob3RwbHVnX2V2
ZW50KGRldik7CiAKKwlpZiAoY29ubmVjdG9yLT5kZGMpCisJCXJldHVybiBzeXNmc19jcmVhdGVf
bGluaygmY29ubmVjdG9yLT5rZGV2LT5rb2JqLAorCQkJCSAmY29ubmVjdG9yLT5kZGMtPmRldi5r
b2JqLCAiZGRjIik7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTMwMSw2ICszMDQsMTAgQEAgdm9pZCBk
cm1fc3lzZnNfY29ubmVjdG9yX3JlbW92ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQogewogCWlmICghY29ubmVjdG9yLT5rZGV2KQogCQlyZXR1cm47CisKKwlpZiAoY29ubmVjdG9y
LT5kZGMpCisJCXN5c2ZzX3JlbW92ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtvYmosICJkZGMi
KTsKKwogCURSTV9ERUJVRygicmVtb3ZpbmcgXCIlc1wiIGZyb20gc3lzZnNcbiIsCiAJCSAgY29u
bmVjdG9yLT5uYW1lKTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5o
IGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCmluZGV4IGNhNzQ1ZDlmZWFmNS4uMWFkM2Qx
ZDU0YmE3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCkBAIC0yMyw2ICsyMyw3IEBACiAjaWZuZGVmIF9fRFJN
X0NPTk5FQ1RPUl9IX18KICNkZWZpbmUgX19EUk1fQ09OTkVDVE9SX0hfXwogCisjaW5jbHVkZSA8
bGludXgvaTJjLmg+CiAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgogI2luY2x1ZGUgPGxpbnV4L2xs
aXN0Lmg+CiAjaW5jbHVkZSA8bGludXgvY3R5cGUuaD4KQEAgLTEzMDgsNiArMTMwOSwxNiBAQCBz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciB7CiAJICogWzBdOiBwcm9ncmVzc2l2ZSwgWzFdOiBpbnRlcmxh
Y2VkCiAJICovCiAJaW50IGF1ZGlvX2xhdGVuY3lbMl07CisKKwkvKioKKwkgKiBAZGRjOiBhc3Nv
Y2lhdGVkIGRkYyBhZGFwdGVyLgorCSAqIEEgY29ubmVjdG9yIHVzdWFsbHkgaGFzIGl0cyBhc3Nv
Y2lhdGVkIGRkYyBhZGFwdGVyLiBJZiBhIGRyaXZlciB1c2VzCisJICogdGhpcyBmaWVsZCwgdGhl
biBhbiBhcHByb3ByaWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgaW4gY29ubmVjdG9yCisJ
ICogc3lzZnMgZGlyZWN0b3J5IHRvIG1ha2UgaXQgZWFzeSBmb3IgdGhlIHVzZXIgdG8gdGVsbCB3
aGljaCBpMmMKKwkgKiBhZGFwdGVyIGlzIGZvciBhIHBhcnRpY3VsYXIgZGlzcGxheS4KKwkgKi8K
KwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKKwogCS8qKgogCSAqIEBudWxsX2VkaWRfY291bnRl
cjogdHJhY2sgc2lua3MgdGhhdCBnaXZlIHVzIGFsbCB6ZXJvcyBmb3IgdGhlIEVESUQuCiAJICog
TmVlZGVkIHRvIHdvcmthcm91bmQgc29tZSBIVyBidWdzIHdoZXJlIHdlIGdldCBhbGwgMHMKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
