Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E9B7308D
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAC16E563;
	Wed, 24 Jul 2019 14:01:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1C86E558;
 Wed, 24 Jul 2019 14:01:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 024AB263B01
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 05/24] drm: rockchip: Provide ddc symlink in inno_hdmi
 sysfs directory
Date: Wed, 24 Jul 2019 15:59:27 +0200
Message-Id: <401193c0294a42adf30724058a41340fc537a98f.1563960855.git.andrzej.p@collabora.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "Y.C. Chen" <yc_chen@aspeedtech.com>,
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
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
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
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyB8IDIzICsrKysr
KysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9f
aGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jCmluZGV4IGVkMzQ0
YTc5NWI0ZC4uMGY3ZWQ2NjQ2MDBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvaW5ub19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5j
CkBAIC01OCw3ICs1OCw2IEBAIHN0cnVjdCBpbm5vX2hkbWkgewogCXN0cnVjdCBkcm1fZW5jb2Rl
cgllbmNvZGVyOwogCiAJc3RydWN0IGlubm9faGRtaV9pMmMgKmkyYzsKLQlzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgKmRkYzsKIAogCXVuc2lnbmVkIGludCB0bWRzX3JhdGU7CiAKQEAgLTU1MSwxMCArNTUw
LDEwIEBAIHN0YXRpYyBpbnQgaW5ub19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0ID0g
MDsKIAotCWlmICghaGRtaS0+ZGRjKQorCWlmICghaGRtaS0+Y29ubmVjdG9yLmRkYykKIAkJcmV0
dXJuIDA7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+ZGRjKTsKKwll
ZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJaWYg
KGVkaWQpIHsKIAkJaGRtaS0+aGRtaV9kYXRhLnNpbmtfaXNfaGRtaSA9IGRybV9kZXRlY3RfaGRt
aV9tb25pdG9yKGVkaWQpOwogCQloZG1pLT5oZG1pX2RhdGEuc2lua19oYXNfYXVkaW8gPSBkcm1f
ZGV0ZWN0X21vbml0b3JfYXVkaW8oZWRpZCk7CkBAIC02MjQsOCArNjIzLDEwIEBAIHN0YXRpYyBp
bnQgaW5ub19oZG1pX3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBpbm5v
X2hkbWkgKmhkbWkpCiAKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmhkbWktPmNvbm5lY3Rv
ciwKIAkJCQkgJmlubm9faGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKLQlkcm1fY29ubmVj
dG9yX2luaXQoZHJtLCAmaGRtaS0+Y29ubmVjdG9yLCAmaW5ub19oZG1pX2Nvbm5lY3Rvcl9mdW5j
cywKLQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJZHJtX2Nvbm5lY3Rvcl9pbml0
X3dpdGhfZGRjKGRybSwgJmhkbWktPmNvbm5lY3RvciwKKwkJCQkgICAgJmlubm9faGRtaV9jb25u
ZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAg
aGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAKIAlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKCZo
ZG1pLT5jb25uZWN0b3IsIGVuY29kZXIpOwogCkBAIC04NDksMTAgKzg1MCwxMCBAQCBzdGF0aWMg
aW50IGlubm9faGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFz
dGVyLAogCiAJaW5ub19oZG1pX3Jlc2V0KGhkbWkpOwogCi0JaGRtaS0+ZGRjID0gaW5ub19oZG1p
X2kyY19hZGFwdGVyKGhkbWkpOwotCWlmIChJU19FUlIoaGRtaS0+ZGRjKSkgewotCQlyZXQgPSBQ
VFJfRVJSKGhkbWktPmRkYyk7Ci0JCWhkbWktPmRkYyA9IE5VTEw7CisJaGRtaS0+Y29ubmVjdG9y
LmRkYyA9IGlubm9faGRtaV9pMmNfYWRhcHRlcihoZG1pKTsKKwlpZiAoSVNfRVJSKGhkbWktPmNv
bm5lY3Rvci5kZGMpKSB7CisJCXJldCA9IFBUUl9FUlIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CisJ
CWhkbWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwogCQlnb3RvIGVycl9kaXNhYmxlX2NsazsKIAl9
CiAKQEAgLTg4NSw3ICs4ODYsNyBAQCBzdGF0aWMgaW50IGlubm9faGRtaV9iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWhkbWktPmNvbm5lY3Rvci5mdW5j
cy0+ZGVzdHJveSgmaGRtaS0+Y29ubmVjdG9yKTsKIAloZG1pLT5lbmNvZGVyLmZ1bmNzLT5kZXN0
cm95KCZoZG1pLT5lbmNvZGVyKTsKIGVycl9wdXRfYWRhcHRlcjoKLQlpMmNfcHV0X2FkYXB0ZXIo
aGRtaS0+ZGRjKTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiBlcnJf
ZGlzYWJsZV9jbGs6CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhkbWktPnBjbGspOwogCXJldHVy
biByZXQ7CkBAIC04OTksNyArOTAwLDcgQEAgc3RhdGljIHZvaWQgaW5ub19oZG1pX3VuYmluZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAloZG1pLT5jb25uZWN0
b3IuZnVuY3MtPmRlc3Ryb3koJmhkbWktPmNvbm5lY3Rvcik7CiAJaGRtaS0+ZW5jb2Rlci5mdW5j
cy0+ZGVzdHJveSgmaGRtaS0+ZW5jb2Rlcik7CiAKLQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+ZGRj
KTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGhkbWktPnBjbGspOwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
