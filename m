Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F09585A0EE
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 18:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3F6E974;
	Fri, 28 Jun 2019 16:32:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C890C6E95B;
 Fri, 28 Jun 2019 16:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id AEAAC289CE5
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/22] drm/sun4i: hdmi: Provide ddc symlink in sun4i hdmi
 connector sysfs directory
Date: Fri, 28 Jun 2019 18:01:20 +0200
Message-Id: <4fa046adb68a57c0ee63f5d31da8af2ed8de2c57.1561735433.git.andrzej.p@collabora.com>
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
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pLmggICAgIHwgIDEgLQog
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZW5jLmMgfCAxNCArKysrKysrLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWkuaCBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW40aV9oZG1pLmgKaW5kZXggN2FkM2YwNmMxMjdlLi4xNjQ5MjczYjE0OTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWkuaApAQCAtMjY1LDcgKzI2NSw2IEBAIHN0cnVj
dCBzdW40aV9oZG1pIHsKIAlzdHJ1Y3QgY2xrCQkqdG1kc19jbGs7CiAKIAlzdHJ1Y3QgaTJjX2Fk
YXB0ZXIJKmkyYzsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIJKmRkY19pMmM7CiAKIAkvKiBSZWdtYXAg
ZmllbGRzIGZvciBJMkMgYWRhcHRlciAqLwogCXN0cnVjdCByZWdtYXBfZmllbGQJKmZpZWxkX2Rk
Y19lbjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX2VuYy5j
IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZW5jLmMKaW5kZXggOWMzZjk5MzM5
YjgyLi4yNTBiZWMwMGRjMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40
aV9oZG1pX2VuYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX2VuYy5j
CkBAIC0yMTMsNyArMjEzLDcgQEAgc3RhdGljIGludCBzdW40aV9oZG1pX2dldF9tb2RlcyhzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWludCBy
ZXQ7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+ZGRjX2kyYyA/OiBo
ZG1pLT5pMmMpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRk
YyA/OiBoZG1pLT5pMmMpOwogCWlmICghZWRpZCkKIAkJcmV0dXJuIDA7CiAKQEAgLTU5OCwxMSAr
NTk4LDExIEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZSAqbWFzdGVyLAogCQlnb3RvIGVycl9kaXNhYmxlX21vZF9jbGs7CiAJfQog
Ci0JaGRtaS0+ZGRjX2kyYyA9IHN1bjRpX2hkbWlfZ2V0X2RkYyhkZXYpOwotCWlmIChJU19FUlIo
aGRtaS0+ZGRjX2kyYykpIHsKLQkJcmV0ID0gUFRSX0VSUihoZG1pLT5kZGNfaTJjKTsKKwloZG1p
LT5jb25uZWN0b3IuZGRjID0gc3VuNGlfaGRtaV9nZXRfZGRjKGRldik7CisJaWYgKElTX0VSUiho
ZG1pLT5jb25uZWN0b3IuZGRjKSkgeworCQlyZXQgPSBQVFJfRVJSKGhkbWktPmNvbm5lY3Rvci5k
ZGMpOwogCQlpZiAocmV0ID09IC1FTk9ERVYpCi0JCQloZG1pLT5kZGNfaTJjID0gTlVMTDsKKwkJ
CWhkbWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwogCQllbHNlCiAJCQlnb3RvIGVycl9kZWxfaTJj
X2FkYXB0ZXI7CiAJfQpAQCAtNjYzLDcgKzY2Myw3IEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWNlY19kZWxl
dGVfYWRhcHRlcihoZG1pLT5jZWNfYWRhcCk7CiAJZHJtX2VuY29kZXJfY2xlYW51cCgmaGRtaS0+
ZW5jb2Rlcik7CiBlcnJfcHV0X2RkY19pMmM6Ci0JaTJjX3B1dF9hZGFwdGVyKGhkbWktPmRkY19p
MmMpOworCWkyY19wdXRfYWRhcHRlcihoZG1pLT5jb25uZWN0b3IuZGRjKTsKIGVycl9kZWxfaTJj
X2FkYXB0ZXI6CiAJaTJjX2RlbF9hZGFwdGVyKGhkbWktPmkyYyk7CiBlcnJfZGlzYWJsZV9tb2Rf
Y2xrOgpAQCAtNjg0LDcgKzY4NCw3IEBAIHN0YXRpYyB2b2lkIHN1bjRpX2hkbWlfdW5iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWRybV9jb25uZWN0b3Jf
Y2xlYW51cCgmaGRtaS0+Y29ubmVjdG9yKTsKIAlkcm1fZW5jb2Rlcl9jbGVhbnVwKCZoZG1pLT5l
bmNvZGVyKTsKIAlpMmNfZGVsX2FkYXB0ZXIoaGRtaS0+aTJjKTsKLQlpMmNfcHV0X2FkYXB0ZXIo
aGRtaS0+ZGRjX2kyYyk7CisJaTJjX3B1dF9hZGFwdGVyKGhkbWktPmNvbm5lY3Rvci5kZGMpOwog
CWNsa19kaXNhYmxlX3VucHJlcGFyZShoZG1pLT5tb2RfY2xrKTsKIAljbGtfZGlzYWJsZV91bnBy
ZXBhcmUoaGRtaS0+YnVzX2Nsayk7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
