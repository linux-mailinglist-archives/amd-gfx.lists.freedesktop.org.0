Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4C7309D
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EA46E574;
	Wed, 24 Jul 2019 14:02:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F024A6E554;
 Wed, 24 Jul 2019 14:02:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2C32A26CFD5
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/24] drm/sun4i: hdmi: Provide ddc symlink in sun4i hdmi
 connector sysfs directory
Date: Wed, 24 Jul 2019 15:59:29 +0200
Message-Id: <adf5251eac7d879d2e99a0fd5ed35f19771b3a73.1563960855.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
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
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
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
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZW5jLmMgfCAyMSArKysrKysrKysrKy0t
LS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWkuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pLmgKaW5kZXggN2FkM2YwNmMxMjdlLi4xNjQ5
MjczYjE0OTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWkuaApAQCAtMjY1LDcgKzI2NSw2
IEBAIHN0cnVjdCBzdW40aV9oZG1pIHsKIAlzdHJ1Y3QgY2xrCQkqdG1kc19jbGs7CiAKIAlzdHJ1
Y3QgaTJjX2FkYXB0ZXIJKmkyYzsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIJKmRkY19pMmM7CiAKIAkv
KiBSZWdtYXAgZmllbGRzIGZvciBJMkMgYWRhcHRlciAqLwogCXN0cnVjdCByZWdtYXBfZmllbGQJ
KmZpZWxkX2RkY19lbjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9o
ZG1pX2VuYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZW5jLmMKaW5kZXgg
YjJkZjc2YWRkYzc1Li40Y2MwYmIyMzJmNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW40aV9oZG1pX2VuYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9o
ZG1pX2VuYy5jCkBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIGludCBzdW40aV9oZG1pX2dldF9t
b2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlk
OwogCWludCByZXQ7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+ZGRj
X2kyYyA/OiBoZG1pLT5pMmMpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25u
ZWN0b3ItPmRkYyA/OiBoZG1pLT5pMmMpOwogCWlmICghZWRpZCkKIAkJcmV0dXJuIDA7CiAKQEAg
LTU5OSwxMSArNTk5LDExIEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCQlnb3RvIGVycl9kaXNhYmxlX21vZF9j
bGs7CiAJfQogCi0JaGRtaS0+ZGRjX2kyYyA9IHN1bjRpX2hkbWlfZ2V0X2RkYyhkZXYpOwotCWlm
IChJU19FUlIoaGRtaS0+ZGRjX2kyYykpIHsKLQkJcmV0ID0gUFRSX0VSUihoZG1pLT5kZGNfaTJj
KTsKKwloZG1pLT5jb25uZWN0b3IuZGRjID0gc3VuNGlfaGRtaV9nZXRfZGRjKGRldik7CisJaWYg
KElTX0VSUihoZG1pLT5jb25uZWN0b3IuZGRjKSkgeworCQlyZXQgPSBQVFJfRVJSKGhkbWktPmNv
bm5lY3Rvci5kZGMpOwogCQlpZiAocmV0ID09IC1FTk9ERVYpCi0JCQloZG1pLT5kZGNfaTJjID0g
TlVMTDsKKwkJCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwogCQllbHNlCiAJCQlnb3RvIGVy
cl9kZWxfaTJjX2FkYXB0ZXI7CiAJfQpAQCAtNjQwLDkgKzY0MCwxMCBAQCBzdGF0aWMgaW50IHN1
bjRpX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwK
IAogCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmaGRtaS0+Y29ubmVjdG9yLAogCQkJCSAmc3Vu
NGlfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKLQlyZXQgPSBkcm1fY29ubmVjdG9yX2lu
aXQoZHJtLCAmaGRtaS0+Y29ubmVjdG9yLAotCQkJCSAmc3VuNGlfaGRtaV9jb25uZWN0b3JfZnVu
Y3MsCi0JCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJcmV0ID0gZHJtX2Nvbm5lY3Rv
cl9pbml0X3dpdGhfZGRjKGRybSwgJmhkbWktPmNvbm5lY3RvciwKKwkJCQkJICAmc3VuNGlfaGRt
aV9jb25uZWN0b3JfZnVuY3MsCisJCQkJCSAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJ
CQkgIGhkbWktPmNvbm5lY3Rvci5kZGMpOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycihkZXYsCiAJ
CQkiQ291bGRuJ3QgaW5pdGlhbGlzZSB0aGUgSERNSSBjb25uZWN0b3JcbiIpOwpAQCAtNjY0LDcg
KzY2NSw3IEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZSAqbWFzdGVyLAogCWNlY19kZWxldGVfYWRhcHRlcihoZG1pLT5jZWNfYWRh
cCk7CiAJZHJtX2VuY29kZXJfY2xlYW51cCgmaGRtaS0+ZW5jb2Rlcik7CiBlcnJfcHV0X2RkY19p
MmM6Ci0JaTJjX3B1dF9hZGFwdGVyKGhkbWktPmRkY19pMmMpOworCWkyY19wdXRfYWRhcHRlciho
ZG1pLT5jb25uZWN0b3IuZGRjKTsKIGVycl9kZWxfaTJjX2FkYXB0ZXI6CiAJaTJjX2RlbF9hZGFw
dGVyKGhkbWktPmkyYyk7CiBlcnJfZGlzYWJsZV9tb2RfY2xrOgpAQCAtNjg1LDcgKzY4Niw3IEBA
IHN0YXRpYyB2b2lkIHN1bjRpX2hkbWlfdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZSAqbWFzdGVyLAogCWRybV9jb25uZWN0b3JfY2xlYW51cCgmaGRtaS0+Y29ubmVjdG9y
KTsKIAlkcm1fZW5jb2Rlcl9jbGVhbnVwKCZoZG1pLT5lbmNvZGVyKTsKIAlpMmNfZGVsX2FkYXB0
ZXIoaGRtaS0+aTJjKTsKLQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+ZGRjX2kyYyk7CisJaTJjX3B1
dF9hZGFwdGVyKGhkbWktPmNvbm5lY3Rvci5kZGMpOwogCWNsa19kaXNhYmxlX3VucHJlcGFyZSho
ZG1pLT5tb2RfY2xrKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoaGRtaS0+YnVzX2Nsayk7CiB9
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
