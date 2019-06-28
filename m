Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EBD5A0EB
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 18:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979626E96E;
	Fri, 28 Jun 2019 16:31:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1B56E95B;
 Fri, 28 Jun 2019 16:04:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id D0079288F94
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/22] drm: rockchip: Provide ddc symlink in rk3066_hdmi
 sysfs directory
Date: Fri, 28 Jun 2019 18:01:17 +0200
Message-Id: <7277b8bc964610ee8eb77b379d3ace679cdb5b3f.1561735433.git.andrzej.p@collabora.com>
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
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
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

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jIHwgMTcgKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1p
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcmszMDY2X2hkbWkuYwppbmRleCA4NWZjNWYw
MWY3NjEuLjFmM2U2MzBlY2RhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JrMzA2Nl9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1p
LmMKQEAgLTQ5LDcgKzQ5LDYgQEAgc3RydWN0IHJrMzA2Nl9oZG1pIHsKIAlzdHJ1Y3QgZHJtX2Vu
Y29kZXIgZW5jb2RlcjsKIAogCXN0cnVjdCByazMwNjZfaGRtaV9pMmMgKmkyYzsKLQlzdHJ1Y3Qg
aTJjX2FkYXB0ZXIgKmRkYzsKIAogCXVuc2lnbmVkIGludCB0bWRzY2xrOwogCkBAIC00NzAsMTAg
KzQ2OSwxMCBAQCBzdGF0aWMgaW50IHJrMzA2Nl9oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQg
cmV0ID0gMDsKIAotCWlmICghaGRtaS0+ZGRjKQorCWlmICghY29ubmVjdG9yLT5kZGMpCiAJCXJl
dHVybiAwOwogCi0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGhkbWktPmRkYyk7CisJ
ZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGNvbm5lY3Rvci0+ZGRjKTsKIAlpZiAoZWRp
ZCkgewogCQloZG1pLT5oZG1pX2RhdGEuc2lua19pc19oZG1pID0gZHJtX2RldGVjdF9oZG1pX21v
bml0b3IoZWRpZCk7CiAJCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoY29ubmVj
dG9yLCBlZGlkKTsKQEAgLTc4OSwxMCArNzg4LDEwIEBAIHN0YXRpYyBpbnQgcmszMDY2X2hkbWlf
YmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAkvKiBpbnRl
cm5hbCBoY2xrID0gaGRtaV9oY2xrIC8gMjUgKi8KIAloZG1pX3dyaXRlYihoZG1pLCBIRE1JX0lO
VEVSTkFMX0NMS19ESVZJREVSLCAyNSk7CiAKLQloZG1pLT5kZGMgPSByazMwNjZfaGRtaV9pMmNf
YWRhcHRlcihoZG1pKTsKLQlpZiAoSVNfRVJSKGhkbWktPmRkYykpIHsKLQkJcmV0ID0gUFRSX0VS
UihoZG1pLT5kZGMpOwotCQloZG1pLT5kZGMgPSBOVUxMOworCWhkbWktPmNvbm5lY3Rvci5kZGMg
PSByazMwNjZfaGRtaV9pMmNfYWRhcHRlcihoZG1pKTsKKwlpZiAoSVNfRVJSKGhkbWktPmNvbm5l
Y3Rvci5kZGMpKSB7CisJCXJldCA9IFBUUl9FUlIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CisJCWhk
bWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwogCQlnb3RvIGVycl9kaXNhYmxlX2hjbGs7CiAJfQog
CkBAIC04MjQsNyArODIzLDcgQEAgc3RhdGljIGludCByazMwNjZfaGRtaV9iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWhkbWktPmNvbm5lY3Rvci5mdW5j
cy0+ZGVzdHJveSgmaGRtaS0+Y29ubmVjdG9yKTsKIAloZG1pLT5lbmNvZGVyLmZ1bmNzLT5kZXN0
cm95KCZoZG1pLT5lbmNvZGVyKTsKIGVycl9kaXNhYmxlX2kyYzoKLQlpMmNfcHV0X2FkYXB0ZXIo
aGRtaS0+ZGRjKTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiBlcnJf
ZGlzYWJsZV9oY2xrOgogCWNsa19kaXNhYmxlX3VucHJlcGFyZShoZG1pLT5oY2xrKTsKIApAQCAt
ODM5LDcgKzgzOCw3IEBAIHN0YXRpYyB2b2lkIHJrMzA2Nl9oZG1pX3VuYmluZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAloZG1pLT5jb25uZWN0b3IuZnVuY3Mt
PmRlc3Ryb3koJmhkbWktPmNvbm5lY3Rvcik7CiAJaGRtaS0+ZW5jb2Rlci5mdW5jcy0+ZGVzdHJv
eSgmaGRtaS0+ZW5jb2Rlcik7CiAKLQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+ZGRjKTsKKwlpMmNf
cHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJl
KGhkbWktPmhjbGspOwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
