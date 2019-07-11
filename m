Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D96553F
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 13:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB5C6E185;
	Thu, 11 Jul 2019 11:28:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94756E185;
 Thu, 11 Jul 2019 11:28:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 8792328B58A
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/23] drm: rockchip: Provide ddc symlink in inno_hdmi
 sysfs directory
Date: Thu, 11 Jul 2019 13:26:31 +0200
Message-Id: <5ce8b3cf60575b515368d9184e7fd7d4306eddc5.1562843413.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
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
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
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
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyB8IDE3ICsrKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYwppbmRleCBmOGNhOThkMjk0ZDAu
LmQ2NGIxMTljMjY0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9f
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYwpAQCAtNTks
NyArNTksNiBAQCBzdHJ1Y3QgaW5ub19oZG1pIHsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIJZW5jb2Rl
cjsKIAogCXN0cnVjdCBpbm5vX2hkbWlfaTJjICppMmM7Ci0Jc3RydWN0IGkyY19hZGFwdGVyICpk
ZGM7CiAKIAl1bnNpZ25lZCBpbnQgdG1kc19yYXRlOwogCkBAIC01NTIsMTAgKzU1MSwxMCBAQCBz
dGF0aWMgaW50IGlubm9faGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IpCiAJc3RydWN0IGVkaWQgKmVkaWQ7CiAJaW50IHJldCA9IDA7CiAKLQlp
ZiAoIWhkbWktPmRkYykKKwlpZiAoIWhkbWktPmNvbm5lY3Rvci5kZGMpCiAJCXJldHVybiAwOwog
Ci0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGhkbWktPmRkYyk7CisJZWRpZCA9IGRy
bV9nZXRfZWRpZChjb25uZWN0b3IsIGhkbWktPmNvbm5lY3Rvci5kZGMpOwogCWlmIChlZGlkKSB7
CiAJCWhkbWktPmhkbWlfZGF0YS5zaW5rX2lzX2hkbWkgPSBkcm1fZGV0ZWN0X2hkbWlfbW9uaXRv
cihlZGlkKTsKIAkJaGRtaS0+aGRtaV9kYXRhLnNpbmtfaGFzX2F1ZGlvID0gZHJtX2RldGVjdF9t
b25pdG9yX2F1ZGlvKGVkaWQpOwpAQCAtODUwLDEwICs4NDksMTAgQEAgc3RhdGljIGludCBpbm5v
X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAog
CWlubm9faGRtaV9yZXNldChoZG1pKTsKIAotCWhkbWktPmRkYyA9IGlubm9faGRtaV9pMmNfYWRh
cHRlcihoZG1pKTsKLQlpZiAoSVNfRVJSKGhkbWktPmRkYykpIHsKLQkJcmV0ID0gUFRSX0VSUiho
ZG1pLT5kZGMpOwotCQloZG1pLT5kZGMgPSBOVUxMOworCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBp
bm5vX2hkbWlfaTJjX2FkYXB0ZXIoaGRtaSk7CisJaWYgKElTX0VSUihoZG1pLT5jb25uZWN0b3Iu
ZGRjKSkgeworCQlyZXQgPSBQVFJfRVJSKGhkbWktPmNvbm5lY3Rvci5kZGMpOworCQloZG1pLT5j
b25uZWN0b3IuZGRjID0gTlVMTDsKIAkJZ290byBlcnJfZGlzYWJsZV9jbGs7CiAJfQogCkBAIC04
ODYsNyArODg1LDcgQEAgc3RhdGljIGludCBpbm5vX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAloZG1pLT5jb25uZWN0b3IuZnVuY3MtPmRlc3Ry
b3koJmhkbWktPmNvbm5lY3Rvcik7CiAJaGRtaS0+ZW5jb2Rlci5mdW5jcy0+ZGVzdHJveSgmaGRt
aS0+ZW5jb2Rlcik7CiBlcnJfcHV0X2FkYXB0ZXI6Ci0JaTJjX3B1dF9hZGFwdGVyKGhkbWktPmRk
Yyk7CisJaTJjX3B1dF9hZGFwdGVyKGhkbWktPmNvbm5lY3Rvci5kZGMpOwogZXJyX2Rpc2FibGVf
Y2xrOgogCWNsa19kaXNhYmxlX3VucHJlcGFyZShoZG1pLT5wY2xrKTsKIAlyZXR1cm4gcmV0OwpA
QCAtOTAwLDcgKzg5OSw3IEBAIHN0YXRpYyB2b2lkIGlubm9faGRtaV91bmJpbmQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJaGRtaS0+Y29ubmVjdG9yLmZ1bmNz
LT5kZXN0cm95KCZoZG1pLT5jb25uZWN0b3IpOwogCWhkbWktPmVuY29kZXIuZnVuY3MtPmRlc3Ry
b3koJmhkbWktPmVuY29kZXIpOwogCi0JaTJjX3B1dF9hZGFwdGVyKGhkbWktPmRkYyk7CisJaTJj
X3B1dF9hZGFwdGVyKGhkbWktPmNvbm5lY3Rvci5kZGMpOwogCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShoZG1pLT5wY2xrKTsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
